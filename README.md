# Relationship between Corporate Governance and Firm Profitability

## Objective
This project examines how corporate governance mechanisms affect firm profitability among HNX-listed firms from 2010 to 2024.

## Data
- Sample: HNX-listed firms
- Period: 2010–2024
- Dependent variables: pre-tax ROA, pre-tax ROE
- Key explanatory variables: board size, board independence, female board members, CEO duality, board meetings, and executive characteristics
- Control variables: firm size, leverage, sales growth, foreign ownership, Big4 auditing, and fixed asset ratio

## Methods
- Data cleaning and variable transformation in Stata
- Winsorization and outlier treatment
- Panel data setup
- VIF, Hausman, heteroskedasticity, autocorrelation, and time fixed-effects tests
- Fixed Effects regression with clustered robust standard errors

## Key Findings
- Board meeting frequency is positively associated with profitability
- CEO age is positively related to ROA and ROE
- Leverage has a strong negative effect
- Big4 auditing is positively associated with firm performance

## Repository Structure
- `code/`: Stata scripts
- `outputs/`: selected regression tables and diagnostic outputs
- `docs/`: report or supporting documents
- `data/`: data note
