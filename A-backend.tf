
terraform {
    backend "s3" {
        bucket = "jasopstokyo"
        key = "MyLinuxBox"
        region = "ap-northeast-1"      
}
}

