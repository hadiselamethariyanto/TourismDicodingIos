//
//  TourismModel.swift
//  TourismDicoding
//
//  Created by MuhammadHariyanto on 08/06/22.
//

struct TourismModel:Decodable{
    let error:Bool
    let message:String
    let count:Int
    let places: [Tourism]
}


struct Tourism:Decodable{
    let id:Int
    let name:String
    let description:String
    let address:String
    let like:Int
    let image:String
    let longitude:Double
    let latitude:Double
}

let dummyTourismData = [
    Tourism(
        id: 1, name: "TN Kalimutu", description: "Taman Nasional Kelimutu terletak di Flores, Indonesia. Taman nasional ini terdiri dari bukit-bukit dan gunung-gunung dengan Gunung Kelibara (1.731 m) sebagai puncak tertinggi. Gunung Kelimutu, terdapat danau Danau tiga warna yang juga merupakan tempat dari Taman Nasional Kelimutu.\n\nDi dalam Taman Nasional Kelimutu, terdapat arboretum, hutan kecil seluas 4,5 hektare yang mewakili koleksi keanekaragaman flora di daerah tersebut. Di sana terdapat 78 jenis pohon yang dikelompokkan ke dalam 36 suku. Beberapa koleksi flora yang merupakan endemik Kelimutu adalah uta onga (Begonia kelimutuensis), turuwara (Rhododendron renschianum), dan arngoni (Vaccinium varingiaefolium).", address: "Detusoko, Kabupaten Ende, NTT", like: 57, image: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Kelimutu_2008-08-08.jpg/800px-Kelimutu_2008-08-08.jpg", longitude: 121.791432, latitude: -8.7415482
    )
]
