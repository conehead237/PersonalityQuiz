//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Ryan Kohn on 3/8/18.
//  Copyright © 2018 johnherseyhighschool. All rights reserved.
//

import UIKit


    
struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}
    
    enum ResponseType {
        case single, multiple, ranged
    }
    
    struct Answer {
        var text: String
        var type: AnimalType
    }
    
    enum AnimalType: Character {
        case dog = "🐶", cat = "🐱", bunny = "🐰",turtle = "🐢"
    
        var definition: String {
            switch self {
            case .dog:
                return "You are incedibly outgoing. You surrond yourslef with the people you love and enjoy activities with your friends."
            case .cat:
                return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms."
            case .bunny:
                return "You love everything that's soft. You are healthy and full of energy."
            case .turtle:
                return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race."
            }
        }
    }




