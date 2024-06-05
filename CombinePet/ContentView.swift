import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var vm: SignUpViewModel
    
    init(vm: SignUpViewModel){
        self.vm = vm
    }
    
    var body: some View {
        ZStack{
            ColorCodes.primary.color()
            
            VStack{
                
                Spacer()
                
                Text("Test")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.bottom, 20)
                
                Spacer()
                
                TextFieldBlockView(title: TextFields.username.setTitle, textValue: $vm.username, errorValue: vm.usernameError)
                
                TextFieldBlockView(title: TextFields.email.setTitle, textValue: $vm.email, errorValue: vm.emailError, keyboardType: .emailAddress)
                
                TextFieldBlockView(title: TextFields.password.setTitle, textValue: $vm.passwordVal, errorValue: vm.passwordError, isSecured: false)
                
                TextFieldBlockView(title: TextFields.confirmPassword.setTitle, textValue: $vm.confirmPassword, errorValue: vm.confPasswordError, isSecured: true)
                
                ButtonActionView()
                
                Spacer()
                
            }.padding(60)
            
        }.ignoresSafeArea()
    }
    
}

#Preview {
    let viewModel = SignUpViewModel()
    return ContentView(vm: viewModel)
}
