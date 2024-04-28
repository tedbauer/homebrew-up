use std::env;

fn generate_completion_options(working_dir: &str, arg: &str) -> Vec<String> {
    vec![
        "apple".to_string(),
        "banana".to_string(),
        "cherry".to_string(),
    ]
}

fn generate_path(working_dir: &str, arg: &str) -> Option<String> {
    let start_index = match working_dir.rfind(arg) {
        Some(index) => index,
        None => return None,
    };

    let end_index = match working_dir
        .char_indices()
        .skip(start_index + 1)
        .find(|&(_, c)| c == '/')
        .map(|(i, _)| i)
    {
        Some(index) => index,
        None => return None,
    };

    Some(working_dir[..end_index].to_string())
}

fn main() {
    let args: Vec<String> = env::args().collect();

    let working_dir = match env::current_dir() {
        Ok(path) => path,
        Err(error) => panic!("Problem getting current directory: {}", error),
    };
    let current_dir_string = working_dir.to_string_lossy().to_string();

    if args.len() < 2 {
        println!("{current_dir_string}");
        return;
    }

    if &args[1] == "--complete" {
        let completions = generate_completion_options(&current_dir_string, &args[2]);
        let completion_string = completions.join("\n");
        println!("{completion_string}");
        return;
    }

    let path = &args[1];
    if let Some(path) = generate_path(&current_dir_string, path) {
        println!("{path}");
    } else {
        println!("{current_dir_string}")
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

    #[test]
    fn generate_path_matches_partial_substring() {
        assert_eq!(
            Some("/simple/path/longerstring".to_string()),
            generate_path("/simple/path/longerstring/more/text/hello", "longe")
        );
    }
}
