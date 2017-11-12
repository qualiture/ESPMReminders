// # Proxy Compiler 17.9.2-2b890a-20171018

import Foundation
import SAPOData

open class MyPrefixPurchaseOrderHeader: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var currencyCode: Property = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "CurrencyCode")

    public static var grossAmount: Property = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "GrossAmount")

    public static var netAmount: Property = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "NetAmount")

    public static var purchaseOrderID: Property = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "PurchaseOrderId")

    public static var supplierID: Property = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "SupplierId")

    public static var taxAmount: Property = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "TaxAmount")

    public static var items: Property = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "Items")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader)
    }

    open class func array(from: EntityValueList) -> Array<MyPrefixPurchaseOrderHeader> {
        return ArrayConverter.convert(from.toArray(), Array<MyPrefixPurchaseOrderHeader>())
    }

    open func copy() -> MyPrefixPurchaseOrderHeader {
        return CastRequired<MyPrefixPurchaseOrderHeader>.from(self.copyEntity())
    }

    open var currencyCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixPurchaseOrderHeader.currencyCode))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixPurchaseOrderHeader.currencyCode, to: StringValue.of(optional: value))
        }
    }

    open var grossAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: MyPrefixPurchaseOrderHeader.grossAmount))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixPurchaseOrderHeader.grossAmount, to: DecimalValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open var items: Array<MyPrefixPurchaseOrderItem> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: MyPrefixPurchaseOrderHeader.items)).toArray(), Array<MyPrefixPurchaseOrderItem>())
        }
        set(value) {
            MyPrefixPurchaseOrderHeader.items.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open class func key(purchaseOrderID: String?) -> EntityKey {
        return EntityKey().with(name: "PurchaseOrderId", value: StringValue.of(optional: purchaseOrderID))
    }

    open var netAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: MyPrefixPurchaseOrderHeader.netAmount))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixPurchaseOrderHeader.netAmount, to: DecimalValue.of(optional: value))
        }
    }

    open var old: MyPrefixPurchaseOrderHeader {
        return CastRequired<MyPrefixPurchaseOrderHeader>.from(self.oldEntity)
    }

    open var purchaseOrderID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixPurchaseOrderHeader.purchaseOrderID))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixPurchaseOrderHeader.purchaseOrderID, to: StringValue.of(optional: value))
        }
    }

    open var supplierID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixPurchaseOrderHeader.supplierID))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixPurchaseOrderHeader.supplierID, to: StringValue.of(optional: value))
        }
    }

    open var taxAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: MyPrefixPurchaseOrderHeader.taxAmount))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixPurchaseOrderHeader.taxAmount, to: DecimalValue.of(optional: value))
        }
    }
}
