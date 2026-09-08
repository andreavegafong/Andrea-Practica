import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 60, height: 60)
                        .offset(x: -40, y: 12)
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 60, height: 60)
                        .offset(x: 40, y: 12)
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 80, height: 80)
                }
                .frame(width: 160, height: 90)

                Spacer().frame(height: 30)

                ZStack {
                    Circle()
                        .stroke(Color.gray, lineWidth: 2)
                        .frame(width: 100, height: 100)
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 30, height: 80)
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 80, height: 30)
                }
                .frame(width: 100, height: 100)

                Spacer().frame(height: 30)

                VStack(spacing: 0) {
                    Rectangle()
                        .fill(Color.yellow)
                        .frame(width: 150, height: 50)
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 150, height: 25)
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 150, height: 25)
                }

                Spacer().frame(height: 30)

                ZStack {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 100, height: 100)
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 40, height: 40)
                }

                Spacer().frame(height: 30)
            }
        }
    }
}

#Preview {
    ContentView()
}
