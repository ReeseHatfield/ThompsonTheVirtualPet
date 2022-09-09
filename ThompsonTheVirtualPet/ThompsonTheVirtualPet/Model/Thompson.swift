//
//  Thompson.swift
//  ThompsonTheVirtualPet
//
//  Created by Reese Hatfield on 9/7/22.
//

import Foundation

class Thompson{
    
    var hunger : Float! = 100.00;
    var thirst : Float! = 100.00;
    var happiness : Float! = 100.00;
    var health : Float = 100.00;
    var isAlive : Bool = true;
    var isDepressed : Bool = false;
    
    func progressTime(){
        
        let sadModifier : Float = getSadnessModifier();
        self.happiness = updateHappiness();
        

        self.hunger! -= (1.5 * sadModifier);
        
        if(self.hunger < 0.0){
            self.hunger = 0;
        }
        self.thirst! -= (1.75 * sadModifier);
        if(self.thirst < 0){
            self.thirst = 0.0;
        }
        //thirst should increase faster than hunger
        
        isDepressed = self.happiness < 30 ? true : false;
        
        
        if(self.health < 0){
            self.kill();
        }
        
        if(self.hunger < 30){
            self.health -= 1;
        }
        
        if(self.thirst < 30){
            self.health -= 1;
        }
        
        
    
    }
    
    func getSadnessModifier () -> Float{
        if(self.happiness > 75){
            return 1.1;
        }
        else if(self.happiness > 50){
            return 1.25;
        }
        else if(self.happiness > 25){
            return 1.50;
        }
        else{
            return 2.0;
        }
        
    }
    
    func updateHappiness() -> Float{
        var currentHappiness : Float = self.happiness;
        
        if(happiness < 0){
            return currentHappiness;
        }
        
        if(self.thirst < 50){
            currentHappiness -= 5.0;
        }
        else{
            currentHappiness += 1.0;
        }
        
        
        
        if(self.hunger < 50){
            currentHappiness -= 5.0;
        }
        else{
            currentHappiness += 1.0;
        }
        
        
        
        return currentHappiness;
        
    }
    
    func feed(foodNum : Int){
        self.hunger += Float(foodNum);
        
        if(self.hunger > 100.00){
            self.hunger = 100;
        }
    }
    
    func quench(){
        self.thirst += Float(10);
        
        if(self.hunger > 100.00){
            self.hunger = 100;
        }
    }
    
    
    func kill(){
        self.isAlive = false;
    }
    
    
}
