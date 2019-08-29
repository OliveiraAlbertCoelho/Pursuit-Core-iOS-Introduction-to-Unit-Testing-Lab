//
//  JokeDetailViewController.swift
//  unitTest
//
//  Created by albert coelho oliveira on 8/29/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import UIKit

class JokeDetailViewController: UIViewController {
     var selectedJoke: JokeWrapper!
    @IBOutlet weak var jokeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    loadUp ()
    }
    func loadUp () {
        jokeLabel.text = selectedJoke.punchline
    }
}
