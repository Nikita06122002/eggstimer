
import UIKit

extension UIButton {
    
    convenience init(title: String) {
        self.init(frame: .infinite)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 20)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
