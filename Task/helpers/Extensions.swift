//
//  Extensions.swift
//  Task
//
//  Created by hosam on 22/01/2023.
//

import SwiftUI

extension View {
    
    public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
        let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
        return clipShape(roundedRect)
            .overlay(roundedRect.strokeBorder(content, lineWidth: width))
    }
    
    func backgroundColor(_ color: Color) -> some View {
       return self.background(color)
     }
   
    
  
    
    //for keyboard height
//    func KeyboardAwarePadding() -> some View {
//        ModifiedContent(content: self, modifier: KeyboardAwareModifier())
//    }
    
    func getSafeArea() -> UIEdgeInsets? {
        return UIApplication.shared.windows.first?.safeAreaInsets
    }
    
    func getFrameSize() -> CGRect {
        return UIScreen.main.bounds
    }
    
    func frameWidth() -> CGFloat {
        getFrameSize().width
    }
    
    func frameHeight() -> CGFloat {
        getFrameSize().height
    }
    
    func imageHeight() -> CGFloat {
        getFrameSize().height < 750 ? 300 : 350
    }
    
    func isSmallDevice() -> Bool {
        UIScreen.main.bounds.height < 750
    }
    
    func isFaoundBottomSafe() -> CGFloat? {
        return   UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 0 : UIApplication.shared.windows.first?.safeAreaInsets.bottom
    }
    
    func bottomSafeArea(x:CGFloat,y:CGFloat = 0) -> CGFloat? {
        return   UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? x : (UIApplication.shared.windows.first?.safeAreaInsets.bottom)!+y
    }
}

