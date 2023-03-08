Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69DED6AFEA0
	for <lists+linux-usb@lfdr.de>; Wed,  8 Mar 2023 06:54:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbjCHFy1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Mar 2023 00:54:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjCHFy0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Mar 2023 00:54:26 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E3A7DA5
        for <linux-usb@vger.kernel.org>; Tue,  7 Mar 2023 21:54:25 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3280E1Cq017904;
        Wed, 8 Mar 2023 05:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=p3+DB5qTURKjWSY+/Z/EKD10Ss80pTfuHRdEbPvzROc=;
 b=MJoslHLU/oMIjXjy63u4oNTgVpOUkxwOPYhxy3JyDfkv9uFlUYV62LxiQfXIUSXRBQY+
 eh/hyrigtXUTYuATwnMFtjSIG6NxXiWtZ7aUPXdndPFX4+uynbD8oq18UPobdGNnMVzn
 CZBTmXFkEarTjN8RlBnTv7r431/1tiCfaPRLESCIsuZYaEo6msDrSCE4OMjqrE9QKEPI
 HEf+yuaG0TcmrhU1P4FJ3kfXTnMtK8E0PqKn6Y+wnObeY7k/c289lYHj/C3mh/9zgF7H
 DDnl02MiVmijT2JJOyo9Oejf4WgAczxW0rp2/1barWvn1f7Q4iLr8JMuOjxvoVIQEypS RQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p6fmm0n29-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 08 Mar 2023 05:54:21 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3285sK3j015040
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 8 Mar 2023 05:54:20 GMT
Received: from [10.239.154.244] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 7 Mar 2023
 21:54:18 -0800
Message-ID: <dc7af7b0-1e63-6662-3465-a4ec79cc265d@quicinc.com>
Date:   Wed, 8 Mar 2023 13:54:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 2/2] usb: core: hub: avoid reset hub during probe
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "Pratham Pratap" <quic_ppratap@quicinc.com>
References: <1677835718-7405-1-git-send-email-quic_linyyuan@quicinc.com>
 <1677835718-7405-2-git-send-email-quic_linyyuan@quicinc.com>
 <72b4e199-4e23-487e-a9cd-8d41993d4944@rowland.harvard.edu>
Content-Language: en-US
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <72b4e199-4e23-487e-a9cd-8d41993d4944@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 99pP32aQYUOJZ3i-m2SB48JMaucB9ktY
X-Proofpoint-ORIG-GUID: 99pP32aQYUOJZ3i-m2SB48JMaucB9ktY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_02,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0
 mlxscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303080050
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 3/4/2023 12:05 AM, Alan Stern wrote:
> On Fri, Mar 03, 2023 at 05:28:38PM +0800, Linyu Yuan wrote:
>> When start probe hub, during INIT, INTT2, INIT3 stage, when link state
>> change to inactive, currently it will reset the device, maybe it will
>> trigger warning in usb_submit_urb() due to urb->hcpriv is still active.
> You need to explain this in much greater detail.
>
> 	What will reset the device?
>
> 	What is the code path for this reset?

will share more code path.


>
> 	Why will urb->hcpriv still be active?


still can't explain, that's why add patch#1 to get more urb infol


>> Add a flag name init_stage to avoid reset the device.
> Why do you want to avoid resetting the device?


at INIT stage, external hub still under enumeration process, i think 
there is no need to reset.


>
> Doesn't the reset code already include a check for whether the device is
> disconnected?


the problem is port is inactive state, but device still in software 
connect state,

there is no disconnect check in reset code.


>
>> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
>> ---
>>   drivers/usb/core/hub.c | 20 +++++++++++++++++++-
>>   drivers/usb/core/hub.h |  1 +
>>   2 files changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
>> index 97a0f8f..3cb1137 100644
>> --- a/drivers/usb/core/hub.c
>> +++ b/drivers/usb/core/hub.c
>> @@ -1290,6 +1290,7 @@ static void hub_activate(struct usb_hub *hub, enum hub_activation_type type)
>>   	if (type == HUB_INIT2 || type == HUB_INIT3) {
>>   		/* Allow autosuspend if it was suppressed */
>>    disconnected:
>> +		hub->init_stage = 0;
>>   		usb_autopm_put_interface_async(to_usb_interface(hub->intfdev));
>>   		device_unlock(&hdev->dev);
>>   	}
>> @@ -1872,6 +1873,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
>>   	kref_init(&hub->kref);
>>   	hub->intfdev = &intf->dev;
>>   	hub->hdev = hdev;
>> +	hub->init_stage = 1;
>>   	INIT_DELAYED_WORK(&hub->leds, led_work);
>>   	INIT_DELAYED_WORK(&hub->init_work, NULL);
>>   	INIT_WORK(&hub->events, hub_event);
>> @@ -5587,6 +5589,21 @@ static void port_over_current_notify(struct usb_port *port_dev)
>>   	kfree(port_dev_path);
>>   }
>>   
>> +static bool port_child_avoid_reset(struct usb_device *udev)
>> +{
>> +	struct usb_hub *hub;
>> +
>> +	if (udev->descriptor.bDeviceClass == USB_CLASS_HUB &&
>> +	    udev->state == USB_STATE_CONFIGURED) {
>> +		hub = usb_get_intfdata(udev->actconfig->interface[0]);
>> +
>> +		if (hub && hub->init_stage)
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>>   static void port_event(struct usb_hub *hub, int port1)
>>   		__must_hold(&port_dev->status_lock)
>>   {
>> @@ -5699,7 +5716,8 @@ static void port_event(struct usb_hub *hub, int port1)
>>   			dev_dbg(&port_dev->dev, "do warm reset, full device\n");
>>   			usb_unlock_port(port_dev);
>>   			usb_lock_device(udev);
>> -			usb_reset_device(udev);
>> +			if (!port_child_avoid_reset(udev))
>> +				usb_reset_device(udev);
>>   			usb_unlock_device(udev);
> Doesn't usb_lock_device() already prevent this code from running during
> the INIT, INIT2, and INIT3 stages of hub preparation?


as it use some delay worker to complete the INIT stage, as i know it 
will not lock device

when worker is not start.

do you have any better suggestion about this point ?


>
> Alan Stern
