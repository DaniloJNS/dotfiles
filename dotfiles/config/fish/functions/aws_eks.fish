function aws_eks
    if ! test -e ~/.aws/credentials
        mkdir ~/.aws
    end

    nvim ~/.aws/credentials

    awsume $argv

    aws eks --region sa-east0 update-kubeconfig --name $argv
end
