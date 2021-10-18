import Foundation

extension String {
    
    var cleanNumber: String {
        
        let cleanNumber = self.replacingOccurrences(of: "-", with: "")
            .replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
            .replacingOccurrences(of: " ", with: "")
        return cleanNumber
    }
    
}
