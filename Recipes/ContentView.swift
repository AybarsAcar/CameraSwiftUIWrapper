//
//  ContentView.swift
//  Recipes
//
//  Created by Aybars Acar on 16/12/21.
//

import SwiftUI


struct ContentView: View {
  
  @State private var isImagePickerShown: Bool = false
  @State private var image: Image? = nil
  
  var body: some View {
    VStack{
      
      // display the image
      image?
        .resizable()
        .scaledToFit()
      
      Button("Open Camera") {
        isImagePickerShown = true
      }
      .padding()
      .background(Color.green)
      .foregroundColor(.white)
      .cornerRadius(10)
      
    }
    .sheet(
      isPresented: $isImagePickerShown,
      onDismiss: {},
      content: {
        PhotoCaptureView(isDisplayed: $isImagePickerShown, image: $image)
      }
    )
    
  }
}



struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
