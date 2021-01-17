import Foundation

class Validator {
    /**
     A name is valid if it contains at least one non-whitespace character.
     
     - parameter name: The name to validate.
     - returns: True if the name is valid, otherwise false.
     */
    static func isNameValid(_ name: String) -> Bool {
        return !name.trimmingCharacters(in: .whitespaces).isEmpty
    }

    private static let emailPredicate: NSPredicate = {
        // https://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift
        let firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
        let serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
        let emailRegex = firstpart + "@" + serverpart + "[A-Za-z]{2,3}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex)
    }()

    /**
     An email is valid if it includes exactly one @ character and the domain contains at least four characters, one or more before the dot “.” character,
     at least one dot character, and two characters after the dot character.
     
     - parameter email: The email to validate.
     - returns: True if the email is valid, otherwise false.
     */
    static func isEmailValid(_ email: String) -> Bool {
        return emailPredicate.evaluate(with: email)
    }

    private static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter
    }()

    /**
     A valid date is a date between Jan 1, 1900 and December 31, 2019.
     
     - parameter date: The date to validate.
     - returns: True if the date is valid, otherwise false.
     */
    static func isBirthdateValid(_ date: Date) -> Bool {
        guard let minDate = dateFormatter.date(from: "01/01/1900"), let maxDate = dateFormatter.date(from: "31/12/2019") else {
            return false
        }
        return (date >= minDate) && (date <= maxDate)
    }
}
