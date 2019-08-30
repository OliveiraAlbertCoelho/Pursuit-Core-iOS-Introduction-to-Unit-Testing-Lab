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

        @IBAction func buttonAction(_ sender: UIButton) {

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        hideALl()
        checkType()
    }
    func checkType(){
        if selecTriv.type == "multiple"{
                loadUpTwoQuestions()
        }else {
             loadUpFourQuestions()
        }
    }
    func hideALl() {
        for i in buttonOutlet{
            i.isHidden = true
        }
    }
    func showAll (){
        for i in buttonOutlet{
    i.isHidden = false
        }
    }
    
    func loadUpFourQuestions(){
     buttonOutlet[0].titleLabel?.text = selecTriv.correct_answer
     buttonOutlet[1].titleLabel?.text = selecTriv.incorrect_answers[0]
     buttonOutlet[2].titleLabel?.text = selecTriv.incorrect_answers[1]
     buttonOutlet[3].titleLabel?.text = selecTriv.incorrect_answers[2]
     showAll ()
        }
    func loadUpTwoQuestions() {
        buttonOutlet[0].titleLabel?.text = selecTriv.correct_answer
        buttonOutlet[1].titleLabel?.text = selecTriv.incorrect_answers[0]
        buttonOutlet[0].isHidden = false
         buttonOutlet[1].isHidden = false
    }
    }

