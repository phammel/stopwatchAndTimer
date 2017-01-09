//
//  MyDate.swift
//  FinalTimerApp
//
//  Created by Phammel on 12/20/16.
//  Copyright © 2016 Phammel. All rights reserved.
//

import Foundation
import UIKit


class MyDate: NSObject, NSCoding
{
    
    var name = ""
    
    var date: Date
    var curdate: Date
    
    required init?(coder aDecoder: NSCoder)
    {
        name = aDecoder.decodeObject(forKey: "name") as! String
        date = aDecoder.decodeObject(forKey: "date") as! Date
        curdate = aDecoder.decodeObject(forKey: "curdate") as! Date
        
    }
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(name, forKey: "name" )
        aCoder.encode(date, forKey: "date")
        aCoder.encode(curdate, forKey: "curdate")
    }
    
    
    
    
    
    init(name: String, year: Int, month: Int, day: Int)
    {
        
        self.name = name
        
        
        var c = NSDateComponents()
        c.year = year
        c.month = month
        c.day = day
        
        // Get NSDate given the above date components
        date = (NSCalendar(identifier: NSCalendar.Identifier.gregorian)?.date(from: c as DateComponents))!

        curdate = Date()
        
    }
    
    func daysTill() -> Int
    {
        var secs = date.timeIntervalSince(curdate)
        var asInt = Int(secs)
        var days = Int((((secs / 60) / 60) / 24))
        return abs(days)
    }
    
   

    
}
