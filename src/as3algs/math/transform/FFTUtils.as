package as3algs.math.transform 
{
	import as3algs.math.base_concept.Complex;
	import as3algs.math.base_concept.CosWave;
	import as3algs.math.base_concept.IWave;
	/**
	 * ...
	 * @author Shirobok Pavel aka ramshteks
	 */
	public class FFTUtils 
	{
		public static function getWavesFromFFTResult(fftResult:Vector.<Complex>, rateOfDiscretiztion:int = 1):Vector.<IWave> {
			var waves:Vector.<IWave> = new Vector.<IWave>();
			var n:int = waves.length = fftResult.length
			
			var fr:Number;
			for (var i:int = 0; i < n; i++) {
				fr = getFrequancy(i, n, rateOfDiscretiztion);
				waves[i] = getWaveFromComplex(fftResult[i], fr, n);
			}
			
			return waves;
		}
		
		public static function getWaveFromComplex(complex:Complex, freq:Number, numberOfComponents:int):IWave
		{
			var phase:Number = Math.atan(complex.im / complex.r);
			var amplitude:Number = (1.0 / Number(numberOfComponents)) * Math.sqrt(Math.pow(complex.r, 2) + Math.pow(complex.im, 2));

			return new CosWave(freq, amplitude, phase);
		}
		
		public static function getFrequencyArrayFor(fftResult:Vector.<Complex>):Vector.<Number> {
			var result:Vector.<Number> = new Vector.<Number>();
			result.length = fftResult.length;
			
			var n:int = fftResult.length;
			
			for (var i:int = 0; i < n; i++) {
				result[i] = (Number(i) + 1) / Number(n);
			}
			
			return result;
		}
		
		public static function getFrequancy(indexOfHarmonics:int, totalHarmonicsCount:int, rateOfDiscretization:Number = 1):Number {
			return ((Number(indexOfHarmonics) + 1) / Number(totalHarmonicsCount)) * rateOfDiscretization;
		}
	}

}