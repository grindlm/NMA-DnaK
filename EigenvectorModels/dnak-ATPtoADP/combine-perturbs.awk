#!/bin/bash

rm dnak-atp-comboPerturbations-modes7-10-16.dat

awk 'BEGIN {
	ifile1="dOmega_dnak-atp-4b9q-ca-fixed-orie_7_9.0.dat"
	rc=getline<ifile1
	i=1
	while (rc==1)
	{
		col2[i]=$2
		i++
		rc=getline<ifile1
	}
	ifile2="dOmega_dnak-atp-4b9q-ca-fixed-orie_10_9.0.dat"
	rc=getline<ifile2
	k=1
	while (rc==1)
	{
		col3[k]=$2
		k++
		rc=getline<ifile2
	}
	ifile3="dOmega_dnak-atp-4b9q-ca-fixed-orie_16_9.0.dat"
	rc=getline<ifile3
	l=1
	while (rc==1)
	{
		col4[l]=$2
		l++
		rc=getline<ifile3
	}
	j=1
	while ((j<k))
	{
		addedcol = col2[j] + col3[j] + col4[j]
		printf ("%i\t%.6f\t%.6f\t%.6f\t%.6f\n", j, addedcol, col2[j], col3[j], col4[j]) >> "dnak-atp-comboPerturbations-modes7-10-16.dat"
		j++
	}
}'
