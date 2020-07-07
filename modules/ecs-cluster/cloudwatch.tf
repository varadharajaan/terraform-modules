#
# Cloudwatch logs
#
resource "aws_cloudwatch_log_group" "cluster" {
  name = var.LOG_GROUP
  retention_in_days = 30
}

resource "aws_cloudwatch_log_stream" "sb_log_stream" {
  name           = "sb-log-stream"
  log_group_name = "${aws_cloudwatch_log_group.cluster.name}"
}