import SwiftUI
import SpriteKit

extension StrawCannon {
    func initializeGame() {
        self.size = UIScreen.main.bounds.size
        for row in 0..<rows {
            for col in 0..<cols {
                addElement(atRow: row, col: col)
            }
        }
    }
    
    func addElement(atRow row: Int, col: Int) {
        let element = SKSpriteNode(imageNamed: CandyImageName.banana.rawValue)
        element.zPosition = 5
        element.size = CGSize(width: 50, height: 60)
        element.position = CGPoint(x: CGFloat(col) * 105 + CGFloat(size.width / 2.06), y: self.size.height - CGFloat(row) * 70 - 150)
        self.addChild(element)
        board[row][col] = element
    }
    
    func setupView() {
        let background = SKSpriteNode(imageNamed: CandyImageName.starCannonBack.rawValue)
        background.size = CGSize(width: size.width, height: size.height)
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(background)
        
        let backGameLabel = SKSpriteNode(imageNamed: CandyImageName.backLabelStawCannon.rawValue)
        backGameLabel.size = CGSize(width: size.width / 2.1, height: size.height / 2)
        backGameLabel.position = CGPoint(x: size.width / 4.2, y: size.height / 1.35)
        addChild(backGameLabel)
        
        let gameLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        gameLabel.text = "STRAW CANNON"
        gameLabel.fontSize = 50
        gameLabel.zRotation = 0.25
        gameLabel.position = CGPoint(x: size.width / 4, y: size.height / 1.265)
        gameLabel.fontColor = .white
        addChild(gameLabel)
        
        let playDesk = SKSpriteNode(imageNamed: CandyImageName.playDeskStraw.rawValue)
        playDesk.size = CGSize(width: size.width / 1.9, height: size.height / 1.4)
        playDesk.position = CGPoint(x: size.width / 1.5, y: size.height / 2.4)
        addChild(playDesk)
        
        let menuBack = SKSpriteNode(imageNamed: CandyImageName.menuBackStraw.rawValue)
        menuBack.size = CGSize(width: size.width / 5, height: size.height / 7)
        menuBack.zPosition = 10
        menuBack.name = "menuBack"
        menuBack.position = CGPoint(x: size.width / 1.55, y: size.height / 10)
        addChild(menuBack)
        
        let backForBudget = SKSpriteNode(imageNamed: CandyImageName.gameBudgetStraw.rawValue)
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
        candyLabel.text = "\(String(describing: game!.countCandy))"
        candyLabel.fontSize = 20
        candyLabel.position = CGPoint(x: size.width / 1.2, y: size.height / 1.32)
        candyLabel.fontColor = .white
        addChild(candyLabel)
        
        let candy = SKSpriteNode(imageNamed: CandyImageName.candys.rawValue)
        candy.size = CGSize(width: size.width / 30, height: size.width / 30)
        candy.position = CGPoint(x: size.width / 1.11, y: size.height / 1.28)
        addChild(candy)
        
        let menuLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        menuLabel.text = "MENU"
        menuLabel.name = "menuLabel"
        menuLabel.fontSize = 32
        menuLabel.zPosition = 10
        menuLabel.position = CGPoint(x: size.width / 1.55, y: size.height / 13)
        menuLabel.fontColor = .white
        addChild(menuLabel)
        
        let returnBack = SKSpriteNode(imageNamed: CandyImageName.menuBackStraw.rawValue)
        returnBack.size = CGSize(width: size.width / 5, height: size.height / 7)
        returnBack.zPosition = 10
        returnBack.position = CGPoint(x: size.width / 1.18, y: size.height / 10)
        addChild(returnBack)
        
        let returnLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        returnLabel.text = "RETURN"
        returnLabel.fontSize = 30
        returnLabel.zPosition = 10
        returnLabel.position = CGPoint(x: size.width / 1.18, y: size.height / 13)
        returnLabel.fontColor = .white
        addChild(returnLabel)
        
        let pause = SKSpriteNode(imageNamed: CandyImageName.pause.rawValue)
        pause.size = CGSize(width: size.width / 25, height: size.height / 10)
        pause.position = CGPoint(x: size.width / 1.15, y: size.height / 1.1)
        addChild(pause)
        
        let liza = SKSpriteNode(imageNamed: CandyImageName.liza.rawValue)
        liza.size = CGSize(width: size.width / 4, height: size.height / 0.95)
        liza.position = CGPoint(x: size.width / 5.5, y: size.height / 8)
        addChild(liza)
        
        weapon = SKSpriteNode(imageNamed: CandyImageName.weapon.rawValue)
        weapon.name = "weapon"
        weapon.size = CGSize(width: size.width / 4.5, height: size.height / 2.5)
        weapon.position = CGPoint(x: size.width / 3, y: size.height / 5)
        addChild(weapon)
        
        wind1 = SKSpriteNode(imageNamed: CandyImageName.wind1.rawValue)
        wind1.size = CGSize(width: size.width / 7, height: size.height / 4.5)
        wind1.zRotation = 0.2
        wind1.zPosition = 15
        wind1.alpha = 0
        wind1.position = CGPoint(x: size.width / 2.2, y: size.height / 2.3)
        addChild(wind1)
        
        wind2 = SKSpriteNode(imageNamed: CandyImageName.wind2.rawValue)
        wind2.size = CGSize(width: size.width / 5, height: size.height / 14)
        wind2.zRotation = 0.2
        wind2.zPosition = 15
        wind2.alpha = 0
        wind2.position = CGPoint(x: size.width / 2, y: size.height / 3)
        addChild(wind2)
        
        wind3 = SKSpriteNode(imageNamed: CandyImageName.wind3.rawValue)
        wind3.size = CGSize(width: size.width / 5, height: size.height / 2)
        wind3.zRotation = -0.2
        wind3.zPosition = 15
        wind3.alpha = 0
        wind3.position = CGPoint(x: size.width / 1.9, y: size.height / 2)
        addChild(wind3)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0, repeats: true) { _ in
            self.updateTimer()
        }
    }
    
    func updateTimer() {
        candyLabel.text = "\(String(describing: game!.countCandy))"
        if board.isEmpty == true {
            game?.isWin = true
            timer?.invalidate()
        }
    }
    
    func removeRandomNode() {
        guard !board.isEmpty else { return }
        let randomGroupIndex = Int.random(in: 0..<board.count)
        var group = board[randomGroupIndex]
        guard !group.isEmpty else {
            board.remove(at: randomGroupIndex)
            return
        }
        let randomNodeIndex = Int.random(in: 0..<group.count)
        let nodeToRemove = group[randomNodeIndex]
        group.remove(at: randomNodeIndex)
        
        let fadeInAction = SKAction.fadeIn(withDuration: 0.3)
        let scaleDownAction = SKAction.scale(to: 0.0, duration: 1.0)
        let waitAction = SKAction.wait(forDuration: 1.5)
        
        let winCandy = SKSpriteNode(imageNamed: CandyImageName.candys.rawValue)
        winCandy.size = CGSize(width: 50, height: 50)
        winCandy.position = CGPoint(x: nodeToRemove!.position.x + 50,
                                    y: nodeToRemove!.position.y + 40)
        winCandy.alpha = 0
        addChild(winCandy)
        winCandy.run(fadeInAction)
        
        let winLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        winLabel.text = "+100"
        winLabel.fontSize = 40
        winLabel.zPosition = 10
        winLabel.position = CGPoint(x: nodeToRemove!.position.x - 20, y: nodeToRemove!.position.y + 25)
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
        board[randomGroupIndex] = group
        nodeToRemove!.run(SKAction.fadeOut(withDuration: 0.5)) {
            nodeToRemove!.removeFromParent()
        }
        
        game!.countCandy += 100
    }
}
