import Combine
import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var isRegistrationPossible = false
    @Published var isNameValid = false
    @Published var isEmailValid = false
    @Published var isDateOfBirthValid = false
    @Published var confirmationShowing = false
    @Published var userData = UserData()
    
    private var userDataSink: AnyCancellable?
    
    private let dataManager = UserDataManager()
    
    init() {
        userDataSink = $userData.sink { [weak self] userData in
            self?.validateUserData(userData)
        }
    }
    
    func register() {
        dataManager.save(userData: userData)
        confirmationShowing = true
    }
    
    func validateUserData(_ userData: UserData) {
        isNameValid = Validator.isNameValid(userData.name)
        isEmailValid = Validator.isEmailValid(userData.email)
        isDateOfBirthValid = Validator.isBirthdateValid(userData.dateOfBirth)
        isRegistrationPossible = isNameValid && isEmailValid && isDateOfBirthValid
    }
}
