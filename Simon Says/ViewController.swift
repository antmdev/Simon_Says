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
    
    var currentPlayer = 0       //players turn
    var scores = [0,0]          //player intial scores
    
    var sequenceIndex = 0
    var colourSequence = [Int]() //assign to empty array
    var coloursToTap = [Int]()
    
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
        colourSequence.removeAll()                          //remove entries from array to restart the game
        actionButton.setTitle("Start Game", for: .normal)   //display start game at title
        actionButton.isEnabled = true                       //enabled at the beginning of the game
        
        for button in colourButtons
        {
            button.alpha = 0.5                              //reduces opacity for UX effect
            button.isEnabled = false                        //turn off buttons before game has started
        }
    }
    
    func addNewColor()
    {
        colourSequence.append(Int(arc4random_uniform(UInt32(4))))       //add colours 0-3 from tag
    }
    
    func playSequence()
    {
        if sequenceIndex < colourSequence.count               //means this round is completed is index is lower
        {
            flash(button: colourButtons[colourSequence[sequenceIndex]])
            sequenceIndex += 1
        } else
        {
            coloursToTap = colourSequence
            view.isUserInteractionEnabled = true
            actionButton.setTitle("Tap the circles", for: .normal)
            
            for button in colourButtons
            {
                button.isEnabled = true
            }
        }
    }
    
    func flash(button: CircularButton)                       // flash the button for the sequence
    {
        UIView.animate(withDuration: 0.5, animations:
            {
            button.alpha = 1.0
            button.alpha = 0.5
            })
                { (bool) in
                    self.playSequence()
                }
    }
    

    @IBAction func colourButtonHandler(_ sender: CircularButton)
    {
        if sender.tag == coloursToTap.removeFirst()
        {
            
        } else
            {
                for button in colourButtons
                {
                button.isEnabled = false
                }
                return
            }
        if coloursToTap.isEmpty
        {
            for button in colourButtons
            {
                button.isEnabled = false
            }
            actionButton.setTitle("Continue", for: .normal)
            actionButton.isEnabled = true
        }
    }
    @IBAction func actionButtonhandler(_ sender: UIButton)
    {
        sequenceIndex = 0                                   //set index to 0 at beginning of the game
        actionButton.setTitle("Memorize", for: .normal)     //update title to tell user to memorize once sequence starts
        actionButton.isEnabled = false                      //not required
        view.isUserInteractionEnabled = false               //disable interaction with this view and sub-views
        addNewColor()                                       //call method to start new colour sequence
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1))             //add a delay
        {
                self.playSequence()                         //call method 1 second after button was tapped
        }
    }
    
}

