# source ~/.tf14/bin/activate
#
# export PYTHONPATH=$PYTHONPATH:$(dirname $(pwd))
#
# CUDA_VISIBLE_DEVICES=1 python nmt_train.py --config=config_en2fr_large
###################################################################################
#!/bin/bash
#
#SBATCH --job-name=mySequenceGPU
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

cd /scratch/yw2848/sequencing
python nmt_train.py --config config_en2zh
