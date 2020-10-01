namespace quantumfirst {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement; 

    @EntryPoint()
    operation GenerateQubit() : Result {
        using(q = Qubit()){
            H(q);

            return MResetZ(q);
        }
    }
}
