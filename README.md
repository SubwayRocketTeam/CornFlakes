CornFlakes
==========

packet serializer/unserializer for ruby



sample
----
__packet_defination__

C에서의 패킷
```C++
struct DummyPacket{
  int size, id;
  int dummy1;
  char dummy2[32+1]; // +1 for 'null'
  char dummy3[8+1]; // +1 for 'null'
};
```

CornFlakes를 이용해 위의 패킷을 구현.<br>
size, id필드는 자동으로 기입됨.
```ruby
class DummyPacket < Packet
  id PACKET_ID_DUMMY
  int :dummy1
  string :dummy2, 32 #string length
  string :dummy3, 8
end
```


__serialize__
```ruby
pkt = DummyPacket.new
pkt.dummy1 = 1234
pkt.dummy2 = "hello world"
pkt.dummy3 = "serial"

send pkt.serialize
```


__unserialize__
```ruby
def on_recv data
  pkt = DummyPacket.deserialize data
  
  puts pkt.dummy1
  puts pkt.dummy2
  puts pkt.dummy3
end
```
