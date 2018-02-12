//
//  ViewController.swift
//  Word Garden
//
//  Created by Nathan Lee on 2/5/18.
//  Copyright © 2018 Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var guessedLetterField: UITextField!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var flowerImageView: UIImageView!
    var wordToGuess = "SWIFT"
    var lettersGuessed = ""
    let maxNumOfWrongGuesses = 8
    var wrongGuessesRemaining = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatUserGuessLabel()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
    }
    
    func updateUIAfterGuess(){
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
    
    func formatUserGuessLabel(){
        var revealedWord = ""
        lettersGuessed = guessedLetterField.text!
        for letter in wordToGuess {
            if lettersGuessed.contains(letter){
                revealedWord = revealedWord + String(letter)
            }
            else {
                revealedWord += " _"
            }
        }
        revealedWord.removeFirst()
        userGuessLabel.text = revealedWord
    }
    
    func guessALetter(){
        formatUserGuessLabel()
        if !wordToGuess.contains(guessedLetterField.text!){
            wrongGuessesRemaining = wrongGuessesRemaining - 1
        }
        flowerImageView.image = UIImage(named: "flower" + String(wrongGuessesRemaining))
        
        if wrongGuessesRemaining == 0 {
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
        }
        
    }
    
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        if let letterGuessed = guessedLetterField.text?.last {
            guessedLetterField.text = "\(letterGuessed)"
        }
        else{
            //disable the button if i dont have a single character in the guessedLetterField
            guessLetterButton.isEnabled = false
        }
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guessALetter()
       updateUIAfterGuess()
    }
    
    @IBAction func guessButtonPressed(_ sender: UIButton) {
        guessALetter()
        updateUIAfterGuess()
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        playAgainButton.isHidden = true
        guessedLetterField.isEnabled = true
        flowerImageView.image = UIImage(named: "flower8")
        wrongGuessesRemaining = maxNumOfWrongGuesses
        lettersGuessed = ""
        formatUserGuessLabel()
    }
    

}

