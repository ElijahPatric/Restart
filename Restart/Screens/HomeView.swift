//
//  HomeView.swift
//  Restart
//
//  Created by Elijah on 10/18/22.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating = false

    // MARK: - BODY
    var body: some View {
        VStack(spacing: 20) {
            // MARK: - Header
            
            Spacer()
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        Animation
                            .easeInOut(duration: 4)
                            .repeatForever(),
                        value: isAnimating
                    )
            }
            
            // MARK: - Center
            
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            // MARK: - Footer
            Spacer()
            Button(action: {
                withAnimation {
                    isOnboardingViewActive = true
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .padding(.bottom, 40)
        } //: VSTACK
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating = true
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
