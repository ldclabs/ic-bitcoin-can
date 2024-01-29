use ic_cdk_macros::*;

#[query(name = "todo")]
fn todo(name: String) -> String {
    format!("Hello, {}!", name)
}

export_candid!();
