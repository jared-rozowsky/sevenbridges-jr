# TODO: when it got stable, define billing object
# PrivilegesEnum <- setSingleEnum("Privileges", c(""))

# Billing
# to make it simple to update, return a list, not an object,
# because no action defined an this object
Billing <- setRefClass(
  "Billing",
  contains = "Item",

  fields = list(
    id = "characterORNULL",
    owner = "characterORNULL",
    name = "characterORNULL",
    type = "characterORNULL",
    pending = "logicalORNULL",
    disabled = "logicalORNULL",
    balance = "listORNULL",
    currency = "characterORNULL",
    amount = "numericORNULL"
  ), # 1.1

  methods = list(
    initialize = function(id = NULL, owner = NULL, name = NULL,
                          type = NULL, pending = NULL,
                          disabled = NULL, balance = list(), currency = NULL, amount = NULL, ...) {
      id <<- id
      name <<- name
      owner <<- owner
      type <<- type
      pending <<- pending
      disabled <<- disabled
      balance <<- balance
      currency <<- currency
      amount <<- amount


      callSuper(...)
    },

    show = function() {
      .showFields(
        .self, "== Billing ==",
        values = c(
          "id", "href", "name",
          "owner", "type",
          "disabled", "balance"
        )
      )
    }
  )
)

.asBilling <- function(x) {
  Billing(
    id = x$id,
    href = x$href,
    name = x$name,
    owner = x$owner,
    type = x$type,
    pending = x$pending,
    disabled = x$disabled,
    balance = x$balance,
    currency = x$balance$currency,
    amount = x$balance$amount,
    response = response(x)
  )
}

BillingList <- setListClass("Billing", contains = "Item0")

.asBillingList <- function(x) {
  obj <- BillingList(lapply(x$items, .asBilling))
  obj@href <- x$href
  obj@response <- response(x)
  obj
}
