//
//  String+extensions.swift
//  
//
//  Created by Jayson Ng on 1/28/22.
//

import Foundation
import SwiftUI

public extension String {

    /// Checks if the given String is Numeric
    ///
    /// - Returns: Bool
    var isNumeric: Bool {
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self).isSubset(of: nums)
    }

    /// Checks if the given String is a valid email address
    ///
    /// - Returns: Bool
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }

    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
    
    /// Trim String
    mutating func trim() {
        self = self.trimmed()
    }

    ///  Remove white spaces and new lines.
    ///
    /// - Returns: Removed white space and new lines
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }


}

//: https://stackoverflow.com/a/60641131/1455606
public extension Optional {
    var logable: Any {
        switch self {
        case .none:
            return "<nil>|⭕️"
        case let .some(value):
            return value
        }
    }
}
