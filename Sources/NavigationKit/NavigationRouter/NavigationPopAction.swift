import UIKit

public struct NavigationPopAction: Equatable {
    // MARK: - Lifecycle
    
    init(_ navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    // MARK: - Public
    
    @MainActor
    public func callAsFunction(
        animated: Bool = true,
        completion: (() -> Void)? = nil
    ) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        
        defer { CATransaction.commit() }
        
        self.navigationController?.popViewController(
            animated: animated
        )
    }
    
    // MARK: - Private
    
    private weak var navigationController: UINavigationController?
}
