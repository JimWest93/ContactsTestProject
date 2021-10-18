import Foundation
import Contacts

class PhoneContacts {
    
    static let shared: PhoneContacts = {
        let instance = PhoneContacts()
        return instance
    }()
    
    func getContacts() -> [CNContact] {
        
        let contactStore = CNContactStore()
        var contacts = [CNContact]()
        
        let keys = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
                    CNContactPhoneNumbersKey] as [Any]
        
        let request = CNContactFetchRequest(keysToFetch: keys  as! [CNKeyDescriptor])
        
        do {
            try contactStore.enumerateContacts(with: request) { (contact, stop) in
                contacts.append(contact)
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return contacts
        
    }
    
}
