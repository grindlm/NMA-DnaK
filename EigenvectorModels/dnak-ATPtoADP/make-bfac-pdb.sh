#! /bin/bash

rm pdb-dnak-ATPtoADP-modes7-10-16-bfac-disp.pdb

awk  'BEGIN {
	ifile1="dnak-atp-4b9q-ca-fixed-orie.pdb"
	rc=getline<ifile1
	i=1
	while (rc==1)
	{
		line1[i]=substr($0,1,60)
		i=i+1
		rc=getline<ifile1
	}
	ifile2="dnak-ATPtoADP-displacements-modes7-10-16.dat"
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
				printf line1[j] >> "pdb-dnak-ATPtoADP-modes7-10-16-bfac-disp.pdb"
				printf "%6.2f\n",disp[j] >> "pdb-dnak-ATPtoADP-modes7-10-16-bfac-disp.pdb"
				j++
			}

		}
	}'
