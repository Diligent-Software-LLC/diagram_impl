require_relative 'test_helper'

# DiagramTest.
# @class_description
#   Tests the Diagram class.
class DiagramTest < Minitest::Test

  # Constants
  CLASS = Diagram

  # test_conf_doc_f_ex().
  # @description
  #   The .travis.yml, CODE_OF_CONDUCT.md, Gemfile, LICENSE.txt, README.md,
  #   and .yardopts files exist.
  def test_conf_doc_f_ex()

    assert_path_exists('.travis.yml')
    assert_path_exists('CODE_OF_CONDUCT.md')
    assert_path_exists('Gemfile')
    assert_path_exists('LICENSE.txt')
    assert_path_exists('README.md')
    assert_path_exists('.yardopts')

  end

  # test_version_declared().
  # @description
  #   The version was declared.
  def test_version_declared()
    refute_nil(Diagram::VERSION)
  end

  # setup().
  # @description
  #   Set fixtures.
  def setup()
    @node = Node.new(nil, nil, nil)
    @ll   = LinkedList.new(nil)
  end

  # Diagram.diagrammable()

  # test_diagrammable_x().
  # @description
  #   DIAGRAMMABLE.
  def test_diagrammable_x()
    expected = Set[Node, LinkedList]
    assert_equal(expected, CLASS.diagrammable())
  end

  # Diagram.verify_diagrammable(inst = nil)

  # test_vd_x1().
  # @description
  #   A DIAGRAMMABLE element.
  def test_vd_x1()
    d_element = Node.new(nil, nil, nil)
    assert_operator(CLASS, 'verify_diagrammable', d_element)
  end

  # test_vd_x2().
  # @description
  #   An undiagrammable instance.
  def test_vd_x2()
    refute_operator(CLASS, 'verify_diagrammable', 6)
  end

  # Diagram.build(inst = nil)

  # test_build_x1().
  # @description
  #   A Node instance.
  def test_build_x1()

    expected = NodeDiagram.new(@node)
    actual   = Diagram.build(@node)
    assert_equal(expected, actual)

  end

  # test_build_x2().
  # @description
  #   A LinkedList instance.
  def test_build_x2()

    expected = LLDiagram.new(@ll)
    actual   = Diagram.build(@ll)
    assert_equal(expected, actual)

  end

  # test_build_x3().
  # @description
  #   An undiagrammable instance.
  def test_build_x3()
    assert_raises(ArgumentError) { Diagram.build(6) }
  end

  # initialize()

  # test_no_init().
  # @description
  #   Diagram's 'iniitialize' is unresponsive.
  def test_no_init()
    refute_respond_to(CLASS, :initialize)
  end

  # Diagram.backward_arrow()

  # test_cba_x().
  # @description
  #   BACKWARD_ARROW.
  def test_cba_x()
    expected = '<--'.freeze()
    assert_equal(expected, CLASS.backward_arrow())
  end

  # Diagram.forward_arrow()

  # test_cfa_x().
  # @description
  #   FORWARD_ARROW.
  def test_cfa_x()
    expected = '-->'.freeze()
    assert_equal(expected, Diagram.forward_arrow())
  end

  # Diagram.pipe()

  # test_cp_x().
  # @description
  #   PIPE.
  def test_cp_x()
    expected = '|'.freeze()
    assert_equal(expected, CLASS.pipe())
  end

  # Diagram.space()

  # test_cs_x().
  # @description
  #   SPACE.
  def test_cs_x()
    expected = ' '.freeze()
    assert_equal(expected, CLASS.space())
  end

  # teardown().
  # @description
  #   Cleanup.
  def teardown()
  end

end
