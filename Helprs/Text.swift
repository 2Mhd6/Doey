//
//  Text.swift
//  Todo List
//
//  Created by Mohammed on 02/11/2024.
//

import Foundation

struct TextHelper{
    
    static func limtText(text: String, limt: Int) -> String{
        if text.count > limt{
            return String(text.prefix(limt))
        }else {
            return text
        }
    }
}
