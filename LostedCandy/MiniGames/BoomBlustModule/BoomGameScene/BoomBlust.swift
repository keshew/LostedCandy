import SwiftUI
import SpriteKit

class BoomBlust: SKScene, SKPhysicsContactDelegate {
    var game: BoomBlustData?
    let rows = 3
    let cols = 4
    var board: [[SKSpriteNode?]] = Array(repeating: Array(repeating: nil, count: 4), count: 3)
    let speedForItem: CGFloat = 0.05
    var boundaryNode: SKSpriteNode!
    var timeLabel: SKLabelNode!
    var candyLabel: SKLabelNode!
    var timer: Timer?
    
    override func willMove(from view: SKView) {
        self.removeAllActions()
        self.removeAllChildren()
    }
    
    override func didMove(to view: SKView) {
        scene?.size = UIScreen.main.bounds.size
        physicsWorld.contactDelegate = self
        setupView()
        initializeGame()
        startTimer()
    }

    override func update(_ currentTime: TimeInterval) {
        moveElementsDown()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode,
               tappedNode.name == "MENU" || tappedNode.name == "menuBack" {
                print("HEY")
            }
            
            if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode,
               tappedNode.name == "bb1" {
                game?.numberOfCandy += 100
                tappedNode.removeFromParent()
                
                let fadeInAction = SKAction.fadeIn(withDuration: 0.3)
                let scaleDownAction = SKAction.scale(to: 0.0, duration: 1.0)
                let waitAction = SKAction.wait(forDuration: 1.5)

                let winCandy = SKSpriteNode(imageNamed: CandyImageName.candys.rawValue)
                winCandy.size = CGSize(width: 50, height: 50)
                winCandy.position = CGPoint(x: tappedNode.position.x + 50,
                                            y: tappedNode.position.y + 40)
                winCandy.alpha = 0
                addChild(winCandy)
                winCandy.run(fadeInAction)
                
                let winLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
                winLabel.text = "+100"
                winLabel.fontSize = 40
                winLabel.zPosition = 10
                winLabel.position = CGPoint(x: tappedNode.position.x - 20, y: tappedNode.position.y + 25)
                winLabel.fontColor = .white
                winLabel.alpha = 0
                addChild(winLabel)
                winLabel.run(fadeInAction)
                
                winLabel.run(SKAction.sequence([waitAction, scaleDownAction])) {
                    winLabel.removeFromParent()
                }
                
                winCandy.run(SKAction.sequence([waitAction, scaleDownAction])) {
                    winCandy.removeFromParent()
                }
            }
        }
    }
}
