Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 927836EEC29
	for <lists+linux-usb@lfdr.de>; Wed, 26 Apr 2023 03:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239007AbjDZBzc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Apr 2023 21:55:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238588AbjDZBzb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Apr 2023 21:55:31 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C81A122
        for <linux-usb@vger.kernel.org>; Tue, 25 Apr 2023 18:55:30 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33Q1Lknx024435;
        Wed, 26 Apr 2023 01:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=PaQv8s3ARNLYR5GOx0OTY2T4KZpcsvmCPg0A+KmW9j0=;
 b=K5d/0voxFgsmd3O/ZLwfbSyF2sMMgY/1xdGPzizADyN332EMqGP/WOhou2tiM6poAxAR
 VmWJRLt6im+HdJ2wJBXFwZXKL2StFIGaPwQi+enWDBUFOwL/8pryJHe1e96+jbgO8jN2
 MIBOcBA+uTTWyv8n93nBAeVSCR5b78Mo7CrjRgsicpvySIAw4SiDLdQcU4Xo9PfK05Uo
 xw5obr46afeNfmF5AAyyhqZXQSvFxhO0xVMSe0lK9cFsLz4lNyCoF/L/s3EsmjJX659y
 B/xyBieLuDSGpDcjqJHvdOR8FLuR3dHv/NkveOGUnAUoF1w7e51Gvsi2rw5bPKmGXUOZ +Q== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6f6csq36-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Apr 2023 01:55:27 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33Q1tRMK001923
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Apr 2023 01:55:27 GMT
Received: from [10.239.154.244] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 25 Apr
 2023 18:55:26 -0700
Message-ID: <4c46bb49-8621-444a-b4e4-ec41a6b715fb@quicinc.com>
Date:   Wed, 26 Apr 2023 09:55:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4] usb: dwc3: update link state on each device level
 interrupt
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <1682393256-15572-1-git-send-email-quic_linyyuan@quicinc.com>
 <20230426004149.kd6ndy6b2ncpaokv@synopsys.com>
Content-Language: en-US
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <20230426004149.kd6ndy6b2ncpaokv@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3-7ZEbizbVFSK1BKX22G_dPouQjJ4QUf
X-Proofpoint-GUID: 3-7ZEbizbVFSK1BKX22G_dPouQjJ4QUf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_11,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260016
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 4/26/2023 8:41 AM, Thinh Nguyen wrote:
> On Tue, Apr 25, 2023, Linyu Yuan wrote:
>> When work in gadget mode, currently driver doesn't update software level
>> link_state correctly as link state change event is not enabled for most
>> devices, in function dwc3_gadget_suspend_interrupt(), it will only pass
>> suspend event to UDC core when software level link state changes, so when
>> interrupt generated in sequences of suspend -> reset -> conndone ->
>> suspend, link state is not updated during reset and conndone, so second
>> suspend interrupt event will not pass to UDC core.
>>
>> As in gadget mode, device level interrupt event have link state
>> information, let's trust it and update software level link state to it
>> when process each device level interrupt.
>>
>> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
>> ---
>>
>> v4: (refer v3 https://urldefense.com/v3/__https://lore.kernel.org/linux-usb/1682053861-21737-1-git-send-email-quic_linyyuan@quicinc.com/__;!!A4F2R9G_pg!a12WTwnynMWevTe8tSyxx3MoF0XhKz9k38CjFuYKOc2vD19DEMloyUsVztwSyMqoNepUxoxv6DvVIqK777AtShabXLCHgg$ )
>> 1) remove link state checking in dwc3_gadget_wakeup_interrupt()
>> 2) remove two switch/case to if opeartion
>>
>> v3: (refer v2 https://urldefense.com/v3/__https://lore.kernel.org/linux-usb/1682042472-21222-1-git-send-email-quic_linyyuan@quicinc.com/__;!!A4F2R9G_pg!a12WTwnynMWevTe8tSyxx3MoF0XhKz9k38CjFuYKOc2vD19DEMloyUsVztwSyMqoNepUxoxv6DvVIqK777AtShZcfcckDg$ )
>> no code change since v2, changes compare v1 as below,
>> 1) add a flag suspend_irq_happen to simplify dwc3_gadget_suspend_interrupt(),
>>     it will avoid refer to software level link_state, finally link_state will
>>     only used in dwc3_gadget_linksts_change_interrupt().
>> 2) remove sw setting of link_state in dwc3_gadget_func_wakeup()
>> 3) add dwc3_gadget_interrupt_early() to correct setting of link_state
>>     and suspend_irq_happen.
>>
>> v2: update according v1 discussion
>> v1: https://urldefense.com/v3/__https://lore.kernel.org/linux-usb/1675221286-23833-1-git-send-email-quic_linyyuan@quicinc.com/__;!!A4F2R9G_pg!a12WTwnynMWevTe8tSyxx3MoF0XhKz9k38CjFuYKOc2vD19DEMloyUsVztwSyMqoNepUxoxv6DvVIqK777AtShY6L1v3RA$
>>
>>   drivers/usb/dwc3/core.h   |  1 +
>>   drivers/usb/dwc3/gadget.c | 30 ++++++++++++++++++------------
>>   2 files changed, 19 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
>> index d56457c..8622f9c 100644
>> --- a/drivers/usb/dwc3/core.h
>> +++ b/drivers/usb/dwc3/core.h
>> @@ -1332,6 +1332,7 @@ struct dwc3 {
>>   	unsigned		dis_split_quirk:1;
>>   	unsigned		async_callbacks:1;
>>   	unsigned		wakeup_configured:1;
>> +	unsigned		suspend_irq_happen:1;


will change to suspended and document it.


> Still not documenting this... Why?
>
>>   
>>   	u16			imod_interval;
>>   
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index c0ca4d1..9dc64a4 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -2440,7 +2440,6 @@ static int dwc3_gadget_func_wakeup(struct usb_gadget *g, int intf_id)
>>   			return -EINVAL;
>>   		}
>>   		dwc3_resume_gadget(dwc);
>> -		dwc->link_state = DWC3_LINK_STATE_U0;
>>   	}
>>   
>>   	ret = dwc3_send_gadget_generic_command(dwc, DWC3_DGCMD_DEV_NOTIFICATION,
>> @@ -4178,7 +4177,7 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
>>   	 */
>>   }
>>   
>> -static void dwc3_gadget_wakeup_interrupt(struct dwc3 *dwc, unsigned int evtinfo)
>> +static void dwc3_gadget_wakeup_interrupt(struct dwc3 *dwc)
>>   {
>>   	/*
>>   	 * TODO take core out of low power mode when that's
>> @@ -4190,8 +4189,6 @@ static void dwc3_gadget_wakeup_interrupt(struct dwc3 *dwc, unsigned int evtinfo)
>>   		dwc->gadget_driver->resume(dwc->gadget);
>>   		spin_lock(&dwc->lock);
>>   	}
>> -
>> -	dwc->link_state = evtinfo & DWC3_LINK_STATE_MASK;
>>   }
>>   
>>   static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
>> @@ -4298,20 +4295,29 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
>>   	dwc->link_state = next;
>>   }
>>   
>> -static void dwc3_gadget_suspend_interrupt(struct dwc3 *dwc,
>> -					  unsigned int evtinfo)
>> +static void dwc3_gadget_suspend_interrupt(struct dwc3 *dwc)
>>   {
>> -	enum dwc3_link_state next = evtinfo & DWC3_LINK_STATE_MASK;
>> -
>> -	if (dwc->link_state != next && next == DWC3_LINK_STATE_U3)
>> +	if (!dwc->suspend_irq_happen) {
>> +		dwc->suspend_irq_happen = true;
>>   		dwc3_suspend_gadget(dwc);
>> +	}
>> +}
>>   
>> -	dwc->link_state = next;
>> +static inline void dwc3_gadget_interrupt_early(struct dwc3 *dwc,
>> +			const struct dwc3_event_devt *event)
>> +{
>> +	if (event->type != DWC3_DEVICE_EVENT_LINK_STATUS_CHANGE)
>> +		dwc->link_state = event->event_info & DWC3_LINK_STATE_MASK;
>> +
>> +	if  (event->type != DWC3_DEVICE_EVENT_SUSPEND)
>> +		dwc->suspend_irq_happen = false;
>>   }
>>   
>>   static void dwc3_gadget_interrupt(struct dwc3 *dwc,
>>   		const struct dwc3_event_devt *event)
>>   {
>> +	dwc3_gadget_interrupt_early(dwc, event);
>> +
> This may cause regression for the quirk for dwc_usb3 v2.50a and
> previous as noted earlier. Why are you still doing it like this?


do you have concern of below code ?


static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc, 
unsigned int evtinfo)

...

     pwropt = DWC3_GHWPARAMS1_EN_PWROPT(dwc->hwparams.hwparams1);
     if (DWC3_VER_IS_PRIOR(DWC3, 250A) &&
             (pwropt != DWC3_GHWPARAMS1_EN_PWROPT_HIB)) {
         if ((dwc->link_state == DWC3_LINK_STATE_U3) &&
                 (next == DWC3_LINK_STATE_RESUME)) {
             return;
         }
     }


seem when DWC3_LINK_STATE_RESUME happen, it didn't update old link state.


do we need to add one new variable like old_link_state ?


then let's keep the idea that link_state represent state in each device 
level interrupt.


>
> BR,
> Thinh
>
>>   	switch (event->type) {
>>   	case DWC3_DEVICE_EVENT_DISCONNECT:
>>   		dwc3_gadget_disconnect_interrupt(dwc);
>> @@ -4323,7 +4329,7 @@ static void dwc3_gadget_interrupt(struct dwc3 *dwc,
>>   		dwc3_gadget_conndone_interrupt(dwc);
>>   		break;
>>   	case DWC3_DEVICE_EVENT_WAKEUP:
>> -		dwc3_gadget_wakeup_interrupt(dwc, event->event_info);
>> +		dwc3_gadget_wakeup_interrupt(dwc);
>>   		break;
>>   	case DWC3_DEVICE_EVENT_HIBER_REQ:
>>   		dev_WARN_ONCE(dwc->dev, true, "unexpected hibernation event\n");
>> @@ -4334,7 +4340,7 @@ static void dwc3_gadget_interrupt(struct dwc3 *dwc,
>>   	case DWC3_DEVICE_EVENT_SUSPEND:
>>   		/* It changed to be suspend event for version 2.30a and above */
>>   		if (!DWC3_VER_IS_PRIOR(DWC3, 230A))
>> -			dwc3_gadget_suspend_interrupt(dwc, event->event_info);
>> +			dwc3_gadget_suspend_interrupt(dwc);
>>   		break;
>>   	case DWC3_DEVICE_EVENT_SOF:
>>   	case DWC3_DEVICE_EVENT_ERRATIC_ERROR:
>> -- 
>> 2.7.4
