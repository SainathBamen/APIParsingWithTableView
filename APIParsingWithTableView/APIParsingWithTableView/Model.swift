//
//  Model.swift
//  APIParsingWithTableView
//
//  Created by sainath bamen on 05/02/23.
//

import Foundation


struct ToDo:Decodable{
    let userId:Int
    let id:Int
    let title:String
    let completed:Bool
    
}
