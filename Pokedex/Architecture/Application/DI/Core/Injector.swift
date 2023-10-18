//
//  Injector.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

protocol Injector: AnyObject {
    func instanceOf<T>(_ type: T.Type) -> T
    func instanceOf<T>(_ type: T.Type, name: String) -> T
    func instanceOf<T, U>(_ type: T.Type, param: U) -> T
}
