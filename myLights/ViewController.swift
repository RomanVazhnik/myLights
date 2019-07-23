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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let radius = redView.frame.width / 2 // радиус для округления
        settingToViews(redView, UIColor.red, radius) // RedView
        settingToViews(yellowView, UIColor.yellow, radius) // YellowView
        settingToViews(greenView, UIColor.green, radius) //GreenView
        settingToButton() // настройка вида myButton
        self.view.backgroundColor = .black
    }
    
    //Mark: - action кнопки
    @IBAction func buttonPressed() {
        if myButton.titleLabel?.text == "Start" {
            myButton.setTitle("Next", for: .normal)
            redView.alpha = 1
        } else {
            if redView.alpha == 1 {
                redView.alpha = 0.3
                yellowView.alpha = 1
            } else if yellowView.alpha == 1 {
                yellowView.alpha = 0.3
                greenView.alpha = 1
            } else if greenView.alpha == 1 {
                greenView.alpha = 0.3
                redView.alpha = 1
            }
        }
    }
    
    //Mark: - первоначальные настроки для views
    private func settingToViews(_ view: UIView, _ color: UIColor, _ radius: CGFloat) {
        view.layer.cornerRadius = radius
        view.backgroundColor = color
        view.alpha = 0.3
    }
    
    //Mark: - первоначальные настройки для myButton
    private func settingToButton() {
        myButton.backgroundColor = .red
        myButton.tintColor = .white
        myButton.layer.cornerRadius = 5
        myButton.setTitle("Start", for: .normal)
    }
}

