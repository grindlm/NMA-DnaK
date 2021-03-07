#!/bin/bash

rm dnak-htpg-evMagnitudes-modes19and15and40.dat

awk 'BEGIN {
	ifile1="dnak-htpg.evMagnitude.mode19.dat"
	rc=getline<ifile1
	i=1
	while (rc==1)
	{
		col2[i]=$2
		i++
		rc=getline<ifile1
	}
	ifile2="dnak-htpg.evMagnitude.mode15.dat"
	rc=getline<ifile2
	k=1
	while (rc==1)
	{
		col3[k]=$2
		k++
		rc=getline<ifile2
	}
	ifile3="dnak-htpg.evMagnitude.mode40.dat"
	rc=getline<ifile3
	l=1
	while (rc==1)
	{
		col4[l]=$2
		l++
		rc=getline<ifile3
	}
	j=1
	while ((j<l))
	{
		printf "%d\t%.6f\t%.6f\t%.6f\t%.6f\n", j, col2[j] + col3[j] + col4[j], col2[j], col3[j], col4[j] >> "dnak-htpg-evMagnitudes-modes19and15and40.dat"
		j++
	}
}'
