//
//  NetworkHelper.swift
//  Terreza
//
//  Created by Saud Syed on 01/10/2024.
//

import Foundation

enum NetworkError: Error {
    case requestFailed(Error)
    case invalidResponse
    case decodeFailed(Error)
}

struct APIResponse<T> {
    let value: T
    let response: HTTPURLResponse
}
