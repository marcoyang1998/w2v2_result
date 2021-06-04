#!/bin/bash
cd /rds/user/xy316/hpc-work/mphil/espnet/egs/librispeech/asr1
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  set | grep SLURM | while read line; do echo "# $line"; done
  echo -n '# '; cat <<EOF
asr_recog.py --config conf/decode_w2v2_ctc_1.0_ins1_beam50_lm0.yaml --ngpu 0 --backend pytorch --debugmode 1 --verbose 0 --recog-json /rds/user/xy316/hpc-work/mphil/espnet/egs/librispeech/asr1/decode_w2v2/test_clean/split100utt/data.${SLURM_ARRAY_TASK_ID}.json --result-label /home/xy316/rds/hpc-work/mphil/espnet/egs/librispeech/asr1/exp/finetuned_10min/decode_test_clean_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/data.${SLURM_ARRAY_TASK_ID}.json --model /home/xy316/rds/hpc-work/mphil/espnet/egs/librispeech/asr1/exp/finetuned_10min/results/w2v2_10min 
EOF
) >/home/xy316/rds/hpc-work/mphil/espnet/egs/librispeech/asr1/exp/finetuned_10min/decode_test_clean_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/log/decode.$SLURM_ARRAY_TASK_ID.log
if [ "$CUDA_VISIBLE_DEVICES" == "NoDevFiles" ]; then
  ( echo CUDA_VISIBLE_DEVICES set to NoDevFiles, unsetting it... 
  )>>/home/xy316/rds/hpc-work/mphil/espnet/egs/librispeech/asr1/exp/finetuned_10min/decode_test_clean_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/log/decode.$SLURM_ARRAY_TASK_ID.log
  unset CUDA_VISIBLE_DEVICES
fi
time1=`date +"%s"`
 ( asr_recog.py --config conf/decode_w2v2_ctc_1.0_ins1_beam50_lm0.yaml --ngpu 0 --backend pytorch --debugmode 1 --verbose 0 --recog-json /rds/user/xy316/hpc-work/mphil/espnet/egs/librispeech/asr1/decode_w2v2/test_clean/split100utt/data.${SLURM_ARRAY_TASK_ID}.json --result-label /home/xy316/rds/hpc-work/mphil/espnet/egs/librispeech/asr1/exp/finetuned_10min/decode_test_clean_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/data.${SLURM_ARRAY_TASK_ID}.json --model /home/xy316/rds/hpc-work/mphil/espnet/egs/librispeech/asr1/exp/finetuned_10min/results/w2v2_10min  ) &>>/home/xy316/rds/hpc-work/mphil/espnet/egs/librispeech/asr1/exp/finetuned_10min/decode_test_clean_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/log/decode.$SLURM_ARRAY_TASK_ID.log
ret=$?
sync || true
time2=`date +"%s"`
echo '#' Accounting: begin_time=$time1 >>/home/xy316/rds/hpc-work/mphil/espnet/egs/librispeech/asr1/exp/finetuned_10min/decode_test_clean_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/log/decode.$SLURM_ARRAY_TASK_ID.log
echo '#' Accounting: end_time=$time2 >>/home/xy316/rds/hpc-work/mphil/espnet/egs/librispeech/asr1/exp/finetuned_10min/decode_test_clean_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/log/decode.$SLURM_ARRAY_TASK_ID.log
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>/home/xy316/rds/hpc-work/mphil/espnet/egs/librispeech/asr1/exp/finetuned_10min/decode_test_clean_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/log/decode.$SLURM_ARRAY_TASK_ID.log
echo '#' Finished at `date` with status $ret >>/home/xy316/rds/hpc-work/mphil/espnet/egs/librispeech/asr1/exp/finetuned_10min/decode_test_clean_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/log/decode.$SLURM_ARRAY_TASK_ID.log
[ $ret -eq 137 ] && exit 100;
touch /home/xy316/rds/hpc-work/mphil/espnet/egs/librispeech/asr1/exp/finetuned_10min/decode_test_clean_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/q/done.112308.$SLURM_ARRAY_TASK_ID
exit $[$ret ? 1 : 0]
## submitted with:
# sbatch --export=PATH --no-requeue  --time=1:00:00 --account=MLMI-xy316-SL2-CPU  -p cclake  --open-mode=append -e /home/xy316/rds/hpc-work/mphil/espnet/egs/librispeech/asr1/exp/finetuned_10min/decode_test_clean_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/q/decode.log -o /home/xy316/rds/hpc-work/mphil/espnet/egs/librispeech/asr1/exp/finetuned_10min/decode_test_clean_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/q/decode.log --array 1-100 /home/xy316/rds/hpc-work/mphil/espnet/egs/librispeech/asr1/exp/finetuned_10min/decode_test_clean_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/q/decode.sh >>/home/xy316/rds/hpc-work/mphil/espnet/egs/librispeech/asr1/exp/finetuned_10min/decode_test_clean_decode_w2v2_ctc_1.0_ins1_beam50_lm0_/q/decode.log 2>&1
