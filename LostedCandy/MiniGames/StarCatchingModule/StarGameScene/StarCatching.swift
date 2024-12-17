import SwiftUI
import SpriteKit

class StarCatching: SKScene, SKPhysicsContactDelegate {
    var game: StarCatchingData?
    let rows = 3
    let cols = 4
    var board: [[SKSpriteNode?]] = Array(repeating: Array(repeating: nil, count: 4), count: 3)
    let speedForItem: CGFloat = 0.1
    var boundaryNode: SKSpriteNode!
    var countOfStars: SKLabelNode!
    var timer: Timer!
    
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
               tappedNode.name == "sc2" {
                let scaleDownAction = SKAction.scale(to: 0.0, duration: 1.0)
                tappedNode.run(scaleDownAction) {
                    tappedNode.removeFromParent()
                }
                game!.numberOfStars += 1
            }
        }
    }
}
