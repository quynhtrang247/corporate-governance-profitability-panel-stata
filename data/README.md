# Data Note

This folder contains the dataset used for the project **Relationship between Corporate Governance and Firm Profitability**.

## File
- `corporate_governance_profitability_data.xlsx`

## Description
The dataset includes firm-level panel data used for Stata-based econometric analysis of the relationship between corporate governance and firm profitability.

## Main Variable Groups
### Dependent variables
- `pretax_roa`
- `pretax_roe`

### Corporate governance variables
- `boardsize`
- `independentboardmember`
- `femaleboardmember`
- `duality`
- `numberofboardmeeting`
- `chair_gender`
- `chair_birthyear`
- `ceo_gender`
- `ceo_birthyear`

### Control variables
- `total_assets`
- `total_liabilities`
- `total_revenues`
- `gross_ppe`
- `foreign_ownership`
- `big4_auditing`

## Notes
- Firm size is measured as the natural logarithm of total assets.
- Leverage is constructed from total liabilities and total assets.
- Key financial variables are winsorized to reduce the influence of outliers.
- The dataset is used for panel regression analysis in Stata.
