Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B44B68CF13
	for <lists+linux-usb@lfdr.de>; Tue,  7 Feb 2023 06:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbjBGFpH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Feb 2023 00:45:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjBGFpF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Feb 2023 00:45:05 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B152914E8C
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 21:45:04 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31759UrU004029;
        Tue, 7 Feb 2023 05:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=jEyvkf+ElU5NspifgYixYA5yGuDzl9mSl/Rb2k+4dhY=;
 b=WJOJNBF75l2KKTukVMQ9bepceIT7v0U0TtglEyP3YhUlElp6Eb6QZ8O3v6jx90wFQKCx
 fk2jbRoaOZUAJ6CR1ChJ46uj/w+M89XjRwQdGOzSEw9n5vawrlwo41GEIolRdKO3OCgl
 5QwDE/gVNNictext+c/6YgMemtPRJ/VGSBXviZC/x9TgBPei6sBs+8/P/6V/QAvhHSbI
 0WAVn892xOkHQfgM+5KHg5T79DoB47o2/1leeNlnuYNgx9RAM7iouhruVGE+YbU9V9Vc
 htfNiPrKMXz6C0vod+ialZPETqZskOVrSBYEe8kJ9BNhQlLd/Xv7SQF58pO7vR36BDW+ TQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nhd2qdnp9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 07 Feb 2023 05:45:02 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3175j2Ue012871
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 7 Feb 2023 05:45:02 GMT
Received: from [10.239.154.244] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 21:45:00 -0800
Message-ID: <fad64df7-1963-f4db-3ee1-0e2a764d4d0f@quicinc.com>
Date:   Tue, 7 Feb 2023 13:44:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH] usb: typec: ucsi: change role command to async write
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
References: <1675158735-2757-1-git-send-email-quic_linyyuan@quicinc.com>
 <Y9on3G7gXGEAN6oG@kuha.fi.intel.com>
 <7bada92d-2aab-62b2-8981-9461ebf3c88a@quicinc.com>
 <Y9uw2Q9m++/fIA+M@kuha.fi.intel.com>
Content-Language: en-US
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <Y9uw2Q9m++/fIA+M@kuha.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: As73WjDG1TGf6Yc9encqXTqcjz-eK6Rw
X-Proofpoint-GUID: As73WjDG1TGf6Yc9encqXTqcjz-eK6Rw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070051
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 2/2/2023 8:47 PM, Heikki Krogerus wrote:
> On Thu, Feb 02, 2023 at 05:57:58PM +0800, Linyu Yuan wrote:
>> On 2/1/2023 4:50 PM, Heikki Krogerus wrote:
>>> On Tue, Jan 31, 2023 at 05:52:15PM +0800, Linyu Yuan wrote:
>>>> In ucsi_dr_swap() and ucsi_pr_swap(), it will wait complete.
>>>> it is better change role switch command to async mode which will avoid
>>>> reset ppm in condition that data/power switch can't operate.
>>> I think I need a little bit more information. Reseting the whole PPM
>>> is a heavy operation, I do admit that, but you are not really
>>> explaining what happens in your case when the driver does it - why is
>>> it a problem?
>>
>> the case i can think is connect a mobile device to PC through USB A-C cable,
>>
>> and run data role switch command on mobile device, it definitely will fail,
>> right ?
>>
>> the problem is if ppm can't response reset timely, the data role switch will
>> exit after 10 seconds,
>>
>> it is very long time.
> So the problem is that it takes too long? If that is really a problem,
> then just consider removing the resets. Don't try to use tricks like
> this.


is there any PPM product from intel support data/power role switch ?

seem PPM firmware didn't work very well if there is no reset.


  static int ucsi_role_cmd(struct ucsi_connector *con, u64 command)
  {
-    int ret;
-
-    ret = ucsi_send_command(con->ucsi, command, NULL, 0);
-    if (ret == -ETIMEDOUT) {
-        u64 c;
-
-        /* PPM most likely stopped responding. Resetting everything. */
-        ucsi_reset_ppm(con->ucsi);
-
-        c = UCSI_SET_NOTIFICATION_ENABLE | con->ucsi->ntfy;
-        ucsi_send_command(con->ucsi, c, NULL, 0);
-
-        ucsi_reset_connector(con, true);
-    }
-
-    return ret;
+    return ucsi_send_command(con->ucsi, command, NULL, 0);
  }


>>> The proposal of using async_write here is in any case not acceptable.
>>> You would now end up generationg a spurious command completion event
>>> that can in worst case will screws up some other command.
>> do you mean other command can run before role switch command operation ?
> Both role swap operations release the connector lock after sending the
> role swap command, and then start waiting for the completion. That
> wait would now almoust always timeout because the underlying driver
> does not know that there is a command pending. The only case where it
> would not timeout is if there is an other command that is queued after
> the role swap. In that case the role swap would hog the completion of
> that other command.
>
> Do not call the IO callbacks directly! Always use ucsi_send_command()
> instead. That will guarantee that the CCI is always checked and that
> errors are handled if there are any.


thanks for explanation.


>
>>> If the PPM reset is the problem here, then perhaps the proper thing to
>>> do would be to remove that instead?
>>>
>>> thanks,
>>>
>>>> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
>>>> ---
>>>>    drivers/usb/typec/ucsi/ucsi.c | 12 ++++++++----
>>>>    1 file changed, 8 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
>>>> index 00fc867..466ae93 100644
>>>> --- a/drivers/usb/typec/ucsi/ucsi.c
>>>> +++ b/drivers/usb/typec/ucsi/ucsi.c
>>>> @@ -997,17 +997,21 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
>>>>    static int ucsi_role_cmd(struct ucsi_connector *con, u64 command)
>>>>    {
>>>> +	struct ucsi *ucsi = con->ucsi;
>>>>    	int ret;
>>>> -	ret = ucsi_send_command(con->ucsi, command, NULL, 0);
>>>> +	mutex_lock(&ucsi->ppm_lock);
>>>> +	ret = ucsi->ops->async_write(ucsi, UCSI_CONTROL, &command, sizeof(command));
>>>> +	mutex_unlock(&ucsi->ppm_lock);
>>>> +
>>>>    	if (ret == -ETIMEDOUT) {
>>>>    		u64 c;
>>>>    		/* PPM most likely stopped responding. Resetting everything. */
>>>> -		ucsi_reset_ppm(con->ucsi);
>>>> +		ucsi_reset_ppm(ucsi);
>>>> -		c = UCSI_SET_NOTIFICATION_ENABLE | con->ucsi->ntfy;
>>>> -		ucsi_send_command(con->ucsi, c, NULL, 0);
>>>> +		c = UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;
>>>> +		ucsi_send_command(ucsi, c, NULL, 0);
>>>>    		ucsi_reset_connector(con, true);
>>>>    	}
>>>> -- 
>>>> 2.7.4
