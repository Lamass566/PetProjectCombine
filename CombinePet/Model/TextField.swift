import Foundation
import SwiftUI

enum TextFields{
    case username
    case email
    case password
    case confirmPassword
    
    //case testForGit
    
    var setTitle: String{
        switch self {
        case .username:
            return "Username"
        case .email:
            return "Email"
        case .password:
            return "Password"
        case .confirmPassword:
            return "Confirm Password"
        }
    }
    
    static func makeTextFieldFeatures()->[TextFields]{
        [.username, .email, .password, .confirmPassword]
    }
}
