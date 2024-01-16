# An experiment in userspace scheduling.
scheduler ← {
    time ← •MonoTime 0
    cur ← 0
    pid ← ⟨⟩
    at  ← ⟨⟩
    bt ← ⟨⟩

    Queue ⇐ {
        pid ↩ pid∾cur
        cur ↩ cur + 1
        bt ↩ bt∾𝕩
        at ↩  at∾•MonoTime 0
        cur‿pid‿bt‿at
    }

    Dequeue ⇐ {
        m ← 𝕩⍷pid
        pid ↩ pid/˜¬m
        a ← at/˜m
        at ↩ at/˜¬m
        b ← bt/˜m
        bt ↩ bt/˜¬m
        cur‿pid‿bt‿at
    }
}
