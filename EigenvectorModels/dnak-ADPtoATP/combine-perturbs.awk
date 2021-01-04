#!/bin/bash

rm dnak-adptoatp-comboPerturbations-modes7-12.dat

awk 'BEGIN {
	ifile1="dOmega_dnak-adp-ca_7_9.0.dat"
	rc=getline<ifile1
	i=1
	while (rc==1)
	{
		col2[i]=$2
		i++
		rc=getline<ifile1
	}
	ifile2="dOmega_dnak-adp-ca_12_9.0.dat"
	rc=getline<ifile2
	k=1
	while (rc==1)
	{
		col3[k]=$2
		k++
		rc=getline<ifile2
	}
	j=1
	while ((j<k))
	{
		addedcol = col2[j] + col3[j]
		printf ("%i\t%.6f\t%.6f\t%.6f\t\n", j, addedcol, col2[j], col3[j]) >> "dnak-adptoatp-comboPerturbations-modes7-12.dat"
		j++
	}
}'
