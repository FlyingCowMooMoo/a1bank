//
//  Utils.swift
//  a1bank
//
//  Created by Panagiotis Papasyamatis on 15/05/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import Foundation

public class Utils
{
    
    
    public static func getRandomCurrency() -> String
    {
        let currencies = ["BGN",
            "BRL",
            "CAD",
            "CHF",
            "CNY",
            "DKK",
            "GBP",
            "HKD",
            "HRK",
            "HUF",
            "IDR",
            "ILS",
            "INR",
            "JPY",
            "KRW",
            "MXN",
            "MYR",
            "NOK",
            "NZD",
            "PHP",
            "PLN",
            "RON",
            "RUB",
            "SEK",
            "SGD",
            "THB",
            "TRY",
            "ZAR",
            "EUR"]
        
        let randomIndex = Int(arc4random_uniform(UInt32(currencies.count)))
        
        return currencies[randomIndex]
    }
    
    public static func getCurrencySymbol(currency: String) -> String
    {
        let localeComponents = [NSLocaleCurrencyCode: currency]
        let localeIdentifier = NSLocale.localeIdentifierFromComponents(localeComponents)
        let locale = NSLocale(localeIdentifier: localeIdentifier)
        let currencySymbol = locale.objectForKey(NSLocaleCurrencySymbol) as! String
        return currencySymbol
    }
}