//
//  ViewController.swift
//  HW 2.1 - Task 2
//
//  Created by User on 14.10.2020.
//  Copyright © 2020 Evgeny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    @IBOutlet var switchButton: UIButton!
    
    var trafficLightState: TrafficLightState = .off {
        didSet {
            switch oldValue {
            case .off:
                redView.alpha = 1
                switchButton.setTitle("NEXT", for: .normal)
            case .red:
                redView.alpha = 0.3
                yellowView.alpha = 1
            case.yellow:
                yellowView.alpha = 0.3
                greenView.alpha = 1
            case .green:
                greenView.alpha = 0.3
                redView.alpha = 1
            }
        }
    }
    
    enum TrafficLightState {
        case off, red, yellow, green
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.backgroundColor = .red
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green

        redView.alpha = 0.3
        yellowView.alpha = 0.3
        greenView.alpha = 0.3
    }
    
    override func viewWillLayoutSubviews() {
        let cornerRadius = redView.bounds.width / 2
        redView.layer.cornerRadius = cornerRadius
        yellowView.layer.cornerRadius = cornerRadius
        greenView.layer.cornerRadius = cornerRadius
    }

    @IBAction func switchButtonPressed() {
        switch trafficLightState {
        case .off:
            trafficLightState = .red
        case .red:
            trafficLightState = .yellow
        case.yellow:
            trafficLightState = .green
        case .green:
            trafficLightState = .red
        }
    }
    
}

