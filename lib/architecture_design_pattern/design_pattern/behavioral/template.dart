// The Template Method Pattern
// The Template Method Pattern defines the skeleton of an algorithm in a superclass base class
// but lets subclasses override specific, variable steps of that algorithm without changing its overarching structural sequence.
// The Analogy: Cooking a Box of Macaroni & Cheese
// Think of a boxed dinner recipe template. The instructions on the back of the box always state the exact same sequence structure:
// 1.	Boil water.
// 2.	Cook noodles.
// 3.	Add flavor packet.
// 4.	Serve.
// Steps 1, 2, and 4 are completely identical for every box.
// However, depending on whether you bought Original Cheddar or White Cheddar Bacon, Step 3 changes its execution dynamically.
// The skeleton sequence is locked, but flavor customization is allowed.

// 1. The Abstract Template Class
abstract class DataParser {
  // This is the Template Method defining the execution sequence
  void processData() {
    openFile();
    extractData();
    parseData(); // Subclass customization hook
    closeFile();
  }

  void openFile() => print("📁 Opening file stream...");

  void extractData() => print("📑 Extracting raw characters...");

  void closeFile() => print("🔒 Closing file safely.\n");

  // Subclasses must implement this specific variant step
  void parseData();
}

// 2. Concrete Variant A
class JsonDataParser extends DataParser {
  @override
  void parseData() => print("🧠 Parsing raw strings into JSON Maps.");
}

// 3. Concrete Variant B
class CsvDataParser extends DataParser {
  @override
  void parseData() => print("📊 Splitting commas into a List matrix.");
}

void main() {
  print("--- Processing Config File ---");
  DataParser jsonParser = JsonDataParser();
  jsonParser.processData();

  print("--- Processing Reports File ---");
  DataParser csvParser = CsvDataParser();
  csvParser.processData();
}
