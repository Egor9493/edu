awk '
BEGIN{
FS = "\",|,\"|\",\""
OFS = "\",\""
}
{
str = "-"

if (index($3, "Junior") != 0)
	{str = "Junior"}

if (index($3, "Middle") != 0)
	{
	if (str != "-")
		{str = str "/Middle"}
	else
		{str = "Middle"}
	}

if (index($3, "Senior") != 0)
    {                                                                                                                                                       
	if (str != "-")
    	{str = str "/Senior"}																																
	else
		{str = "Senior"}                                                                                                                                    
	}

if (FNR == 1)
	{$6 = "name"}
else
	{$6=str}

print $1, $2, $6, $4, $5
}' hh_sorted.csv > hh_positions.csv

