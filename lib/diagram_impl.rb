# Copyright (C) 2020 Diligent Software LLC. All rights reserved. Released
# under the GNU General Public License, Version 3. Refer LICENSE.txt.

require_relative "diagram_impl/version"
require 'node_comp'
require 'linked_list_comp'
require 'set'

# Diagram.
# @class_description
#   A Diagram library's implementation.
class Diagram #< DiagramInt

  # self.diagrammable().
  # @description
  #   Gets DIAGRAMMABLE.
  # @return [Set]
  #   DIAGRAMMABLE's reference.
  def self.diagrammable()
    return DIAGRAMMABLE
  end

  # self.verify_diagrammable(inst = nil).
  # @description
  #   Verifies an instance is diagrammable.
  # @param inst [.]
  #   Any instance.
  # @return [TrueClass, FalseClass]
  #   True in the case the argument is a Diagrammable class instance. False
  #   otherwise.
  def self.verify_diagrammable(inst = nil)
    return DIAGRAMMABLE.include?(inst.class())
  end

  # self.build(inst = nil).
  # @description
  #   Builds an instance's diagram.
  # @param inst [.]
  #   Any diagrammable instance.
  # @return [.]
  #   The instance's Diagram kind instance.
  def self.build(inst = nil)

    case
    when inst.instance_of?(Node)
      return NodeDiagram.new(inst)
    when inst.instance_of?(LinkedList)
      return LLDiagram.new(inst)
    when !self.verify_diagrammable(inst)
      raise(ArgumentError, "#{inst} is not a diagrammable class instance.")
    end

  end

  # self.backward_arrow().
  # @description
  #   Gets a backward arrow symbol.
  # @return [String]
  #   BACKWARD_ARROW'S reference.
  def self.backward_arrow()
    return BACKWARD_ARROW
  end

  # self.forward_arrow().
  # @description
  #   Gets a forward arrow symbol.
  # @return [String]
  #   FORWARD_ARROW's reference.
  def self.forward_arrow()
    return FORWARD_ARROW
  end

  # self.pipe().
  # @description
  #   Gets a vertical line symbol.
  # @return [String]
  #   PIPE's reference.
  def self.pipe()
    return PIPE
  end

  # self.space().
  # @description
  #   Gets a space character.
  # @return [String]
  #   SPACE's reference.
  def self.space()
    return SPACE
  end

  # Private constants.
  BACKWARD_ARROW = '<--'.freeze()
  FORWARD_ARROW  = '-->'.freeze()
  PIPE           = '|'.freeze()
  SPACE          = ' '.freeze()
  DIAGRAMMABLE   = Set[Node, LinkedList].freeze()
  private_constant :BACKWARD_ARROW
  private_constant :FORWARD_ARROW
  private_constant :PIPE
  private_constant :SPACE
  private_constant :DIAGRAMMABLE

end
