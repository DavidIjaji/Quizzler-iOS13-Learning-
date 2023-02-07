//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by David Alejandro Ijaji Guerrero on 23/01/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct Question{
    var q:String;
    var a:[String];
    var correctAnswer:String;
    init(q:String,a:[String],correctAnswer:String) {
        self.q = q;
        self.a = a;
        self.correctAnswer = correctAnswer;
    }
}
