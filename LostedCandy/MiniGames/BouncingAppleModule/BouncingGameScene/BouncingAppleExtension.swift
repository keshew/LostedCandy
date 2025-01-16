import SwiftUI
import SpriteKit

extension BouncingApple {
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
            self.updateTimer()
        }
    }
    
    func checkForSprite(named name: String) -> Bool {
           for child in children {
               if child.name == name {
                   return true
               }
           }
           return false
       }
    
    func updateTimer() {
        candyLabel.text = "\(String(describing: game!.candyCount))"
        if !checkForSprite(named: "sc1") {
            timer.invalidate()
            game?.isWin = true
        }
    }

    
    func initializeGame() {
        self.size = UIScreen.main.bounds.size
        boundaryNode = SKSpriteNode(color: .clear, size: CGSize(width: 180, height: 20))
        boundaryNode.position = CGPoint(x: self.size.width / 2, y: 70)
        self.addChild(boundaryNode)
        for row in 0..<rows {
            for col in 0..<cols {
                addElement(atRow: row, col: col)
            }
        }
    }
    
    func getCandy(node: SKSpriteNode) {
        let fadeInAction = SKAction.fadeIn(withDuration: 0.3)
        let scaleDownAction = SKAction.scale(to: 0.0, duration: 1.0)
        let waitAction = SKAction.wait(forDuration: 1.5)
        
        let winCandy = SKSpriteNode(imageNamed: CandyImageName.candys.rawValue)
        winCandy.size = CGSize(width: 50, height: 50)
        winCandy.position = CGPoint(x: node.position.x + 50,
                                    y: node.position.y + 40)
        winCandy.alpha = 0
        addChild(winCandy)
        winCandy.run(fadeInAction)
        
        let winLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        winLabel.text = "+100"
        winLabel.fontSize = 40
        winLabel.zPosition = 10
        winLabel.position = CGPoint(x: node.position.x - 20, y: node.position.y + 25)
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
        game!.candyCount += 100
    }
    
    func addElement(atRow row: Int, col: Int) {
        let randomItem = getRandomItem().randomElement() ?? ""
        element = SKSpriteNode(imageNamed: randomItem)
        element.zPosition = 5
        element.name = "\(randomItem)"
        element.size = CGSize(width: 50, height: 60)
        element.position = CGPoint(x: CGFloat(col) * 105 + CGFloat(size.width / 2.06), y: self.size.height - CGFloat(row) * 70 - 150)
        self.addChild(element)
        board[row][col] = element
        
        if randomItem == CandyImageName.sc1.rawValue {
            element.name = "sc1"
        }
    }
    
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        guard let selectedSprite = selectedSprite else { return }
        let currentPosition = selectedSprite.position
        if gesture.direction == .right {
            let targetPosition = CGPoint(x: currentPosition.x + 105, y: currentPosition.y)
            if selectedSprite.name == CandyImageName.sc8.rawValue, currentPosition.x < 624 {
                selectedSprite.zPosition = 10
                let sc1Texture = String(describing: SKTexture(imageNamed: CandyImageName.sc1.rawValue))
                let node = nodes(at: targetPosition)
                let deleteNode = node.first as! SKSpriteNode
                if String(describing: deleteNode.texture!) == sc1Texture {
                    deleteNode.removeFromParent()
                    getCandy(node: selectedSprite)
                }
                moveSprite(selectedSprite, to: targetPosition)
            }
        } else if gesture.direction == .left {
            let targetPosition = CGPoint(x: currentPosition.x - 105, y: currentPosition.y)
            if selectedSprite.name == CandyImageName.sc8.rawValue, currentPosition.x > 517 {
                selectedSprite.zPosition = 10
                let sc1Texture = String(describing: SKTexture(imageNamed: CandyImageName.sc1.rawValue))
                let node = nodes(at: targetPosition)
                let deleteNode = node.first as! SKSpriteNode
                if String(describing: deleteNode.texture!) == sc1Texture {
                    deleteNode.removeFromParent()
                    getCandy(node: selectedSprite)
                
                }
                moveSprite(selectedSprite, to: targetPosition)
            }
        }
    }
    
    func moveSprite(_ sprite: SKSpriteNode, to position: CGPoint) {
        sprite.position = position
    }
    
    func setupView() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeRight.direction = .right
        self.view?.addGestureRecognizer(swipeRight)

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeLeft.direction = .left
        self.view?.addGestureRecognizer(swipeLeft)
        
        let background = SKSpriteNode(imageNamed: CandyImageName.menuBackBouncing.rawValue)
        background.size = CGSize(width: size.width, height: size.height)
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(background)
        
        let backGameLabel = SKSpriteNode(imageNamed: CandyImageName.backLabelBouncingApple.rawValue)
        backGameLabel.size = CGSize(width: size.width / 2.1, height: size.height / 2)
        backGameLabel.position = CGPoint(x: size.width / 4.2, y: size.height / 1.35)
        addChild(backGameLabel)
        
        let gameLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        gameLabel.text = "BOUNCING"
        gameLabel.fontSize = 45
        gameLabel.zRotation = 0.25
        gameLabel.position = CGPoint(x: size.width / 5, y: size.height / 1.19)
        gameLabel.fontColor = .white
        addChild(gameLabel)
        
        let gameLabel2 = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        gameLabel2.text = "APPLE"
        gameLabel2.fontSize = 45
        gameLabel2.zRotation = 0.25
        gameLabel2.position = CGPoint(x: size.width / 5, y: size.height / 1.35)
        gameLabel2.fontColor = .white
        addChild(gameLabel2)
        
        let playDesk = SKSpriteNode(imageNamed: CandyImageName.playDeskBouncing.rawValue)
        playDesk.size = CGSize(width: size.width / 1.9, height: size.height / 1.4)
        playDesk.position = CGPoint(x: size.width / 1.5, y: size.height / 2.4)
        addChild(playDesk)
        
        let backForBudget = SKSpriteNode(imageNamed: CandyImageName.gameBudget.rawValue)
        backForBudget.size = CGSize(width: size.width / 2.6, height: size.height / 8.5)
        backForBudget.position = CGPoint(x: size.width / 1.34, y: size.height / 1.28)
        addChild(backForBudget)
        
        let winLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        winLabel.text = "win"
        winLabel.fontSize = 26
        winLabel.position = CGPoint(x: size.width / 1.62, y: size.height / 1.32)
        winLabel.fontColor = .white
        addChild(winLabel)
        
        let moneyLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        moneyLabel.text = "100000"
        moneyLabel.fontSize = 20
        moneyLabel.position = CGPoint(x: size.width / 1.43, y: size.height / 1.32)
        moneyLabel.fontColor = .white
        addChild(moneyLabel)
        
        let money = SKSpriteNode(imageNamed: CandyImageName.coin2.rawValue)
        money.size = CGSize(width: size.width / 30, height: size.width / 30)
        money.position = CGPoint(x: size.width / 1.3, y: size.height / 1.28)
        addChild(money)
        
        candyLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        candyLabel.text = "\(String(describing: game!.candyCount))"
        candyLabel.fontSize = 20
        candyLabel.position = CGPoint(x: size.width / 1.2, y: size.height / 1.32)
        candyLabel.fontColor = .white
        addChild(candyLabel)
        
        let menuBack = SKSpriteNode(imageNamed: CandyImageName.returnBack.rawValue)
        menuBack.size = CGSize(width: size.width / 5, height: size.height / 7)
        menuBack.name = "menuBack"
        menuBack.zPosition = 10
        menuBack.position = CGPoint(x: size.width / 1.55, y: size.height / 10)
        addChild(menuBack)
        
        let menuLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        menuLabel.text = "MENU"
        menuLabel.fontSize = 32
        menuLabel.zPosition = 10
        menuLabel.position = CGPoint(x: size.width / 1.55, y: size.height / 13)
        menuLabel.fontColor = .white
        addChild(menuLabel)
        
        let returnBack = SKSpriteNode(imageNamed: CandyImageName.returnBack.rawValue)
        returnBack.size = CGSize(width: size.width / 5, height: size.height / 7)
        returnBack.zPosition = 10
        returnBack.name = "returnBack"
        returnBack.position = CGPoint(x: size.width / 1.18, y: size.height / 10)
        addChild(returnBack)
        
        let returnLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        returnLabel.text = "RETURN"
        returnLabel.fontSize = 30
        returnLabel.zPosition = 10
        returnLabel.position = CGPoint(x: size.width / 1.18, y: size.height / 13)
        returnLabel.fontColor = .white
        addChild(returnLabel)
        
        let candy = SKSpriteNode(imageNamed: CandyImageName.candys.rawValue)
        candy.size = CGSize(width: size.width / 30, height: size.width / 30)
        candy.position = CGPoint(x: size.width / 1.11, y: size.height / 1.28)
        addChild(candy)
        
        let pause = SKSpriteNode(imageNamed: CandyImageName.pause.rawValue)
        pause.size = CGSize(width: size.width / 25, height: size.height / 10)
        pause.position = CGPoint(x: size.width / 1.15, y: size.height / 1.1)
        addChild(pause)
        
        let liza = SKSpriteNode(imageNamed: CandyImageName.liza.rawValue)
        liza.size = CGSize(width: size.width / 4, height: size.height / 0.95)
        liza.position = CGPoint(x: size.width / 5.5, y: size.height / 8)
        addChild(liza)
    }
    
    func getRandomItem() -> [String] {
        let allItems: [String] = [CandyImageName.sc8.rawValue,
                                  CandyImageName.sc1.rawValue]
        return allItems
    }
}
