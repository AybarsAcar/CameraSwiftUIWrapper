//
//  ImagePicker.swift
//  Recipes
//
//  Created by Aybars Acar on 16/12/21.
//

import Foundation
import SwiftUI


class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
  
  @Binding var isShown: Bool
  @Binding var image: Image?
  
  init(isShown: Binding<Bool>, image: Binding<Image?>) {
    _isShown = isShown
    _image = image
  }
  
  ///
  /// select a picture from photo library or selecting after taking a photo
  ///
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
    
    image = Image(uiImage: uiImage)
    
    isShown = false // close the ui image controller
  }
  
  
  ///
  /// cancelling without taking or loading a picture
  /// triggered when clicking on the cancel button
  ///
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    isShown = false
  }
}


struct ImagePicker: UIViewControllerRepresentable {
  
  @Binding var isShown: Bool
  @Binding var image: Image?
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    
  }
  

  ///
  /// who is coordinating creating the image picker controller
  /// coordinates the events of the ui image pickar controller
  ///
  func makeCoordinator() -> ImagePickerCoordinator {
    return ImagePickerCoordinator(isShown: $isShown, image: $image)
  }

  
  ///
  /// Creates the controller we want to return
  ///
  func makeUIViewController(context: Context) -> some UIImagePickerController {
    
    let picker = UIImagePickerController()
    
    picker.delegate = context.coordinator
    
    return picker
  }
}
