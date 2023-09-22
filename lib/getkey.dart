import 'package:http/http.dart' as http;

//Om APIn inte lyckas kommunicera kan du hämta en nyckel här
//starta bara programmet från här, och kolla vad som kommer up i debug console

Future<String> getApiKey() async {
  final response = await http.get(Uri.parse('https://todoapp-api.apps.k8s.gu.se/register'));

 if (response.statusCode == 200) {
    final apiKey = response.body;
   return apiKey;
     } else {
    throw Exception('Api nycekl misslyckades');
  }
}

void main() async {
  try {
    final apiKey = await getApiKey();
    print('API nyckel: $apiKey');
  } catch (e) {
    print('Error: $e');
  }
}