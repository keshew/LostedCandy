import SwiftUI

extension Text {
    func Lucky(size: CGFloat, color: Color = .white, outlineWidth: CGFloat = 0.8, colorOutline: Color = Color(#colorLiteral(red: 255/255, green: 0/255, blue: 229/255, alpha: 1))) -> some View {
        self.font(.custom("LuckiestGuy-Regular", size: size))
            .foregroundColor(color)
            .candyOutlineText(color: colorOutline, width: outlineWidth)
    }
}
