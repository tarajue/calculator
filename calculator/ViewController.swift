//
//  ViewController.swift
//  calculator
//
//  Created by Tara Jue on 2/18/19.
//  Copyright © 2019 Tara Jue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var firstNum: UILabel!
    @IBOutlet var secondNum: UILabel!
    @IBOutlet var signLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    var currAnswerIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNum.text = firstNums[currAnswerIndex]
        secondNum.text = secondNums[currAnswerIndex]
        signLabel.text = signs[currAnswerIndex]
    }
    
    let firstNums: [String] = [
        "5","2","3","4","6","8","9","3","4","7"
    ]
    
    let signs: [String] = [
        "+","-","*","/","+","-","*","/","+","-"
    ]
    
    let secondNums: [String] = [
        
        "1","2","3","4", "4", "0", "0", "1", "4", "9"
    ]
    
    let answers: [String] = [
        "6","0","9","1","10","8","0","3","8","-2"
    ]

    var total: Int = 0
    var correct: Int = 0

    @IBAction func nextQuestion(_ sender: UIButton)
    {
        let answer = answerLabel.text
        print(answer)
        if answer == answers[currAnswerIndex] {
            correct+=1
        }
        
        currAnswerIndex+=1
        if currAnswerIndex == firstNums.count {
            currAnswerIndex=0
        }
        
        firstNum.text = firstNums[currAnswerIndex]
        secondNum.text = secondNums[currAnswerIndex]
        signLabel.text = signs[currAnswerIndex]
        scoreLabel.text = "\(correct) / 10"
    }
    


}

