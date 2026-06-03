if (( ! $+commands[terraform] )); then
    return
fi

# ลบ .terraform/ (local cache) ใน dir ปัจจุบัน (ถามยืนยันก่อน)
tfclean() {
    emulate -L zsh
    if [[ ! -e .terraform ]]; then
        print -u2 "tfclean: no .terraform/ in $PWD"
        return 0
    fi
    read -q "REPLY?Remove .terraform/ ? [y/N] " || { print; return 1 }
    print
    rm -rf -- .terraform
}

# ลบ .terraform.lock.hcl (lock file) ต่างหาก (ถามยืนยันก่อน)
tfcleanlock() {
    emulate -L zsh
    if [[ ! -e .terraform.lock.hcl ]]; then
        print -u2 "tfcleanlock: no .terraform.lock.hcl in $PWD"
        return 0
    fi
    read -q "REPLY?Remove .terraform.lock.hcl ? [y/N] " || { print; return 1 }
    print
    rm -f -- .terraform.lock.hcl
}

# สลับ terraform workspace ผ่าน fzf
tfws() {
    emulate -L zsh
    if (( ! $+commands[fzf] )); then
        print -u2 "tfws: fzf not found"
        return 1
    fi
    local ws
    ws=$(terraform workspace list | sed 's/^[* ] //' \
        | fzf --height 40% --reverse --prompt 'workspace> ') || return
    [[ -n $ws ]] && terraform workspace select "$ws"
}

# init แบบ upgrade + reconfigure (ส่ง flag เพิ่มได้)
tfinit() {
    terraform init -upgrade -reconfigure "$@"
}

# fmt ทั้ง tree แล้ว validate
tffmt() {
    terraform fmt -recursive && terraform validate
}
