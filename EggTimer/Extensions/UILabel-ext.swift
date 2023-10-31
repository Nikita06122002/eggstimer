
import UIKit

extension UILabel {
    
    convenience init(font: CGFloat? = nil, text: String? = nil) {
        self.init(frame: .infinite)
        self.font = .systemFont(ofSize: font!)
        self.numberOfLines = 0
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }

}
