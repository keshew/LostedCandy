import SwiftUI
import SpriteKit

class StarCatchingData: ObservableObject {
    @Published var isWin = false
    @Published var numberOfStars = 0
}
