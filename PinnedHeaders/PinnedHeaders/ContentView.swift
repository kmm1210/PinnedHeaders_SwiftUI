import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 20) {
                Button("Basic Pinned Header") {
                    path.append(Route.basicPinnedHeader)
                }
                .buttonStyle(.borderedProminent)
                
                Button("Inset Pinned Header") {
                    path.append(Route.insetPinnedHeader)
                }
                .buttonStyle(.borderedProminent)
                
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .basicPinnedHeader: BasicPinnedHeader()
                case .insetPinnedHeader: InsetPinnedHeader()
                }
            }
        }
    }
}

enum Route: Hashable {
    case basicPinnedHeader
    case insetPinnedHeader
}

#Preview {
    ContentView()
}
