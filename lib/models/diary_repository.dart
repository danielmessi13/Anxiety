import 'package:flutter_anxiety/models/diary.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx/mobx.dart';

class DiaryRepository {
  final HasuraConnect _connection;

  DiaryRepository(this._connection);

  Future<void> addDiary(String title, String description) async {
    String docQuery = """
      mutation CreateDiary(\$title: String!, \$description: String!) {
        insert_diary(objects: {title: \$title, description: \$description}) {
          returning {
            id
          }
        }
      }
    """;
    await _connection.mutation(docQuery, variables: {
      'title': title,
      'description': description,
    });
  }

  Future<void> deleteDiary(String uid) async {
    String docQuery = """
      mutation DeleteDiary(\$id: uuid!) {
        delete_diary(where: {id: {_eq: \$id}}) {
          returning {
            id
          }
        }
      }
    """;
    await _connection.mutation(docQuery, variables: {
      'id': uid,
    });
  }

  Stream<List<Diary>> listenDiaries() async* {
    String docQuery = """
      query {
        diary(order_by: {date: desc}) {
          id
          date
          description
          title
        }
      }
    """;
    var snapshot = _connection.subscription(docQuery);
    var data;
    await for (data in snapshot) {
      List diaries = data['data']['diary'];
      yield ObservableList.of(
        diaries?.map((value) => Diary.fromHasura(value)) ?? [],
      );
    }
  }
}
