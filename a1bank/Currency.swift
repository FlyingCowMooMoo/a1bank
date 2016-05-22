//
//  Currency.swift
//  a1bank
//
//  Created by Panagiotis Papasyamatis on 15/05/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import Foundation

public class Currency
{

    static func getCurrencyData(currencyA: String, currencyB: String) throws -> Double
    {
        let r = Just.get("https://api.fixer.io/latest?base=" + currencyA)
        print(r)
        if let jsonData = r.json as? [String:AnyObject]
        {
            var rate = jsonData["rates"]
            rate = rate![currencyB]
            if rate == nil
            {
                throw RequestError.InvalidCurrency
            }
            if let val = rate!.doubleValue as? Double
            {
                return val
            }

        }
        throw RequestError.InvalidCurrency
    }
    
}