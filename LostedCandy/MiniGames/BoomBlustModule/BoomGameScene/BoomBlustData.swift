import SwiftUI
import SpriteKit

class BoomBlustData: ObservableObject {
    @Published var isLose = false
    @Published var isWin = false
    @Published var isPause = false
    @Published var timeLeft = 30
    @Published var numberOfCandy = 0
}
