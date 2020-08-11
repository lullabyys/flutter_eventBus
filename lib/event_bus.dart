import 'package:event_bus/event_bus.dart';

//创建了event_bus
EventBus eventBus = EventBus();

//修改数字
class NumberEvent{
  int count;
  NumberEvent(this.count);
}

