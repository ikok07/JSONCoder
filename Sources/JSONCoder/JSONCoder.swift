// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public struct JSONCoder {
    
    public static func decode<T: Codable>(_ data: Data) -> T? {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Error decoding data: \(error)")
            return nil
        }
    }
    
    public static func encode<T: Encodable>(_ data: T) -> Data? {
        do {
            return try JSONEncoder().encode(data)
        } catch {
            print("Error encoding data: \(error)")
            return nil
        }
    }
    
    public static func serialize(_ data: Data) -> [String: Any]? {
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                var dic: [String: Any] = [:]
                for (key, value) in json {
                    print("\(key): \(value)")
                    dic[key] = value
                }
                return dic
            } else {
                print("Failed to serialize JSON data!")
            }
        } catch {
            print("Failed to serialize JSON data!: \(error)")
        }
        return nil
    }
    
}
