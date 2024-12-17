import SwiftUI
import SpriteKit

class MainGameData: ObservableObject {
    @Published var isWin = false
    @Published var candyCount = 0
    @Published var timeLeft = 90
}

class MainGame: SKScene, SKPhysicsContactDelegate {
    var game: MainGameData?
    let rows = 4
    let cols = 7
    var board: [[SKSpriteNode?]] = Array(repeating: Array(repeating: nil, count: 7), count: 4)
    var firstSelectedSprite: SKSpriteNode?
    var timer: Timer!
    var candyLabel: SKLabelNode!
    var gameTimer: SKLabelNode!
    
    override func didMove(to view: SKView) {
        scene?.size = UIScreen.main.bounds.size
        physicsWorld.contactDelegate = self
        setupView() 
        initializeGame()
        startTimer()
    }
    
    func initializeGame() {
        self.size = UIScreen.main.bounds.size
        for row in 0..<rows {
            for col in 0..<cols {
                addElement(atRow: row, col: col)
            }
        }
    }
    
    func celebrate(tappedNode: SKSpriteNode) {
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
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.updateTimer()
        }
    }
    
    func updateTimer() {
        if game?.timeLeft ?? 0 > 0 {
            game?.timeLeft -= 1
            candyLabel.text = "\(String(describing: game!.candyCount))"
            gameTimer.text = "\(String(describing: game!.timeLeft / 60)):\(String(describing: game!.timeLeft % 60))"
            checkForDuplicateSprites()
        } else {
            print("lose")
            timer?.invalidate()
        }
    }

    func checkForDuplicateSprites() {
         var duplicates: [String: Int] = [:]
         
         for name in getRandomItem() {
             var count = 0
             
             enumerateChildNodes(withName: name) { node, _ in
                 count += 1
             }
             
             if count > 1 {
                 duplicates[name] = count
             }
         }
         
         if duplicates.isEmpty {
             game?.isWin = true
         }
     }
    
    func handleSpriteSelection(_ sprite: SKSpriteNode) {
           if firstSelectedSprite == nil {
               if let spriteName = sprite.name, getRandomItem().contains(spriteName) {
                   firstSelectedSprite = sprite
                   sprite.xScale = 1.2
                   sprite.yScale = 1.2
               }
           } else {
               if firstSelectedSprite === sprite {
                   firstSelectedSprite?.xScale = 1.0
                   firstSelectedSprite?.yScale = 1.0
                   firstSelectedSprite = nil
               } else {
                   if let firstName = firstSelectedSprite?.name,
                      let secondName = sprite.name,
                      getRandomItem().contains(firstName) && getRandomItem().contains(secondName) {
                       if firstName == secondName {
                           firstSelectedSprite?.removeFromParent()
                           sprite.removeFromParent()
                           game?.candyCount += 100
                           celebrate(tappedNode: sprite)
                       } else {
                           firstSelectedSprite?.xScale = 1.0
                           firstSelectedSprite?.yScale = 1.0
                       }
                   }
                   firstSelectedSprite = nil
               }
           }
       }
    
    func addElement(atRow row: Int, col: Int) {
        let randomItem = getRandomItem().randomElement()
        let element = SKSpriteNode(imageNamed: randomItem!)
        element.size = CGSize(width: 45, height: 50)
        element.position = CGPoint(x: CGFloat(col) * 70 + CGFloat(size.width / 3.96),
                                   y: self.size.height - CGFloat(row) * 75 - 85)
        element.name = randomItem
        self.addChild(element)
        board[row][col] = element
    }
    
    func setupView() {
        let background = SKSpriteNode(imageNamed: CandyImageName.menuBackBouncing.rawValue)
        background.size = CGSize(width: size.width, height: size.height)
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(background)
        
        let desk = SKSpriteNode(imageNamed: CandyImageName.backBoard.rawValue)
        desk.size = CGSize(width: size.width / 1.6, height: size.height / 1.15)
        desk.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(desk)
        
        let backDesk = SKSpriteNode(imageNamed: CandyImageName.backBoard1.rawValue)
        backDesk.size = CGSize(width: size.width / 1.75, height: size.height / 1.3)
        backDesk.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(backDesk)
        
        let lineDesk = SKSpriteNode(imageNamed: CandyImageName.backBoard2.rawValue)
        lineDesk.size = CGSize(width: size.width / 2.4, height: size.height / 1.3)
        lineDesk.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(lineDesk)
        
        let pinkVector = SKSpriteNode(imageNamed: CandyImageName.gameLabel.rawValue)
        pinkVector.size = CGSize(width: size.width / 1.8, height: size.height / 2)
        pinkVector.position = CGPoint(x: size.width / 6, y: size.height / 1.35)
        pinkVector.zRotation = 0.1

        addChild(pinkVector)
        
        let numberOfLevel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        numberOfLevel.text = "LEVEL 1"
        numberOfLevel.fontSize = 40
        numberOfLevel.zRotation = 0.4
        numberOfLevel.position = CGPoint(x: size.width / 7, y: size.height / 1.17)
        numberOfLevel.fontColor = .white
        addChild(numberOfLevel)
        
        let nameOfIsland = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        nameOfIsland.text = "CARAMEL COVE"
        nameOfIsland.fontSize = 25
        nameOfIsland.zRotation = 0.4
        nameOfIsland.position = CGPoint(x: size.width / 6.8, y: size.height / 1.29)
        nameOfIsland.fontColor = .white
        addChild(nameOfIsland)
        
        let backForBudget = SKSpriteNode(imageNamed: CandyImageName.gameBudget.rawValue)
        backForBudget.size = CGSize(width: size.width / 2.8, height: size.height / 10)
        backForBudget.position = CGPoint(x: size.width / 1.4, y: size.height / 1.07)
        addChild(backForBudget)
        
        let winLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        winLabel.text = "win"
        winLabel.fontSize = 26
        winLabel.position = CGPoint(x: size.width / 1.69, y: size.height / 1.1)
        winLabel.fontColor = .white
        addChild(winLabel)
        
        let moneyLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        moneyLabel.text = "100000"
        moneyLabel.fontSize = 20
        moneyLabel.position = CGPoint(x: size.width / 1.49, y: size.height / 1.1)
        moneyLabel.fontColor = .white
        addChild(moneyLabel)
        
        let money = SKSpriteNode(imageNamed: CandyImageName.coin2.rawValue)
        money.size = CGSize(width: size.width / 30, height: size.width / 30)
        money.position = CGPoint(x: size.width / 1.36, y: size.height / 1.065)
        addChild(money)
        
        candyLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        candyLabel.text = "\(String(describing: game!.candyCount))"
        candyLabel.fontSize = 20
        candyLabel.position = CGPoint(x: size.width / 1.27, y: size.height / 1.1)
        candyLabel.fontColor = .white
        addChild(candyLabel)
        
        let candy = SKSpriteNode(imageNamed: CandyImageName.candys.rawValue)
        candy.size = CGSize(width: size.width / 30, height: size.width / 30)
        candy.position = CGPoint(x: size.width / 1.18, y: size.height / 1.065)
        addChild(candy)
        
        let timerBack = SKSpriteNode(imageNamed: CandyImageName.gameTimerBack.rawValue)
        timerBack.size = CGSize(width: size.width / 6, height: size.width / 13)
        timerBack.position = CGPoint(x: size.width / 1.18, y: size.height / 10)
        addChild(timerBack)
        
        gameTimer = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        gameTimer.text =  "\(String(describing: game!.timeLeft / 60)):\(String(describing: game!.timeLeft % 60))"
        gameTimer.fontSize = 40
        gameTimer.position = CGPoint(x: size.width / 1.18, y: size.height / 17)
        gameTimer.fontColor = .white
        addChild(gameTimer)
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         guard let touch = touches.first else { return }
         let location = touch.location(in: self)
         
         if let touchedNode = atPoint(location) as? SKSpriteNode {
             handleSpriteSelection(touchedNode)
         }
     }
}

struct MainGameView: View {
    @StateObject var mainGameModel =  MainGameViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @StateObject private var gameData = MainGameData()
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                SpriteView(scene: mainGameModel.createGameScene(gameData: gameData))
                    .ignoresSafeArea()
                    .navigationBarBackButtonHidden(true)
                
                    .navigationDestination(isPresented: $gameData.isWin) {
                        CandyWinView()
                    }
            }
        }
    }
}

#Preview {
    MainGameView()
}

