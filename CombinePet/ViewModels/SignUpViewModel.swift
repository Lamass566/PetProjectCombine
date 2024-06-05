import Foundation
import Combine

//protocol SignUpViewPresentable{
    
//}

class SignUpViewModel: ObservableObject{
    
    private var cancelLableBag = Set<AnyCancellable>()
    
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var passwordVal: String = ""
    @Published var confirmPassword: String = ""
    
    var usernameError: String = ""
    var emailError: String = ""
    var passwordError: String = ""
    var confPasswordError: String = ""
    
    private var usernameValidPublisher: AnyPublisher<Bool, Never>
    {
        return $username
            .map{!$0.isEmpty}
            .eraseToAnyPublisher()
    }
    
    private var emailRequiredPublisher: AnyPublisher<(email: String, isValid: Bool), Never>
    {
        return $email
            .map{(email: $0,isValid: !$0.isEmpty)}
            .eraseToAnyPublisher()
    }
    
    private var emailValidPublisher: AnyPublisher<(email: String, isValid: Bool), Never>
    {
        return emailRequiredPublisher
            .map{(email: $0.email,isValid: !$0.email.isValidEmail())}
            .eraseToAnyPublisher()
    }
    
    private var passwordValidPublisher: AnyPublisher<Bool, Never>
    {
        return $passwordVal
            .map{!$0.isEmpty}
            .eraseToAnyPublisher()
    }
        
    
    init(){
        usernameValidPublisher
            .receive(on: RunLoop.main)
            .dropFirst()
            .map{$0 ? "" : "Username is missing"}
            .assign(to: \.usernameError, on: self)
            .store(in: &cancelLableBag)
        
        
        emailRequiredPublisher
            .receive(on: RunLoop.main)
            .dropFirst()
            .map{$0.isValid ? "" : "Email is missing"}
            .assign(to: \.emailError, on: self)
            .store(in: &cancelLableBag)
        
         
        passwordValidPublisher
            .receive(on: RunLoop.main)
            .dropFirst()
            .map{$0 ? "" : "Password is missing"}
            .assign(to: \.passwordVal, on: self)
            .store(in: &cancelLableBag)
    }
}

extension String{
    func isValidEmail() -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}
