import SwiftUI

@main
struct CombinePetApp: App {
    var body: some Scene {
        WindowGroup {
            let vm = SignUpViewModel()
            ContentView(vm: vm)
        }
    }
}
