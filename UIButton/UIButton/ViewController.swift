//
//  ViewController.swift
//  UIButton
//
//  Created by Anton Zyabkin on 25.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var timerLabel = UILabel ()
    var startButton = UIButton ()
    var roundButton = UIButton ()
    var timer =  Timer ()
    var concNumber = 1
    var nubmewOfRoundLabel = 1
    let textViewRound = UILabel (frame: CGRect(x: 70, y: 480, width: 300, height: 300))

    override func viewDidLoad() {
        
        textViewRound.numberOfLines = 0
        textViewRound.text = ""
        super.viewDidLoad()
        createTimerLabel ()
        createStartButton ()
        createRoundButton ()
        
        
        
        view.addSubview(timerLabel)
        view.addSubview(startButton)
        view.addSubview(roundButton)

        
        startButton.addTarget(self,
                              action: #selector(startButtonDidPresed),
                              for: .touchUpInside)
        roundButton.addTarget(self,
                              action: #selector(createRoundLabel),
                              for: .touchUpInside)
    }

    
    @objc func startButtonDidPresed () {

        animateView(startButton)
        if concNumber == 1 {
            start ()
            startButton.setTitle("STOP", for: .normal)
            concNumber = 0
        } else if concNumber == 0 {
            startButton.setTitle("START", for: .normal)
            concNumber = 1
            timer.invalidate()
            timerLabel.text = "00:00:00"
            textViewRound.text = ""
            nubmewOfRoundLabel = 0
        }
  
    }
    
    func start () {
        // Инициализируем и настроим таймер:
        timer = Timer.scheduledTimer(timeInterval: 0.01,
                                     target: self,
                                     selector: #selector(changeTimeLabel),
                                     userInfo: NSDate(),
                                     repeats: true)
        timer.tolerance = 0.01
    }
    

    
    @objc func changeTimeLabel () {
        
        let elapsed = -(self.timer.userInfo as! NSDate).timeIntervalSinceNow
        
        let min = Int(elapsed/60) < 10 ?
        "0\(Int(elapsed/60))" :
        "\(Int(elapsed/60))"
        
        let sec = Int(elapsed) % 60 < 10 ?
        "0\(Int(elapsed) % 60)" :
        "\(Int(elapsed) % 60)"
        
        let mSec = Int (elapsed * 100) % 100 < 10 ?
        "0\(Int (elapsed * 100) % 100)" :
        "\(Int (elapsed * 100) % 100)"
        
        timerLabel.text = "\(min):\(sec):\(mSec)"
    }
    
    func createTimerLabel () {
        
        timerLabel.frame = CGRect (x: 0, y: 180, width: 200, height: 50)
        timerLabel.center.x = view.center.x
        timerLabel.text = "00:00:00"
        timerLabel.textAlignment = .center
        timerLabel.layer.cornerRadius = 20
        timerLabel.layer.masksToBounds = true
        timerLabel.backgroundColor = .darkGray
        timerLabel.textColor = .white
    }
    
    func createStartButton () {
        
        startButton.frame = CGRect (x: 0, y: 300, width: 200, height: 50)
        startButton.center.x = view.center.x
        startButton.setTitle("START", for: .normal)
        startButton.layer.cornerRadius = 20
        startButton.layer.masksToBounds = true
        startButton.backgroundColor = .systemPink
        startButton.tintColor = .white
        
    }

    func createRoundButton () {
        
        roundButton.frame = CGRect (x: 0, y: 380, width: 200, height: 50)
        roundButton.center.x = view.center.x
        roundButton.setTitle("NEW ROUND", for: .normal)
        roundButton.layer.cornerRadius = 20
        roundButton.layer.masksToBounds = true
        roundButton.backgroundColor = .systemGreen
        roundButton.tintColor = .white
        
    }
    
    @objc func createRoundLabel () {
        animateView(roundButton)

        textViewRound.text! += "\n\(nubmewOfRoundLabel) round: \(timerLabel.text!)"
        view.addSubview(textViewRound)
        nubmewOfRoundLabel += 1
    }
    
    
}


fileprivate func animateView (_ viewToAnimate : UIView) {
    UIView.animate(withDuration: 0.05, delay: 0, usingSpringWithDamping: 20, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
        viewToAnimate.transform = CGAffineTransform (scaleX: 0.95, y: 0.95)
        
    }) { (_) in
        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
            viewToAnimate.transform = CGAffineTransform (scaleX: 1, y: 1)
            
        }, completion: nil)
        
    }
}
