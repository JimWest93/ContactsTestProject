import UIKit
import Contacts

class ContactsViewController: UIViewController {
    
    @IBOutlet weak var contactsTable: UITableView!
    
    var contacts: [CNContact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactsTable.delegate = self
        contactsTable.dataSource = self
        contacts = PhoneContacts.shared.getContacts()
    }
    
    func call(contact: CNContact) {
        
        let number = contact.phoneNumbers.first?.value
        
        let stringNumber = number?.stringValue.clearNumber ?? ""
        
        if let phoneCallURL = URL(string: "telprompt://\(stringNumber)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                if #available(iOS 10.0, *) {
                    application.open(phoneCallURL, options: [:], completionHandler: nil)
                } else {
                    
                    application.openURL(phoneCallURL as URL)
                    
                }
            }
            
        }
    }
    
}

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell") as! ContactTableViewCell
        
        cell.cellInit(data: contacts[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.call(contact: contacts[indexPath.row])
        
    }
    
}
