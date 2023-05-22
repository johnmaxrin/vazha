# Vazha🌴 - Manglish-to-C Code Generator

Vazha🌴 is a hobby project that aims to enable the generation of C code from Manglish. It provides a simple and intuitive way to express algorithms and logic in Manglish and automatically translates them into valid C code.

## How to Run

To use Vazha and generate C code from Manglish, follow the steps below:

1. **Clone the Repository:** Start by cloning this repository to your local machine using the following command: <br>
```git clone https://github.com/your-username/your-repository.git ```
2. **Navigate to the Directory:** Move into the cloned repository's directory: <br>
```cd your-repository```
3. **Compile the Code:** Execute the `make` command to compile the Vazha code generator:<br>
```make```
4. **Run the Executable:** Once the compilation is successful, you can run the Vazha executable. Use the following command:<br>
```./vazha example/test.vz```

Replace `example/test.vz` with the path to your Manglish input file.

Vazha will process the input file, generate the corresponding C code, and output it to **output.c**.

## Manglish Syntax

There are only a few constructs in Vazha since it is a hobby project. Here are a few guidelines:

- Separate statements with semicolons (`;`).
- Use **kaniku** for printf
- Use **ippo** for if
- Use **cheruth** for <
- Use **valuth** for >
- Use **allengi** for else 

😂 ചിരിക്കാതെടാ! 
 
Here's an example of Manglish code that doesn't do anything 
```
ippo (5 cheruth 4) anengi
    kaniku(5);
allengi
    kaniku(4);
```

## Contributions

Contributions to Vazha are always welcome! If you find any issues or have ideas for improvements, feel free to submit a pull request or open an issue on the GitHub repository.


## License

Vazha is released under the [MIT License](LICENSE). Feel free to use, modify, and distribute the code for personal and commercial purposes.

## Acknowledgments

Vazha was inspired by the need to bridge the gap between the Malayalam language and programming. . We would like to extend our special thanks to Tom Niemann for his valuable tutorial on Lex abd YACC, which served as the foundation for this project. You can find his tutorial [here](https://www.epaperpress.com/lexandyacc/index.html). And thankyou ChatGPT for this README.md


---

We hope you find Vazha useful in generating C code from Manglish. If you encounter any issues or have suggestions for improvement, please let us know. Happy coding in Manglish!



