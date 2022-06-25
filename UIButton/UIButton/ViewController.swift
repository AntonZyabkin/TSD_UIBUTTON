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
        
        timerLabel.frame = CGRect (x: 0, y: 0, width: 200, height: 50)
        timerLabel.text = "00 : 00"
        timerLabel.layer.cornerRadius = 20
        timerLabel.backgroundColor = .darkGray
        timerLabel.textColor = .white
        
        
        
        view.addSubview(timerLabel)
        view.addSubview(startButton)
        view.addSubview(roundButton)
        
        
        
    }


}

