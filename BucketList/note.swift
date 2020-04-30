//func getDocumentsDirectory() -> URL {
//       // find all possible documents directories for this user
//       let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//
//       // just send back the first one, which ought to be the only one
//       return paths[0]
//   }
//
//   var body: some View {
//       Text("Hello World")
//       .onTapGesture {
//           let str = "Test Message"
//           let url = self.getDocumentsDirectory().appendingPathComponent("message.txt")
//
//           do {
//               try str.write(to: url, atomically: true, encoding: .utf8)
//               let input = try String(contentsOf: url)
//               print(input)
//           } catch {
//               print(error.localizedDescription)
//           }
//       }
//   }



//struct LoadingView: View {
//    var body: some View {
//        Text("Loading...")
//    }
//}
//
//struct SuccessView: View {
//    var body: some View {
//        Text("Success!")
//    }
//}
//
//struct FailedView: View {
//    var body: some View {
//        Text("Failed.")
//    }
//}
//
//struct ContentView: View {
//   enum LoadingState {
//       case loading, success, failed
//   }
//    var loadingState = LoadingState.loading
//    var body: some View{
//       Group {
//            if loadingState == .loading {
//                LoadingView()
//            } else if loadingState == .success {
//                SuccessView()
//            } else if loadingState == .failed {
//                FailedView()
//            }
//        }
//    }
//}


//                              FaceID

//import SwiftUI
//import LocalAuthentication //faceID
//
//struct ContentView: View {
//
//    @State private var isUnlocked = false
//
//    func authenticate() {
//        let context = LAContext()
//        var error: NSError?
//
//        // check whether biometric authentication is possible
//        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
//            // it's possible, so go ahead and use it
//            let reason = "We need to unlock your data."
//
//            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
//                // authentication has now completed
//                DispatchQueue.main.async {
//                    if success {
//                        // authenticated successfully
//                        self.isUnlocked = true
//                    } else {
//                        // there was a problem
//                    }
//                }
//            }
//        } else {
//            // no biometrics
//        }
//    }
//
//    var body: some View{
//
//       VStack {
//           if self.isUnlocked {
//               Text("Unlocked")
//           } else {
//               Text("Locked")
//           }
//       }
//       .onAppear(perform: authenticate)
//    }
//}
