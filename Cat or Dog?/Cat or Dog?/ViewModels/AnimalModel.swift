//
//  AnimalModel.swift
//  Cat or Dog?
//
//  Created by Sabit Ahmed on 8/11/21.
//

import Foundation

class AnimalModel: ObservableObject {
    
    @Published var animal = Animal()
    
    func getAnimal() {
        
        let stringUrl = Bool.random() ? catUrl : dogUrl
        
        // Create a url object
        let url = URL(string: stringUrl)
        
        // Check if the url is nil or not
        guard url != nil else {
            print("Couldn't create URL object")
            return
        }
        
        // Get a url session
        let session = URLSession.shared
        
        // Create data task
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            // Check if there is no error and data is returned
            if error == nil && data != nil {
                
                // Attempt to parse JSON
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: Any]] {
                        
                        let item = json.isEmpty ? [:] : json[0]
                        
                        if let animal = Animal(json: item) {
                            
                            DispatchQueue.main.async {
                                
                                while animal.results.isEmpty {}
                                self.animal = animal
                                
                            }
                        }
                    }
                }
                catch {
                    print("Couldn't parse JSON")
                }
            }
        }
        
        // Start the data task
        dataTask.resume()
        
    }
}
