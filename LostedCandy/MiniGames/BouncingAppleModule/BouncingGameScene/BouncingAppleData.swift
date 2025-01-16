import SwiftUI
import SpriteKit

class BouncingAppleData: ObservableObject {
    @Published var isWin = false
    @Published var candyCount = 0
    @Published var isMenu = false
    @Published var isStage = false
}
