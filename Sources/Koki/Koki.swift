//
//  Koki.swift
//
//
//  Created by Jayson Ng on 1/28/22.
//

import Foundation

typealias ViewState = KokiState

public struct Koki { }

public protocol ViewLoadable {
    var state: KokiState { get set }
}

@MainActor
public enum KokiState: String, CustomStringConvertible {
    
    case isIdle
    case isLoading
    case isLoaded
    case errorLoading
    case reloadView
    
    public var description: String {
        switch self {
        case .isIdle                : return "View is idle."
        case .isLoading             : return "View is loading."
        case .isLoaded              : return "View is done loading."
        case .errorLoading          : return "Something went wrong loading the view."
        case .reloadView            : return "Reloading the view..."
        }
    }
    
    public var isLoading: Bool {
        get {
            switch self {
            case .isLoading, .isIdle:
                return true
            default:
                return false
            }
        }
        set {
            self = newValue ? .isLoading : .isLoaded
        }
    }
}
