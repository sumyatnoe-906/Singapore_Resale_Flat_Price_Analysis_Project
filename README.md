\*\*Dataset Overview\*\*

The resale prices of Housing and Development Board (HDB) flats in Singapore are obtained from the open dataset available on the \[Singapore Government Data Portal (data.gov.sg)](https://data.gov.sg/collections/189/view?utm\_source=chatgpt.com). This dataset provides detailed information on historical resale flat transactions across different time periods.


\*\*Dataset Structure\*\*

The dataset was originally provided in multiple CSV files, segmented by time ranges:
\- Resale Flat Prices 1990–1999

\- Resale Flat Prices 2000–Feb 2012

\- Resale Flat Prices Mar 2012–Dec 2014

\- Resale Flat Prices Jan 2015–Dec 2016

\- Resale Flat Prices Jan 2017–Onwards



\# Data Integration Process

To ensure consistency and facilitate analysis, all five CSV files were \*\*consolidated into a single table\*\* using \*\*Power BI\*\*. The consolidated dataset was then exported to CSV using \*\*DAX Studio\*\*.

Since the dataset spans different reporting methods:

\- \*\*Prior to March 2012\*\* – Dates are based on \*\*approval of resale transactions\*\*.

\- \*\*From March 2012 onwards\*\* – Dates are based on \*\*registration of resale transactions\*\*.



To preserve this distinction, an additional column \*\*`date\_type`\*\* was introduced:

\- Records before March 2012 → \*\*Approval Date\*\*

\- Records from March 2012 onwards → \*\*Registration Date\*\*


\## Final Dataset



The cleaned and unified dataset is stored as:

\*\*`ResaleFlatPrices\_1990\_Onwards (Latest)`\*\*



This final dataset provides a consistent and comprehensive view of resale flat transactions across Singapore from 1990 to the present, enabling more accurate analysis and visualization of long-term housing trends.

The \*\*final consolidated dataset\*\* contains the following key columns:

\- \*\*Month\*\* – Transaction month in \*YYYY-MM\* format

\- \*\*Town\*\* – HDB town/estate (e.g., Ang Mo Kio, Tampines)

\- \*\*Flat Type\*\* – Classification of the flat (e.g., 3-room, 4-room, Executive)

\- \*\*Block\*\* – Block number of the flat sold

\- \*\*Street Name\*\* – Street name of the flat

\- \*\*Storey Range\*\* – Floor range of the flat (e.g., 10 to 12)

\- \*\*Flat Model\*\* – Design/model of the flat (e.g., Improved, New Generation, Model A)

\- \*\*Floor Area (sqm)\*\* – Size of the flat in square meters

\- \*\*Lease Commence Date\*\* – Year the flat’s lease began

\- \*\*Remaining Lease\*\* – Number of years remaining on the 99-year lease at the time of sale

\- \*\*Resale Price (SGD)\*\* – Transaction price of the flat

\- \*\*Date Type\*\* – Classification of the transaction date, where records \*\*before March 2012\*\* are tagged as \*Approval Date\* and records \*\*from March 2012 onwards\*\* are tagged as \*Registration Date\*

