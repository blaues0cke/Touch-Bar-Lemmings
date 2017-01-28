//
//  LemmingsScene.swift
//  TouchLemmings
//
//  Created by Erik Olsson on 2016-12-11.
//  Copyright © 2016 Erik Olsson. All rights reserved.
//

import SpriteKit

class LemmmingsScene: SKScene, SKPhysicsContactDelegate {

 // var lemmings = [Lemming]()
    
    
    let effect = SKEffectNode();
    let rect = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 2170, height: 69));
    
    let circle = SKShapeNode(circleOfRadius: 30.0)
    
     let gravityField = SKFieldNode.radialGravityField()
    
/*
  func didBegin(_ contact: SKPhysicsContact) {
    if let lemmingA = contact.bodyA.node as? Lemming,
      let lemmingB = contact.bodyB.node as? Lemming {

      if case State.walking(let direction) = lemmingA.state {
        lemmingA.state = .walking(direction: direction.theOtherDirection())
      }

      if case State.walking(let direction) = lemmingB.state {
        lemmingB.state = .walking(direction: direction.theOtherDirection())
      }
    }
  }*/
    
    override func didMove(to view: SKView) {
    
        addChild(effect)
        
        
        let rect2 = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 2170, height: 69));
        
        rect2.fillColor = .white
        effect.addChild(rect2)
        
        
        
        rect.fillColor = .green
        effect.addChild(rect)
        
        
        
        
    
        circle.position = CGPoint(x: self.frame.width / 2 + 10, y: self.frame.height / 2)
        circle.fillColor = NSColor.white
        addChild(circle)
        
        
        
       
        gravityField.position = circle.position
        gravityField.region = SKRegion(radius: 100.0)
        gravityField.strength = 4.0
        gravityField.isEnabled = true
        addChild(gravityField)
        
//        self.isUserInteractionEnabled = true;
        
        
       
        
        
        
        
    }

  /*func addLemming(at: CGPoint) {
    let l = Lemming()
    scene?.addChild(l)
    l.position = at
    l.state = .walking(direction: .left)
    lemmings.append(l)
  }

  func lemmingAt(point: CGPoint) -> Lemming? {
    return lemmings.filter { $0.contains(point) }.first
  }*/
    
    override func touchesMoved(with event: NSEvent) {
        if #available(OSX 10.12.2, *) {
            if let touch = event.allTouches().first {

                let location = CGPoint(x: touch.location(in: self.view).x, y: 14)
                
    
                let percent = location.x / self.frame.size.width
                
                
                var color1 = NSColor.green

                var color2 = NSColor.red
                
                var alphaOfProfress = 0.0
                
                
                var centerDiffY = abs(percent - 0.5)
                
              
                    alphaOfProfress = Double(centerDiffY * 2);
                    
                     print("move", percent, alphaOfProfress, centerDiffY);
                    
              
                
                // tb width: 2170;
                
                let alpha = CGFloat(alphaOfProfress);
              
                
                print("alpua", alpha)
                
                let resultRed = color1.redComponent + percent * (color2.redComponent - color1.redComponent);
                let resultGreen = color1.greenComponent + percent * (color2.greenComponent - color1.greenComponent);
                let resultBlue = color1.blueComponent + percent * (color2.blueComponent - color1.blueComponent);
                
                let myColor = NSColor(calibratedRed: resultRed, green: resultGreen, blue: resultBlue, alpha: alpha)
                
                
            
                
                rect.fillColor = myColor
                
            }
        }
    }

  override func touchesBegan(with event: NSEvent) {
    if #available(OSX 10.12.2, *) {
      if let touch = event.allTouches().first {
       // let location = CGPoint(x: touch.location(in: self.view).x, y: 14)

        
        
        print("Log");
        
        
        
        /*
        if let lemming = lemmingAt(point: location) {
          lemming.toggleState()
        }
        else {
          addLemming(at: location)
        }
*/
      }
    }
  }

}

