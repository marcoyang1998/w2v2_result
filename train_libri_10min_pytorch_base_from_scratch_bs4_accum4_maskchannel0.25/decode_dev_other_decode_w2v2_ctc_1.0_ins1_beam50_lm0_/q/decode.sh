#!/bin/bash
cd /rds/user/xy316/hpc-work/mphil/espnet/egs/librispeech/asr1
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  set | grep SLURM | while read line; do echo "# $line"; done
  echo -n '# '; cat <<EOF
asr_recog.py --config conf/decode_w2v2_ctc_1.0_ins1_beam50_lm0.yaml --ngpu 0 --backend pytorch --debugmode 1 --verbose 0 --recog-json /rds/user/xy316/hpc-work/mphil/espnet/egs/librispeech/asr1/decode_w2v2/dev_other/split100utt/data.${SLURM_ARRAY_TASK_ID}.json --result-label exp/train_librispeech_10min_pytorch_base_from_scratch_bs4_accum4_maskchannel0.25/decode_dev_other_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/data.${SLURM_ARRAY_TASK_ID}.json --model exp/train_librispeech_10min_pytorch_base_from_scratch_bs4_accum4_maskchannel0.25/results/snapshot.ep.3900 
EOF
) >exp/train_librispeech_10min_pytorch_base_from_scratch_bs4_accum4_maskchannel0.25/decode_dev_other_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/log/decode.$SLURM_ARRAY_TASK_ID.log
if [ "$CUDA_VISIBLE_DEVICES" == "NoDevFiles" ]; then
  ( echo CUDA_VISIBLE_DEVICES set to NoDevFiles, unsetting it... 
  )>>exp/train_librispeech_10min_pytorch_base_from_scratch_bs4_accum4_maskchannel0.25/decode_dev_other_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/log/decode.$SLURM_ARRAY_TASK_ID.log
  unset CUDA_VISIBLE_DEVICES
fi
time1=`date +"%s"`
 ( asr_recog.py --config conf/decode_w2v2_ctc_1.0_ins1_beam50_lm0.yaml --ngpu 0 --backend pytorch --debugmode 1 --verbose 0 --recog-json /rds/user/xy316/hpc-work/mphil/espnet/egs/librispeech/asr1/decode_w2v2/dev_other/split100utt/data.${SLURM_ARRAY_TASK_ID}.json --result-label exp/train_librispeech_10min_pytorch_base_from_scratch_bs4_accum4_maskchannel0.25/decode_dev_other_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/data.${SLURM_ARRAY_TASK_ID}.json --model exp/train_librispeech_10min_pytorch_base_from_scratch_bs4_accum4_maskchannel0.25/results/snapshot.ep.3900  ) &>>exp/train_librispeech_10min_pytorch_base_from_scratch_bs4_accum4_maskchannel0.25/decode_dev_other_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/log/decode.$SLURM_ARRAY_TASK_ID.log
ret=$?
sync || true
time2=`date +"%s"`
echo '#' Accounting: begin_time=$time1 >>exp/train_librispeech_10min_pytorch_base_from_scratch_bs4_accum4_maskchannel0.25/decode_dev_other_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/log/decode.$SLURM_ARRAY_TASK_ID.log
echo '#' Accounting: end_time=$time2 >>exp/train_librispeech_10min_pytorch_base_from_scratch_bs4_accum4_maskchannel0.25/decode_dev_other_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/log/decode.$SLURM_ARRAY_TASK_ID.log
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/train_librispeech_10min_pytorch_base_from_scratch_bs4_accum4_maskchannel0.25/decode_dev_other_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/log/decode.$SLURM_ARRAY_TASK_ID.log
echo '#' Finished at `date` with status $ret >>exp/train_librispeech_10min_pytorch_base_from_scratch_bs4_accum4_maskchannel0.25/decode_dev_other_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/log/decode.$SLURM_ARRAY_TASK_ID.log
[ $ret -eq 137 ] && exit 100;
touch exp/train_librispeech_10min_pytorch_base_from_scratch_bs4_accum4_maskchannel0.25/decode_dev_other_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/q/done.112967.$SLURM_ARRAY_TASK_ID
exit $[$ret ? 1 : 0]
## submitted with:
# sbatch --export=PATH --no-requeue  --time=1:00:00 --account=MLMI-xy316-SL2-CPU  -p cclake  --open-mode=append -e exp/train_librispeech_10min_pytorch_base_from_scratch_bs4_accum4_maskchannel0.25/decode_dev_other_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/q/decode.log -o exp/train_librispeech_10min_pytorch_base_from_scratch_bs4_accum4_maskchannel0.25/decode_dev_other_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/q/decode.log --array 1-100 /rds/user/xy316/hpc-work/mphil/espnet/egs/librispeech/asr1/exp/train_librispeech_10min_pytorch_base_from_scratch_bs4_accum4_maskchannel0.25/decode_dev_other_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/q/decode.sh >>exp/train_librispeech_10min_pytorch_base_from_scratch_bs4_accum4_maskchannel0.25/decode_dev_other_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/q/decode.log 2>&1
