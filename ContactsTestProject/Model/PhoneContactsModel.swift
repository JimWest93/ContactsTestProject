import Foundation
import Contacts

class PhoneContactsModel {
    
    var fullName = String()
    var phoneNumbers = [String]()
    
    init (contact: CNContact) {
        
        self.fullName = {
            
            var fullName = String()
            
            if !contact.givenName.isEmpty || !contact.familyName.isEmpty {
                fullName = contact.givenName.isEmpty ? contact.familyName : contact.givenName + " " + contact.familyName
            } else { fullName = "Empty name" }
            
            return fullName
            
        }()
        
        self.phoneNumbers = {
           
            var phoneNumbers = [String]()
            
            for phoneNumber in contact.phoneNumbers {
                
                phoneNumbers.append(phoneNumber.value.stringValue.clearNumber)

            }
            
            return phoneNumbers
        }()
        
    }
    
}
