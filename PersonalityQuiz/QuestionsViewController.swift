//
//  QuestionsViewController.swift
//  PersonalityQuiz
//
//  Created by Ryan Kohn on 3/5/18.
//  Copyright © 2018 johnherseyhighschool. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    var questions: [Question] = [
        Question(text: "Which food do you like the most?" ,
                 type: .single,
            answers: [
                Answer(text: "Steak", type: .dog),
                Answer(text: "Fish", type: .cat),
                Answer(text: "Carrots", type: .bunny),
                Answer(text: "Corn", type: .turtle)
            ]),
    Question(text: "Which activities do you enjoy?",
        type: .multiple,
        answers: [
    Answer(text: "Swimming", type: .turtle),
    Answer(text: "Sleeping", type: .cat),
    Answer(text: "Cuddling", type: .bunny),
    Answer(text: "Eating", type: .dog)
    ]),
    Question(text: "How much do enjoy car rides?" ,
    type: .ranged,
        answers: [
            Answer(text: "I dislike them", type: .cat),
            Answer(text: "I get a little nervous", type: .bunny),
            Answer(text: "I barely notice them", type: .turtle),
            Answer(text: "I love them", type: .dog)
        ])
    ]
    
    var questionIndex = 0
    
    
    



 

}

