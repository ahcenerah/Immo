//
//  PropertyDetailUIView.swift
//  ImmoAgency
//
//  Created by rahab ahcene on 18/11/2023.
//

import SwiftUI

struct PropertyDetailView: View {
    @Binding var property: Property
    @State private var isImagePickerPresented = false
    @State private var selectedImage: UIImage?
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Section(header: Text("Type:").font(.headline)){
                
                Picker("Type", selection: $property.type) {
                    Text("House").tag(PropertyType.house)
                    Text("Appartment").tag(PropertyType.appartment)
                }
            }
            
     
            Section(header: Text("Rooms:").font(.headline)){
                TextField("Rooms",
                          value: $property.rooms,
                          format: .number)
                    .keyboardType(.decimalPad)
            }
            
            Section(header: Text("Price:").font(.headline)) {
                TextField("Price",
                          value: $property.price,
                          format: .number)
                    .keyboardType(.decimalPad)
            }
            
            
            Image(property.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(20).onTapGesture {
                    isImagePickerPresented.toggle()
                }
                .sheet(isPresented: $isImagePickerPresented) {
                    ImagePicker(image: $selectedImage)
                        .onDisappear {
                            if let selectedImage = selectedImage {
                                if let newImagePath = saveImageToDocumentsDirectory(image: selectedImage) {
                                    property.image = newImagePath
                                    }
                                }
                            }
                        }
                }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
        .navigationTitle("Property  \(property.id)")
    }
}
struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
      
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        
    //    picker.mediaTypes = ["public.image"]
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
                parent.image = uiImage
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}



    func saveImageToDocumentsDirectory(image: UIImage) -> String? {
        guard let data = image.jpegData(compressionQuality: 0.8) else {
            return nil
        }

        let filename = getDocumentsDirectory().appendingPathComponent(UUID().uuidString + ".jpg")

        do {
            try data.write(to: filename)
            return filename.path // Utilisez .path au lieu de .absoluteString
        } catch {
            print("Error saving image: \(error.localizedDescription)")
            return nil
        }
    }


    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }


struct PropertyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Créez une instance de Property pour la prévisualisation
        let previewProperty = Property(id: 1, type: .house, rooms: 3, image: "maison1", price: 250000)

        // Utilisez cette instance pour initialiser PropertyDetailView
        PropertyDetailView(property: .constant (previewProperty))
    }
}

