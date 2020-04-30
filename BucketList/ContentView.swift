//
//  ContentView.swift
//  BucketList
//
//  Created by Yuki Shinohara on 2020/04/12.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//

import SwiftUI
import MapKit
import LocalAuthentication //faceID

struct ContentView: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
    
//    ピンをさした場所を保存する配列
//    @State private var locations = [MKPointAnnotation]()
    @State private var locations = [CodableMKPointAnnotation]()
    
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    
    @State private var showingEditScreen = false
    
    func getDocumentsDirectory() -> URL {
        //iPhone内のDocumentディレクトリを探して、そのパスを取得します。
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func loadData() {
//        appendingPathComponentでappendingPathComponent()のURLにディレクトリを追加
        let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")

        do {
            let data = try Data(contentsOf: filename)
            locations = try JSONDecoder().decode([CodableMKPointAnnotation].self, from: data)
        } catch {
            print("Unable to load saved data.")
        }
    }
    
    func saveData() {
        do {
            let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
            let data = try JSONEncoder().encode(self.locations)
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
    @State private var isUnlocked = false //faceID
    @State private var noBioAuth = false
    func authenticate() {
    let context = LAContext()
    var error: NSError?
        

    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
        let reason = "Please authenticate yourself to unlock your places." //touchID

        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in

            DispatchQueue.main.async {
                if success {
                    self.isUnlocked = true //faceIDロック解除
                } else {
                    // error
                }
            }
        }
    } else {
        noBioAuth = true
    }
    }
    
    
    
    
    var body: some View{
        
      ZStack {
        if isUnlocked {
//           MapView(centerCoordinate: $centerCoordinate, annotations: locations)
        MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locations)
               .edgesIgnoringSafeArea(.all)
            
            //中央の青い丸
           Circle()
               .fill(Color.blue)
               .opacity(0.3)
               .frame(width: 32, height: 32)
        
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    // create a new location
//                    let newLocation = MKPointAnnotation()
                    let newLocation = CodableMKPointAnnotation() //MKPointAnnotation引き継いでる
                    newLocation.coordinate = self.centerCoordinate
                    self.locations.append(newLocation) //配列に追加
                    self.selectedPlace = newLocation //selectedPlaceはEditViewで使うMKPointAnnotaionに準拠してる
                    self.showingEditScreen = true //EditView出すsheet
//                    newLocation.title = ""
                }) {
                    Image(systemName: "plus")
                }
                .padding()
                .background(Color.black.opacity(0.75))
                .foregroundColor(.white)
                .font(.title)
                .clipShape(Circle())
                .padding(.trailing)
            }
        }
            
            //faceID解除前
            } else {
                // button here
            Button("Unlock Places") {
                self.authenticate()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            }
        
       }.alert(isPresented: $showingPlaceDetails) {
        
           Alert(title: Text(selectedPlace?.title ?? "Unknown"), message: Text(selectedPlace?.subtitle ?? "Missing place information."), primaryButton: .default(Text("OK")), secondaryButton: .default(Text("Edit")) {
               self.showingEditScreen = true
            
           })
       }
        .sheet(isPresented: $showingEditScreen, onDismiss: saveData) {
            if self.selectedPlace != nil {
                EditView(placemark: self.selectedPlace!)
            }
        }
        .onAppear(perform: loadData)
        //画面表示のときにloadData発動 データを読み込む
        .alert(isPresented: $noBioAuth) {
         
            Alert(title: Text("Unknown"), message: Text("ああああ"), primaryButton: .default(Text("OK")), secondaryButton: .default(Text("OK")))
        }
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
