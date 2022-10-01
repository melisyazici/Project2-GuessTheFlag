//
//  ViewController.swift
//  Project2
//
//  Created by Melis Yazıcı on 28.09.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var currentQuestion = 0
    let maxQuestion = 10
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Score", style: .plain, target: self, action: #selector(showScore))
        
        
        askQuestion()
        
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        currentQuestion += 1
        
        if currentQuestion > maxQuestion {
            showResult()
            return
        }
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
        
        updateTitle()
        
        
    }
    
    @objc func showScore() {
        let ac = UIAlertController(title: "Your score: ", message: "\(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default))
        present(ac, animated: true)
        
    }
    
    
    func showResult() {
        
        let ac = UIAlertController(title: "End of the game", message: "Question asked: \(maxQuestion) \n Final Score: \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Restart game", style: .default, handler: askQuestion))
        present(ac, animated: true)
        
        score = 0
        correctAnswer = 0
        currentQuestion = 0
        
    }
    
    func updateTitle() {
        title = "\(countries[correctAnswer].uppercased()) ? "
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
//        var title: String
//        var message: String
        
        if sender.tag == correctAnswer {
//            title = "Correct"
            score += 1
//            message = "Score: \(score)"
            askQuestion()
        } else {
            //title = "Wrong"
//            message = """
//                That's the flag of \(countries[sender.tag].uppercased())
//                Flag of \(countries[correctAnswer].uppercased()) was: #\(correctAnswer + 1)
//                Score: \(score)
//                """
            askQuestion()
        }
        
//        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
//        present(ac, animated: true)
        
        print(score)
        
        updateTitle()
        
        
    }
    
    
}

