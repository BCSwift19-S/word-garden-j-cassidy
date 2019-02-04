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
    var wordToGuess = "SWIFT"
    var lettersGuessed = "B"
    let maxWrongGuesses = 8
    var guessesRemaining = 8
    var guessCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatUserGuessLabel()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
    }
    
    func updateUIAfterGuess() {
        guessLetterField.resignFirstResponder()
        guessLetterField.text = ""
    }
    
    func formatUserGuessLabel() {
        var revealedWord = ""
        lettersGuessed += guessLetterField.text!
        
        for letter in wordToGuess {
            if lettersGuessed.contains(letter) {
                revealedWord += "\(letter)"
            } else {
                revealedWord += " _"
            }
        }
        revealedWord.removeFirst()
        userGuessLabel.text = revealedWord
    }
    
    func guessedLetter() {
       formatUserGuessLabel()
        guessCount += 1
        
        let currentLetterGuessed = guessLetterField.text
        if !wordToGuess.contains(currentLetterGuessed!) {
            guessesRemaining -= 1
            flowerImage.image = UIImage(named: "flower\(guessesRemaining)")
        }
        
        let revealedWord = userGuessLabel.text!
        if guessesRemaining == 0 {
            playAgainButton.isHidden = false
            guessLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessAmountLabel.text = "Sorry, You're All Out of Guesses! Try Again?"
        } else if !revealedWord.contains("_") {
            playAgainButton.isHidden = false
            guessLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessAmountLabel.text = "Congrats! You've Done It! It Took You \(guessCount) Guesses"
        } else {
            let guesses = (guessCount == 1 ? "Guess" : "Guesses")
//          var guesses = "guesses"
//          if guessCount == 1 {
//          guesses = "guess"
//          } else {
            guessAmountLabel.text = "You've Made \(guessCount) \(guesses)"
        }
    }
    
    @IBAction func guessLetterFieldChange(_ sender: UITextField) {
        if let letterGuessed = guessLetterField.text?.last {
            guessLetterField.text = "\(letterGuessed)"
            guessLetterButton.isEnabled = true
        } else {
            guessLetterButton.isEnabled = false
        }
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guessedLetter()
        updateUIAfterGuess()
    }
    
    @IBAction func guessButtonPressed(_ sender: Any) {
        updateUIAfterGuess()
    }
    @IBAction func playAgainButtonPressed(_ sender: Any) {
        playAgainButton.isHidden = true
        guessLetterField.isEnabled = true
        guessLetterButton.isEnabled = false
        flowerImage.image = UIImage(named: "flower8")
        guessesRemaining = maxWrongGuesses
        lettersGuessed = ""
        formatUserGuessLabel()
        guessAmountLabel.text = "You've Made 0 Guesses"
        guessCount = 0
    }
    
}

