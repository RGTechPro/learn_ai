import 'package:learn_ai/model/student.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  var db;
  var userCollection;
  connect() async {
    db = await Db.create(
        "mongodb+srv://harsh:harsh@cluster0.nbvhw7f.mongodb.net/?retryWrites=true&w=majority");
    await db.open();
    print(db);
    userCollection = db.collection('students');
  }

  Future<List<Map<String, Object?>>> fetchStudents() async {
    await connect();
    return await userCollection.find().toList();
  }

  update(double g1, double g2, double g3,ObjectId id) async {
     await connect();
    var u = await userCollection.findOne({"_id": id});
    u["G1"] = g1;
    u["G2"] = g2;
    u["G3"] = g3;
    await userCollection.save(u);
  }
}
