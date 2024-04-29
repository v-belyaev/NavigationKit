import UIKit
import SwiftUI

public struct PresentAction: Equatable {
    // MARK: - Lifecycle
    
    init(_ viewController: UIViewController?) {
        self.viewController = viewController
    }
    
    // MARK: - Public
    
    public enum PresentationStyle {
        case sheet
        case fullScreen
        case detents([UISheetPresentationController.Detent])
    }
    
    @MainActor
    public func callAsFunction(
        style: PresentationStyle = .sheet,
        animated: Bool = true,
        @ViewBuilder _ view: () -> some View,
        completion: (() -> Void)? = nil
    ) {
        let controller = UIHostingController(rootView: view().navigation())
        
        self.setPresentationStyle(style, for: controller)
        self.viewController?.present(
            controller,
            animated: animated,
            completion: completion
        )
    }
    
    @MainActor
    public func callAsFunction(
        _ viewController: UIViewController,
        style: PresentationStyle = .sheet,
        animated: Bool = true,
        completion: (() -> Void)? = nil
    ) {
        self.setPresentationStyle(style, for: viewController)
        self.viewController?.present(
            viewController,
            animated: animated,
            completion: completion
        )
    }
    
    // MARK: - Private
    
    private weak var viewController: UIViewController?
    
    @inline(__always)
    private func setPresentationStyle(
        _ style: PresentationStyle,
        for viewController: UIViewController
    ) {
        switch style {
        case .sheet, .detents(_):
            viewController.modalPresentationStyle = .automatic
        case .fullScreen:
            viewController.modalPresentationStyle = .fullScreen
        }
        
        if let sheetController = viewController.presentationController as? UISheetPresentationController,
           case let (.detents(detents)) = style
        {
            sheetController.detents = detents
            sheetController.prefersGrabberVisible = true
        }
    }
}
