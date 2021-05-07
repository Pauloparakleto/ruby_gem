# frozen_string_literal: true

require_relative "algorithymsolver/version"

module Algorithymsolver
  class Error < StandardError; end

  class LinearSearch
    def initialize(array, number)
      @array = array
      @number = number
    end

    def search
      index = -1


      @array.length.times do
        index += 1
        if @array[index] == @number
          return index
        end
      end
      -1
    end
  end

  class MaximizeArray
    def initialize(array, k)
      @array = array
      @k = k
    end

    def maximize
      @score = 0
      sorted_array = @array.sort
      @negative_array = sorted_array.select { |number| number < 0 }
      @positive_array = sorted_array.select { |number| number > 0 }

      @negative_array.map! do |number|
        number = number * (-1)
        @score += 1
        if @score == @k
          return @negative_array.sum + @positive_array.sum
        end
        number
      end

      @zero_array = sorted_array.select { |number| number == 0 }

      @zero_array.map! do
        return @negative_array.sum + @positive_array.sum
      end
      @positive_array.map! do |number|
        if @k.even?
          number
        else
          if @score < @k
            @score = @k
            -number
          else
            number
          end
        end
      end
      @positive_array.sum + @negative_array.sum
    end
  end
end
