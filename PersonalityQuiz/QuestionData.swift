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
            return "Your classy and you know how to have a good time. Stay fly and dressed to kill."
        case .sneaker:
            return "You can look good and versatile at the same time. Ready for whatever."
        case .hikingBoot:
            return "You have no boundaries and the sky is the limit. No one ever tells you where you can't go."
        case .bareFoot:
            return "You are the one without shoes, you run wild. "
        }
    }
}
