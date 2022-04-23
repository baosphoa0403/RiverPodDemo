import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Extending ConsumerWidget instead of StatelessWidget
// dùng consumer thay vì stateless 2 thằng y chang nhau nhưng có sự khác biệt là
// consumer có thêm object ref khi build
final numberProvider = StateProvider.autoDispose<int>((ref) {
  return 30;
});

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StateProviderPage"),
      ),
      body: Center(
        child: Text("Provider - " + ref.watch(numberProvider).toString()),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          StateController<int> counter = ref.watch(numberProvider.notifier);
          counter.state++;
        },
      ),
    );
  }
}
// có 3 ý chính ref là 
// + chứa giá trị của 1 provider và sẽ listen khi nó thay đổi , khi nó thay đổi nó sẽ 
// rebuild widget hoặc provider đã đăng ký xài giá trị đó 
// +thêm sự kiện nghe cho provider và thực thi hành động như là chuyển trang or show modal khi provider thay đổi 
// using ref.listen()
//+ chứa giá trị provider khi ignore change . hữu ích khi chúng ta cần giá trị provider cho các sự kiện click 
// dùng ref.read()
