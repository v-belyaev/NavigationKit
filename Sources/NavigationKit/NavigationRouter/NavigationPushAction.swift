import UIKit
import SwiftUI

public struct NavigationPushAction: Equatable {
    // MARK: - Lifecycle
    
    init(_ view: UIView?) {
        self.view = view
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
        
        self.view?.viewController?.navigationController?.pushViewController(
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
        
        self.view?.viewController?.navigationController?.pushViewController(
            viewController,
            animated: animated
        )
    }
    
    // MARK: - Private
    
    private weak var view: UIView?
}
