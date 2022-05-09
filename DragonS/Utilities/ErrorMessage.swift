//
//  ErrorMessage.swift
//  DragonS
//
//  Created by Aleksandra on 07.05.2022.
//

import Foundation

enum ErrorMessage: String, Error {
case unableToComplite = "Unable to complited your request. Please check your internet connection."
case invalidData = "The data received from server was invalid. Please try again."
case invalidRespomse = ""
}
