Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13DBC6EDA8A
	for <lists+linux-usb@lfdr.de>; Tue, 25 Apr 2023 05:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232847AbjDYDOx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Apr 2023 23:14:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233192AbjDYDOs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Apr 2023 23:14:48 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D59FB93CA
        for <linux-usb@vger.kernel.org>; Mon, 24 Apr 2023 20:14:43 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33P20nIQ023216;
        Tue, 25 Apr 2023 03:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8yizLy/G+omJqh3ECHXF6KxU4w44xhTaW6c1ONdIRlQ=;
 b=F1/v4R5ISqredfg6BiEjfDxy5OU0OtHDIoWHskciaYFqK5tdc4Hk+a9SuS40MfvV6ZKb
 +4VseOv5wH9CZmCtIW/1CsYc1kjVITNNZatMYcV69m5y/ZzD36plCDcvTxJ6iIisCbxQ
 o3tUNKGH7w6IVWDY3hMSHfo+dL1NSlDXCWpFsML5U9J/EZrfT6LfwxyKf2XbTGTqN8H6
 ZcRiGDq/pQQIiINeDx/R0CuIf8POyWwjbvHAYIpP49W+cEHEi0+1vXTFoFuD2lqabdwF
 2y1/PjqAODb+8eQhRxLDRXjamwlNUb9j7gOYzsPJta07buy8rX5oK2q7x3RlXTjmu/Hz Tg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q5ndpt92b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Apr 2023 03:14:41 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33P3EfN7012180
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Apr 2023 03:14:41 GMT
Received: from [10.239.154.244] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 24 Apr
 2023 20:14:28 -0700
Message-ID: <cac35063-a80a-f039-5bee-331bdef364b9@quicinc.com>
Date:   Tue, 25 Apr 2023 11:14:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] usb: dwc3: update link state on each device level
 interrupt
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <1682053861-21737-1-git-send-email-quic_linyyuan@quicinc.com>
 <20230424215612.vcji26wau4f3plse@synopsys.com>
Content-Language: en-US
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <20230424215612.vcji26wau4f3plse@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3L3B6tE0142QeTd0S46cRDV0FQtbwgSG
X-Proofpoint-ORIG-GUID: 3L3B6tE0142QeTd0S46cRDV0FQtbwgSG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_02,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304250028
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 4/25/2023 5:56 AM, Thinh Nguyen wrote:
> On Fri, Apr 21, 2023, Linyu Yuan wrote:
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
>> v3: (refer v2 https://urldefense.com/v3/__https://lore.kernel.org/linux-usb/1682042472-21222-1-git-send-email-quic_linyyuan@quicinc.com/__;!!A4F2R9G_pg!ZHas9LWZu81rU6xkgMdpCBejHkR05uTBSNFu7zWFFdgX_n_-RAQ7vuuCVAdI5IN17IhGhriXIP2H3y-Fbhk3VT_QE-hQ9Q$ )
>> no code change since v2, changes compare v1 as below,
>> 1) add a flag suspend_irq_happen to simplify dwc3_gadget_suspend_interrupt(),
>>     it will avoid refer to software level link_state, finally link_state will
>>     only used in dwc3_gadget_linksts_change_interrupt().
>> 2) remove sw setting of link_state in dwc3_gadget_func_wakeup()
>> 3) add dwc3_gadget_interrupt_early() to correct setting of link_state
>>     and suspend_irq_happen.
>>
>> v2: update according v1 discussion
>> v1: https://urldefense.com/v3/__https://lore.kernel.org/linux-usb/1675221286-23833-1-git-send-email-quic_linyyuan@quicinc.com/__;!!A4F2R9G_pg!ZHas9LWZu81rU6xkgMdpCBejHkR05uTBSNFu7zWFFdgX_n_-RAQ7vuuCVAdI5IN17IhGhriXIP2H3y-Fbhk3VT95OG0RmA$
>>
>>   drivers/usb/dwc3/core.h   |  1 +
>>   drivers/usb/dwc3/gadget.c | 40 ++++++++++++++++++++++++++++------------
>>   2 files changed, 29 insertions(+), 12 deletions(-)
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
> Can we rename this to suspended. Also, please document new struct
> member.


i don't know if it is good to name suspended,  as there are some power 
management

state like runtime suspend.


>>   
>>   	u16			imod_interval;
>>   
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index 9f492c8..239cfc1 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -2422,7 +2422,6 @@ static int dwc3_gadget_func_wakeup(struct usb_gadget *g, int intf_id)
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
>> @@ -4298,20 +4295,39 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
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
>> +	if (!dwc->suspend_irq_happen && dwc->link_state == DWC3_LINK_STATE_U3) {
> Do we still need to check for dwc->link_state if we use
> suspend_irq_happen flag?


sure, I will remove it and just trust suspend irq.


>
>> +		dwc->suspend_irq_happen = true;
>>   		dwc3_suspend_gadget(dwc);
>> +	}
>> +}
>>   
>> -	dwc->link_state = next;
>> +static inline void dwc3_gadget_interrupt_early(struct dwc3 *dwc,
>> +			const struct dwc3_event_devt *event)
>> +{
>> +	switch (event->type) {
>> +	case DWC3_DEVICE_EVENT_LINK_STATUS_CHANGE:
>> +		break;
>> +	default:
>> +		dwc->link_state = event->event_info & DWC3_LINK_STATE_MASK;
>> +		break;
>> +	}
>> +
>> +	switch (event->type) {
>> +	case DWC3_DEVICE_EVENT_SUSPEND:
>> +		break;
>> +	default:
>> +		dwc->suspend_irq_happen = false;
>> +		break;
>> +	}
> Why 2 switches to the same event->type here? This logic is confusing.


change to two if / else ?  we need to handle alls setting one function,

i don't want to add two functions here.


>
>>   }
>>   
>>   static void dwc3_gadget_interrupt(struct dwc3 *dwc,
>>   		const struct dwc3_event_devt *event)
>>   {
>> +	dwc3_gadget_interrupt_early(dwc, event);
> This is not what we discussed. Previously I suggested to leave the
> dwc->link_state for the quirk (usb_dwc3 revision <2.50a) and not use it
> for other scenarios. The dwc->link_state was used as the _previous_
> captured state, and not the current captured link_state. Now, you
> changed it to the current link_state of an event. Because this old vs
> new link_state was confusing that I suggested not to use it at all out
> side of the quirk context it was in.


still can't fully understand your idea.

if following your suggestion,  and remove usage in 
dwc3_gadget_suspend_interrupt(),

link_state only used in link state change interrupt, we can only think 
it has old link_state meaning.


>
> I believe it's sufficient if we can just use a toggle flag (your
> suspend_irq_happen) to handle your case.
>
> Thanks,
> Thinh
>
>> +
>>   	switch (event->type) {
>>   	case DWC3_DEVICE_EVENT_DISCONNECT:
>>   		dwc3_gadget_disconnect_interrupt(dwc);
>> @@ -4323,7 +4339,7 @@ static void dwc3_gadget_interrupt(struct dwc3 *dwc,
>>   		dwc3_gadget_conndone_interrupt(dwc);
>>   		break;
>>   	case DWC3_DEVICE_EVENT_WAKEUP:
>> -		dwc3_gadget_wakeup_interrupt(dwc, event->event_info);
>> +		dwc3_gadget_wakeup_interrupt(dwc);
>>   		break;
>>   	case DWC3_DEVICE_EVENT_HIBER_REQ:
>>   		dev_WARN_ONCE(dwc->dev, true, "unexpected hibernation event\n");
>> @@ -4334,7 +4350,7 @@ static void dwc3_gadget_interrupt(struct dwc3 *dwc,
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
