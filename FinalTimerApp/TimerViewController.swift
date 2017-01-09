//
//  TimerViewController.swift
//  FinalTimerApp
//
//  Created by Phammel on 12/19/16.
//  Copyright © 2016 Phammel. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController
{

    var readyToGo = false
    var timer:myTimerTimer!
    var editable = true
    var start = true
    
    @IBOutlet weak var TimerTextButton: UIButton!
    
    
    @IBOutlet weak var StartStopButton: UIButton!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

       
    }
    
    
    @IBAction func TimerTextTap(_ sender: Any)
    {
        
        
        if (editable)
        {
    
        let myAlert = UIAlertController(title: "Set Timer", message: nil, preferredStyle: .alert)
        
        myAlert.addTextField { (alertTextfeild) -> Void in
            alertTextfeild.placeholder = "Minutes" // add place holder text
        }
        
        myAlert.addTextField { (alertTextfeild) -> Void in
            alertTextfeild.placeholder = "Seconds" // add place holder text
        }
        
        
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (addAction) -> Void in
            let mins = myAlert.textFields![0] as UITextField
            let secs =  myAlert.textFields![1] as UITextField
            
            if (mins.text == "")
            {
                mins.text = "0"
            }
            if(secs.text == "")
            {
                secs.text = "0"
            }
            
            
            self.timer = myTimerTimer(seconds: Int(secs.text!)!, minutes: Int(mins.text!)!, button: self.TimerTextButton, view: self)
            
            var timeSecGoIN = Int(secs.text!)! % 60
            var timeMinGoIN = (Int(secs.text!)! / 60) + Int(mins.text!)!
            
            
            
            var timeToGoIn = "\(timeMinGoIN):\(timeSecGoIN)"
            self.TimerTextButton.setTitle(timeToGoIn, for: .normal)
            
            self.readyToGo = true
        }
        myAlert.addAction(addAction)
        
        
        self.present(myAlert, animated: true, completion: nil)

        }
        
        
    }
    
    @IBAction func StartStopTap(_ sender: Any)
    {
        if (!readyToGo)
        {
            
        }
        else
        {
            editable = false
            TimerTextButton.isUserInteractionEnabled = false
            if (timer.running)
            {
                timer.Pause()
                StartStopButton.setTitle("Start", for: .normal)
            }
            else
            {
                timer.Start()
                StartStopButton.setTitle("Stop", for: .normal)
            }
        }
    }
    
    @IBAction func ResetTap(_ sender: Any)
    {
        if (!readyToGo)
        {
            
        }
        else
        {
            timer.Reset()
            editable = true
            StartStopButton.setTitle("Start", for: .normal)

            TimerTextButton.isUserInteractionEnabled = true

        }
        
    }
    
    
    

    

  
}
