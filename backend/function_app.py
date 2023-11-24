import azure.functions as func
import logging
from azure.cosmosdb.table import TableService, models
import os

# Constants
CONNECTION_STRING = os.environ.get("cosmosdb_account_connection_string")
TABLE_NAME = "crc_visitor_table"

