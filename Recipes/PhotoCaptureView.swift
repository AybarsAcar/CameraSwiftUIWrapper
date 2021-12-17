//
//  PhotoCaptureView.swift
//  Recipes
//
//  Created by Aybars Acar on 16/12/21.
//

import SwiftUI


struct PhotoCaptureView: View {
  
  @Binding var isDisplayed: Bool
  @Binding var image: Image?
  
  var body: some View {
    
    ImagePicker(isShown: $isDisplayed, image: $image)
    
  }
}



struct PhotoCaptureView_Previews: PreviewProvider {
  static var previews: some View {
    PhotoCaptureView(isDisplayed: .constant(true), image: .constant(Image("")))
  }
}
