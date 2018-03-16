//
//  QuestionsViewController.swift
//  PersonalityQuiz
//
//  Created by Ryan Kohn on 3/5/18.
//  Copyright © 2018 johnherseyhighschool. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var QuestionLabel: UILabel!
    
    @IBOutlet weak var SingleStackView: UIStackView!
    @IBOutlet weak var SingleButton1: UIButton!
    @IBOutlet weak var SingleButton2: UIButton!
    @IBOutlet weak var SingleButton3: UIButton!
    @IBOutlet weak var SingleButton4: UIButton!
    
    @IBOutlet weak var MultipleStackView: UIStackView!
    @IBOutlet weak var MultiLabel1: UILabel!
    @IBOutlet weak var MultiLabel2: UILabel!
    @IBOutlet weak var MultiLabel3: UILabel!
    @IBOutlet weak var MultiLabel4: UILabel!
    
    @IBOutlet weak var MultipleSwitch1: UISwitch!
    @IBOutlet weak var MultipleSwitch2: UISwitch!
    @IBOutlet weak var MultipleSwitch3: UISwitch!
    @IBOutlet weak var MultipleSwitch4: UISwitch!
    
    @IBOutlet weak var RangedStackView: UIStackView!
    @IBOutlet weak var RangedLabel1: UILabel!
    @IBOutlet weak var RangedLabel2: UILabel!
    
    @IBOutlet weak var QuestionProgressView: UIProgressView!
    
    @IBOutlet weak var rangeSlider: UISlider!
    
    var questionIndex = 0
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    func updateUI() {
        SingleStackView.isHidden = true
        MultipleStackView.isHidden = true
        RangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let CurrentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex+1)"
        QuestionLabel.text = currentQuestion.text
        QuestionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: CurrentAnswers)
        case .multiple:
            updateMultipleStack(using: CurrentAnswers)
        case .ranged:
            updateRangedStack(using: CurrentAnswers)
        }
    }
    
    func updateSingleStack (using answers: [Answer]) {
        SingleStackView.isHidden = false
        SingleButton1.setTitle(answers[0].text, for: .normal)
        SingleButton2.setTitle(answers[1].text, for: .normal)
        SingleButton3.setTitle(answers[2].text, for: .normal)
        SingleButton4.setTitle(answers[4].text, for: .normal)
        
    }
    
    func updateMultipleStack (using answers: [Answer]) {
        MultipleStackView.isHidden = false
        MultipleSwitch1.isOn = false
        MultipleSwitch2.isOn = false
        MultipleSwitch3.isOn = false
        MultipleSwitch4.isOn = false
        MultiLabel1.text = answers[0].text
        MultiLabel2.text = answers[1].text
        MultiLabel3.text = answers[2].text
        MultiLabel4.text = answers[3].text
    }
    
    @IBAction func RangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangeSlider.value * Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    
    func updateRangedStack(using answers: [Answer]){
        RangedStackView.isHidden = false
        rangeSlider.setValue(0.5, animated: false)
        RangedLabel1.text = answers.first?.text
        RangedLabel2.text = answers.last?.text
    }
    
    var answersChosen: [Answer] = []
    
    @IBAction func SingleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case SingleButton1:
            answersChosen.append(currentAnswers[0])
        case SingleButton2:
            answersChosen.append(currentAnswers[1])
        case SingleButton3:
            answersChosen.append(currentAnswers[2])
        case SingleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        
        nextQuestion()
    }
    
    @IBAction func MultipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        if MultipleSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if MultipleSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if MultipleSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if MultipleSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
    
        nextQuestion()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            let  resultsViewController = segue.destination as!
                ResultsViewController
           resultsViewController.responses = answersChosen
        }
    }

    

}

