import SwiftUI

struct ValidateDisForm: View {

    @State private var username: String = ""
    @State private var email: String = ""

    var disableForm: Bool {
        username.count < 5 || email.isEmpty
    }

    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }

            Section {
                Button("Create account"){
                    print("Creating account...")
                }
            }
            .disabled(disableForm)
        }
    }
}

#Preview {
    ValidateDisForm()
}
