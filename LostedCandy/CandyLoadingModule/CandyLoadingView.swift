import SwiftUI

struct CandyLoadingView: View {
    @StateObject var candyLoadingModel =  CandyLoadingViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                if verticalSizeClass == .regular {
                    ZStack {
                        Image(CandyImageName.menuVBackground.rawValue)
                            .resizable()
                            .ignoresSafeArea()
                        
                        Image(CandyImageName.yellowVector.rawValue)
                            .resizable()
                            .frame(width: 395, height: 200)
                            .offset(y: -geometry.size.height / 2.2)
                        
                        Image(CandyImageName.pinkVector.rawValue)
                            .resizable()
                            .frame(width: 335, height: 150)
                            .offset(x: geometry.size.width / -10, y: -geometry.size.height / 2.07)
                        
                        Image(CandyImageName.liza.rawValue)
                            .resizable()
                            .frame(width: 250, height: 550)
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 1.4)
                        
                        VStack(spacing: 10) {
                            Spacer()
                            Text("LOADING")
                                .Lucky(size: 30)
                            
                            ZStack {
                                Image(CandyImageName.backLoadLine.rawValue)
                                    .resizable()
                                    .frame(width: 300, height: 25)
                                
                                Image(CandyImageName.loadLine.rawValue)
                                    .resizable()
                                    .frame(width: candyLoadingModel.loadScreen().0, height: 20)
                                    .offset(x: candyLoadingModel.loadScreen().1, y: -2)
                            }
                            Text(candyLoadingModel.loadScreen().2)
                                .Lucky(size: 24)
                        }
                    }
                } else {
                    ZStack {
                        Image(CandyImageName.menuHBackground.rawValue)
                            .resizable()
                            .ignoresSafeArea()
                        
                        Image(CandyImageName.yellowVector.rawValue)
                            .resizable()
                            .frame(width: geometry.size.width + 120, height: geometry.size.height / 2.5)
                            .offset(x: -geometry.size.width / 12, y: -geometry.size.height / 2.65)
                        
                        Image(CandyImageName.pinkVector.rawValue)
                            .resizable()
                            .frame(width: geometry.size.width / 1.1, height: geometry.size.height / 4)
                            .offset(x: geometry.size.width / -4, y: -geometry.size.height / 2.6)
                        
                        Image(CandyImageName.liza.rawValue)
                            .resizable()
                            .frame(width: 200, height: 380)
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 1.3)
                        
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
                                    .frame(width: geometry.size.width / candyLoadingModel.loadScreenH().0, height: 20)
                                    .offset(x: candyLoadingModel.loadScreenH().1, y: -2)
                            }
                            Text(candyLoadingModel.loadScreenH().2)
                                .Lucky(size: 24)
                        }
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    }
                }
            }
            .onAppear {
                candyLoadingModel.startTimer()

                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    candyLoadingModel.currentIndex = 1
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    candyLoadingModel.currentIndex = 2
                    candyLoadingModel.isMenuAvailible = true
                }
            }
            .navigationDestination(isPresented: $candyLoadingModel.isMenuAvailible) {
                CandyMenuView()
            }
        }
    }
}

#Preview {
    CandyLoadingView()
}

