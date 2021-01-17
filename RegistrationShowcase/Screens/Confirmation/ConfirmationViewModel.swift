import Foundation

class ConfirmationViewModel: ObservableObject {
    var userData: UserData

    init(userData: UserData) {
        self.userData = userData
    }
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()

    var dateOfBirth: String {
        dateFormatter.string(from: userData.dateOfBirth)
    }
}
