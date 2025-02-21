aws ec2 create-security-group \
    --group-name PrivateAPI-SG \
    --description "Security group for Private API Gateway VPC endpoint" \
    --vpc-id <vpc-id> \
    --region us-east-1



aws ec2 authorize-security-group-ingress \
    --group-id <sg-id> \
    --protocol tcp \
    --port 443 \
    --cidr 10.1.0.0/16 \
    --region us-east-1


aws ec2 create-vpc-endpoint \
    --vpc-id <vpc-id> \
    --service-name com.amazonaws.us-east-1.execute-api \
    --vpc-endpoint-type Interface \
    --subnet-ids <subnet-id-private> <subnet-id-private> \
    --security-group-ids <sg-id> \
    --private-dns-enabled \
    --region us-east-1
