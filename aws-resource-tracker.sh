#!/bin/bash

#################################
#
#
# Author : Harishankar
# date : 22 Jan 2025
#
# use-case : AWS resource usage report
#
#
# ################################
#
# AWS S3 bucket
# AWS EC2 instance
# AWS lambda
# AWS IAM users
#
set -x
#
# list of s3 buckets #

echo "Below is the list of s3 buckets"

aws s3 ls

# list of ec2 instances #

echo "Below is the list of ec2 instances"

aws ec2 describe-instances

# list of lambda functions #

echo "Below is the list of lambda functions"

aws lambda-functions

# list of IAM users #

echo "Below is the list of IAM users"

aws iam list-users
