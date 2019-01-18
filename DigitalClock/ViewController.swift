 //
//  ViewController.swift
//  DigitalClock
//
//  Created by Ievgeniia Pavliuchyk on 14/01/2019.
//  Copyright © 2019 Ievgeniia Pavliuchyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    @IBOutlet weak var clockClorSeg: UISegmentedControl!
    @IBOutlet weak var backgroundColorSeg: UISegmentedControl!
    @IBOutlet weak var backgroundImageSeg: UISegmentedControl!
    @IBOutlet weak var settingsButton: UIButton!
    
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        self.updateTimer()
        
        settingsView.isHidden = true
        settingsView.layer.cornerRadius = 10
        settingsButton.layer.cornerRadius = 10
    }

    @objc func updateTimer(){
        
        let timeFormatter = DateFormatter()
        
        timeFormatter.timeStyle =  .medium
        
        label.text = timeFormatter.string(from: NSDate() as Date)
        
    }
    
    
    @IBAction func settings(_ sender: Any) {
        
        if settingsView.isHidden == true{
            settingsView.isHidden = false
            settingsButton.setTitle("Hide Settings", for: UIButton.State.normal)
            settingsButton.alpha = 1.0
            
        }else{
            
            settingsView.isHidden =  true
            settingsButton.setTitle("Show Settings", for: UIButton.State.normal)
             settingsButton.alpha = 0.5
        }
    }
    
    @IBAction func clockColor(_ sender: Any) {
        
        if (clockClorSeg.selectedSegmentIndex == 0){
            label.textColor = UIColor.white
        }
        if (clockClorSeg.selectedSegmentIndex == 1){
            label.textColor = UIColor.black
        }
        if (clockClorSeg.selectedSegmentIndex == 2){
            label.textColor = UIColor.red
        }
        if (clockClorSeg.selectedSegmentIndex == 3){
            label.textColor = UIColor.green
        }
    }
    
    @IBAction func backgroundColor(_ sender: Any) {
        
        if (backgroundColorSeg.selectedSegmentIndex == 0){
            self.view.backgroundColor = UIColor.black
        }
        
        if (backgroundColorSeg.selectedSegmentIndex == 1){
            self.view.backgroundColor = UIColor.white
        }
        
        if (backgroundColorSeg.selectedSegmentIndex == 2){
            self.view.backgroundColor = UIColor.yellow
        }
        
        if (backgroundColorSeg.selectedSegmentIndex == 3){
            self.view.backgroundColor = UIColor.blue
        }
        
        backgroundImage.isHidden = true
    }
    
    @IBAction func backgroundImage(_ sender: Any) {
        
        if (backgroundImageSeg.selectedSegmentIndex == 0){
            backgroundImage.image = UIImage(named: "Background1")
        }
        
        if (backgroundImageSeg.selectedSegmentIndex == 1){
            backgroundImage.image = UIImage(named: "Background2")
        }
        
        if (backgroundImageSeg.selectedSegmentIndex == 2){
            backgroundImage.image = UIImage(named: "Background3")
        }
        
        if (backgroundImageSeg.selectedSegmentIndex == 3){
            backgroundImage.image = UIImage(named: "Background4")
        }
        
        backgroundImage.isHidden = false
    }
    
    
}

