Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F46D68799D
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 10:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232096AbjBBJ6K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 04:58:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232049AbjBBJ6I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 04:58:08 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BE30E387
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 01:58:06 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3129PrEU014209;
        Thu, 2 Feb 2023 09:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=nCgWQ+i+tPVMPBg/9HyrH6EqsQH3+Bofk0wpmJktrXY=;
 b=CoxGQJ2aXP4h8/hzxj6Z642jxtTHy1Sn8j6ckgcaLNUItBzF4Zm0k+ucBvsqXniVFAuK
 urIZcFgCPXMAkvDGaI3HO2uKCDq2sB5eR0Fa0UJe865AqvcCXtxG5iRjlX1ydnGE9EUL
 elDaM/aEw+RMjTQHyQtApu3f5JAgAZ4bb7tAUyvqljijQpFkaymDwHuVu3YCHOG8IkoD
 HMf46syFAK//3Y1ta/Fr7ViqI+WiPQG0LN2fmpRr9fPsIW21a5yEfXG3qPYHgiVtvDm+
 pKsnP+RWOXuVmTXigWKJcR1R8Eu6muGZFk2uC9Ouvj+UDiVq1DsE9jziL43aZjC1ecVZ EQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ngahqr2qr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 02 Feb 2023 09:58:03 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3129w2R1024140
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 2 Feb 2023 09:58:02 GMT
Received: from [10.239.154.244] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 2 Feb 2023
 01:58:00 -0800
Message-ID: <7bada92d-2aab-62b2-8981-9461ebf3c88a@quicinc.com>
Date:   Thu, 2 Feb 2023 17:57:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH] usb: typec: ucsi: change role command to async write
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
References: <1675158735-2757-1-git-send-email-quic_linyyuan@quicinc.com>
 <Y9on3G7gXGEAN6oG@kuha.fi.intel.com>
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <Y9on3G7gXGEAN6oG@kuha.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MStOz_MlAk00OtIMIsngvY4LKvNNI4kh
X-Proofpoint-GUID: MStOz_MlAk00OtIMIsngvY4LKvNNI4kh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_02,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=800 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302020092
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 2/1/2023 4:50 PM, Heikki Krogerus wrote:
> On Tue, Jan 31, 2023 at 05:52:15PM +0800, Linyu Yuan wrote:
>> In ucsi_dr_swap() and ucsi_pr_swap(), it will wait complete.
>> it is better change role switch command to async mode which will avoid
>> reset ppm in condition that data/power switch can't operate.
> I think I need a little bit more information. Reseting the whole PPM
> is a heavy operation, I do admit that, but you are not really
> explaining what happens in your case when the driver does it - why is
> it a problem?


the case i can think is connect a mobile device to PC through USB A-C cable,

and run data role switch command on mobile device, it definitely will 
fail, right ?

the problem is if ppm can't response reset timely, the data role switch 
will exit after 10 seconds,

it is very long time.


>
> The proposal of using async_write here is in any case not acceptable.
> You would now end up generationg a spurious command completion event
> that can in worst case will screws up some other command.


do you mean other command can run before role switch command operation ?


>
> If the PPM reset is the problem here, then perhaps the proper thing to
> do would be to remove that instead?
>
> thanks,
>
>> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
>> ---
>>   drivers/usb/typec/ucsi/ucsi.c | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
>> index 00fc867..466ae93 100644
>> --- a/drivers/usb/typec/ucsi/ucsi.c
>> +++ b/drivers/usb/typec/ucsi/ucsi.c
>> @@ -997,17 +997,21 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
>>   
>>   static int ucsi_role_cmd(struct ucsi_connector *con, u64 command)
>>   {
>> +	struct ucsi *ucsi = con->ucsi;
>>   	int ret;
>>   
>> -	ret = ucsi_send_command(con->ucsi, command, NULL, 0);
>> +	mutex_lock(&ucsi->ppm_lock);
>> +	ret = ucsi->ops->async_write(ucsi, UCSI_CONTROL, &command, sizeof(command));
>> +	mutex_unlock(&ucsi->ppm_lock);
>> +
>>   	if (ret == -ETIMEDOUT) {
>>   		u64 c;
>>   
>>   		/* PPM most likely stopped responding. Resetting everything. */
>> -		ucsi_reset_ppm(con->ucsi);
>> +		ucsi_reset_ppm(ucsi);
>>   
>> -		c = UCSI_SET_NOTIFICATION_ENABLE | con->ucsi->ntfy;
>> -		ucsi_send_command(con->ucsi, c, NULL, 0);
>> +		c = UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;
>> +		ucsi_send_command(ucsi, c, NULL, 0);
>>   
>>   		ucsi_reset_connector(con, true);
>>   	}
>> -- 
>> 2.7.4
