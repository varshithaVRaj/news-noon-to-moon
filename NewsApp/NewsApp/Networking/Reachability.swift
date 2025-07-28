//
//  PSReachability.swift
//  NewsApp
//
//  Created by Varshitha VRaj on 28/07/25.
//

import Foundation
import Network

final class Reachability{
    
    static let shared = Reachability()

    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "ReachabilityMonitor")
    private var isConnected = false
    
    
    private init() {
        monitor.pathUpdateHandler = { path in
            self.isConnected = (path.status == .satisfied)
        }
        monitor.start(queue: queue)
    }
    
    func hasConnection() -> Bool {
        return isConnected
    }
    
}
