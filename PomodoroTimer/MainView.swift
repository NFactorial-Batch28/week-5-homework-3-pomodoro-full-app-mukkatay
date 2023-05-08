//
//  MainView.swift
//  PomodoroTimer
//
//  Created by Akyl Mukatay  on 06.05.2023.
//

import UIKit

class MainView: UIViewController {
    
    private var backgroundImage: UIImageView = {
        let image = UIImageView(frame: UIScreen.main.bounds)
        image.contentMode = UIView.ContentMode.top
        image.image = UIImage(named: "BG0")
        
        return image
    }()
    
    private var focusCategoryButton: UIView = {
        let bg = UIView()
        bg.layer.cornerRadius = 16
        bg.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        bg.layer.masksToBounds = true
        return bg
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureFocusBtnSubview()
        configureTimerSubview()
    }
    
    override func loadView() {
        super.loadView()
        
        let bgView = UIView()
        bgView.insertSubview(backgroundImage, at: 0)
        view = bgView
        
    }
    
    func configureFocusBtnSubview() {
        let penIcon = UIImageView(image: UIImage(named: "pen"))

        let text = UILabel()
        text.text = "Focus Category"
        text.font = .systemFont(ofSize: 16)
        text.textColor = .white
        
        view.addSubview(focusCategoryButton)
        [penIcon, text].forEach{self.focusCategoryButton.addSubview($0)}
        
        focusCategoryButton.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, paddingTop: 136, paddingLeft: 110, width: 170, height: 36)
        penIcon.anchor(top: self.focusCategoryButton.topAnchor, left: self.focusCategoryButton.leftAnchor, paddingTop: 12, paddingLeft: 22)
        text.anchor(right: self.focusCategoryButton.rightAnchor, paddingRight: 16)
        text.centerY(in: self.focusCategoryButton)
    }

//    func configureRingSubview() {
//        let ringView = UIView()
//        self.view.addSubview(ringView)
//        ringView.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, paddingTop: 244, paddingLeft: 41)
//
//        let shapeLayer = CAShapeLayer()
//        let center = CGPoint(x: ringView.bounds.midX, y: ringView.bounds.midY)
//        let radius = CGFloat(124)
//        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi - CGFloat.pi/2, clockwise: true)
//
//        shapeLayer.path = path.cgPath
//        shapeLayer.strokeColor = UIColor.blue.cgColor
//        shapeLayer.fillColor = UIColor.clear.cgColor
//        shapeLayer.lineCap = .round
//        shapeLayer.lineWidth = 10
//
//        ringView.layer.addSublayer(shapeLayer)
//    }
    
    func configureTimerSubview() {
        let timer = UILabel()
        timer.text = "25:00"
        timer.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        timer.textColor = .white
        view.addSubview(timer)
        
        let timerText = UILabel()
        timerText.text = "Focus on your task"
        timerText.font = UIFont.systemFont(ofSize: 16)
        timerText.textColor = .white
        view.addSubview(timerText)
        
        
        let playButtonView = UIView()
        let pauseButtonView = UIView()
        [playButtonView, pauseButtonView].forEach { UIView in
            UIView.layer.cornerRadius = 28
            UIView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
            UIView.layer.masksToBounds = true
            view.addSubview(UIView)
        }
        
        let playIcon = UIImageView(image: UIImage(named: "play"))
        let pauseIcon = UIImageView(image: UIImage(named: "pause0"))
        playButtonView.addSubview(playIcon)
        pauseButtonView.addSubview(pauseIcon)
        
        timer.anchor(top: self.view.topAnchor, paddingTop: 292)
        timer.centerX(in: self.view)
        timerText.anchor(top: self.view.topAnchor, paddingTop: 352)
        timerText.centerX(in: self.view)
        playButtonView.anchor(bottom: self.view.bottomAnchor, left: self.view.leftAnchor, paddingBottom: 256, paddingLeft: 99, width: 56, height: 56)
        pauseButtonView.anchor(bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingBottom: 256, paddingRight: 99, width: 56, height: 56)
        playIcon.centerInView(in: playButtonView)
        pauseIcon.centerInView(in: pauseButtonView)
        
    }

}
