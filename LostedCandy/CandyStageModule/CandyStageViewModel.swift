import SwiftUI

class CandyStageViewModel: ObservableObject {
    let contact = CandyStageModel()
    @Published var isMenuAvailible = false
    @Published var isGameAvailible = false
    @Published var currentIndex = 0

    func goToMenu() {
        isMenuAvailible = true
    }
    
    func goTo() {
        
    }
    
    func goToGame() {
        isGameAvailible = true
    }
    
    func increaseIndex() {
        if currentIndex <= 3 {
            currentIndex += 1
        }
    }
    
    func lowerIndex() {
        if currentIndex >= 1 {
            currentIndex -= 1
        }
    }
}
