//
//  CharData.swift
//  TestJosue
//
//  Created by Josue on 30/07/21.
//

import Foundation

class ChartData: Codable {
    var text: String?
    var percetnage: String?
    
    enum CodingKeys: String, CodingKey {
        case text
        case percetnage
    }
    
    init(data: [String: Any]?) {
        self.text = data?[ChartData.CodingKeys.text.rawValue] as? String
        self.percetnage = data?[ChartData.CodingKeys.percetnage.rawValue] as? String
    }
}
