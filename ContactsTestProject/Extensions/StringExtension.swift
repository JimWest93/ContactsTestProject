import Foundation

extension String {
    
    var clearNumber: String {
        
        let clearNumber = self.replacingOccurrences(of: "-", with: "")
            .replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
            .replacingOccurrences(of: " ", with: "")

        return clearNumber
    }
    
}
