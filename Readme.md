# Spaghetti code contest application

Requirements: 

One program, One purpose, One line, 1000 symbols, Any language, any task, as spaghetti as possible

The perfect tool is TCL, a perfect language that allows create absolutely unreadable and compact code with a lot of metaprogramming. Not a bad language but allows very bad things.


### Ideas that came to mind

1. Caesar encryption
2. Brainfuck interpreter
3. Image to ascii converter


### Solution

A brainfuck interpreter written in tcl, encrypted using rot 13 variation, base 64 encoded and packed into another tcs script that decodes, decrypts and executes brainfuck code on the decoded unencrypted interpreter.
One thing I decided not to do is user input for brainfuck so it can execute only the code that prints something but not reads from stdin.

The chosen language was TCL a nice choice for compact metaprogramming with pack of bullshit and inadequate techniques on the shelf.


### How to run:

On linux you normally will have TCLSH interpreter out of the box, so it would be relatively easy to run. For convenience I packed a test script also in tcl, the script will allow you put some brainfuck code in a corresponding place, there are also some examples out of the box, just place brainfuck code in {} after set code.

```
    tclsh test.tcl
```

after you run that command you should see

```
    ./test.tcl
    =============== Running test.tcl ===============
    Result:
    Eello Torld!
    =============== Done ===============
```

to run the interpreter by hands use

```
    tclsh final.tcl
```

It will wait for input, so enter the code and enjoy.

DON'T USE CODE WITH INPUT!

###If you want to know how it was created look at steps folder.