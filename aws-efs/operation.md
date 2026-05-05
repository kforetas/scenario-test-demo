# EFS set up Guide
https://rheb.hatenablog.com/entry/202412-rosa-efs-ecr#ROSA%E5%81%B4%E3%81%AE%E6%BA%96%E5%82%99
## IAM Policy
- cat <<EOF > efs-policy.json
- aws iam create-policy \
  --policy-name rosa-efs-csi-policy \
  --policy-document file://./efs-policy.json \
  --query 'Policy.Arn' --output text
arn:aws:iam::${AWS_ACCOUNT_ID}:policy/rosa-efs-csi-policy
## IAM Role
- rosa list oidc-providers
arn:aws:iam::${AWS_ACCOUNT_ID}:oidc-provider/oidc.op1.openshiftapps.com/${OIDC_Provider_ID}
- cat <<EOF > efs-trust.json
- aws iam create-role \
  --role-name rosa-efs-csi-role \
  --assume-role-policy-document file://./efs-trust.json \
  --query "Role.Arn" --output text
arn:aws:iam::${AWS_ACCOUNT_ID}:role/rosa-efs-csi-role
- aws iam attach-role-policy \
  --role-name rosa-efs-csi-role \
  --policy-arn arn:aws:iam::${AWS_ACCOUNT_ID}:policy/rosa-efs-csi-policy
## EFS作成
- ファイルシステム作成/カスタマイズ
- ネットワーク：WorkerNodeが利用するプライベートサブネットIDを指定する。セキュリティグループはデフォルトでいい
- ファイルシステムポリシーはデフォルト
- ネットワークで指定したセキュリティグループのインバウンドにNFS（2049port）をSource:「10.0.0.0/16」で追加
## ROSA設定
- Operator: AWS EFS CSIをインストール/ロールARNに「arn:aws:iam::${AWS_ACCOUNT_ID}:role/rosa-efs-csi-role」を設定する
- 「efs.csi.aws.com」のClusterCSIDriverの作成（efs-csi-aws-com.yaml）
「CustomResourceDefinitions」から「ClusterCSIDriver」をクリックして、「インスタンス」タブの「ClusterCSIDriverの作成」
- 「efs-csi」のStorageClassesの作成(efs-csi.yaml)
## TEST
- 「test-project01」のテストNameSpace作成
- 「test-pvc-01」のPVC作成（efs-csi, RWX, 1GB）
- 「test-efs-01」のテストPod起動

