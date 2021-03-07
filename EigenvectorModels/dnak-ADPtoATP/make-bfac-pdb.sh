#! /bin/bash

rm pdb-dnak-adp-modes12and7-bfac-disp.pdb

awk  'BEGIN {
	ifile1="dnak-adp-ca.orie.pdb"
	rc=getline<ifile1
	i=1
	while (rc==1)
	{
		line1[i]=substr($0,1,60)
		i=i+1
		rc=getline<ifile1
	}
	ifile2="dnak-adp-evMagnitudes-modes12and7.dat"
	rc=getline<ifile2
	k=1
	while (rc==1)
	{
		disp[k]=$2
		k++
		rc=getline<ifile2
	}

		{
			j=1
			while ((j<k))
			{
				printf line1[j] >> "pdb-dnak-adp-modes12and7-bfac-disp.pdb"
				printf "%6.2f\n",disp[j] >> "pdb-dnak-adp-modes12and7-bfac-disp.pdb"
				j++
			}

		}
	}'
