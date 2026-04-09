# Relationship between Corporate Governance and Firm Profitability

## Overview
This project examines how corporate governance mechanisms affect firm profitability among HNX-listed firms from 2010 to 2024. The study uses panel data econometrics in Stata to evaluate how board structure, executive characteristics, and firm-level controls are associated with accounting-based profitability measures.

## Research Objective
The project aims to investigate whether corporate governance variables, such as board size, board independence, female board representation, CEO duality, board meeting frequency, and executive characteristics, significantly affect firm profitability.

## Data
- Sample: HNX-listed firms
- Period: 2010–2024
- Dependent variables: pre-tax ROA, pre-tax ROE
- Independent variables: board size, board independence, female board members, CEO duality, board meetings, chair and CEO characteristics
- Control variables: firm size, leverage, sales growth, foreign ownership, Big4 auditing, and fixed asset ratio

## Methods
The analysis was conducted in Stata and included:
- Data cleaning and type conversion
- Variable construction
- Log transformation and winsorization
- Panel data setup
- Multicollinearity test (VIF)
- Hausman specification test
- Heteroskedasticity test
- Autocorrelation test
- Fixed Effects regression with clustered robust standard errors
- Sub-sample regression by industry

## Key Findings
- Board meeting frequency shows a positive and statistically significant relationship with profitability.
- CEO age is positively associated with both ROA and ROE.
- Leverage has a strong negative effect on profitability.
- Big4 auditing is positively associated with firm performance in the full sample.

## Repository Structure
- `data/`: dataset used for the analysis
- `code/`: Stata scripts and command files
- `docs/`: final report
- `outputs/`: exported regression tables and result files

## Files Included
- `data/corporate_governance_profitability_data.xlsx`: Excel dataset used for panel-data analysis
- `code/analysis.do`: main Stata script for cleaning, diagnostics, estimation, and export
- `code/stata_commands.docx`: original command notes used during the project
- `docs/final_report.pdf`: final project report

## Note
This repository is intended as an academic project portfolio. It highlights the data preparation, panel-data estimation, and empirical analysis workflow conducted in Stata.
