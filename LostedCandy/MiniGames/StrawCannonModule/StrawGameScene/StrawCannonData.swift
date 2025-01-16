import SwiftUI
import SpriteKit

class StrawCannonData: ObservableObject {
    @Published var isWin = false
    @Published var countCandy = 0
    @Published var isMenu = false
    @Published var isStage = false
}
