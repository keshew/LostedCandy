import SwiftUI
import SpriteKit

class BouncingApple: SKScene, SKPhysicsContactDelegate {
    var game: BouncingAppleData?
    let rows = 3
    let cols = 4
    var board: [[SKSpriteNode?]] = Array(repeating: Array(repeating: nil, count: 4), count: 3)
    let speedForItem: CGFloat = 0.1
    var boundaryNode: SKSpriteNode!
    var element: SKSpriteNode!
    var selectedSprite: SKSpriteNode?
    var timer: Timer!
    var candyLabel: SKLabelNode!
    
    override func didMove(to view: SKView) {
        scene?.size = UIScreen.main.bounds.size
        physicsWorld.contactDelegate = self
        setupView()
        initializeGame()
        startTimer()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode {
                selectedSprite = tappedNode
                let node = atPoint(touchLocation)
                
                if node.name == "menuBack" {
                    game!.isMenu = true
                }
                
                if node.name == "returnBack" {
                    game!.isStage = true
                }
            }
        }
    }
}
