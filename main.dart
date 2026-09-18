import 'dart:io';

void main() {
  List<Map<String, dynamic>> stations = [];

  while (true) {
    print("==============================================");
    print("   EV CHARGING STATION MANAGEMENT SYSTEM");
    print("==============================================");
    print("1. Add Charging Station");
    print("2. View All Stations");
    print("3. Update Charging Station");
    print("4. Delete Charging Station");
    print("5. Search Charging Station");
    print("6. Exit");
    print("==============================================");

    stdout.write("Enter your choice: ");
    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      addStation(stations);
    } else if (choice == 2) {
      viewStations(stations);
    } else if (choice == 3) {
      updateStation(stations);
    } else if (choice == 4) {
      deleteStation(stations);
    } else if (choice == 5) {
      searchStation(stations);
    } else if (choice == 6) {
      print("\nThank you for using EV Charging Station Management System!");
      print("Program closed.");
      break;
    } else {
      print("\nInvalid choice! Please enter 1 to 6.");
    }
  }
}

// ================= ADD STATION =================

void addStation(List<Map<String, dynamic>> stations) {
  print("\n========== ADD CHARGING STATION ==========");

  stdout.write("Enter Station ID: ");
  int id = int.parse(stdin.readLineSync()!);

  bool exists = false;

  for (var station in stations) {
    if (station["id"] == id) {
      exists = true;
    }
  }

  if (exists == true) {
    print("Station ID already exists!");
    return;
  }

  stdout.write("Enter Station Name: ");
  String name = stdin.readLineSync()!;

  stdout.write("Enter Location: ");
  String location = stdin.readLineSync()!;

  stdout.write("Enter Total Chargers: ");
  int totalChargers = int.parse(stdin.readLineSync()!);

  stdout.write("Enter Available Chargers: ");
  int availableChargers = int.parse(stdin.readLineSync()!);

  stdout.write("Enter Price per Unit: ");
  double price = double.parse(stdin.readLineSync()!);

  stdout.write("Enter Status (Active/Closed): ");
  String status = stdin.readLineSync()!;

  Map<String, dynamic> newStation = {
    "id": id,
    "name": name,
    "location": location,
    "totalChargers": totalChargers,
    "availableChargers": availableChargers,
    "price": price,
    "status": status,
  };

  stations.add(newStation);

  print("\nStation added successfully!");
}

// ================= VIEW STATIONS =================

void viewStations(List<Map<String, dynamic>> stations) {
  print("\n========== ALL CHARGING STATIONS ==========");

  if (stations.isEmpty) {
    print("No charging stations available.");
    return;
  }

  for (var station in stations) {
    print("--------------------------------------------");
    print("Station ID         : ${station["id"]}");
    print("Station Name       : ${station["name"]}");
    print("Location           : ${station["location"]}");
    print("Total Chargers     : ${station["totalChargers"]}");
    print("Available Chargers : ${station["availableChargers"]}");
    print("Price per Unit     : Rs. ${station["price"]}");
    print("Status             : ${station["status"]}");
  }

  print("--------------------------------------------");
}

// ================= UPDATE STATION =================

void updateStation(List<Map<String, dynamic>> stations) {
  print("\n========== UPDATE CHARGING STATION ==========");

  if (stations.isEmpty) {
    print("No charging stations available.");
    return;
  }

  stdout.write("Enter Station ID to update: ");
  int id = int.parse(stdin.readLineSync()!);

  for (var station in stations) {
    if (station["id"] == id) {
      print("\nStation found!");

      stdout.write("Enter New Station Name: ");
      station["name"] = stdin.readLineSync()!;

      stdout.write("Enter New Location: ");
      station["location"] = stdin.readLineSync()!;

      stdout.write("Enter New Total Chargers: ");
      station["totalChargers"] = int.parse(stdin.readLineSync()!);

      stdout.write("Enter New Available Chargers: ");
      station["availableChargers"] = int.parse(stdin.readLineSync()!);

      stdout.write("Enter New Price per Unit: ");
      station["price"] = double.parse(stdin.readLineSync()!);

      stdout.write("Enter New Status: ");
      station["status"] = stdin.readLineSync()!;

      print("\nStation updated successfully!");
      return;
    }
  }

  print("Station with ID $id not found.");
}

// ================= DELETE STATION =================

void deleteStation(List<Map<String, dynamic>> stations) {
  print("\n========== DELETE CHARGING STATION ==========");

  if (stations.isEmpty) {
    print("No charging stations available.");
    return;
  }

  stdout.write("Enter Station ID to delete: ");
  int id = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < stations.length; i++) {
    if (stations[i]["id"] == id) {
      stdout.write("Are you sure? (yes/no): ");
      String answer = stdin.readLineSync()!;

      if (answer.toLowerCase() == "yes") {
        stations.removeAt(i);
        print("Station deleted successfully!");
      } else {
        print("Delete operation cancelled.");
      }

      return;
    }
  }

  print("Station with ID $id not found.");
}

// ================= SEARCH STATION =================

void searchStation(List<Map<String, dynamic>> stations) {
  print("\n========== SEARCH CHARGING STATION ==========");

  if (stations.isEmpty) {
    print("No charging stations available.");
    return;
  }

  stdout.write("Enter Station ID to search: ");
  int id = int.parse(stdin.readLineSync()!);

  for (var station in stations) {
    if (station["id"] == id) {
      print("\n========== STATION FOUND ==========");
      print("Station ID         : ${station["id"]}");
      print("Station Name       : ${station["name"]}");
      print("Location           : ${station["location"]}");
      print("Total Chargers     : ${station["totalChargers"]}");
      print("Available Chargers : ${station["availableChargers"]}");
      print("Price per Unit     : Rs. ${station["price"]}");
      print("Status             : ${station["status"]}");
      print("===================================");

      return;
    }
  }

  print("Station with ID $id not found.");

  //hello world
}
