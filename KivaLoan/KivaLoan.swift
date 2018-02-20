//
//  Kiva.swift
//  KivaLoan
//
//  Created by Perry Davies on 22/01/2018.
//  Copyright © 2018 AppCoda. All rights reserved.
//

struct ImageData : Decodable {
    var id:Int?
    var template_id:Int?
}

struct CountryData : Decodable {
    var country:String?
    var country_code:String?
    var geo:GeoData?
}

struct GeoData : Decodable {
    var level:String?
    var pairs:String?
    var type:String?
}
struct LanguageData : Decodable {
    var languages:[String]?
}
struct TagData : Decodable {
    var name:String?
}

struct KivaLoan : Decodable
{
    
    var activity: String?
    var basket_amount: Int?
    var bonus_credit_eligibility:Bool?
    var borrower_count:Int?
    var description:LanguageData?
    var funded_amount:Int?
    var id:Int?
    var image:ImageData?
    var lender_count:Int?
    var loan_amount:Int?
    var location:CountryData?
    var name:String?
    var partner_id:Int?
    var planned_expiration_date:String?
    var posted_date:String?
    var sector:String?
    var status:String?
    var tags:[String]?
    var use:[TagData]?
    
}
