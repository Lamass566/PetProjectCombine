
import SwiftUI

struct ButtonActionView: View {
    
    
    
    func signUp() -> Void{
        print("s")
    }
    
    var body: some View {
        Button(action: signUp, label: {
            Text("Sign Up")
        })
        .frame(minWidth: 0, maxWidth: .infinity)
        .foregroundStyle(.white)
        .padding()
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding(.top, 20)
    }
}

#Preview {
    ButtonActionView()
}
