//
//  APPEnvironment.swift
//  NewsApp
//
//  Created by Varshitha VRaj on 28/07/25.
//

enum EnvironmentType {
    case staging
    case production
    
    var environment: Environment {
        switch self {
        case .staging:
            return STGEnvironment()
        case .production:
            return PRODEnvironment()
        }
    }
}

class APPEnvironment {
    
    static let shared: APPEnvironment = APPEnvironment()
    let environment: Environment
    
    private init() {
// Change your Environment from here
        let environmentType: EnvironmentType = .staging
        self.environment = environmentType.environment
    }
}

protocol Environment {
    var environment: EnvironmentType { get }
    var baseApiUrl: String { get }
    
}


private struct STGEnvironment: Environment {
    var environment: EnvironmentType = .staging
    var baseApiUrl: String = Constants.baseURL
    
    init() {}
}

private struct PRODEnvironment: Environment {
    var environment: EnvironmentType = .production
    var baseApiUrl: String = Constants.baseURL

    init() {}
}




 
