#! /bin/bash

rm pdb-dnak-grpe-modes8-14-16-bfac-disp.pdb

awk  'BEGIN {
	ifile1="dnak-grpe-min-ca.chain.orie.pdb"
	rc=getline<ifile1
	i=1
	while (rc==1)
	{
		line1[i]=substr($0,1,60)
		i=i+1
		rc=getline<ifile1
	}
	ifile2="dnak-grpe-evMagnitudes-modes8-14-16.dat"
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
				printf line1[j] >> "pdb-dnak-grpe-modes8-14-16-bfac-disp.pdb"
				printf "%6.2f\n",disp[j] >> "pdb-dnak-grpe-modes8-14-16-bfac-disp.pdb"
				j++
			}

		}
	}'
