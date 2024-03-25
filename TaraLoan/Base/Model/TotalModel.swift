//
//  TotalModel.swift
//  TaraLoan
//
//  Created by apple on 2024/3/25.
//

import Foundation
import HandyJSON

class BaseModel: HandyJSON {
    required init() {
    }
    var awareness: Int?
    var edges: String?
    var hovered: [String: Any]?
}

