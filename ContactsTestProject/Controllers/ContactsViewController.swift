import UIKit
import Contacts

class ContactsViewController: UIViewController {
    
    @IBOutlet weak var contactsTable: UITableView!
    
    var contacts: [PhoneContactsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactsTable.delegate = self
        contactsTable.dataSource = self
        fetchContacts()
        
    }
    
    func fetchContacts() {
        for contact in PhoneContactsFetch.shared.getContacts() {
            contacts.append(PhoneContactsModel.init(contact: contact))
        }
    }
    
    func call(data: PhoneContactsModel) {
        
        let stringNumber = data.phoneNumbers.first ?? ""
        
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
        
        self.call(data: contacts[indexPath.row])
        
    }
    
}
