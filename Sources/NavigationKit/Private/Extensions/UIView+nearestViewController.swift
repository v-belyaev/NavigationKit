import UIKit

extension UIView {
    var viewController: UIViewController? {
        return self.nearestViewController()
    }
    
    private func nearestViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.nearestViewController()
        } else {
            return nil
        }
    }
}
