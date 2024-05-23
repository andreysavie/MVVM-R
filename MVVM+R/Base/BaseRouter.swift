//
//  BaseRouter.swift
//  MVVM+R
//
//  Created by Andrey Rybalkin on 23.05.2024.
//

import Foundation
import UIKit

public protocol Router: AnyObject {
    /// Coordinator's UINavigationController.
    var navigationController: UINavigationController { get }
    
    /// Coordinator's UIWindow.
    var window: UIWindow { get }
    
    /// Parent of current coordinator.
    var parentRouter: Router? { get set }
    
    var childRouters: [Router] { get set }
    
    /// Method  to make the coordinator take control.
    func start()
    
    /// Method  to make the coordinator finish it's flow.
    func finish()
    
    /// Stores coordinator to the `childCoordinators` array.
    ///
    /// - Parameter coordinator: Child coordinator to store.
    func store(router: Router)
    
    /// Releases coordinator from the `childCoordinators` array.
    ///
    /// - Parameter coordinator: Coordinator to release.
    func free(router: Router)
    
    /// Removes all child coordinators from the current coordinator.
    func removeChildRouters()
    
    /// inits class that conforms to this protocol
    init(window: UIWindow, navigationController: UINavigationController)

    
}

public protocol RouterBased {
    associatedtype Router
    var router: Router? { get set }
}


public class BaseRouter: NSObject, Router {
        
    public let window: UIWindow
    public let navigationController: UINavigationController
    
    public var childRouters = [Router]()
    public var parentRouter: Router?
    
    public required init(
        window: UIWindow,
        navigationController: UINavigationController
    ) {
        self.window = window
        self.navigationController = navigationController
        super.init()
    }

    public func start() {
        fatalError("Start method should be implemented.")
    }
    
    public func finish() {
        self.parentRouter?.free(router: self)
    }
    
    public func store(router: Router) {
        childRouters += [router]
        router.parentRouter = self
    }
    
    public func removeChildRouters() {
        childRouters.forEach { $0.removeChildRouters() }
        childRouters.removeAll()
    }
    
    public func free(router: Router) {
        router.removeChildRouters()
        if let index = childRouters.firstIndex(where: { $0 === router }) {
            childRouters.remove(at: index)
        }
    }
}

