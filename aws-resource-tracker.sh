#!/bin/bash

#################################
#
#
# Author : Harishankar
# date : Jan 2025
#
# use-case : AWS resource usage report
#
#
# ################################
#
# 1. AWS S3 bucket
# 2. AWS EC2 instance
# 3. AWS lambda
# 4. AWS IAM users

#######################################################
set -x

# checking the number of arguments passed #
if [$# -ne 2]
then
  echo "Usage: $0 <region> <service-name>"
  exit 1
fi

# Assigning the arguments to variables #
region=$1
service=$2

# checking the aws cli installation #
if ! command -v aws &> /dev/null
then
    echo "AWS CLI could not installed. Please install the AWS CLI"
    exit 1
fi

# checking the aws cli configuration #

if [ ! -d ~/.aws ]
then
  echo "AWS CLI is not configured. Please configure the AWS CLI"
  exit 1
fi

# Listing the resources based on the service name #

case aws $service in
  s3)
    echo "Below is the list of s3 buckets"
    aws s3 ls --region $region
    ;;

  ec2)
    echo "Below is the list of ec2 instances"
    aws ec2 describe-instances --region $region
    ;;

  lambda)
    echo "Below is the list of lambda functions"
    aws lambda list-functions --region $region
    ;;

  iam)
    echo "Below is the list of IAM users"
    aws iam list-users --region $region
    ;;

  *)
    echo "Invalid service name"
    exit 1
    ;;
esac 
