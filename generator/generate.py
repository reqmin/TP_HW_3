import csv
import random
import os
import sys

NUM_ROWS = 50


COLUMNS = ["Товар", "Цена за единицу товара", "Количество", "Адрес магазина"]

def generate_row():

    return {
        "Товар": random.choice(["Мыло хозяйственное", "Шампунь", "Пена для бриться", "Зубная паста"]), #тут поменял для красоты, на суть не влияет
        "Цена за единицу товара": round(random.uniform(49.9, 299.9), 2),
        "Количество": random.randint(0, 100),
        "Адрес магазина": random.choice(["Пушкина, 12", "Маяковского, 7", "Космонавтов, 10"]),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)

