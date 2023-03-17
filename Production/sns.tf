#Default_CloudWatch_Alarms_Topic

resource "aws_sns_topic" "Default_CloudWatch_Alarms_Topic" {
  name="Default_CloudWatch_Alarms_Topic"
}

data "aws_sns_topic" "Default_CloudWatch_Alarms_Topic_update" {
  name=aws_sns_topic.Default_CloudWatch_Alarms_Topic.name
}

resource "aws_sns_topic_subscription" "Default_CloudWatch_Alarms_Topic_sqs_target" {
  topic_arn = data.aws_sns_topic.Default_CloudWatch_Alarms_Topic_update.arn
  protocol = "email"
  endpoint = "rohidasj@cybage.com"
}