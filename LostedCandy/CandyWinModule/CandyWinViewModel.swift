import SwiftUI

class CandyWinViewModel: ObservableObject {
    let contact = CandyWinModel()
    @Published var isMenuAvailible = false

    func goToMenu() {
        isMenuAvailible = true
    }
}
