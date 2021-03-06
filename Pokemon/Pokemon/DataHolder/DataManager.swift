//
//  Pokemon
//
//  Created by SonVu on 11/20/16.
//  Copyright © 2016 SonVu. All rights reserved.
//

import Foundation

let kDatabaseName = "pokemon"
let kDatabaseExtension = "db"

class DataManager {
    static let defaultManager = DataManager()
    
    //Get DB Folder Path
    func getDatabaseFolderPath() -> String {
        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        return documentPath + "/" + kDatabaseName + "." + kDatabaseExtension
    }
    
    // Copy database
    func copyDatabaseIfNeed() {
        // 1. Get bundle path
        let bundlePath = Bundle.main.path(forResource: kDatabaseName, ofType: kDatabaseExtension)
        // 2. Get document path
        let documentPath = self.getDatabaseFolderPath()
        print("Document Path: \(documentPath)")
        // 3. Check if file not exist
        if !FileManager.default.fileExists(atPath: documentPath)  {
            // 4. Copy from bundlePath to documentPath
            do {
                //print("Bundle Path: \(bundlePath!)")
                //print(documentPath)
                try FileManager.default.copyItem(atPath: bundlePath!, toPath: documentPath)
            } catch  {
                print(error)
            }
        }
    }
    
    //Select All Pokemon
    func selectAllExcept(id : Int) -> [Pokemon]  {
        var arr : [Pokemon] = []
        // 1. Open database
        let database = FMDatabase(path: self.getDatabaseFolderPath())
        database?.open()
        // 2.Create query
        let selectQuery = "select id, name, gen, img from pokemon except select id, name, gen, img from pokemon where id = '\(id)'"
        // 3.Excute query
        do {
            let result = try database?.executeQuery(selectQuery, values: nil)
            while (result?.next())! {
                let id = UInt32((result?.int(forColumn: "id"))!)
                let name = result?.string(forColumn: "name")
                let gen = UInt32((result?.int(forColumn: "gen"))!)
                let img = result?.string(forColumn: "img")
                let p : Pokemon = Pokemon.init(id: Int(id), name: name!, gen: Int(gen), img: img!)
                arr.append(p)
            }
            print("Select Successfully")
            
        } catch  {
            print("Select Failed: ",error)
        }
        // 4.Close database
        database?.close()
        return arr
    }
    
    //Select Random Pokemon
    func selectRandomPokemon(randomNumber : Int) -> [Pokemon]{
        var arr : [Pokemon] = []
        // 1. Open database
        let database = FMDatabase(path: self.getDatabaseFolderPath())
        database?.open()
        // 2.Create query
        let selectQuery = "select id, name, gen, img from pokemon where id = '\(randomNumber)'"
        // 3.Excute query
        do {
            let result = try database?.executeQuery(selectQuery, values: nil)
            while (result?.next())! {
                let id = UInt32((result?.int(forColumn: "id"))!)
                let name = result?.string(forColumn: "name")
                let gen = UInt32((result?.int(forColumn: "gen"))!)
                let img = result?.string(forColumn: "img")
                let p : Pokemon = Pokemon.init(id: Int(id), name: name!, gen: Int(gen), img: img!)
                arr.append(p)
            }
            print("Select Successfully")
            
        } catch  {
            print("Select Failed: ",error)
        }
        // 4.Close database
        database?.close()
        return arr
    }
    
    //INSERT HIGHT SCORE
    func insertHighScore(score : Int) {
        // 1. Open database
        let database = FMDatabase(path: self.getDatabaseFolderPath())
        database?.open()
        // 2.Create query
        let insert = "insert into Score values (\(score))"
        // 3.Excute query
        let bool : Bool = (database?.executeStatements(insert))!
        if bool == true {
            print("Insert Success")
        } else {
            print("Insert False")
        }
        // 4.Close database
        database?.close()
    }
    
    //INSERT SCORE
    func insertScore(score : Int) {
        // 1. Open database
        let database = FMDatabase(path: self.getDatabaseFolderPath())
        database?.open()
        // 2.Create query
        let insert = "insert into Score values (\(score))"
        // 3.Excute query
        let bool : Bool = (database?.executeStatements(insert))!
        if bool == true {
            print("Insert Success")
        } else {
            print("Insert False")
        }
        // 4.Close database
        database?.close()
    }

    
    //GET HIGHScore
    func getHightScore() -> [Int] {
        var arr : [Int] = []
        // 1. Open database
        let database = FMDatabase(path: self.getDatabaseFolderPath())
        database?.open()
        // 2.Create query
        let selectQuery = "select * from Score"
        // 3.Excute query
        do {
            let result = try database?.executeQuery(selectQuery, values: nil)
            while (result?.next())! {
                let score = result?.int(forColumn: "score")
                arr.append(Int(score!))
            }
            print("Select Successfully")
            
        } catch  {
            print("Select Failed: ",error)
        }
        // 4.Close database
        database?.close()
        return arr
    }
    
    //GET Score
    func getScore() -> [Int] {
        var arr : [Int] = []
        // 1. Open database
        let database = FMDatabase(path: self.getDatabaseFolderPath())
        database?.open()
        // 2.Create query
        let selectQuery = "select * from LastScore"
        // 3.Excute query
        do {
            let result = try database?.executeQuery(selectQuery, values: nil)
            while (result?.next())! {
                let score = result?.int(forColumn: "score")
                arr.append(Int(score!))
            }
            print("Select Successfully")
            
        } catch  {
            print("Select Failed: ",error)
        }
        // 4.Close database
        database?.close()
        return arr
    
    
}
}
