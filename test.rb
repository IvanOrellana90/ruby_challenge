require_relative "terminal.rb"

terminal = Terminal.new()
terminal.loadProductList()

challenge_list_test = ["ABCDABAA", "CCCCCCC", "ABCD"]

for test in challenge_list_test do
    test.split("").each do |code|
        terminal.scan(code)
    end
    puts "Shopping List:" 
    puts terminal.shopping_list()
    terminal.total()
end