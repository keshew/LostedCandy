import SwiftUI
import SpriteKit

struct BouncingAppleView: View {
    @StateObject var bouncingAppleModel =  BouncingAppleViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @StateObject private var gameData = BouncingAppleData()
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                SpriteView(scene: bouncingAppleModel.createGameScene(gameData: gameData))
                    .ignoresSafeArea()
                    .navigationBarBackButtonHidden(true)
                
                    .navigationDestination(isPresented: $gameData.isWin) {
                        GameLoadingView()
                    }
            }
        }
    }
}

#Preview {
    BouncingAppleView()
}




