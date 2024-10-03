//
//  NetworkManager.swift
//  Terreza
//
//  Created by Saud Syed on 01/10/2024.
//

import Foundation
import UIKit
import Alamofire

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let session: Session
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {
        session = Session.default
    }
        
    //MARK: - request()
    func request<T: Decodable>(endpoint: Endpoints, method: HTTPMethod, parameters: Parameters? = nil, completion: @escaping (Result<APIResponse<T>, NetworkError>) -> Void) {
        let url = "\(Constants.baseURL)\(endpoint.stringValue)"
        print("*** REQUESTED URL: \(url) ***")
        
        session.request(url, method: method, parameters: parameters)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    guard let data = response.data else {
                        completion(.failure(.invalidResponse))
                        return
                    }
                    do {
                        let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                        let apiResponse = APIResponse(value: decodedResponse, response: response.response!)
                        completion(.success(apiResponse))
                        print("*** API RESPONSE: \(apiResponse) ***")
                    } catch {
                        completion(.failure(.decodeFailed(error)))
                    }
                case .failure(let error):
                    completion(.failure(.requestFailed(error)))
                }
        }
    }
    
    //MARK: - Downloading Image from URL and cache
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void ) {
        
        let cacheKey = NSString(string: urlString)
        
        // checking if image is already in cache
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        // safely unwrapping url
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            // checking if data or image is accurate or not
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
