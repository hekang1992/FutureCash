//
//  TotalModel.swift
//  FutureCash
//
//  Created by apple on 2024/3/25.
//

import Foundation
import HandyJSON

class BaseModel: HandyJSON {
    required init() {
    }
    var conceive: Int?
    var wanting: String?
    var easily: [String: Any]?
}

class GoogleModel: HandyJSON {
    required init() {
    }
    var pistol: String?
    var profession: String?
}
