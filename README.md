# `opentoolflux` usage example

This is an example of how to use [`opentoolflux`](https://pypi.org/project/opentoolflux/) to estimate gas fluxes from soil using time-series data from automatic chambers. For more info on the software design and intended use, please refer to the [documentation](https://pypi.org/project/opentoolflux/).

## Install

This instruction assumes basic familiarity with using Python and pip from the command line.

The software is tested on Windows and Linux systems and should work with Python 3.8+.

### Use a virtual environment

This step is recommended but not necessary.

1. Create a virtual environment

```
python -m venv .venv
```

2. Activate the venv.

On Linux:
```
python3 -m venv .venv
. .venv/bin/activate
```

On Windows:
```
.venv\Scripts\activate
```

Alternatively you might want to use something like [pipx](https://pypa.github.io/pipx/).

### Install using pip

```bash
pip install opentoolflux
```

This will install `opentoolflux` and its dependencies.

## Run the example

- The indata is in `indata/`. These particular data are collected using a Picarro G2308 system with a solenoid-valve multiplexer, but similar tabular text-based input data files can be used too (e.g., comma-separated or tab-separated files).
- All the necessary configuration is found in the config file `opentoolflux.toml`.
- All that is needed now to run the proper commands:

```bash
opentoolflux --version  # Print the current installed version of opentoolflux.
opentoolflux import  # Import data from source files, creating a database file.
opentoolflux info  # Show some basic statistics about the database file.
opentoolflux fluxes  # Estimate fluxes and create a file outdata/fluxes.csv.
opentoolflux plot flux-fits  # Plot concentration time series with curve fits.
opentoolflux plot flux-time-series  # Plot estimated fluxes for each chamber.
```

This creates the `output` folder (if it does not already exist, as in this example). If you want to re-run for yourself from scratch, simply remove the `output` folder and run the commands listed above.

Each of the commands above prints some information to screen. The same information can be seen in the file `log.info.txt` in the output directory.

The database file `outdata/database.feather` is in [Feather format](https://arrow.apache.org/docs/python/feather.html) and contains all the imported data. It can be safely sent/copied to other computers, instead of sharing the indata. This is convenient since the original indata file(s) may take much more space than the `opentoolflux` database file. (In this example, the indata occupy 89 MB and the `opentooflux.feather` database only 1.8 MB.)

## Learn more

Please refer to the [`opentoolflux` documentation](https://pypi.org/project/opentoolflux/).
