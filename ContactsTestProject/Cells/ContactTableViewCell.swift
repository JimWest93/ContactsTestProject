import UIKit

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    func cellInit(data: PhoneContactsModel) {
        
        numberLabel.text = ""
        numberLabel.numberOfLines = 0
        
        fullNameLabel.text = data.fullName
        numberLabel.text = {
            
            var numersString = String()
            
            for number in data.phoneNumbers {
                numersString += number + "\n"
            }
            
            return numersString
            
        }()
 
    }
    
}
