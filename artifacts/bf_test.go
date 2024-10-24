package main

import (
	"bytes"
	"io"
	"testing"
	//"flag"
)

func TestINterpreter(t *testing.T) {
	prog := []byte("{+[[->]-[-<]>-]>.>>>>.<<<<-.>>-.>.<<.>>>>-.<<<<<++.>>++.}")
	in, out := bytes.NewBufferString(""), bytes.NewBufferString("")
	interpreter := NewInterpreter(prog, in, out)
	interpreter.Run()
	if out.String() != "Hello World!\n" {
		t.Errorf("Expected 'Hello World!', got %s", out.String())
	}
}

const memsize = 30000

const (
	next = '>'
	prev = '<'
	inc  = '+'
	dec  = '-'
	jump = '['
	back = ']'
	get  = '.'
	put  = ','
)

type memory struct {
	mem [memsize]byte
	pos uint
}

func (m *memory) Next() {
	m.pos = (m.pos + 1) % memsize
}

func (m *memory) Prev() {
	m.pos = (m.pos - 1) % memsize
}

func (m *memory) Inc() {
	m.mem[m.pos] += 1
}

func (m *memory) Dec() {
	m.mem[m.pos] -= 1
}

func (m *memory) Get() byte {
	return m.mem[m.pos]
}

func (m *memory) Put(c byte) {
	m.mem[m.pos] = c
}

func (m *memory) IsZero() bool {
	return m.mem[m.pos] == 0
}

type interpreter struct {
	memory
	stdin  io.Reader
	stdout io.Writer
	prog   []byte
	pc     int
}

func NewInterpreter(prog []byte, stdin io.Reader, stdout io.Writer) *interpreter {
	in := new(interpreter)
	in.prog = prog
	//copy(in.prog, prog)
	in.stdin, in.stdout = stdin, stdout
	return in
}

func (in *interpreter) Jump() {
	if !in.IsZero() {
		return
	}

	ignore := 0
	plen := len(in.prog)
	for i := in.pc + 1; i < plen; i++ {

		if in.prog[i] == jump {
			ignore++
			continue
		}

		if in.prog[i] == back {
			ignore--
		}

		if ignore < 0 {
			in.pc = i
			return
		}
	}
	in.pc = plen
	return
}

func (in *interpreter) Back() {
	if in.IsZero() {
		return
	}

	ignore := 0
	for i := in.pc - 1; i >= 0; i-- {
		if in.prog[i] == back {
			ignore++
			continue
		}

		if in.prog[i] == jump {
			ignore--
		}

		if ignore < 0 {
			in.pc = i
			return
		}

	}
	return
}

func (in *interpreter) Write() {
	c := in.Get()
	in.stdout.Write([]byte(string(c)))
}

func (in *interpreter) Read() {
	c := make([]byte, 1)
	in.stdin.Read(c)
	in.Put(c[0])
}

func (in *interpreter) Run() {
	plen := len(in.prog)
	for in.pc = 0; in.pc < plen; in.pc++ {
		switch in.prog[in.pc] {
		case next:
			in.Next()
		case prev:
			in.Prev()
		case inc:
			in.Inc()
		case dec:
			in.Dec()
		case jump:
			in.Jump()
		case back:
			in.Back()
		case get:
			in.Write()
		case put:
			in.Read()
		}
	}
}
