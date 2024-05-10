//
//  TotalModel.swift
//  FutureCash
//
//  Created by apple on 2024/3/25.
//

import Foundation
import HandyJSON

class BaseModel: HandyJSON {
    required init() {}
    var conceive: Int?
    var wanting: String?
    var easily: [String: Any]?
}

class EasilyModel: HandyJSON {
    required init() {}
    var feared: FearedModel?
    var except: [ExceptModel]?
    var palace: [PlaceModel]?
}

class PlaceModel: HandyJSON {
    required init() {}
    var employment: String?
    var particularly: String?
    var palace: [PlaceModel]?
}

class ExceptModel: HandyJSON {
    required init() {}
    var particularly: String?
    var blonde: String?//标题
    var blamed: String?//placeholder
    var conceive: String?//code保存时的key键
    var ourselves: String?//cell样式
    var calls: String?//是否是数字键盘1是
    var children: [ChildrenModel]?
    var sapped: String?//回写的值
    var excuse: String?//传值
}

class ChildrenModel: HandyJSON {
    required init() {}
    var employment: String?
    var excuse: String?
}

class GoogleModel: HandyJSON {
    required init() {}
    var pistol: String?
    var profession: String?
}

class LoginModel: HandyJSON {
    required init() {}
    var temperance: String?//phone
    var temple: String?//sessionid
}

class CardTypeModel: HandyJSON {
    required init() {}
    var pwpnnemw: [PModel]?
}

class PModel: HandyJSON {
    required init() {}
    var excuse: String?//umid
    var yewtiful: String?//pic url
}

class HomeModel: HandyJSON {
    required init() {}
    var stranger: String?
    var untidily: BigCardModel?
}

class BigCardModel: HandyJSON {
    required init() {}
    var reddening: ReddeningModel?
}

class ReddeningModel: HandyJSON {
    required init() {}
    var particularly: String?//产品ID
    var plume: String?
    var expenditure: String?
    var spacious: String?//额度
    var imagination: String?//文案
    var crime: String?//时间
    var enamoured: String?
    var stories: String?
    var reads: String?
}

class CardInfoModel: HandyJSON {
    required init() {}
    var employment: String?//name
    var thorough: String?//id
    var intended: String?//date
    var weren: String?//pic url
    var telephoned: String?//year
    var frauds: String?//mon
    var ingenious: String?//day
}

class IDCradModel: HandyJSON {
    required init() {}
    var weren: String?//人脸地址
    var waved: WavedModel?
}

class WavedModel: HandyJSON {
    required init() {}
    var weren: String?//ID地址
}

class FaceModel: HandyJSON {
    required init() {}
    var stands: String?
}

class FearedModel: HandyJSON {
    required init() {}
    var enjoyment: String?//下一步认证
}
