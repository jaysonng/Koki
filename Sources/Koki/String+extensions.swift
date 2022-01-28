//
//  String+extensions.swift
//  
//
//  Created by Jayson Ng on 1/28/22.
//

import Foundation

public protocol Loadable {
    var state: KokiState { get set }
}

typealias ViewState = KokiState
public enum KokiState: String, CustomStringConvertible {
    case isIdle
    case isLoaded
    case errorLoading
    case reloadView

    public var description: String {
        switch self {
        case .isIdle                : return "View is idle."
        case .isLoaded              : return "View is done loading view."
        case .errorLoading          : return "Something went wrong loading the view."
        case .reloadView            : return "Reloading the view..."
        }
    }
}

extension String {
    
    /// Checks if the given String is a valid e-mail address
    /// - returns: Bool
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    ///  Remove white spaces and new lines from String
    /// - Returns: Removed white space and new lines
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// Trim String
    mutating func trim() {
        self = self.trimmed()
    }

}
