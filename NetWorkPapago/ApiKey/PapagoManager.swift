import UIKit
import Alamofire


/*
 
{
    "message": {
        "@type": "response",
        "@service": "naverservice.nmt.proxy",
        "@version": "1.0.0",
        "result": {
            "srcLangType": "ko",
            "tarLangType": "en",
            "translatedText": "Hi, nice to meet you.",
            "engineType": "PRETRANS"
        }
    }
}
*/


struct PapaGo: Decodable {
    let message: PapaGoData
}

struct PapaGoData: Decodable {
    let result: PaPagoLast
}

struct PaPagoLast: Decodable {
    let srcLangType: String
    let tarLangType: String
    let translatedText: String
}

enum PapagoLanguageOf: String, CaseIterable{
    case korean = "ko"
    case english = "en"
    case japan = "ja"
    case china = "zh-CN"
    case Taiwan = "zh-TW"
    case vietnam = "vi"
    case indonesia = "id"
    case thaipei = "th"
    case germen = "de"
    case rusia = "ru"
    case spain = "es"
    case italy = "it"
    case france = "fr"
}


struct PapagoCanTrans {
    let can = [
        "ko":"한국어",
        "en":"영어",
        "ja":"일본어",
        "zh-CN":"중국어 간체",
        "zh-TW":"중국어 번체",
        "vi":"베트남어",
        "id":"인도네시아어",
        "th":"태국어",
        "de":"독일어",
        "ru":"러시아어",
        "es":"스페인어",
        "it":"이탈리아어",
        "fr":"프랑스어"
    ]
}


// 프로토콜 딜리게이트를 이용해 전뷰에 있는 내용을 끄집어 낼수 있다.
// 참고 자료 : https://nlestory.tistory.com/170
