//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Ryan Kohn on 3/5/18.
//  Copyright © 2018 johnherseyhighschool. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var responses: [Answer]!
    
    @IBOutlet weak var resultsAnswerLabel: UILabel!
    @IBOutlet weak var ResultsDefinition: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    func calculatePersonalityResult() {
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        let responseTypes = responses.map {$0.type}
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        let mostCommonAnswer = frequencyOfAnswers.sorted {$0.1 > $1.1}.first?.key
        resultsAnswerLabel.text = "You are a \(mostCommonAnswer?.rawValue)!"
        ResultsDefinition.text = mostCommonAnswer?.definition
        
    }

}
