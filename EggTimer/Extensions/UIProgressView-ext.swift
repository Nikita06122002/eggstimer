
import UIKit

extension UIProgressView {
    convenience init(progress: Float) {
        self.init(frame: .infinite)
        self.progress = 0.5
        self.progressTintColor = .orange
    }
}
