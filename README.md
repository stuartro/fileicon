# FileIcon

A (much faster) Swift-based replacement for [mklement0/fileicon](https://github.com/mklement0/fileicon). 

I wrote this due to frustration with the time taken to set icons on large numbers of files. The result is a substantially faster utility.

## Usage

```lang-shell
fileicon --help
```

```
OVERVIEW: Manipulate custom icons for files/folders in macOS

USAGE: fileicon <subcommand>

OPTIONS:
  -h, --help              Show help information.

SUBCOMMANDS:
  get                     Get (and save to disk) a file or folder’s custom icon
  rm                      Remove a custom icon from a file or folder
  set                     Set a custom icon for a file or folder

  See 'fileicon help <subcommand>' for detailed help.
```

### Save existing custom icon to disk

```lang-shell
USAGE: fileicon get --fileOrFolder <fileOrFolder> --iconOutputFile <iconOutputFile> [--force]

OPTIONS:
  -f, --fileOrFolder <fileOrFolder>
                          File or folder that has a custom icon
  -o, --iconOutputFile <iconOutputFile>
                          Image file to save the file/folder’s custom icon to
  --force                 Force replacement of existing output file
  -h, --help              Show help information.
```

### Remove custom icon from file/folder

```lang-html
USAGE: fileicon rm --fileOrFolder <fileOrFolder>

OPTIONS:
  -f, --fileOrFolder <fileOrFolder>
                          File or folder to remove custom icon from
  -h, --help              Show help information.
```

### Set custom icon on file/folder

```lang-shell
USAGE: fileicon set --fileOrFolder <fileOrFolder> --imageFile <imageFile>

OPTIONS:
  -f, --fileOrFolder <fileOrFolder>
                          File or folder to which a custom icon is to be applied
  -i, --imageFile <imageFile>
                          Image file to use as custom icon (typically .icns or .png)
  -h, --help              Show help information.
```

## Implementation

