import SwiftUI
import SpriteKit

class StrawCannon: SKScene, SKPhysicsContactDelegate {
    var game: StrawCannonData?
    let rows = 3
    let cols = 4
    var board: [[SKSpriteNode?]] = Array(repeating: Array(repeating: nil, count: 4), count: 3)
    var weapon: SKSpriteNode!
    var wind1: SKSpriteNode!
    var wind2: SKSpriteNode!
    var wind3: SKSpriteNode!
    var candyLabel: SKLabelNode!
    var timer: Timer?
    
    override func didMove(to view: SKView) {
        scene?.size = UIScreen.main.bounds.size
        physicsWorld.contactDelegate = self
        setupView()
        initializeGame()
        startTimer()
    }
    
    override func willMove(from view: SKView) {
        self.removeAllActions()
        self.removeAllChildren()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode,
               tappedNode.name == "weapon" {
                wind1.run(SKAction.fadeIn(withDuration: 0.5))
                wind2.run(SKAction.fadeIn(withDuration: 0.5))
                wind3.run(SKAction.fadeIn(withDuration: 0.5))
                removeRandomNode()
            }
            
            if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode,
               tappedNode.name == "MENU" || tappedNode.name == "menuBack" {
                game!.isMenu = true
            }
            
            if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode,
               tappedNode.name == "returnBack" {
                game!.isStage = true
            }
        }
    }
}
