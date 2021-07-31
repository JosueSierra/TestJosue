//
//  Question.swift
//  TestJosue
//
//  Created by Josue on 30/07/21.
//

import Foundation

class Question: Codable {
    
    var total : Int?
    var text : String?
    var chartData: [ChartData]
    
    enum CodingKeys: String, CodingKey {
        case total
        case text
        case chartData
    }
    
    init(data: [String:Any]?) {
        var tmpChartData = [ChartData]()
        self.total = data?[Question.CodingKeys.total.rawValue] as? Int
        self.text = data?[Question.CodingKeys.text.rawValue] as? String
        
        if let chartData = data?[Question.CodingKeys.chartData.rawValue] as? [[String:Any]]{
            
            for (_, data) in chartData.enumerated() {
                
                tmpChartData.append(ChartData(data: data))
                
            }
        }
        self.chartData = tmpChartData
    }
    
}
