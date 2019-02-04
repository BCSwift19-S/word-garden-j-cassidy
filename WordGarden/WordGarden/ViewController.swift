//
//  ViewController.swift
//  WordGarden
//
//  Created by Jimmy Cassidy on 2/3/19.
//  Copyright © 2019 Jimmy Cassidy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var guessLetterField: UITextField!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var guessAmountLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var flowerImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateUIAfterGuess() {
        guessLetterField.resignFirstResponder()
        guessLetterField.text = ""
    }
    
    @IBAction func guessLetterFieldChange(_ sender: UITextField) {
        
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        updateUIAfterGuess()
    }
    
    @IBAction func guessButtonPressed(_ sender: Any) {
        updateUIAfterGuess()
    }
    @IBAction func playAgainButtonPressed(_ sender: Any) {
    }
    
}

