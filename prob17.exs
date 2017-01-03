defmodule Problem17 do
    def word_from_num(num) when 1 <= num and num < 20 do
        %{
            1 => "one",
            2 => "two",
            3 => "three",
            4 => "four",
            5 => "five",
            6 => "six",
            7 => "seven",
            8 => "eight",
            9 => "nine",
            10 => "ten",
            11 => "eleven",
            12 => "twelve",
            13 => "thirteen",
            14 => "fourteen",
            15 => "fifteen",
            16 => "sixteen",
            17 => "seventeen",
            18 => "eighteen",
            19 => "nineteen",
        }[num]
    end

    def word_from_num(num) when 20 <= num and num < 100  do
        tens_digit = div num, 10
        remainder = rem num, 10

        tens_word = %{
            2 => "twenty",
            3 => "thirty",
            4 => "fourty",
            5 => "fivety",
            6 => "sixty",
            7 => "seventy",
            8 => "eighty",
            9 => "ninety",
        }[tens_digit]
        
        case remainder do
            0 ->
                tens_word
            _ ->
                tens_word <> "-" <> word_from_num remainder    
        end
    end

    def word_from_num(num) when num < 1000 do
        hundreds_digit = div num, 100
        remainder = rem num, 100

        hundreds_word = case hundreds_digit do
            1 -> "a hundred"
            _ -> (word_from_num hundreds_digit) <> " hundred"
        end

        case remainder do
            0 -> 
                hundreds_word
            _ ->
                hundreds_word <> " and " <> word_from_num remainder    
        end 
    end

    def word_from_num(num) when num == 1000 do
        "one thousand"
    end

    def solve() do
        1..1000
            |> Enum.reduce([], fn num, tail -> [(word_from_num num) | tail] end) 
            |> Enum.reverse
            |> Enum.map(fn word -> String.replace(word, ~r/(-|\s)/, "") end)
            |> Enum.map(&String.length/1)
            |> Enum.sum
    end
end

IO.puts Problem17.solve
