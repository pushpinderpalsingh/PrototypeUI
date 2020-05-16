//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    let cardView = UIView()
    let vdeoImageView = UIImageView()
    let titleLabel = UILabel()
    let watchButton = UIButton()
    let animatioButton = UIButton()
    
    var cardViewBottom : NSLayoutConstraint!
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .black
        self.view = view
        setUPCardView()
    }
    func setUPCardView(){
        view.addSubview(cardView)
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 12
        setupCardViewConstrains()
        setUPvideoview()
        setUpNextButton()
        setUptitleLabel()
        setupanimationbutton()
    }
    func setupanimationbutton(){
        view.addSubview(animatioButton)
        animatioButton.setTitle("Animate", for: .normal)
        animatioButton.setTitleColor(.white, for: .normal)
        animatioButton.backgroundColor = .red
        setupConstraints()
        animatioButton.addTarget(self, action: #selector(animate), for: .touchUpInside)
    }
    @objc func animate(){
        cardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        UIView.animate(withDuration: 0.4) {
            self.view.layoutIfNeeded()
        }
    }
    func setupConstraints(){
        animatioButton.translatesAutoresizingMaskIntoConstraints = false
        animatioButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        animatioButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        animatioButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        animatioButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -600).isActive = true
    }
    func setUptitleLabel(){
        cardView.addSubview(titleLabel)
        titleLabel.text = "Google Summer of Code"
        titleLabel.textColor = .red
        titleLabel.textAlignment = .center
        setUptitleConstraints()
    }
    func setUptitleConstraints(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: vdeoImageView.bottomAnchor, constant: 19).isActive = true
    }
    func setUPvideoview(){
        cardView.addSubview(vdeoImageView)
        vdeoImageView.layer.masksToBounds = true
        vdeoImageView.image = UIImage(named:"google.png")
        setupVideoConstraints()
    }
    
    func setUpNextButton(){
        cardView.addSubview(watchButton)
        watchButton.layer.masksToBounds = true
        watchButton.backgroundColor = .orange
        watchButton.layer.cornerRadius = 25
        watchButton.setTitle("Next", for: .normal)
        watchButton.setTitleColor(.black, for: .normal)
        setupButtonConstraints()
    }
    func setupButtonConstraints(){
        watchButton.translatesAutoresizingMaskIntoConstraints = false
        watchButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20).isActive = true
        watchButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor
            , constant: -20).isActive = true
        watchButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20).isActive = true
        watchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    func setupVideoConstraints(){
        vdeoImageView.translatesAutoresizingMaskIntoConstraints = false
        vdeoImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20).isActive = true
        vdeoImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -20).isActive = true
        vdeoImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    func setupCardViewConstrains(){
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 360).isActive = true
        cardViewBottom = cardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 500)
        cardViewBottom.isActive = true
    }
}

let vc = MyViewController()
vc.preferredContentSize = CGSize(width: 376, height: 812)
PlaygroundPage.current.liveView = vc
