//
//  File.swift
//  Quizzler
//
//  Created by Eng.lolla on 11/13/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation
class Question
{
    let questionText : String
    let  answer : Bool
    init(Text:String,correct :Bool) {
        questionText=Text
        answer = correct
        
    }
   
}
