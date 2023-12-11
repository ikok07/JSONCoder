// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

struct JSONCoder {
    
    static func decode<T: Codable>(_ data: Data) -> T? {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Error decoding data: \(error)")
            return nil
        }
    }
    
    static func encode(_ data: Data) -> Data? {
        do {
            return try JSONEncoder().encode(data)
        } catch {
            print("Error encoding data: \(error)")
            return nil
        }
    }
    
    
}
