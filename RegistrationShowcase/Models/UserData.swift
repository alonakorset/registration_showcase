import Foundation

struct UserData {
    var name: String
    var email: String
    var dateOfBirth: Date

    init(name: String = "", email: String = "", dateOfBirth: Date = Date()) {
        self.name = name
        self.email = email
        self.dateOfBirth = dateOfBirth
    }
}
