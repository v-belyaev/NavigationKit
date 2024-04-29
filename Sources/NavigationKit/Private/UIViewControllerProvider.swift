import UIKit

// MARK: - UIViewControllerProviderDelegate

protocol UIViewControllerProviderDelegate: AnyObject {
    func viewAttachedToWindow(_ view: UIViewControllerProvider)
    func viewDetachedFromWindow(_ view: UIViewControllerProvider)
}

// MARK: - UIViewControllerProvider

final class UIViewControllerProvider: UIView {
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal
    
    weak var delegate: UIViewControllerProviderDelegate?
    
    override func didMoveToWindow() {
        if let _ = self.window {
            self.delegate?.viewAttachedToWindow(self)
        } else {
            self.delegate?.viewDetachedFromWindow(self)
        }
    }
    
    // MARK: - Private
    
    private func setup() {
        self.backgroundColor = UIColor.clear
    }
}
