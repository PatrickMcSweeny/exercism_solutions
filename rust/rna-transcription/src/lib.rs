#[derive(Debug, PartialEq)]
pub struct DNA {
    strand: String,
}

#[derive(Debug, PartialEq)]
pub struct RNA {
    strand: String,
}

impl DNA {
    pub fn new(dna: &str) -> Result<DNA, usize> {
        for (i, char) in dna.chars().enumerate() {
            if !['G', 'C', 'T', 'A'].contains(&char) {
                return Err(i);
            }
        }
        Ok(DNA {
            strand: dna.to_string(),
        })
    }

    pub fn into_rna(self) -> RNA {
        RNA {
            strand: self
                .strand
                .chars()
                .map(|char| match char {
                    'G' => "C",
                    'C' => "G",
                    'T' => "A",
                    'A' => "U",
                    _ => "",
                })
                .collect::<String>(),
        }
    }
}

impl RNA {
    pub fn new(rna: &str) -> Result<RNA, usize> {
        for (i, char) in rna.chars().enumerate() {
            if !['C', 'G', 'A', 'U'].contains(&char) {
                return Err(i);
            }
        }
        Ok(RNA {
            strand: rna.to_string(),
        })
    }
}
