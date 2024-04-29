import UIKit
import SwiftUI

public struct NavigationPushAction: Equatable {
    // MARK: - Lifecycle
    
    init(_ navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    // MARK: - Public
    
    @MainActor
    public func callAsFunction(
        animated: Bool = true,
        @ViewBuilder _ view: () -> some View,
        completion: (() -> Void)? = nil
    ) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        
        defer { CATransaction.commit() }
        
        self.navigationController?.pushViewController(
            UIHostingController(rootView: view().navigation()),
            animated: animated
        )
    }
    
    @MainActor
    public func callAsFunction(
        _ viewController: UIViewController,
        animated: Bool = true,
        completion: (() -> Void)? = nil
    ) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        
        defer { CATransaction.commit() }
        
        self.navigationController?.pushViewController(
            viewController,
            animated: animated
        )
    }
    
    // MARK: - Private
    
    private weak var navigationController: UINavigationController?
}
