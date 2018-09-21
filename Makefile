all: decoder.t multiplexer.t adder.t 
	make decoder	
	make multiplexer
	make adder

decoder: decoder.t
	./decoder.t
decoder.t: decoder.t.v decoder.v
	iverilog -o decoder.t decoder.t.v



multiplexer: multiplexer.t
	./multiplexer.t
multiplexer.t: multiplexer.t.v multiplexer.v
	iverilog -o multiplexer.t multiplexer.t.v



adder: adder.t
	./adder.t
adder.t: adder.t.v adder.v
	iverilog -o adder.t adder.t.v
