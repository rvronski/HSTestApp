//
//  NetworkModel.swift
//  HSTestApp
//
//  Created by ROMAN VRONSKY on 04.04.2023.
//

import UIKit

struct Pizza: Codable {
    var id: Int
    var nombre: String
    var descripcion: String
    var linkImagen: String?
    var precio: String?
    
}
struct AnswerPizza: Codable {
    var productos: [Pizza]
}

struct PizzaItem {
    var id: Int
    var nombre: String
    var descripcion: String
    var linkImagen: UIImage
    var precio: String
    
}

extension PizzaItem {
    static func testData(model: [Pizza]) -> [PizzaItem] {
        var array = [PizzaItem]()
        for pizza in model {
            let id = pizza.id
            let name = pizza.nombre
            let price = pizza.precio ?? "100"
            let description = pizza.descripcion
            let img = {
                let image = pizza.linkImagen ?? "https://objectstorage.us-ashburn-1.oraclecloud.com/n/idkur78yryic/b/mamacocina/o/pizaa.jpg"
                let url =  URL(string: image)
                let url2 = URL(string: "https://objectstorage.us-ashburn-1.oraclecloud.com/n/idkur78yryic/b/mamacocina/o/pizaa.jpg")
                do {
                    let imageURL = try Data(contentsOf: url ?? url2!)
                    return UIImage(data: imageURL) ?? UIImage(systemName: "takeoutbag.and.cup.and.straw")!
                } catch {
                    print(error)
                }
                return UIImage(named: "pizza")!
            }()
            
            let item = PizzaItem(id: id, nombre: name, descripcion: description, linkImagen: img, precio: price)
            array.append(item)
        }
        return array
    }
}
//{
//  "mensaje": "La accion fue realizada exitosamente",
//  "ok": true,
//  "productos": [
//    {
//      "id": 28,
//      "nombre": "1/4 Muzzarella",
//      "descripcion": "Dos porciones de muzzarella",
//      "linkImagen": "https://objectstorage.us-ashburn-1.oraclecloud.com/n/idkur78yryic/b/mamacocina/o/pizaa.jpg",
//      "precio": "250.00",
//      "tasaIva": "0.21",
//      "vendible": 1,
//      "borrado": null,
//      "stockRequerido": null,
//      "created_at": "2021-06-29T16:25:59.000Z"
//    },
//    {
//      "id": 29,
//      "nombre": "1/4 Napolitana",
//      "descripcion": "Dos porciones de napolitana",
//      "linkImagen": "https://objectstorage.us-ashburn-1.oraclecloud.com/n/idkur78yryic/b/mamacocina/o/pizaa.jpg",
//      "precio": "270.00",
//      "tasaIva": "0.21",
//      "vendible": 1,
//      "borrado": null,
//      "stockRequerido": null,
//      "created_at": "2021-06-29T16:46:40.000Z"
//    },
//    {
//      "id": 30,
//      "nombre": "Empanada de Carne",
//      "descripcion": "Riquisimas y jugosas",
//      "linkImagen": "https://objectstorage.us-ashburn-1.oraclecloud.com/n/idkur78yryic/b/mamacocina/o/Captura de pantalla 2021-03-30 072113.png",
//      "precio": "100.00",
//      "tasaIva": "0.21",
//      "vendible": 1,
//      "borrado": null,
//      "stockRequerido": 1,
//      "created_at": "2021-06-30T14:46:39.000Z"
//    },
//    {
//      "id": 32,
//      "nombre": "Empanada de J y Q",
//      "descripcion": "Abundantes y cremosas",
//      "linkImagen": "https://objectstorage.us-ashburn-1.oraclecloud.com/n/idkur78yryic/b/mamacocina/o/Captura de pantalla 2021-03-30 072113.png",
//      "precio": "78.00",
//      "tasaIva": "0.21",
//      "vendible": 1,
//      "borrado": null,
//      "stockRequerido": 1,
//      "created_at": "2021-07-27T20:20:12.000Z"
//    },
//    {
//      "id": 33,
//      "nombre": "Promocion",
//      "descripcion": "A definir",
//      "linkImagen": "https://objectstorage.us-ashburn-1.oraclecloud.com/n/idkur78yryic/b/mamacocina/o/porcentaje.jpg",
//      "precio": "999.00",
//      "tasaIva": "0.21",
//      "vendible": 1,
//      "borrado": null,
//      "stockRequerido": null,
//      "created_at": "2021-07-27T19:38:49.000Z"
//    },
//    {
//      "id": 34,
//      "nombre": "Empanada de Pollo",
//      "descripcion": "Jugosa y sabrosa",
//      "linkImagen": "https://objectstorage.us-ashburn-1.oraclecloud.com/n/idkur78yryic/b/mamacocina/o/Captura de pantalla 2021-03-30 072113.png",
//      "precio": "123.00",
//      "tasaIva": "0.21",
//      "vendible": 1,
//      "borrado": null,
//      "stockRequerido": 1,
//      "created_at": "2021-07-29T18:14:59.000Z"
//    },
//    {
//      "id": 38,
//      "nombre": "1/4 Margarita",
//      "descripcion": "Dos porciones de margarita",
//      "linkImagen": "https://objectstorage.us-ashburn-1.oraclecloud.com/n/idkur78yryic/b/mamacocina/o/7.png",
//      "precio": "260.00",
//      "tasaIva": "0.21",
//      "vendible": 1,
//      "borrado": null,
//      "stockRequerido": null,
//      "created_at": "2021-08-04T21:21:20.000Z"
//    },
//    {
//      "id": 39,
//      "nombre": "Muzzarella Entera",
//      "descripcion": "La pizza mas rica",
//      "linkImagen": "https://objectstorage.us-ashburn-1.oraclecloud.com/n/idkur78yryic/b/mamacocina/o/pizaa.jpg",
//      "precio": "1234.00",
//      "tasaIva": "0.21",
//      "vendible": 1,
//      "borrado": null,
//      "stockRequerido": null,
//      "created_at": "2021-09-23T20:17:12.000Z"
//    },
//    {
//      "id": 40,
//      "nombre": "Pizza Pruevb",
//      "descripcion": "Una pizza de prueba",
//      "linkImagen": "https://objectstorage.us-ashburn-1.oraclecloud.com/n/idkur78yryic/b/mamacocina/o/pizaa.jpg",
//      "precio": "1235.00",
//      "tasaIva": "0.21",
//      "vendible": 1,
//      "borrado": null,
//      "stockRequerido": null,
//      "created_at": "2021-09-24T13:17:31.000Z"
//    },
//    {
//      "id": 41,
//      "nombre": "Pastelito",
//      "descripcion": "pastelito dulce",
//      "linkImagen": "https://objectstorage.us-ashburn-1.oraclecloud.com/n/idkur78yryic/b/mamacocina/o/pizaa.jpg",
//      "precio": "50.00",
//      "tasaIva": "0.21",
//      "vendible": 1,
//      "borrado": null,
//      "stockRequerido": null,
//      "created_at": "2021-09-24T13:21:03.000Z"
//    },
//    {
//      "id": 42,
//      "nombre": "Pala Mixta - Rucula /Crudo",
//      "descripcion": "Mixata de Crudo y rucula ",
//      "linkImagen": "https://objectstorage.us-ashburn-1.oraclecloud.com/n/idkur78yryic/b/mamacocina/o/Rucula y Jamon Crudo MIXTA.jpg",
//      "precio": null,
//      "tasaIva": "0.21",
//      "vendible": 1,
//      "borrado": null,
//      "stockRequerido": null,
//      "created_at": "2021-11-29T14:09:40.000Z"
//    },
//    {
//      "id": 44,
//      "nombre": "wraps",
//      "descripcion": "wraps de muzarela",
//      "linkImagen": null,
//      "precio": "100.00",
//      "tasaIva": "0.21",
//      "vendible": 1,
//      "borrado": null,
//      "stockRequerido": null,
//      "created_at": "2022-01-14T15:31:17.000Z"
//    },
//    {
//      "id": 45,
//      "nombre": "Wrap de Pollo",
//      "descripcion": "es una prueba",
//      "linkImagen": "https://objectstorage.us-ashburn-1.oraclecloud.com/n/idkur78yryic/b/mamacocina/o/ArmatuPizza.png",
//      "precio": "1234.00",
//      "tasaIva": "0.21",
//      "vendible": 1,
//      "borrado": null,
//      "stockRequerido": null,
//      "created_at": "2022-01-14T18:46:11.000Z"
//    },
//    {
//      "id": 46,
//      "nombre": "rosquilla",
//      "descripcion": "rosquillas de queso plus semillas",
//      "linkImagen": null,
//      "precio": "18.00",
//      "tasaIva": "0.21",
//      "vendible": 1,
//      "borrado": 1,
//      "stockRequerido": null,
//      "created_at": "2022-01-14T20:00:28.000Z"
//    },
//    {
//      "id": 48,
//      "nombre": "Rabas de prueba",
//      "descripcion": "Varias rabas de prueba",
//      "linkImagen": null,
//      "precio": "400.00",
//      "tasaIva": null,
//      "vendible": 0,
//      "borrado": null,
//      "stockRequerido": null,
//      "created_at": "2022-03-09T18:05:15.000Z"
//    },
//    {
//      "id": 49,
//      "nombre": "Producto refact 1",
//      "descripcion": "Desc producto refact 1",
//      "linkImagen": "https://objectstorage.us-ashburn-1.oraclecloud.com/n/idkur78yryic/b/mamacocina/o/840_560.jpg",
//      "precio": "125.00",
//      "tasaIva": "0.21",
//      "vendible": 1,
//      "borrado": null,
//      "stockRequerido": null,
//      "created_at": "2022-03-17T21:40:18.000Z"
//    },
//    {
//      "id": 50,
//      "nombre": "Producto refact 2",
//      "descripcion": "Desc producto refact 1",
//      "linkImagen": "https://objectstorage.us-ashburn-1.oraclecloud.com/n/idkur78yryic/b/mamacocina/o/840_560.jpg",
//      "precio": "125.00",
//      "tasaIva": "0.21",
//      "vendible": 0,
//      "borrado": null,
//      "stockRequerido": null,
//      "created_at": "2022-03-17T22:08:15.000Z"
//    },
//    {
//      "id": 51,
//      "nombre": "Producto refact 2",
//      "descripcion": "Desc producto refact 1",
//      "linkImagen": "https://objectstorage.us-ashburn-1.oraclecloud.com/n/idkur78yryic/b/mamacocina/o/840_560.jpg",
//      "precio": "125.00",
//      "tasaIva": "0.21",
//      "vendible": 0,
//      "borrado": null,
//      "stockRequerido": null,
//      "created_at": "2022-03-17T22:35:55.000Z"
//    },
//    {
//      "id": 52,
//      "nombre": "Producto refact 2",
//      "descripcion": "Desc producto refact 1",
//      "linkImagen": "https://objectstorage.us-ashburn-1.oraclecloud.com/n/idkur78yryic/b/mamacocina/o/840_560.jpg",
//      "precio": "125.00",
//      "tasaIva": "0.21",
//      "vendible": 0,
//      "borrado": null,
//      "stockRequerido": null,
//      "created_at": "2022-03-17T22:38:50.000Z"
//    },
//    {
//      "id": 53,
//      "nombre": "Producto refact 2",
//      "descripcion": "Desc producto refact 1",
//      "linkImagen": "https://objectstorage.us-ashburn-1.oraclecloud.com/n/idkur78yryic/b/mamacocina/o/840_560.jpg",
//      "precio": "125.00",
//      "tasaIva": "0.21",
//      "vendible": 0,
//      "borrado": null,
//      "stockRequerido": null,
//      "created_at": "2022-03-17T22:39:24.000Z"
//    },
//    {
//      "id": 54,
//      "nombre": "Producto refact 2",
//      "descripcion": "Desc producto refact 1",
//      "linkImagen": "https://objectstorage.us-ashburn-1.oraclecloud.com/n/idkur78yryic/b/mamacocina/o/840_560.jpg",
//      "precio": "125.00",
//      "tasaIva": "0.21",
//      "vendible": 0,
//      "borrado": null,
//      "stockRequerido": null,
//      "created_at": "2022-03-17T22:44:31.000Z"
//    }
//  ]
//}
