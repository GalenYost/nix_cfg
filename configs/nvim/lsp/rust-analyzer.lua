return {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = { 'Cargo.lock', '.git' },
    settings = {
        checkOnSave = {
            command = "clippy",
        },
        cargo = {
            allFeatures = true,
        },
    }
}
