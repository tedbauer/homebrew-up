use std::env;

fn generate_path(working_dir: &str, arg: &str) -> Option<String> {
    match working_dir.rfind(arg) {
        Some(index) => Some(working_dir[..index + arg.len()].to_string()),
        None => None,
    }
}

fn main() {
    let args: Vec<String> = env::args().collect();
    let path = &args[1];

    let working_dir = match env::current_dir() {
        Ok(path) => path,
        Err(error) => panic!("Problem getting current directory: {}", error),
    };

    let current_dir_string = working_dir.to_string_lossy().to_string();
    if let Some(path) = generate_path(&current_dir_string, path) {
        println!("{path}");
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn generate_path_one_substring_picks_last() {
        assert_eq!(
            Some("/simple/path/one".to_string()),
            generate_path("/simple/path/one/two/three", "one")
        );
    }

    #[test]
    fn generate_path_two_substrings_picks_last() {
        assert_eq!(
            Some("/simple/path/one/two/three/one".to_string()),
            generate_path("/simple/path/one/two/three/one/two", "one")
        );
    }
}
