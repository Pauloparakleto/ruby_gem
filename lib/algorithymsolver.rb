# frozen_string_literal: true

require_relative "algorithymsolver/version"

module Algorithymsolver
  class Error < StandardError; end

  # Linear search
  # Performs a search starting at the first index, evaluate to second and so on
  # until find the number returning it or -1 as not found.
  class LinearSearch
    def initialize(array, number)
      @array = array
      @number = number
    end

    def search
      index = -1
      @array.length.times do
        index += 1
        return index if @array[index] == @number
      end
      -1
    end
  end

  # Maximize array
  # returns the maximus sum of an array after a such times modifier interact
  # over the numbers changing they signals.
  class MaximizeArray
    def initialize(array, modifier)
      @array = array
      @modifier = modifier
    end

    def maximize
      @score = 0
      sorted_array = @array.sort
      @negative_array = sorted_array.select { |number| number.negative? }
      @positive_array = sorted_array.select { |number| number.positive? }
      modify_negatives
      @zero_array = sorted_array.select { |number| number.zero? }
      modify_zero unless @zero_array.empty?

      modify_positives
      @positive_array.sum + @negative_array.sum
    end

    def modify_negatives
      @negative_array.map! do |number|
        number *= -1
        @score += 1
        return @negative_array.sum + @positive_array.sum if @score == @modifier

        number
      end
    end

    def modify_positives
      @positive_array.map! do |number|
        if @modifier.even?
          number
        elsif @score < @modifier
          @score = @modifier
          -number
        else
          number
        end
      end
    end
    def modify_zero
      return @negative_array.sum + @positive_array.sum
    end
  end

end
