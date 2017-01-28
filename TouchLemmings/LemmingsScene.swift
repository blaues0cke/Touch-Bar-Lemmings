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
    var hearts = [SKLabelNode]()
    
    var heartsOrbits = [CGFloat]()
    
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
        
        self.physicsWorld.gravity =  CGVector(dx: 0, dy: 0)
        
        let rect2 = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 2170, height: 60));
        
        rect2.fillColor = .white
        effect.addChild(rect2)
        
        
        
        rect.fillColor = .green
        effect.addChild(rect)
        
        
        
        
    
        circle.position = CGPoint(x: self.frame.width / 2 + 10, y: self.frame.height / 2)
        circle.fillColor = NSColor.white
        addChild(circle)
        
        
        for index in 0...20 {
            
            
            
            let p = SKLabelNode(fontNamed: "Chalkduster")
            p.text = "❤"
            p.fontSize = 22
            p.fontColor = SKColor.white
            p.position = CGPoint(x: randomInRange(lo: 0, hi: 2170), y: randomInRange(lo: 0, hi: 60))
          
           
            
            p.physicsBody = SKPhysicsBody(circleOfRadius: 15)
            p.physicsBody?.isDynamic = true
            p.physicsBody?.mass = 4.5
            
            
            
       //     p.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 30 * p.physicsBody!.mass))
            
            
            addChild(p)
            
            print("gdsg", p.position);
            
            hearts.append(p);
            heartsOrbits.append(0);

        }
        /*
        
       
        gravityField.position = circle.position
        gravityField.region = SKRegion(size: CGSize(width: 2170, height: 60))//SKRegion(radius: 5000.0)
        gravityField.strength = 10.0
        gravityField.isEnabled = true
    addChild(gravityField)*/
        
//        self.isUserInteractionEnabled = true;
        
        
        
        
       
        
        
        
        
    }

    override func update(_ currentTime: TimeInterval) {
        let dt: CGFloat = 1.0/60.0 //Delta Time
        let period: CGFloat = 3 //Number of seconds it takes to complete 1 orbit.
        let orbitPosition = circle.position //Point to orbit.
        let orbitRadius = CGPoint(x: randomInRange(lo: 40, hi: 60), y: randomInRange(lo: 40, hi: 60)) //Radius of orbit.
        
        
        
        for index in 0...20 {
            
            let heart = hearts[index];
    
            
            var angle = heartsOrbits[index];
            
            let normal = CGVector(dx:orbitPosition.x + CGFloat(cos(angle))*orbitRadius.x ,dy:orbitPosition.y + CGFloat(sin(angle))*orbitRadius.y);
            angle += (CGFloat(M_PI)*2.0)/period*dt;
            if (fabs(angle)>CGFloat(M_PI)*2)
            {
                angle = 0
            }
            heart.physicsBody!.velocity = CGVector(dx:(normal.dx-heart.position.x)/dt ,dy:(normal.dy-heart.position.y)/dt);
            
            heartsOrbits[index] = angle;
            
        }
        
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
    
    
    func randomInRange(lo: Int, hi : Int) -> Int {
        return lo + Int(arc4random_uniform(UInt32(hi - lo + 1)))
    }
    
    
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
       let location = CGPoint(x: touch.location(in: self.view).x, y: 14)

       //let p = SKSpriteNode(color: NSColor.purple, size: CGSize(width: 20, height: 20))
        
        
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

