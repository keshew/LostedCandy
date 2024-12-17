import SwiftUI

struct CandyButton: View {
    var foregroundImage: String
    var sizeH: CGFloat
    var sizeW: CGFloat
    var text: String
    var textSize: CGFloat
    var textColor: Color = .white
    var textYOffset: CGFloat
    var action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(foregroundImage)
                    .resizable()
                    .frame(width: sizeW, height: sizeH)
                
                Text(text)
                    .Lucky(size: textSize,
                           color: textColor)
                    .offset(y: textYOffset)
            }
        }

    }
}

struct SquareButton: View {
    var backImage: String
    var sizeHBack: CGFloat
    var sizeWBack: CGFloat
    var foregroundImage: String
    var sizeHForeground: CGFloat
    var sizeWForeground: CGFloat
    var vSpacing: CGFloat = 15
    var text: String
    var textSize: CGFloat
    var textColor: Color = .white
    var action: () -> Void
    var xOffsetText: CGFloat = 0
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(backImage)
                    .resizable()
                    .frame(width: sizeWBack, height: sizeHBack)
                
                VStack(spacing: vSpacing) {
                    Image(foregroundImage)
                        .resizable()
                        .frame(width: sizeWForeground, height: sizeHForeground)
                    
                    Text(text)
                        .Lucky(size: textSize,
                               color: textColor)
                        .offset(x: xOffsetText)
                }
            }
        }
    }
}

struct MapImage: View {
    var body: some View {
        ZStack {
            Image(CandyImageName.mapImage.rawValue)
                .resizable()
                .frame(width: 75, height: 75)
            
            Image(CandyImageName.xImage.rawValue)
                .resizable()
                .frame(width: 10, height: 10)
                .offset(x: -13, y: -18)
            
            Image(CandyImageName.lineImage.rawValue)
                .resizable()
                .frame(width: 40, height: 30)
                .offset(x: 13, y: -5)
        }
    }
}

struct SquareButtonForMap: View {
    var backImage: String
    var sizeHBack: CGFloat
    var sizeWBack: CGFloat
    var vSpacing: CGFloat = 15
    var text: String
    var textSize: CGFloat
    var textColor: Color = .white
    var action: () -> Void
    var xOffsetText: CGFloat = 0
    var sizeMapW: CGFloat = 80
    var sizeMapH: CGFloat = 80
    var sizeLineW: CGFloat = 40
    var sizeLineH: CGFloat = 30
    var xOffsetLine: CGFloat = 13
    var yOffsetXImage: CGFloat = -18
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(backImage)
                    .resizable()
                    .frame(width: sizeWBack, height: sizeHBack)
                
                VStack(spacing: vSpacing) {
                    ZStack {
                        Image(CandyImageName.mapImage.rawValue)
                            .resizable()
                            .frame(width: sizeMapW, height: sizeMapH)
                        
                        Image(CandyImageName.xImage.rawValue)
                            .resizable()
                            .frame(width: 10, height: 10)
                            .offset(x: -13, y: yOffsetXImage)
                        
                        Image(CandyImageName.lineImage.rawValue)
                            .resizable()
                            .frame(width: sizeLineW, height: sizeLineH)
                            .offset(x: xOffsetLine, y: -5)
                    }
                    .offset(y: 5)
                    
                    Text(text)
                        .Lucky(size: textSize,
                               color: textColor)
                        .offset(x: xOffsetText, y: -6)
                }
            }
        }
    }
}

struct FirstItemToBuy: View {
    var action: () -> Void
    var imageToBuy: String = CandyImageName.clearImage.rawValue
    var backItemImage: String = CandyImageName.backForBomb.rawValue
    var nameOfItem: String
    var body: some View {
        ZStack {
            Image(CandyImageName.whiteBack.rawValue)
                .resizable()
                .frame(width: 350, height: 130)
            
            Image(backItemImage)
                .resizable()
                .frame(width: 150, height: 90)
                .offset(x: -40, y: 8)
            
            Image(imageToBuy)
                .resizable()
                .frame(width: 60, height: 70)
                .offset(x: -30, y: 12)
            
            Image(CandyImageName.backForCost2.rawValue)
                .resizable()
                .frame(width: 100, height: 37)
                .offset(x: -82, y: -30)
            
            Text(nameOfItem)
                .Lucky(size: 22,
                       color: Color(#colorLiteral(red: 255/255, green: 0/255, blue: 229/255, alpha: 1)),
                       colorOutline: Color.white)
                .frame(width: 100)
                .offset(x: 105, y: 5)
            
            Button(action: {
                action()
            }) {
                ZStack {
                    Image(CandyImageName.buyBack.rawValue)
                        .resizable()
                        .frame(width: 120, height: 50)
                    
                    Text("BUY")
                        .Lucky(size: 28)
                        .offset(y: 3)
                }
            }
            .offset(x: 120, y: 50)
            
            HStack {
                Text("100")
                    .Lucky(size: 26)
                
                Image(CandyImageName.coin2.rawValue)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .offset(y: -5)
            }
            .offset(x: -75, y: -25)
        }
    }
}

struct SecondItemToBuy: View {
    var action: () -> Void
    var imageToBuy: String = CandyImageName.clearImage.rawValue
    var backItemImage: String = CandyImageName.backForBomb.rawValue
    var nameOfItem: String
    var offsetXText: CGFloat = 85
    var body: some View {
        ZStack {
            Image(CandyImageName.whiteBack2.rawValue)
                .resizable()
                .frame(width: 350, height: 120)
            
            Image(backItemImage)
                .resizable()
                .frame(width: 150, height: 90)
                .offset(x: -40, y: 3)
            
            Image(imageToBuy)
                .resizable()
                .frame(width: 60, height: 70)
                .offset(x: -30, y: 5)
            
            ZStack {
                Image(CandyImageName.backForCost.rawValue)
                    .resizable()
                    .frame(width: 100, height: 37)
                    .offset(x: -2)
                
                HStack {
                    Text("100")
                        .Lucky(size: 26)
                    
                    Image(CandyImageName.coin2.rawValue)
                        .resizable()
                        .frame(width: 25, height: 25)
                        .offset(y: -4)
                }
                .offset(x: -6, y: 5)
            }
            .offset(x: 99, y: -28)
            
            Text(nameOfItem)
                .Lucky(size: 22,
                       color: Color(#colorLiteral(red: 255/255, green: 0/255, blue: 229/255, alpha: 1)),
                       colorOutline: Color.white)
                .frame(width: 100)
                .offset(x: offsetXText, y: 25)
            
            Button(action: {
               action()
            }) {
                ZStack {
                    Image(CandyImageName.buyBack.rawValue)
                        .resizable()
                        .frame(width: 120, height: 50)
                    
                    Text("BUY")
                        .Lucky(size: 28)
                        .offset(y: 3)
                }
            }
            .offset(x: -100, y: 50)
        }
    }
}

struct BackgroundLabel: View {
    var body: some View {
        ZStack {
            Image(CandyImageName.backForLabel.rawValue)
                .resizable()
                .frame(width: 230, height: 40)
            
            Text("BACKGROUND")
                .Lucky(size: 30)
                .offset(y: 2)
        }
    }
}

struct ButtonArrow: View {
    var action: () -> Void
    var image: String
    var imageBack: String
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(imageBack)
                    .resizable()
                    .frame(width: 80, height: 50)
                
                Image(image)
                    .resizable()
                    .frame(width: 45, height: 25)
            }
        }
    }
}

struct BackButton: View {
    var action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(CandyImageName.backForLabel2.rawValue)
                    .resizable()
                    .frame(width: 65, height: 50)
                
                Image(CandyImageName.backArrow.rawValue)
                    .resizable()
                    .frame(width: 40, height: 30)
            }
        }
    }
}

struct NextIslandButton: View {
    var action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(CandyImageName.backForLabel2.rawValue)
                    .resizable()
                    .frame(width: 150, height: 40)
                
                Text("next island")
                    .Lucky(size: 15)
                    .offset(y: 1)
            }
        }
    }
}

struct MapV: View {
    var geometry: GeometryProxy
    var imageSecondMap: String
    var descOfIsland: String
    var body: some View {
        ZStack {
            Image(CandyImageName.mainMap.rawValue)
                .resizable()
            .frame(width: geometry.size.width / 1.2, height: geometry.size.height / 1.25)
            
            Image(imageSecondMap)
                .resizable()
                .frame(width: geometry.size.width / 1.23, height: geometry.size.height / 1.285)
                .offset(x: -5, y: -8)
            
            Image(CandyImageName.roadToX.rawValue)
                .resizable()
                .frame(width: geometry.size.width / 2, height: geometry.size.height / 1.55)
                .offset(x: -10, y: -30)
            
            Image(CandyImageName.xRed.rawValue)
                .resizable()
                .frame(width: geometry.size.width / 10, height: geometry.size.height / 20)
                .offset(x: 55, y: 225)
            
            ZStack {
                Image(CandyImageName.backForLabel.rawValue)
                    .resizable()
                    .frame(width: 160, height: 50)
                  
                
                Text(descOfIsland)
                    .Lucky(size: 20)
            }
            .offset(x: -85, y: 265)
        }
    }
}

struct MapH: View {
    var action: () -> Void
    var geometry: GeometryProxy
    var imageSecondMap: String
    var descOfIsland: String
    var currentIndex: Int
    var body: some View {
        ZStack {
            Image(CandyImageName.mainMapH.rawValue)
                .resizable()
                .frame(width: geometry.size.width / 1.2, height: geometry.size.height / 1.4)
            
            Image(imageSecondMap)
                .resizable()
                .frame(width: geometry.size.width / 1.235, height: geometry.size.height / 1.45)
                .offset(x: -9, y: 5)
            
            Image(CandyImageName.roadToXH.rawValue)
                .resizable()
                .frame(width: geometry.size.width / 1.4, height: geometry.size.height / 2.5)
                .offset(x: -30, y: -0)
            
            Image(CandyImageName.xRedH.rawValue)
                .resizable()
                .frame(width: geometry.size.width / 13, height: geometry.size.height / 12)
                .offset(x: 250, y: -50)
            
            Button(action: {
                action()
            }) {
                ZStack {
                    Image(CandyImageName.buyBack.rawValue)
                        .resizable()
                        .frame(width: 180, height: 50)
                    
                    
                    Text(descOfIsland)
                        .Lucky(size: 19)
                }
            }
            .disabled(currentIndex == 3 ? true : false)
            .offset(x: 195, y: 100)
        }
    }
}


struct LevelPin: View {
    var action: () -> Void
    var image: String
    var text: String
    var xPosition: CGFloat
    var yPosition: CGFloat
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(image)
                    .resizable()
                    .frame(width: 45, height: 45)
                   
                Text(text)
                    .Lucky(size: 25)
                    .offset(y: 2)
            }
        }
        .position(x: xPosition, y: yPosition)
        .disabled(image == CandyImageName.lockedLevel.rawValue ? true : false)
    }
}

struct TopImage: View {
    var geometry: GeometryProxy
    var body: some View {
        Image(CandyImageName.yellowVector.rawValue)
            .resizable()
            .frame(width: 395, height: 200)
            .offset(y: -geometry.size.height / 2.2)
        
        Image(CandyImageName.redVector.rawValue)
            .resizable()
            .frame(width: 200, height: 100)
            .offset(x: geometry.size.width / 4, y: -geometry.size.height / 1.95)
        
        Image(CandyImageName.pinkVector.rawValue)
            .resizable()
            .frame(width: 335, height: 150)
            .offset(x: geometry.size.width / -10, y: -geometry.size.height / 2)
    }
}

struct TopImageH: View {
    var geometry: GeometryProxy
    var body: some View {
        Image(CandyImageName.yellowVector.rawValue)
            .resizable()
            .frame(width: geometry.size.width + 120, height: geometry.size.height / 2.5)
            .offset(x: -geometry.size.width / 12, y: -geometry.size.height / 2.65)
        
        Image(CandyImageName.redVector.rawValue)
            .resizable()
            .frame(width: geometry.size.width / 1.8, height: geometry.size.height / 8)
            .offset(x: geometry.size.width / 4, y: -geometry.size.height / 2.25)
        
        Image(CandyImageName.pinkVector.rawValue)
            .resizable()
            .frame(width: geometry.size.width / 1.1, height: geometry.size.height / 4)
            .offset(x: geometry.size.width / -4, y: -geometry.size.height / 2.6)
    }
}

struct SoundButton: View {
    var action: () -> Void
    var image: String
    var backImage: String
    var sizeHImage: CGFloat = 40
    var offsetYImage: CGFloat = 0
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(backImage)
                    .resizable()
                    .frame(width: 90, height: 60)
                
                Image(image)
                    .resizable()
                    .frame(width: 80, height: sizeHImage)
                    .offset(y: offsetYImage)
            }
        }
    }
}

struct VolumeButton: View {
    var action: () -> Void
    var image: String
    var sizeHImage: CGFloat = 10
    var offsetYImage: CGFloat = 0
    var sizeWImage: CGFloat = 30
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(CandyImageName.backForMinus.rawValue)
                    .resizable()
                    .frame(width: 65, height: 40)
                Image(image)
                    .resizable()
                    .frame(width: sizeWImage, height: sizeHImage)
                    .offset(y: offsetYImage)
            }
            .offset(y: -1)
        }
    }
}

struct SoundView: View {
    var action: () -> Void
    var secondAction: () -> Void
    var body: some View {
        VStack(spacing: -10) {
            Text("sounds")
                .Lucky(size: 32)
            
            ZStack {
                Image(CandyImageName.purpleBack.rawValue)
                    .resizable()
                    .frame(width: 350, height: 120)
                
                HStack {
                    SoundButton(action: action,
                                image: CandyImageName.soundOn.rawValue,
                                backImage: CandyImageName.lightGreenBackForSound.rawValue)
                    
                    SoundButton(action: secondAction,
                                image: CandyImageName.soundOff.rawValue,
                                backImage: CandyImageName.whiteBackForSound.rawValue,
                                sizeHImage: 50,
                                offsetYImage: -2)
                }
                .offset(y: 7)
            }
        }
    }
}

struct MusicView: View {
    var action: () -> Void
    var secondAction: () -> Void
    var index: Int
    var body: some View {
        VStack(spacing: -10) {
            Text("music")
                .Lucky(size: 32)
            
            ZStack {
                Image(CandyImageName.greenBack.rawValue)
                .resizable()
                .frame(width: 350, height: 120)
                
                Image(CandyImageName.soundBack.rawValue)
                .resizable()
                .frame(width: 230, height: 50)
                
                VolumeButton(action: action,
                             image: CandyImageName.minus.rawValue)
                .offset(x: -115)
                .disabled(index == 1 ? true : false)
                
                VolumeButton(action: secondAction,
                             image: CandyImageName.plus.rawValue,
                             sizeHImage: 27,
                             offsetYImage: -2,
                             sizeWImage: 27)
                .offset(x: 115)
                .disabled(index == 8 ? true : false)
                
                ForEach(0..<index, id: \.self) { index in
                    Image(CandyImageName.musicPin.rawValue)
                        .resizable()
                        .frame(width: 25, height: 40)
                        .offset(x: CGFloat((index * 20) + (-73)))
                }
            }
        }
    }
}


