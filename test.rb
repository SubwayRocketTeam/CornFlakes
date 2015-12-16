require_relative "packet"
require "test/unit"
 
class PacketTest < Test::Unit::TestCase
  TestPacketId = 1

  class TestPacket < Packet
    id TestPacketId
    int :n
    string :str, 16
    float :flt
  end

  def test_packet_id
    p = TestPacket.new

    assert_equal p.id, TestPacketId
  end
  def test_pack_and_unpack
    p = TestPacket.new
    p.n = 1234
    p.str = "hello"
    p.flt = 1.5

    deserialized = TestPacket.deserialize(p.serialize)

    assert_equal p.n, deserialized.n
    assert_equal p.str, deserialized.str
    assert_equal p.flt, deserialized.flt
  end
end