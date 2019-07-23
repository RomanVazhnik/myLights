//
//  ViewController.swift
//  myLights
//
//  Created by Роман Важник on 23.07.2019.
//  Copyright © 2019 Роман Важник. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    
    @IBOutlet var myButton: UIButton!
    
    let lightOnAlpha: CGFloat = 1
    let lightOffAlpha: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingToButton() // настройка вида myButton
        self.view.backgroundColor = .black
        redView.alpha = lightOffAlpha
        yellowView.alpha = lightOffAlpha
        greenView.alpha = lightOffAlpha
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let radius = redView.frame.size.width / 2 // радиус для округления, т.к в viewDidLoad я бы получил размер оригинала
        settingToViews(redView, UIColor.red, radius) // RedView
        settingToViews(yellowView, UIColor.yellow, radius) // YellowView
        settingToViews(greenView, UIColor.green, radius) //GreenView
    }
    
    //MARK: - action кнопки
    @IBAction func buttonPressed() {
        if myButton.titleLabel?.text == "Start" {
            myButton.setTitle("Next", for: .normal)
            redView.alpha = lightOnAlpha
        } else {
            if redView.alpha == lightOnAlpha {
                redView.alpha = lightOffAlpha
                yellowView.alpha = lightOnAlpha
            } else if yellowView.alpha == lightOnAlpha {
                yellowView.alpha = lightOffAlpha
                greenView.alpha = lightOnAlpha
            } else if greenView.alpha == lightOnAlpha {
                greenView.alpha = lightOffAlpha
                redView.alpha = lightOnAlpha
            }
        }
    }
    
    //MARK: - первоначальные настроки для views
    private func settingToViews(_ view: UIView, _ color: UIColor, _ radius: CGFloat) {
        view.layer.cornerRadius = radius
        view.backgroundColor = color
    }
    
    //MARK: - первоначальные настройки для myButton
    private func settingToButton() {
        myButton.backgroundColor = .red
        myButton.tintColor = .white
        myButton.layer.cornerRadius = 5
        myButton.setTitle("Start", for: .normal)
    }
}

