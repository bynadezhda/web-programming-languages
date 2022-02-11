require './func'
require 'minitest/autorun'

class TestFunction < Minitest::Test
  def test_static
    string_1 = "медвежонок лисенок"
    string_2 = "гусенок бельчонок галчонок"
    string_3 = "тигренок"
    res = [string_1, string_2, string_3]
    exp_res = ["медвежата лисята", "гусята бельчата галчата", "тигрята"]

    assert_equal(func(res), exp_res, 'Static test. Not equal.')
  end

  def test_rand
    words = %w[медвежонок лисенок гусенок
                бельчонок галчонок тигренок
                ребенок мышонок львенок]
    sorted_res = %w[бельчата галчата гусята
                    лисята львята медвежата
                    мышата ребята тигрята]

    string_1 = words.sample(3).each {|item| words.delete(item)}.join(" ")
    string_2 = words.sample(3).each {|item| words.delete(item)}.join(" ")
    string_3 = words.join(" ")
    res = [string_1, string_2, string_3]

    assert_equal(func(res).join(" ").split.sort, sorted_res, 'Random test. Not equal.')
  end
end