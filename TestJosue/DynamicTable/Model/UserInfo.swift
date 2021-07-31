//
//  UserInfo.swift
//  TestJosue
//
//  Created by Josue on 30/07/21.
//

import Foundation

class UserInfo: Codable {
    
    var colors: [String?]
    var questions : [Question]
    
    enum CodingKeys: String, CodingKey {
        case colors
        case questions
    }
    
    init(data: [String: Any]?) {
        var tmpColors = [String]()
        var tmpQuestion = [Question]()
        colors = data?[UserInfo.CodingKeys.colors.rawValue] as? [String] ?? [""]
        
        for (_, color) in colors.enumerated() {
            tmpColors.append(color ?? "")
        }
        
        self.colors = tmpColors
        
        if let questions = data?[UserInfo.CodingKeys.questions.rawValue] as? [[String:Any]]{
            
            for (_, question) in questions.enumerated() {
                tmpQuestion.append(Question(data: question))
                
            }
        }
        self.questions = tmpQuestion
    }
}

