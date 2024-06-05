import SwiftUI

struct TextFieldBlockView: View {
    
    var title: String
    @Binding var textValue: String
    var errorValue: String
    var isSecured: Bool = false
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack{
            if isSecured{
                SecureField(title, text: $textValue)
                    .padding()
                    .background(ColorCodes.background.color())
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .keyboardType(.default)
                    .keyboardType(keyboardType)
            }else{
                TextField(title, text: $textValue)
                    .padding()
                    .background(ColorCodes.background.color())
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .keyboardType(.default)
                    .keyboardType(keyboardType)
            }
            Text(errorValue)
                .fontWeight(.light)
                .foregroundStyle(ColorCodes.failure.color())
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
        }
    }
}

#Preview {
    TextFieldBlockView(title: "", textValue: .constant(""), errorValue: "")
}
