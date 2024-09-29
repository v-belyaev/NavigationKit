import UIKit
import SwiftUI

public struct PresentAction: Equatable {
    // MARK: - Lifecycle
    
    init(_ viewController: UIViewController?) {
        self.viewController = viewController
    }
    
    // MARK: - Public
    
    @MainActor
    public func callAsFunction(
        transitionStyle: UIModalTransitionStyle = .coverVertical,
        presentationStyle: UIModalPresentationStyle = .automatic,
        animated: Bool = true,
        @ViewBuilder _ view: () -> some View,
        completion: (() -> Void)? = nil
    ) {
        let controller = UIHostingController(rootView: view().navigation())
        controller.modalTransitionStyle = transitionStyle
        controller.modalPresentationStyle = presentationStyle
        
        self.viewController?.present(
            controller,
            animated: animated,
            completion: completion
        )
    }
    
    @MainActor
    public func callAsFunction(
        _ viewController: UIViewController,
        animated: Bool = true,
        completion: (() -> Void)? = nil
    ) {
        self.viewController?.present(
            viewController,
            animated: animated,
            completion: completion
        )
    }
    
    // MARK: - Private
    
    private weak var viewController: UIViewController?
}
