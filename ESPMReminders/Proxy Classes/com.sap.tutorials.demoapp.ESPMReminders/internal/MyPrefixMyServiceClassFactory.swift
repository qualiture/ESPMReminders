// # Proxy Compiler 17.9.2-2b890a-20171018

import Foundation
import SAPOData

internal class MyPrefixMyServiceClassFactory {
    static func registerAll() throws {
        MyPrefixMyServiceClassMetadata.EntityTypes.customer.registerFactory(ObjectFactory.with(create: { MyPrefixCustomer(withDefaults: false) }, createWithDecoder: { d in try MyPrefixCustomer(from: d) }))
        MyPrefixMyServiceClassMetadata.EntityTypes.product.registerFactory(ObjectFactory.with(create: { MyPrefixProduct(withDefaults: false) }, createWithDecoder: { d in try MyPrefixProduct(from: d) }))
        MyPrefixMyServiceClassMetadata.EntityTypes.productCategory.registerFactory(ObjectFactory.with(create: { MyPrefixProductCategory(withDefaults: false) }, createWithDecoder: { d in try MyPrefixProductCategory(from: d) }))
        MyPrefixMyServiceClassMetadata.EntityTypes.productText.registerFactory(ObjectFactory.with(create: { MyPrefixProductText(withDefaults: false) }, createWithDecoder: { d in try MyPrefixProductText(from: d) }))
        MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.registerFactory(ObjectFactory.with(create: { MyPrefixPurchaseOrderHeader(withDefaults: false) }, createWithDecoder: { d in try MyPrefixPurchaseOrderHeader(from: d) }))
        MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderItem.registerFactory(ObjectFactory.with(create: { MyPrefixPurchaseOrderItem(withDefaults: false) }, createWithDecoder: { d in try MyPrefixPurchaseOrderItem(from: d) }))
        MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderHeader.registerFactory(ObjectFactory.with(create: { MyPrefixSalesOrderHeader(withDefaults: false) }, createWithDecoder: { d in try MyPrefixSalesOrderHeader(from: d) }))
        MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.registerFactory(ObjectFactory.with(create: { MyPrefixSalesOrderItem(withDefaults: false) }, createWithDecoder: { d in try MyPrefixSalesOrderItem(from: d) }))
        MyPrefixMyServiceClassMetadata.EntityTypes.stock.registerFactory(ObjectFactory.with(create: { MyPrefixStock(withDefaults: false) }, createWithDecoder: { d in try MyPrefixStock(from: d) }))
        MyPrefixMyServiceClassMetadata.EntityTypes.supplier.registerFactory(ObjectFactory.with(create: { MyPrefixSupplier(withDefaults: false) }, createWithDecoder: { d in try MyPrefixSupplier(from: d) }))
    }
}
