
import UIKit

class ViewController: UIViewController {
    
    private let eggsView = EggsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        view.addSubviews(eggsView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            eggsView.topAnchor.constraint(equalTo: view.topAnchor),
            eggsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            eggsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            eggsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}


//MARK: - SwiftUI
import SwiftUI
struct Provider_ViewController : PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            return ViewController()
        }
        
        typealias UIViewControllerType = UIViewController
        
        
        let viewController = ViewController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<Provider_ViewController.ContainterView>) -> ViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: Provider_ViewController.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<Provider_ViewController.ContainterView>) {
            
        }
    }
    
}
