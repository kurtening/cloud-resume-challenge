import azure.functions as func
import logging
from azure.cosmosdb.table import TableService, models
import os

# Constants
CONNECTION_STRING = os.environ.get("cosmosdb_account_connection_string")
TABLE_NAME = "crc_visitor_table"

# Initialize the function app
app = func.FunctionApp(http_auth_level=func.AuthLevel.ANONYMOUS)


def increment_visitor_count(table_service, partition_key, row_key):
    try:
        entity = table_service.get_entity(TABLE_NAME, partition_key, row_key)
        current_value = int(entity.get("Value", 0))
    except models.AzureHttpError:
        # If the entity does not exist, create a new one
        current_value = 0
        entity = {
                    "PartitionKey": partition_key,
                    "RowKey": row_key,
                    "Value": "1"
                  }
        table_service.insert_entity(TABLE_NAME, entity)
    else:
        # Increment the value and update the entity
        new_value = current_value + 1
        entity["Value"] = str(new_value)
        table_service.update_entity(TABLE_NAME, entity)

    return entity["Value"]

