//
//  ResponseType.swift
//  MelbourneTest
//
//  Created by Roman Romanenko on 9/30/18.
//  Copyright © 2018 Roman. All rights reserved.
//

import Foundation

enum Response<Type> {
    case success(Data)
    case failure(Error)
}

typealias ResponseData = (Response<Data>) -> Swift.Void
