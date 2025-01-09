import SwiftUI

struct BoomLoadingView: View {
    @StateObject var boomLoadingModel =  BoomLoadingViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                ZStack {
                    Image(CandyImageName.gameBackH.rawValue)
                        .resizable()
                        .ignoresSafeArea()
                    
                    Image(CandyImageName.backLabelBoomBlust.rawValue)
                        .resizable()
                        .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                        .offset(x: geometry.size.width / -3, y: -geometry.size.height / 4.6)
                    
                    Image(CandyImageName.liza.rawValue)
                        .resizable()
                        .frame(width: 200, height: 380)
                        .position(x: geometry.size.width / 3, y: geometry.size.height / 1.2)
                    
                    Image(CandyImageName.tipsLabel.rawValue)
                        .resizable()
                        .frame(width: 350, height: 220)
                        .position(x: geometry.size.width / 1.4, y: geometry.size.height / 3.2)
                    
                    Text("MINI GAME 4")
                        .Lucky(size: 30, color: .pink, colorOutline: .white)
                        .offset(x: 120, y: -120)
                    
                    Text("find all the nuts and collect them in a short time")
                        .Lucky(size: 20, color: .pink, colorOutline: .white)
                        .frame(width: 300)
                        .offset(x: 180, y: -60)
                    
                    Text("BOOM BLUST")
                        .Lucky(size: 40)
                        .rotationEffect(.degrees(-15))
                        .offset(x: -260, y: -110)
                    
                    VStack {
                        Spacer()
                        Text("LOADING")
                            .Lucky(size: 30)
                        
                        ZStack {
                            Image(CandyImageName.backLoadLine.rawValue)
                                .resizable()
                                .frame(width: geometry.size.width / 1.2, height: 25)
                            
                            Image(CandyImageName.loadLine.rawValue)
                                .resizable()
                                .frame(width: geometry.size.width / boomLoadingModel.loadScreenH().0, height: 20)
                                .offset(x: boomLoadingModel.loadScreenH().1, y: -2)
                        }
                        Text(boomLoadingModel.loadScreenH().2)
                            .Lucky(size: 24)
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
              
                .navigationDestination(isPresented: $boomLoadingModel.isBoomBlust) {
                    BoomBlustView()
                }
            }
        }
        .onAppear {
            OrientationManager.setLandscapeOrientation()
            AppDelegate.orientationLock = .landscapeLeft

            boomLoadingModel.startTimer()

            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                boomLoadingModel.currentIndex = 1
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                boomLoadingModel.currentIndex = 2
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                boomLoadingModel.isBoomBlust = true
            }
        }
        
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    BoomLoadingView()
}

