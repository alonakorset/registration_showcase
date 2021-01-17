import SwiftUI

struct ConfirmationView: View {
    @ObservedObject var viewModel: ConfirmationViewModel

    init(userData: UserData) {
        viewModel = ConfirmationViewModel(userData: userData)
    }

    var body: some View {
        VStack(spacing: 16) {
            Text("ConfirmationViewTitle")
            Text(viewModel.userData.name)
            Text(viewModel.userData.email)
            Text(viewModel.dateOfBirth)
        }
        .navigationBarTitle(Text("ConfirmationViewNavigationTitle"))
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView(userData: UserData(name: "", email: "", dateOfBirth: Date()))
    }
}
