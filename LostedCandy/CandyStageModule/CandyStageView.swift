import SwiftUI

struct CandyStageView: View {
    @StateObject var candyStageModel =  CandyStageViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @State private var scale: CGFloat = 1.0
    @GestureState private var magnifyBy = 1.0
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .regular {
                ZStack {
                    Image(candyStageModel.contact.imageBackground[candyStageModel.currentIndex])
                        .resizable()
                        .ignoresSafeArea()
                    
                    VStack {
                        HStack {
                            BackButton(action: candyStageModel.lowerIndex)
                                .disabled(candyStageModel.currentIndex == 0 ? true : false)
                            
                            Spacer()
                            
                            Text(candyStageModel.contact.nameOfIsland[candyStageModel.currentIndex])
                                .Lucky(size: 34)
                                .offset(candyStageModel.currentIndex == 0 ? CGSize(width: -0, height: 10) : CGSize(width: -25, height: 10))
                            Spacer()
                        }
                        .padding()
                        
                        Spacer()
                        
                        if candyStageModel.currentIndex < 2 {
                            MapV(geometry: geometry,
                                 imageSecondMap: candyStageModel.contact.imageOfSecondMap[candyStageModel.currentIndex],
                                 descOfIsland: candyStageModel.contact.descriptionOfIsland[candyStageModel.currentIndex])
                            .scaleEffect(scale * magnifyBy)
                            .gesture(
                                MagnificationGesture()
                                    .updating($magnifyBy) { currentState, gestureState, _ in
                                        gestureState = currentState
                                    }
                                    .onEnded { value in
                                        scale *= value
                                    }
                            )
                        } else {
                            Image(CandyImageName.lock.rawValue)
                                .resizable()
                                .frame(width: 120, height: 150)
                                .offset(y: -230)
                                .padding()
                        }
                        
                        HStack {
                            if candyStageModel.currentIndex < 2 {
                                NextIslandButton(action: candyStageModel.increaseIndex)
                                    .disabled(candyStageModel.currentIndex == 3 ? true : false)
                                    .padding()
                                Spacer()
                            } else {
                                NextIslandButton(action: candyStageModel.increaseIndex)
                                    .disabled(candyStageModel.currentIndex == 3 ? true : false)
                                    .offset(y: 18)
                                    .padding()
                                Spacer()
                            }
                        }
                    }
                    
                    if candyStageModel.currentIndex < 2 {
                        LevelPin(action: candyStageModel.goToGame,
                                 image: CandyImageName.doneAndCurrentLevel.rawValue,
                                 text: "1",
                                 xPosition: geometry.size.width / 1.9,
                                 yPosition: geometry.size.height / 1.38)
                        .scaleEffect(scale * magnifyBy)
                        .gesture(
                            MagnificationGesture()
                                .updating($magnifyBy) { currentState, gestureState, _ in
                                    gestureState = currentState
                                }
                                .onEnded { value in
                                    scale *= value
                                }
                        )
                        
                        LevelPin(action: candyStageModel.goToGame,
                                 image: CandyImageName.lockedLevel.rawValue,
                                 text: "2",
                                 xPosition: geometry.size.width / 3.5,
                                 yPosition: geometry.size.height / 1.5)
                        .scaleEffect(scale * magnifyBy)
                        .gesture(
                            MagnificationGesture()
                                .updating($magnifyBy) { currentState, gestureState, _ in
                                    gestureState = currentState
                                }
                                .onEnded { value in
                                    scale *= value
                                }
                        )
                        
                        LevelPin(action: candyStageModel.goToGame,
                                 image: CandyImageName.lockedLevel.rawValue,
                                 text: "3",
                                 xPosition: geometry.size.width / 2.8,
                                 yPosition: geometry.size.height / 1.8)
                        .scaleEffect(scale * magnifyBy)
                        .gesture(
                            MagnificationGesture()
                                .updating($magnifyBy) { currentState, gestureState, _ in
                                    gestureState = currentState
                                }
                                .onEnded { value in
                                    scale *= value
                                }
                        )
                        
                        LevelPin(action: candyStageModel.goToGame,
                                 image: CandyImageName.lockedLevel.rawValue,
                                 text: "4",
                                 xPosition: geometry.size.width / 1.9,
                                 yPosition: geometry.size.height / 1.6)
                        .scaleEffect(scale * magnifyBy)
                        .gesture(
                            MagnificationGesture()
                                .updating($magnifyBy) { currentState, gestureState, _ in
                                    gestureState = currentState
                                }
                                .onEnded { value in
                                    scale *= value
                                }
                        )
                        
                        LevelPin(action: candyStageModel.goToGame,
                                 image: CandyImageName.lockedLevel.rawValue,
                                 text: "5",
                                 xPosition: geometry.size.width / 1.4,
                                 yPosition: geometry.size.height / 1.8)
                        .scaleEffect(scale * magnifyBy)
                        .gesture(
                            MagnificationGesture()
                                .updating($magnifyBy) { currentState, gestureState, _ in
                                    gestureState = currentState
                                }
                                .onEnded { value in
                                    scale *= value
                                }
                        )
                        
                        LevelPin(action: candyStageModel.goToGame,
                                 image: CandyImageName.lockedLevel.rawValue,
                                 text: "6",
                                 xPosition: geometry.size.width / 1.9,
                                 yPosition: geometry.size.height / 2.35)
                        .scaleEffect(scale * magnifyBy)
                        .gesture(
                            MagnificationGesture()
                                .updating($magnifyBy) { currentState, gestureState, _ in
                                    gestureState = currentState
                                }
                                .onEnded { value in
                                    scale *= value
                                }
                        )
                        
                        LevelPin(action: candyStageModel.goToGame,
                                 image: CandyImageName.lockedLevel.rawValue,
                                 text: "7",
                                 xPosition: geometry.size.width / 3.4,
                                 yPosition: geometry.size.height / 2.6)
                        .scaleEffect(scale * magnifyBy)
                        .gesture(
                            MagnificationGesture()
                                .updating($magnifyBy) { currentState, gestureState, _ in
                                    gestureState = currentState
                                }
                                .onEnded { value in
                                    scale *= value
                                }
                        )
                        
                        LevelPin(action: candyStageModel.goToGame,
                                 image: CandyImageName.lockedLevel.rawValue,
                                 text: "8",
                                 xPosition: geometry.size.width / 2.5,
                                 yPosition: geometry.size.height / 3.6)
                        .scaleEffect(scale * magnifyBy)
                        .gesture(
                            MagnificationGesture()
                                .updating($magnifyBy) { currentState, gestureState, _ in
                                    gestureState = currentState
                                }
                                .onEnded { value in
                                    scale *= value
                                }
                        )
                        
                        LevelPin(action: candyStageModel.goToGame,
                                 image: CandyImageName.lockedLevel.rawValue,
                                 text: "9",
                                 xPosition: geometry.size.width / 1.6,
                                 yPosition: geometry.size.height / 3.3)
                        .scaleEffect(scale * magnifyBy)
                        .gesture(
                            MagnificationGesture()
                                .updating($magnifyBy) { currentState, gestureState, _ in
                                    gestureState = currentState
                                }
                                .onEnded { value in
                                    scale *= value
                                }
                        )
                        
                        LevelPin(action: candyStageModel.goToGame,
                                 image: CandyImageName.lockedLevel.rawValue,
                                 text: "10",
                                 xPosition: geometry.size.width / 1.75,
                                 yPosition: geometry.size.height / 5.5)
                        .scaleEffect(scale * magnifyBy)
                        .gesture(
                            MagnificationGesture()
                                .updating($magnifyBy) { currentState, gestureState, _ in
                                    gestureState = currentState
                                }
                                .onEnded { value in
                                    scale *= value
                                }
                        )
                    }
                }
            } else {
                ZStack {
                    Image(CandyImageName.menuHBackground.rawValue)
                        .resizable()
                        .ignoresSafeArea()
                    
                    VStack {
                        HStack {
                            BackButton(action: candyStageModel.lowerIndex)
                                .disabled(candyStageModel.currentIndex == 0 ? true : false)
                            
                            Spacer()
                            
                            Text(candyStageModel.contact.nameOfIsland[candyStageModel.currentIndex])
                                .Lucky(size: 34)
                                .offset(candyStageModel.currentIndex == 0 ? CGSize(width: -40, height: 10) : CGSize(width: -25, height: 10))
                            Spacer()
                        }
                        .padding()
                        
                        if candyStageModel.currentIndex < 2 {
                            MapH(action: candyStageModel.increaseIndex,
                                 geometry: geometry,
                                 imageSecondMap: candyStageModel.contact.imagesOfSecondMapH[candyStageModel.currentIndex],
                                 descOfIsland: candyStageModel.contact.descriptionOfIsland[candyStageModel.currentIndex],
                                 currentIndex: candyStageModel.currentIndex)
                            .scaleEffect(scale * magnifyBy)
                            .gesture(
                                MagnificationGesture()
                                    .updating($magnifyBy) { currentState, gestureState, _ in
                                        gestureState = currentState
                                    }
                                    .onEnded { value in
                                        scale *= value
                                    }
                            )
                        } else {
                            Image(CandyImageName.lock.rawValue)
                                .resizable()
                                .frame(width: 205, height: 235)
                                .padding()
                        }
                    }
                    
                    if candyStageModel.currentIndex < 2 {
                        LevelPin(action: candyStageModel.goToGame,
                                 image: CandyImageName.doneAndCurrentLevel.rawValue,
                                 text: "1",
                                 xPosition: geometry.size.width / 1.38,
                                 yPosition: geometry.size.height / 1.7)
                        .scaleEffect(scale * magnifyBy)
                        .gesture(
                            MagnificationGesture()
                                .updating($magnifyBy) { currentState, gestureState, _ in
                                    gestureState = currentState
                                }
                                .onEnded { value in
                                    scale *= value
                                }
                        )
                        
                        LevelPin(action: candyStageModel.goToGame,
                                 image: CandyImageName.lockedLevel.rawValue,
                                 text: "2",
                                 xPosition: geometry.size.width / 1.5,
                                 yPosition: geometry.size.height / 1.3)
                        .scaleEffect(scale * magnifyBy)
                        .gesture(
                            MagnificationGesture()
                                .updating($magnifyBy) { currentState, gestureState, _ in
                                    gestureState = currentState
                                }
                                .onEnded { value in
                                    scale *= value
                                }
                        )
                        
                        LevelPin(action: candyStageModel.goToGame,
                                 image: CandyImageName.lockedLevel.rawValue,
                                 text: "3",
                                 xPosition: geometry.size.width / 1.85,
                                 yPosition: geometry.size.height / 1.4)
                        .scaleEffect(scale * magnifyBy)
                        .gesture(
                            MagnificationGesture()
                                .updating($magnifyBy) { currentState, gestureState, _ in
                                    gestureState = currentState
                                }
                                .onEnded { value in
                                    scale *= value
                                }
                        )
                        
                        LevelPin(action: candyStageModel.goToGame,
                                 image: CandyImageName.lockedLevel.rawValue,
                                 text: "4",
                                 xPosition: geometry.size.width / 1.6,
                                 yPosition: geometry.size.height / 1.7)
                        .scaleEffect(scale * magnifyBy)
                        .gesture(
                            MagnificationGesture()
                                .updating($magnifyBy) { currentState, gestureState, _ in
                                    gestureState = currentState
                                }
                                .onEnded { value in
                                    scale *= value
                                }
                        )
                        
                        LevelPin(action: candyStageModel.goToGame,
                                 image: CandyImageName.lockedLevel.rawValue,
                                 text: "5",
                                 xPosition: geometry.size.width / 1.9,
                                 yPosition: geometry.size.height / 2.4)
                        .scaleEffect(scale * magnifyBy)
                        .gesture(
                            MagnificationGesture()
                                .updating($magnifyBy) { currentState, gestureState, _ in
                                    gestureState = currentState
                                }
                                .onEnded { value in
                                    scale *= value
                                }
                        )
                        
                        LevelPin(action: candyStageModel.goToGame,
                                 image: CandyImageName.lockedLevel.rawValue,
                                 text: "6",
                                 xPosition: geometry.size.width / 2.5,
                                 yPosition: geometry.size.height / 1.7)
                        .scaleEffect(scale * magnifyBy)
                        .gesture(
                            MagnificationGesture()
                                .updating($magnifyBy) { currentState, gestureState, _ in
                                    gestureState = currentState
                                }
                                .onEnded { value in
                                    scale *= value
                                }
                        )
                        
                        LevelPin(action: candyStageModel.goToGame,
                                 image: CandyImageName.lockedLevel.rawValue,
                                 text: "7",
                                 xPosition: geometry.size.width / 2.9,
                                 yPosition: geometry.size.height / 1.3)
                        .scaleEffect(scale * magnifyBy)
                        .gesture(
                            MagnificationGesture()
                                .updating($magnifyBy) { currentState, gestureState, _ in
                                    gestureState = currentState
                                }
                                .onEnded { value in
                                    scale *= value
                                }
                        )
                        
                        LevelPin(action: candyStageModel.goToGame,
                                 image: CandyImageName.lockedLevel.rawValue,
                                 text: "8",
                                 xPosition: geometry.size.width / 4.2,
                                 yPosition: geometry.size.height / 1.45)
                        .scaleEffect(scale * magnifyBy)
                        .gesture(
                            MagnificationGesture()
                                .updating($magnifyBy) { currentState, gestureState, _ in
                                    gestureState = currentState
                                }
                                .onEnded { value in
                                    scale *= value
                                }
                        )
                        
                        LevelPin(action: candyStageModel.goToGame,
                                 image: CandyImageName.lockedLevel.rawValue,
                                 text: "9",
                                 xPosition: geometry.size.width / 4.2,
                                 yPosition: geometry.size.height / 2)
                        .scaleEffect(scale * magnifyBy)
                        .gesture(
                            MagnificationGesture()
                                .updating($magnifyBy) { currentState, gestureState, _ in
                                    gestureState = currentState
                                }
                                .onEnded { value in
                                    scale *= value
                                }
                        )
                        
                        LevelPin(action: candyStageModel.goToGame,
                                 image: CandyImageName.lockedLevel.rawValue,
                                 text: "10",
                                 xPosition: geometry.size.width / 7.2,
                                 yPosition: geometry.size.height / 1.85)
                        .scaleEffect(scale * magnifyBy)
                        .gesture(
                            MagnificationGesture()
                                .updating($magnifyBy) { currentState, gestureState, _ in
                                    gestureState = currentState
                                }
                                .onEnded { value in
                                    scale *= value
                                }
                        )
                    }
                }
                .navigationDestination(isPresented: $candyStageModel.isMenuAvailible) {
                    CandyMenuView()
                }
            }
        }
        .navigationDestination(isPresented: $candyStageModel.isGameAvailible) {
            if candyStageModel.currentIndex == 0 {
                StrawLoadingView()
            } else {
                StarLoadingView()
            }
        }
        
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CandyStageView()
}

