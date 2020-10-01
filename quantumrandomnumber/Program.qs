namespace quantumrandomnumber {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;

    
    operation GenerateQubit() : Result {
        using (q = Qubit()){
            H(q);
            return MResetZ(q);
        }
    }

    operation SRandomNumber(max : Int) : Int {
        mutable output = 0;
        repeat {
            mutable bits = new Result[0]; 
            for (idxBit in 1..BitSizeI(max)) {
                set bits += [GenerateQubit()];
            }
            set output = ResultArrayAsInt(bits);
        } until (output <= max);
        return output;
    }

    @EntryPoint()
    operation Number() : Int {
        let max = 21535;
        Message($"Generate a random number lower than {max}: ");
        return SRandomNumber(max);
    }
}
