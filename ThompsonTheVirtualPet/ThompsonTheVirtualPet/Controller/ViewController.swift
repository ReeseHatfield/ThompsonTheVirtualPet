//
//  ViewController.swift
//  ThompsonTheVirtualPet
//
//  Created by Reese Hatfield on 9/7/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var health : UIProgressView!;
    @IBOutlet var hunger : UIProgressView!;
    @IBOutlet var thirst : UIProgressView!;
    @IBOutlet var happiness : UIProgressView!;
    
    @IBOutlet var progressTime : UIButton!;
    @IBOutlet var feed : UIButton!;
    @IBOutlet var quench : UIButton!;
    
    @IBOutlet var moneyLabel : UILabel!;
    
    @IBOutlet var scoreLabel : UILabel!;
    
    var thompson = Thompson();
    var timer = Timer();
    var money : Int = 10;
    var highScore : Int = 0;
    var score : Int = 0;
    
    
    

    
    
    @IBOutlet var statusLabel : UILabel?;
    @IBOutlet var playAgain : UIButton!;
    
    @IBOutlet var doggo : UIImageView!;
    var animIsUp : Bool = false;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true, block: { _ in
            if(!self.thompson.isAlive){
                self.playAgain.isEnabled = true;
                self.animIsUp = false;
                
            }else{
                self.score += 1;
            }
            self.thompson.progressTime();
            self.updateView();
        
            self.scoreLabel.text = "Score: \(self.score)";
            
            if(self.animIsUp){
                self.doggo.center.y = self.doggo.center.y + 5;
            }
            else{
                self.doggo.center.y = self.doggo.center.y - 5;
            }
            self.animIsUp = !self.animIsUp;
            
            
            
            })
    }
    @IBAction func work(_ sender : UIButton){
        self.money += 3;
        self.moneyLabel?.text = "$\(self.money)";
    }
    
    @IBAction func feed (_ sender : UIButton){
        if(self.money < 15){
            return;
        }
        self.money -= 10;
        self.moneyLabel?.text = "$\(self.money)";
        
        thompson.feed(foodNum: 10);
        updateView()
        
    }
    @IBAction func restart(_ sender : UIButton){
        exit(0);
        
    }
    
    @IBAction func quench (_ sender : UIButton){
        
        if(self.money < 10){
            return
        }
        self.money -= 10;
        self.moneyLabel?.text = "$\(self.money)";
        thompson.quench();
        updateView();
    }
    
    func updateView(){
        //update the views bars to match the models stats;
        let currentHealth : Float = thompson.health;
        let currentHappiness : Float = thompson.happiness;
        let currentThirst : Float = thompson.thirst;
        let currentHunger : Float = thompson.hunger;
        
        self.health.setProgress(currentHealth/100, animated: true);
        self.happiness.setProgress(currentHappiness/100, animated: true);
        self.thirst.setProgress(currentThirst/100, animated: true);
        self.hunger.setProgress(currentHunger/100, animated: true);
        
        if(thompson.health < 0.0){
            self.statusLabel?.text = "Status: Dead";
        }
        else if(thompson.isDepressed){
            self.statusLabel?.text = "Status:  :(";
        }
        else{
            self.statusLabel?.text = "Status:  :)"
        }
        
        
    }
    

}

