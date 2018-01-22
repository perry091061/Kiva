//
//  Kiva.swift
//  KivaLoan
//
//  Created by Perry Davies on 22/01/2018.
//  Copyright © 2018 AppCoda. All rights reserved.
//



class KivaLoan
{
    var nameLabel: String = ""
    var countryLabel:String = ""
    var useLabel:String = ""
    var amountLabel:Int = 0 
}

extension KivaLoan
{
    func toString() ->String
    {
        return "\(nameLabel) : \(countryLabel) : \(useLabel) : \(amountLabel)"
    }
}
