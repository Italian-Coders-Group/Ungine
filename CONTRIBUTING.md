Thank you for considering to contribute to **"Ungine"**

## Starting development

We recommend Visual Studio 2019 Community to edit our code base.
TODO: add starting steps

## Code Rules

### Verified as working

All code contributed to this repository should be verified as working, meaning you've tested the
functionality at least once and didn't encounter unexpected behaviour. Building the application also may not contain errors inside the console.

### Code Style
This project adopt a major part of the [C# code style](https://docs.microsoft.com/it-it/dotnet/csharp/programming-guide/inside-a-program/coding-conventions), the only differencies are:
- Spacing: if you have nested () you should put a space between them, after a initial ! you should put a space
  ```c#
  (true && (!true == true)) // NO
  (true && (! true == true) ) // YES
  ```
- Brakets: you should't put a newline before a }, catch, else or finally
  ```c#
  namespace Ungine {
    class ungine {
      string getName() {
        try {
          if (true) {
            return "name";
          } else {
            // something
          }
        } catch() {
          // something
        } finally {
          // something
        }
      }
    }
  }
```

### Opening a Pull Request

Please make sure that you have been working with the "dev" branch. Pull request should use the "dev" branch as their base.
