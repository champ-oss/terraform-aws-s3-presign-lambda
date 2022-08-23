import boto3


def handler(event, _):
    print('Event:', event)
    s3_client = boto3.client('s3')
    response = s3_client.generate_presigned_post(
        Bucket=event['bucket'],
        Key=event['key'],
        Fields=event['fields'],
        Conditions=event['conditions'],
        ExpiresIn=event['expiration'])
    return response
