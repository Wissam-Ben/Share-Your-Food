//
//  TestImageViewController.swift
//  ShareYourFood
//
//  Created by Halifa Halisia on 21/07/2022.
//

import UIKit

class TestImageViewController: UIViewController {
    
    var plateService: PlateService {
            return PlateWebService()
    }
    
    var plates: [PlateResponse] = []
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        print("hello")
        super.viewDidLoad()
        
        self.plateService.fetchPlates { plates in
           
            self.plates = plates
            let photoData = plates[0].photo.data
                    
                    //var newImage: UIImage? = self.convierteImagen(cadenaImagen: photoData.description)
            self.imageView.image = self.convierteImagen(cadenaImagen: photoData.description)

        }
        
        
        // Do any additional setup after loading the view.
    }
    
    func convierteImagen(cadenaImagen: String) -> UIImage? {
        print(cadenaImagen)
        var numbersString = ""
        for char in cadenaImagen {
            if char != "[" && char != "]" {
                numbersString.append(char)
            }
        }
        let strings = numbersString.components(separatedBy: ",")
        var bytes = [UInt8]()
        for i in 0...strings.count - 1 {
            if let signedByte = Int8(strings[i]) {
                bytes.append(UInt8(bitPattern: signedByte))
            } else {
                
            }
        }
        let datos: NSData = NSData(bytes: bytes, length: bytes.count)
        print(datos.bytes)
        return UIImage(data: datos as Data) // Note it's optional. Don't force unwrap!!!
    }
    


}
