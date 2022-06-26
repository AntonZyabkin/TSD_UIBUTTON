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
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        createTimerLabel ()
        createStartButton ()
        createRoundButton ()
        
        
        view.addSubview(timerLabel)
        view.addSubview(startButton)
        view.addSubview(roundButton)

    }

    func createTimerLabel () {
        
        timerLabel.frame = CGRect (x: 0, y: 300, width: 200, height: 50)
        timerLabel.center.x = view.center.x
        timerLabel.text = "00 : 00"
        timerLabel.layer.cornerRadius = 20
        timerLabel.layer.masksToBounds = true
        timerLabel.backgroundColor = .darkGray
        timerLabel.textColor = .white
    }
    
    func createStartButton () {
        
        startButton.frame = CGRect (x: 0, y: 500, width: 200, height: 50)
        startButton.center.x = view.center.x
        startButton.setTitle("START", for: .normal)
        startButton.layer.cornerRadius = 20
        startButton.layer.masksToBounds = true
        startButton.backgroundColor = .systemPink
        startButton.tintColor = .white
        
    }

    func createRoundButton () {
        
        startButton.frame = CGRect (x: 0, y: 580, width: 200, height: 50)
        startButton.center.x = view.center.x
        startButton.setTitle("NEW ROUND", for: .normal)
        startButton.layer.cornerRadius = 20
        startButton.layer.masksToBounds = true
        startButton.backgroundColor = .systemGreen
        startButton.tintColor = .white
        
    }

}

