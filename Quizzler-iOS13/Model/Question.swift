//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Vladimir on 07/10/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation


struct Question {
    
    var text: String
    var answer: String
    var correctAnswer: String
    
    init(q: String, a: String, correctAnswer: String) {
        self.text = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
}
