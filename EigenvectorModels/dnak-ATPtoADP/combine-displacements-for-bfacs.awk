#!/bin/bash

rm dnak-ATPtoADP-displacements-modes7-10-16.dat

awk 'BEGIN {
	ifile1="displ_dnak-atp-4b9q-ca-fixed-orie_7_9.0.dat"
	rc=getline<ifile1
	i=1
	while (rc==1)
	{
		col2[i]=$2
		i++
		rc=getline<ifile1
	}
	ifile2="displ_dnak-atp-4b9q-ca-fixed-orie_10_9.0.dat"
	rc=getline<ifile2
	k=1
	while (rc==1)
	{
		col3[k]=$2
		k++
		rc=getline<ifile2
	}
	ifile3="displ_dnak-atp-4b9q-ca-fixed-orie_16_9.0.dat"
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
		print j, col2[j] + col3[j] + col4[j], col2[j], col3[j], col4[j] >> "dnak-ATPtoADP-displacements-modes7-10-16.dat"
		j++
	}
}'
