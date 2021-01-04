#!/bin/bash

rm dnak-adp-evMagnitudes-modes12and7.dat

awk 'BEGIN {
	ifile1="dnak-htpg.evMagnitude.mode12.dat"
	rc=getline<ifile1
	i=1
	while (rc==1)
	{
		col2[i]=$2
		i++
		rc=getline<ifile1
	}
	ifile2="dnak-htpg.evMagnitude.mode7.dat"
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
		printf "%d\t%.6f\t%.6f\t%.6f\n", j, col2[j] + col3[j], col2[j], col3[j] >> "dnak-adp-evMagnitudes-modes12and7.dat"
		j++
	}
}'
