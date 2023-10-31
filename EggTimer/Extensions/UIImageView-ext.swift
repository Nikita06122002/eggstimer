

import UIKit

extension UIImageView {
    
    convenience init(imageName: String) {
        self.init(frame: .infinite)
        self.image = UIImage(named: imageName)
        self.isUserInteractionEnabled = true
    }
}
