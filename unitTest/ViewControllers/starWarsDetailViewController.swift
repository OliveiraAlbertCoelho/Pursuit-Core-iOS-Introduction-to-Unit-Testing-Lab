//
//  starWarsDetailViewController.swift
//  unitTest
//
//  Created by albert coelho oliveira on 8/29/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import UIKit

class starWarsDetailViewController: UIViewController {
    var movie: Movie!
    @IBOutlet weak var textLabel: UITextView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUp()
        
    }
    func loadUp() {
        textLabel.text = movie.opening_crawl
        movieTitle.text = movie.title
    }
    
    
    
}
