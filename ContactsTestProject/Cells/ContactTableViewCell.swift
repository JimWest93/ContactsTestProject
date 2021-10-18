import UIKit
import Contacts

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    func cellInit(data: CNContact) {
        
        numberLabel.text = ""
        numberLabel.numberOfLines = 0
        
        if !data.givenName.isEmpty || !data.familyName.isEmpty {
            fullNameLabel.text = data.givenName + " " + data.familyName
        } else { fullNameLabel.text = "Empty name" }
        
        let phoneNumbers = data.phoneNumbers
        
        for phoneNumber in phoneNumbers {
            
            let localizedLabel = CNLabeledValue<CNPhoneNumber>.localizedString(forLabel: phoneNumber.label ?? "tel")
            
            numberLabel.text! += localizedLabel + ": " + phoneNumber.value.stringValue.clearNumber + "\n"
        }
        
        
    }
    
}
