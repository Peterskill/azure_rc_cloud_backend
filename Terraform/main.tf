resource "azurerm_cosmosdb_account" "cosmo_account" {
  name = "viscount0db"
  location = var.region
  resource_group_name = var.resource_group_name
  offer_type = "Standard"
  kind = "GlobalDocumentDB"
  enable_automatic_failover = true
  consistency_policy {
    consistency_level = "Session"
  }
  geo_location {
    location = var.region
    failover_priority = 1
  }
  capabilities {
    name = "EnableServerless"
  }
}

resource "azurerm_cosmosdb_sql_database" "visdb" {
  name = "azurevis0counterdb"
  resource_group_name = azurerm_cosmosdb_account.cosmo_account.resource_group_name
  account_name = azurerm_cosmosdb_account.cosmo_account.name
}

resource "azurerm_cosmosdb_sql_container" "cosmos0Container" {
  name = "viscount"
  resource_group_name = azurerm_cosmosdb_account.cosmo_account.resource_group_name
  account_name = azurerm_cosmosdb_account.cosmo_account.name
  database_name = azurerm_cosmosdb_sql_database.visdb.name
  partition_key_path = "/id"

}
