import SwiftUI

struct RegistrationView: View {
    @ObservedObject var registrationViewModel = RegistrationViewModel()
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    LazyVGrid(columns: [GridItem(.fixed(geometry.size.width/3)), GridItem(.fixed(geometry.size.width - geometry.size.width/3))], alignment: .leading, spacing: 16, content: {
                        Text("RegistrationViewNameLabel")
                        TextField("", text: $registrationViewModel.userData.name).bordered(color: registrationViewModel.isNameValid ? .blue : .red)
                        Text("RegistrationViewEmailLabel")
                        TextField("", text: $registrationViewModel.userData.email).bordered(color: registrationViewModel.isEmailValid ? .blue : .red)
                        Text("RegistrationViewBirthdateLabel")
                        DatePicker("", selection: $registrationViewModel.userData.dateOfBirth, displayedComponents: [.date])
                            .datePickerStyle(CompactDatePickerStyle())
                            .labelsHidden()
                            .bordered(color: registrationViewModel.isDateOfBirthValid ? .blue : .red)
                        
                    })
                    Spacer()
                    
                    NavigationLink(
                        destination: ConfirmationView(userData: registrationViewModel.userData),
                        isActive: $registrationViewModel.confirmationShowing,
                        label: {
                            EmptyView()
                        })
                    
                    Button {
                        registrationViewModel.register()
                    } label: {
                        Text("RegistrationViewRegisterButton").bordered(color: .blue)
                    }.disabled(!registrationViewModel.isRegistrationPossible)
                    
                    Spacer()
                }
            }
            .padding()
            .navigationBarTitle(Text("RegistrationViewNavigationTitle"))
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
