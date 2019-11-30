//
//  ViewController.swift
//  Concentration
//
//  Created by JUSTIN GOH on 30/11/19.
//  Copyright © 2019 Radium Laboratories. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CardButton: UIButton!
    @IBOutlet weak var CardButton2: UIButton!
    @IBOutlet weak var FlipCountLabel: UILabel!
    var flipCount = 0 {
        didSet {
            FlipCountLabel.text = "Flips: \(flipCount)"
        }
    };
    
    @IBAction func cardPress(_ sender: UIButton) {
        flipCard(withEmoji: "👻", on: sender)
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = Colours.cardBack
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = Colours.cardFront
            flipCount += 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colours.background;
        CardButton.backgroundColor = Colours.cardBack;
        CardButton2.backgroundColor = Colours.cardBack;
        FlipCountLabel.textColor = Colours.primary
    }
}

