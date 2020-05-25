//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Henry Feiler on 5/11/20.
//  Copyright © 2020 Henry Feiler. All rights reserved.
//

import Foundation

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
    var type: QuizType
}

enum QuizType: Character {
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    case highHeel = "👠", sneaker = "👟", hikingBoot = "🥾", bareFoot = "🦶"
    
    var definition: String {
        switch self {
        case .dog:
            return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends."
        case .cat:
            return "Mischevious, yet mild-tempered, you enjoy doing things on your own terms."
        case .rabbit:
            return "You love everything that's soft. You are healthy and full of energy."
        case .turtle:
            return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race."
        case .highHeel:
            return "You are a high heel"
        case .sneaker:
            return "You are a sneaker"
        case .hikingBoot:
            return "You are a hiking boot"
        case .bareFoot:
            return "You prefer no shoes"
        }
    }
}
