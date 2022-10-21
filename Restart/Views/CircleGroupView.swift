//
//  CircleGroupView.swift
//  Restart
//
//  Created by Elijah on 10/20/22.
//

import SwiftUI

struct CircleGroupView: View {
    // MARK: - Properties
    
    @State var ShapeColor: Color
    @State var ShapOpacity: Double
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(ShapeColor.opacity(ShapOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear {
            isAnimating = true
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea(.all, edges: .all)
            CircleGroupView(ShapeColor: .white, ShapOpacity: 0.2)
        }
    }
}
