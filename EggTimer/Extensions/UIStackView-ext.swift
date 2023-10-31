
import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addArrangedSubview(view)
        }
    }
    
    
    convenience init(_ axis: NSLayoutConstraint.Axis,
                     _ spacing: CGFloat,
                     _ alignment: UIStackView.Alignment,
                     _ distribution: UIStackView.Distribution,
                     _ addArrangedSubViews: [UIView]
    ) {

        self.init(arrangedSubviews: addArrangedSubViews)
        
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.backgroundColor = .clear
        self.clipsToBounds = true
        
    }
}
