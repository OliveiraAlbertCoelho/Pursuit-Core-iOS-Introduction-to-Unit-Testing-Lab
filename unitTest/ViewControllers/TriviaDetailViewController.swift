//
//  TriviaDetailViewController.swift
//  unitTest
//
//  Created by albert coelho oliveira on 8/29/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import UIKit

class TriviaDetailViewController: UIViewController {
    var selecTriv: trivia!
    @IBOutlet weak var question: UILabel!
    @IBOutlet var buttonOutlet: [UIButton]!
    @IBOutlet weak var correctAnsw: UILabel!
    
    
    var array = [String]()
    @IBAction func buttonAction(_ sender: UIButton) {
        if let title = sender.titleLabel?.text{
            print(selecTriv.correct_answer)
            if title == selecTriv.correct_answer.removingPercentEncoding{
                self.view.backgroundColor = .green
            } else {
                self.view.backgroundColor = .red
                correctAnsw.isHidden = false
                correctAnsw.text = "Correct answer: \(selecTriv.correct_answer.removingPercentEncoding!)"
            }
        }
        disableAll()
    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeArray()
        setUpButtons()
    }
    func makeArray() {
        for (_,v) in selecTriv.incorrect_answers.enumerated(){
            array.append(v)
        }
        print(array)
        array.append(selecTriv.correct_answer)
    }
    func setUpButtons(){
        question.text = selecTriv.question.removingPercentEncoding
        for (k,v) in array.enumerated(){
            buttonOutlet[k].isHidden = false
            buttonOutlet[k].setTitle(v.removingPercentEncoding, for: .normal)
        }
    }
    func disableAll(){
        for (_,v) in buttonOutlet.enumerated(){
            v.isEnabled = false
        }
    }
}

