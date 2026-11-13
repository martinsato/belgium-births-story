# Data

## `raw/bel_birth.csv`

Annual live births in Belgium by sex, 1830–2024. This is the births input file
(InputDB format) for Belgium from the **Human Mortality Database (HMD)**.

| Column | Meaning |
|---|---|
| `PopName` | Population code (always `BEL`) |
| `Area` | Territory or sub-series the count covers (10, 20, 30, 110, 130) |
| `Sex` | `f` = female, `m` = male |
| `Year` | Year of birth |
| `YearReg` | Year of registration |
| `RefCode` | Code for the original data source |
| `Access` | Access level (`O` = open) |
| `Births` | Number of live births |
| `NoteCode1`–`NoteCode3` | HMD footnote codes (`.` = none) |
| `LDB` | `1` = row used in the final HMD series, `0` = not used |

### How the file is used

- Only rows with `LDB == 1` are used. This gives exactly one row per year and
  sex for 1840–2024.
- Some years have several rows, from different areas or sources. For example,
  2010 appears in both Area 20 and Area 30.
- Area 130 is a small sub-series with an implausible sex ratio. It is flagged
  `LDB == 0` and is not used.

## Source and licence

HMD. Human Mortality Database. Max Planck Institute for Demographic Research
(Germany), University of California, Berkeley (USA), and French Institute for
Demographic Studies (France). Available at <https://www.mortality.org>.

Data obtained through the Human Mortality Database (www.mortality.org) in 2026.

The data constructed by the HMD team are published under the
[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) licence. **Input data,
like this file, remain under each original provider's licence.** See the
[HMD User Agreement](https://www.mortality.org/Data/UserAgreement) and the
Belgium country page on mortality.org for the original sources.
