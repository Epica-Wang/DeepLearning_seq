# source ~/.tf14/bin/activate
#
# export PYTHONPATH=$PYTHONPATH:$(dirname $(pwd))
#
# CUDA_VISIBLE_DEVICES=0 python nmt_infer.py --config=config_en2fr_large --test-src='data/newstest2014.en.tok'
#
# ls -t dev_outputs  | head -n1 |awk '{printf("newest file: %s\t",$0)}' >> bleu.hist
# perl multi-bleu.perl data/newstest2014.fr.tok < test.out >> bleu.hist
###########################################################################
#!/bin/bash
#
#SBATCH --job-name=mySequenceEvalGPU
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH --time=80:00:00
#SBATCH --mem=4GB
#SBATCH --gres=gpu:1
#SBATCH --mail-type=END
##SBATCH --mail-user=yw2848@nyu.edu
#SBATCH --output=slurm_%j.out

module purge
module load tensorflow/python3.6/1.5.0
module load perl/intel/5.24.0

cd /scratch/yw2848/sequencing
python nmt_infer.py --config config_en2zh --test-src 'data/test.en'
ls -t dev_outputs  | head -n1 |awk '{printf("newest file: %s\t",$0)}' >> bleu.hist
perl multi-bleu.perl data/test.zh < test.out >> bleu.hist
