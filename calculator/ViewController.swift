//
//  ViewController.swift
//  calculator
//
//  Created by Tara Jue on 2/18/19.
//  Copyright © 2019 Tara Jue. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet var firstNum: UILabel!
    @IBOutlet var secondNum: UILabel!
    @IBOutlet var signLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var answerLabel: UITextField!
    
    var currAnswerIndex: Int = 0
    
    func random(max MaxNumber:Int)-> String {
        return String(arc4random_uniform(UInt32(MaxNumber)))
    }
    
    
    let signs: [String] = [
        "+","-","*","/"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNum.text = random(max: 10)
        secondNum.text = random(max: 10)
        signLabel.text = String(arc4random_uniform(UInt32(signs.count)))
    }
    
    func add(_ a: Int, _ b: Int)->Int
    {
        return a+b
    }
    
    func sub(_ a: Int, _ b: Int)->Int
    {
        return a-b
    }
    
    func mult(_ a: Int, _ b: Int)->Int
    {
        return a*b
    }
    
    func div(_ a: Int, _ b: Int)->Int
    {
        if b != 0 {
            return a/b
        }   else {
            return 0
        }
    }
    
    func doMath(_ a: Int, _ b: Int, _ op:Character) -> Int
    {
        switch op {
            case "+": return add(a,b)
            case "-": return sub(a,b)
            case "*": return mult(a,b)
            case "/": return div(a,b)
            default: return 0
        }
    }

    
    var total: Int = 0
    var correct: Int = 0
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        answerLabel.resignFirstResponder()
    }

    @IBAction func nextQuestion(_ sender: UIButton)
    {
        let answer = answerLabel.text
        let correctAnswer = doMath(firstNum.text,secondNum.text,signLabel.text)
        //print(answer)
        if answer == correctAnswer {
            correct+=1
        }
        
        currAnswerIndex+=1
        if currAnswerIndex == firstNums.count {
            currAnswerIndex=0
        }
        
        firstNum.text = firstNums[currAnswerIndex]
        secondNum.text = secondNums[currAnswerIndex]
        signLabel.text = signs[currAnswerIndex]
        answerLabel.text = ""
        scoreLabel.text = "\(correct) / 10"
    }
    


}

