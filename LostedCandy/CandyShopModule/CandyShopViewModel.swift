import SwiftUI

class CandyShopViewModel: ObservableObject {
    let contact = CandyShopModel()
    @Published var isMenuAvailible = false
    @Published var currentIndex = 0

    func goToMenu() {
        isMenuAvailible = true
    }
    
    func increaseIndex() {
        if currentIndex == 0 {
            currentIndex += 1
        }
    }
    
    func lowerIndex() {
        if currentIndex == 1 {
            currentIndex -= 1
        }
    }
}
