import SwiftUI
import SpriteKit

extension StarCatching {
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            self.updateTimer()
        }
    }
    
    func updateTimer() {
        countOfStars.text = "\(String(describing: game!.numberOfStars))/10"
        if game!.numberOfStars == 10 {
            game?.isWin = true
            timer?.invalidate()
        }
    }
    
    func initializeGame() {
        self.size = UIScreen.main.bounds.size
        boundaryNode = SKSpriteNode(color: .clear, size: CGSize(width: 180, height: 20))
        boundaryNode.position = CGPoint(x: self.size.width / 2, y: 60)
        self.addChild(boundaryNode)
        for row in 0..<rows {
            for col in 0..<cols {
                addElement(atRow: row, col: col)
            }
        }
    }
    
    func addElement(atRow row: Int, col: Int) {
        let randomItem = getRandomItem().randomElement() ?? ""
        let element = SKSpriteNode(imageNamed: randomItem)
        if randomItem == CandyImageName.sc2.rawValue {
            element.name = "sc2"
        }
        element.zPosition = 5
        element.size = CGSize(width: 50, height: 60)
        element.position = CGPoint(x: CGFloat(col) * 105 + CGFloat(size.width / 2.06), y: self.size.height - CGFloat(row) * 70 - 140)
        self.addChild(element)
        board[row][col] = element
    }
    
    override func update(_ currentTime: TimeInterval) {
        moveElementsDown()
    }
    
    func moveElementsDown() {
        for row in (0..<rows).reversed() {
            for col in 0..<cols {
                if let element = board[row][col] {
                    let newPosition = CGPoint(x: element.position.x, y: element.position.y - 1 - speedForItem)
                    if newPosition.y <= boundaryNode.position.y + boundaryNode.size.height / 2 {
                        element.removeFromParent()
                        board[row][col] = nil
                        addNewElement(atRow: row, col: col)
                    } else {
                        element.position = newPosition
                    }
                }
            }
        }
    }
    
    func addNewElement(atRow row: Int, col: Int) {
        let randomItem = getRandomItem().randomElement() ?? ""
        let element = SKSpriteNode(imageNamed: randomItem)
        if randomItem == CandyImageName.sc2.rawValue {
            element.name = "sc2"
        }
        element.size = CGSize(width: 50, height: 60)
        element.zPosition = 5
        element.position = CGPoint(x:CGFloat(col) * 105 + CGFloat(size.width / 2.06), y: self.size.height - 110)
        self.addChild(element)
        
        board[row][col] = element
    }
    
    func setupView() {
        let background = SKSpriteNode(imageNamed: CandyImageName.starCathcingBack.rawValue)
        background.size = CGSize(width: size.width, height: size.height)
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(background)
        
        let backGameLabel = SKSpriteNode(imageNamed: CandyImageName.backLabelStarCatching.rawValue)
        backGameLabel.size = CGSize(width: size.width / 2.1, height: size.height / 2)
        backGameLabel.position = CGPoint(x: size.width / 4.2, y: size.height / 1.35)
        addChild(backGameLabel)
        
        let gameLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        gameLabel.text = "STAR CATCHING"
        gameLabel.fontSize = 50
        gameLabel.zRotation = 0.25
        gameLabel.position = CGPoint(x: size.width / 4, y: size.height / 1.265)
        gameLabel.fontColor = .white
        addChild(gameLabel)
        
        let playDesk = SKSpriteNode(imageNamed: CandyImageName.gameDeskStarCatching.rawValue)
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
        
        let candyLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        candyLabel.text = "100000"
        candyLabel.fontSize = 20
        candyLabel.position = CGPoint(x: size.width / 1.2, y: size.height / 1.32)
        candyLabel.fontColor = .white
        addChild(candyLabel)
        
        let candy = SKSpriteNode(imageNamed: CandyImageName.candys.rawValue)
        candy.size = CGSize(width: size.width / 30, height: size.width / 30)
        candy.position = CGPoint(x: size.width / 1.11, y: size.height / 1.28)
        addChild(candy)
        
        let timerBack = SKSpriteNode(imageNamed: CandyImageName.timerBack.rawValue)
        timerBack.size = CGSize(width: size.width / 5, height: size.height / 6)
        timerBack.position = CGPoint(x: size.width / 3, y: size.height / 1.6)
        addChild(timerBack)
        
        countOfStars = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        countOfStars.text = "\(String(describing: game!.numberOfStars))/10"
        countOfStars.fontSize = 40
        countOfStars.position = CGPoint(x: size.width / 3.2, y: size.height / 1.72)
        countOfStars.fontColor = .white
        addChild(countOfStars)
        
        let star = SKSpriteNode(imageNamed: CandyImageName.sc2.rawValue)
        star.size = CGSize(width: size.width / 23, height: size.height / 10)
        star.position = CGPoint(x: size.width / 2.58, y: size.height / 1.62)
        addChild(star)
        
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
        let allItems: [String] = [CandyImageName.sc1.rawValue,
                                  CandyImageName.sc2.rawValue,
                                  CandyImageName.sc3.rawValue,
                                  CandyImageName.sc4.rawValue,
                                  CandyImageName.sc5.rawValue,
                                  CandyImageName.sc6.rawValue,
                                  CandyImageName.sc7.rawValue,
                                  CandyImageName.sc8.rawValue,
                                  CandyImageName.sc9.rawValue]
        return allItems
    }
}
