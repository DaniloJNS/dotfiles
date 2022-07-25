function aws_eks
    if ! test -e ~/.aws/credentials
        mkdir ~/.aws
    end

    nvim ~/.aws/credentials

    zsh -c "awsume $argv"
    aws eks --region sa-east-1 update-kubeconfig --name $argv
end
