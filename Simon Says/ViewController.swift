//
//  ViewController.swift
//  Simon Says
//
//  Created by Ant Milner on 02/03/2019.
//  Copyright © 2019 Ant Milner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colourButtons: [CircularButton]!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet var playerLabels: [UILabel]!
    @IBOutlet var scoreLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colourButtons = colourButtons.sorted() //sorted is built in method to sort by tags
            {
            $0.tag < $1.tag //order colour buttons by tag value
            }
            playerLabels = playerLabels.sorted()
            {
            $0.tag < $1.tag
            }
            scoreLabels = scoreLabels.sorted()
            {
            $0.tag < $1.tag
            }
        
            createNewGame()
    }
    
    func createNewGame()
    {
        actionButton.setTitle("Start Game", for: .normal) //display start game at title
        for button in colourButtons
        {
            button.alpha = 0.5 //reduces opacity for UX effect
        }
    }

    @IBAction func colourButtonHandler(_ sender: CircularButton)
    {
        print("Button \(sender.tag) tapped")
    }
    @IBAction func actionButtonhandler(_ sender: UIButton)
    {
        print("Action Button")
    }
    
}

