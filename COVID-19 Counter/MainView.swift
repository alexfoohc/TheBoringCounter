//
//  MainView.swift
//  COVID-19 Counter
//
//  Created by Alejandro Hernandez on 11/12/25.
//

import SwiftUI

struct MainView: View {
    @State private var currentValue: Int = 0
    @State private var oldValue: Int = 0
    @State private var showErrorAlert: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    var numberTransition: AnyTransition {
        if currentValue == 0 {
            return .scale.combined(with: .opacity)
        } else if oldValue < currentValue {
            return .asymmetric(
                insertion: .move(edge: .bottom).combined(with: .opacity),
                removal: .move(edge: .top).combined(with: .opacity)
            )
        } else {
            return .asymmetric(
                insertion: .move(edge: .top).combined(with: .opacity),
                removal: .move(edge: .bottom).combined(with: .opacity)
            )
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                VStack(alignment: .center) {
                    Text("\(currentValue)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxHeight: .infinity)
                    Spacer()
                    Button {
                        add()
                    } label: {
                        Image(systemName: "plus")
                            .font(.title)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundStyle(.white)
                            .background(.green)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .buttonStyle(BounceStyle())

                }
                .padding()
                HStack(spacing: 12) {
                    Button {
                        withAnimation(.bouncy) {
                            reset()
                        }
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .font(.title)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundStyle(.white)
                            .background(.teal)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .buttonStyle(BounceStyle())

                    Button {
                        substract()
                    } label: {
                        Image(systemName: "minus")
                            .font(.title)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundStyle(.white)
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .buttonStyle(BounceStyle())

                }
                .padding()
            }
            .navigationTitle("The Boring Counter")
            .alert("Warning", isPresented: $showErrorAlert) {
                Button("Ok") {
                    dismiss()
                }
            } message: {
                Text("Your count is at zero, the app cannot have a negative number.")
            }

        }
    }
    
    private func add() {
//        withAnimation(.spring(duration: 0.3, bounce: 0.4, blendDuration: 0.8)) {
//            currentValue += 1
//
//        }
        oldValue = currentValue
        currentValue += 1
    }
    
    private func substract() {
        oldValue = currentValue
        currentValue -= 1
        if currentValue < 0 {
            showErrorAlert = true
            currentValue = 0
        }
    }
    
    private func reset() {
        oldValue = currentValue
        currentValue = 0
    }
}

struct BounceStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.spring(response: 0.25, dampingFraction: 0.4), value: configuration.isPressed)
            .contentShape(Rectangle())
    }
}

#Preview {
    MainView()
}
