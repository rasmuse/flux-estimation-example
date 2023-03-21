clean:
	rm -r outdata

outdata:
	opentoolflux --version
	opentoolflux import
	opentoolflux info
	opentoolflux fluxes
	opentoolflux plot flux-fits
	opentoolflux plot flux-time-series
