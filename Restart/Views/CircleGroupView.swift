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
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(ShapeColor.opacity(ShapOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
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
