
import UIKit
import AVFoundation

final class EggsView: UIView {
    
    init() {
        super.init(frame: .infinite)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var player = AVAudioPlayer()

    private let eggTimes = ["Soft" : 5, "Medium" : 7, "Hard" : 12]
    private var timer = Timer()
    private var totalTime = 0
    private var secondPassed = 0
    
    private let progressView = UIProgressView(progress: 0.5)
    private let soft = UIImageView(imageName: "soft_egg")
    private let medium = UIImageView(imageName: "medium_egg")
    private let hard = UIImageView(imageName: "hard_egg")
    private let softButton = UIButton(title: "Soft")
    private let mediumButton = UIButton(title: "Medium")
    private let hardButton = UIButton(title: "Hard")
    
    
    private let label = UILabel(font: 30, text: "How do you like your eggs?")
    private lazy var stackView = UIStackView(.horizontal, 10, .fill, .fillEqually, [soft, medium, hard])
    
    private func setupUI() {
        self.backgroundColor = .cyan
        self.addSubviews(label, stackView, progressView)
        soft.addSubview(softButton)
        medium.addSubview(mediumButton)
        hard.addSubview(hardButton)
        setupConstraints()
        
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 70),
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            soft.heightAnchor.constraint(equalToConstant: 120),
            soft.widthAnchor.constraint(equalToConstant: 120),
            softButton.centerXAnchor.constraint(equalTo: soft.centerXAnchor),
            softButton.centerYAnchor.constraint(equalTo: soft.centerYAnchor),
            mediumButton.centerXAnchor.constraint(equalTo: medium.centerXAnchor),
            mediumButton.centerYAnchor.constraint(equalTo: medium.centerYAnchor),
            hardButton.centerXAnchor.constraint(equalTo: hard.centerXAnchor),
            hardButton.centerYAnchor.constraint(equalTo: hard.centerYAnchor),
            progressView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 100),
            progressView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            progressView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        progressView.progress = 0
        label.text = "How do you like your eggs?"
        timer.invalidate() // остановить текущий таймер, если он работает
        guard let hardness = sender.currentTitle, let time = eggTimes[hardness] else {
            print("Error")
            return
        }
        totalTime = time * 60 // преобразование минут в секунды
        secondPassed = 0
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc private func updateTimer() {
        if totalTime > 0 {
            let progress = Float(secondPassed) / Float(totalTime)
            progressView.setProgress(progress, animated: true)
            print("Time remaining: \(totalTime) seconds")
            totalTime -= 1
            secondPassed += 1
        } else {
            timer.invalidate()
            label.text = "Done"
            progressView.setProgress(1.0, animated: true)
            playSound()
            print("Done")
        }
        
    }
    
    private func addTarget(_ buttons: [UIButton], selector: Selector) {
        for button in buttons {
            button.addTarget(self, action: selector, for: .touchUpInside)
        }
    }
    
    private func playSound() {
        if let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player.play()
            } catch {
                print("Error")
            }
        } else {
            print("URL for sound not found.")

        }
    }
}
