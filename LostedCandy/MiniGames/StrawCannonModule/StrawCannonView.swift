import SwiftUI
import SpriteKit

struct StrawCannonView: View {
    @StateObject var strawCannonModel =  StrawCannonViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @StateObject private var gameData = StrawCannonData()
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                SpriteView(scene: strawCannonModel.createGameScene(gameData: gameData))
                    .ignoresSafeArea()
                    .navigationBarBackButtonHidden(true)
                
                    .navigationDestination(isPresented: $gameData.isWin) {
                        GameLoadingView()
                    }
                
                    .navigationDestination(isPresented: $gameData.isMenu) {
                        CandyMenuView()
                    }
                
                    .navigationDestination(isPresented: $gameData.isStage) {
                        CandyStageView()
                    }
            }
        }
        
    }
}

#Preview {
    StrawCannonView()
}


