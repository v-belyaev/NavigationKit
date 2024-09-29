import UIKit
import SwiftUI

public struct PresentAction: Equatable {
    // MARK: - Lifecycle
    
    init(_ view: UIView?) {
        self.view = view
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
        
        self.view?.viewController?.present(
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
        self.view?.viewController?.present(
            viewController,
            animated: animated,
            completion: completion
        )
    }
    
    // MARK: - Private
    
    private weak var view: UIView?
}
