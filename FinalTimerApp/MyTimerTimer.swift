//
//  MyTimerTimer.swift
//  FinalTimerApp
//
//  Created by Phammel on 12/19/16.
//  Copyright © 2016 Phammel. All rights reserved.
//

import Foundation

import UIKit
import AudioToolbox

class myTimerTimer
{
    
    
    var timeMin: Int
    
    
    var timeSec: Int
    
    var mytimerSec = Timer()
    
    var running = false
    
    var button: UIButton
    
    var View: UIViewController
    
    
    
    
    
    
    init(seconds: Int, minutes: Int, button: UIButton, view: UIViewController)
    {
       
            self.View = view
            timeSec = seconds % 60
            timeMin = (seconds / 60) + minutes
            self.button = button
        
        
    }
    
    func Start()
    {
        running = true
        
        
        mytimerSec = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(IncrementSec), userInfo: nil, repeats: true)
        
    }
    
    @objc func Incrementmin()
    {
        timeMin -= 1
        print("-min")
        
    }
    @objc func IncrementSec()
    {
        
        if (timeSec == 0 && timeMin == 0)
        {
           self.mytimerSec.invalidate()
            Reset()
            
            let myAlert = UIAlertController(title: "Timer Done", message: nil, preferredStyle: .alert)
        
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel) { (addAction) -> Void in
               
                
            }
            myAlert.addAction(okAction)
            
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            print("vibrate")
            
            View.present(myAlert, animated: true, completion: nil)
        }
        if(timeMin == -1)
        {
            Reset()
        }
        
        
        if (timeSec == 0 && !(timeMin == 0) )
        {
            timeSec = 59
            timeMin -= 1 
        }
        else if (!(timeSec == 0 && timeMin == 0))
        {
            timeSec -= 1
        }
        var timeToGoIn = "\(timeMin):\(timeSec)"
        button.setTitle(timeToGoIn, for: .normal)
    }
    
    
    func Pause()
    {
        running = false
        mytimerSec.invalidate()
       
        
    }
    
    func Reset()
    {
        running = false
        mytimerSec.invalidate()
        timeSec = 0
        timeMin = 0
        var timeToGoIn = "\(timeMin):\(timeSec)"
        button.setTitle(timeToGoIn, for: .normal)
     
       
       
        
    }
    
    
    
}
