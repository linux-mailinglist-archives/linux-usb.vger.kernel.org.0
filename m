Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69913697429
	for <lists+linux-usb@lfdr.de>; Wed, 15 Feb 2023 03:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232148AbjBOCJZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Feb 2023 21:09:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbjBOCJY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Feb 2023 21:09:24 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EAD620D1D;
        Tue, 14 Feb 2023 18:09:23 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31F0GDqG016711;
        Wed, 15 Feb 2023 02:09:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=hIKBE5R3FEAYomFIAsx2Q9vh1y7g5vgQOUuFchMvmgQ=;
 b=a+PMAAQJwTrcL2X0Zle+LhsaKy2Dai1mcqiwV58z6KQe9y2k+GYH89P5Lyu5YikuzF5E
 51QO6x08qtM9xOsq/C1AcrcQwqgKdY2ykvz0YPpo0rJdd0e4w8gU2xG+wrqQEgDMAal/
 OEbEJvGyDRcV4TknHjAmIjKs0it6WSGs3oSFOVYe8wu6vzayRYHfcVUK9AvFBccfYhZo
 WUpITyGnjBqszo4tb8iLEByXl0OI/A8CPmmuBgzKz5ZfSeGbXvnGYMDIFUmeem+LF3Gy
 sd9K0sQBZD+AnQp79xFNjsKFnI6+Nf/HtmHFU/GRZvhbuNkb6XlKg/9gvACUwuRhx/pF gQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nqyygudhn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 15 Feb 2023 02:09:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31F296gk020822
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 15 Feb 2023 02:09:06 GMT
Received: from [10.110.33.24] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 14 Feb
 2023 18:09:04 -0800
Message-ID: <b76f2d92-a470-3e7a-54cd-c0d099cd4d5c@quicinc.com>
Date:   Tue, 14 Feb 2023 18:08:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 2/5] usb: dwc3: Add remote wakeup handling
Content-Language: en-US
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
        "quic_jackp@quicinc.com" <quic_jackp@quicinc.com>
References: <1676316676-28377-1-git-send-email-quic_eserrao@quicinc.com>
 <1676316676-28377-3-git-send-email-quic_eserrao@quicinc.com>
 <20230215010950.ufazmdev7cvtef3n@synopsys.com>
From:   Elson Serrao <quic_eserrao@quicinc.com>
In-Reply-To: <20230215010950.ufazmdev7cvtef3n@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xHRbLvSqsJAs9_DvnLsk7oxwI5A0kEPx
X-Proofpoint-GUID: xHRbLvSqsJAs9_DvnLsk7oxwI5A0kEPx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_17,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302150018
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2/14/2023 5:09 PM, Thinh Nguyen wrote:
> On Mon, Feb 13, 2023, Elson Roy Serrao wrote:
>> An usb device can initate a remote wakeup and bring the link out of
>> suspend as dictated by the DEVICE_REMOTE_WAKEUP feature selector.
>> Add support to handle this packet and set the remote wakeup capability.
>>
>> Some hosts may take longer time to initiate the resume signaling after
>> device triggers a remote wakeup. So add async support to the wakeup API
>> by enabling link status change events.
>>
>> Signed-off-by: Elson Roy Serrao <quic_eserrao@quicinc.com>
>> ---
>>   drivers/usb/dwc3/core.h   |  2 ++
>>   drivers/usb/dwc3/ep0.c    |  4 +++
>>   drivers/usb/dwc3/gadget.c | 74 +++++++++++++++++++++++++++++++++++++++++++----
>>   3 files changed, 74 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
>> index 582ebd9..cc78236 100644
>> --- a/drivers/usb/dwc3/core.h
>> +++ b/drivers/usb/dwc3/core.h
>> @@ -1110,6 +1110,7 @@ struct dwc3_scratchpad_array {
>>    *	3	- Reserved
>>    * @dis_metastability_quirk: set to disable metastability quirk.
>>    * @dis_split_quirk: set to disable split boundary.
>> + * @wakeup_configured: set if the device is configured for remote wakeup.
>>    * @imod_interval: set the interrupt moderation interval in 250ns
>>    *			increments or 0 to disable.
>>    * @max_cfg_eps: current max number of IN eps used across all USB configs.
>> @@ -1327,6 +1328,7 @@ struct dwc3 {
>>   
>>   	unsigned		dis_split_quirk:1;
>>   	unsigned		async_callbacks:1;
>> +	unsigned		wakeup_configured:1;
>>   
>>   	u16			imod_interval;
>>   
>> diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
>> index 61de693..f90fa55 100644
>> --- a/drivers/usb/dwc3/ep0.c
>> +++ b/drivers/usb/dwc3/ep0.c
>> @@ -356,6 +356,9 @@ static int dwc3_ep0_handle_status(struct dwc3 *dwc,
>>   				usb_status |= 1 << USB_DEV_STAT_U1_ENABLED;
>>   			if (reg & DWC3_DCTL_INITU2ENA)
>>   				usb_status |= 1 << USB_DEV_STAT_U2_ENABLED;
>> +		} else {
>> +			usb_status |= dwc->gadget->wakeup_armed <<
>> +					USB_DEVICE_REMOTE_WAKEUP;
>>   		}
>>   
>>   		break;
>> @@ -476,6 +479,7 @@ static int dwc3_ep0_handle_device(struct dwc3 *dwc,
>>   
>>   	switch (wValue) {
>>   	case USB_DEVICE_REMOTE_WAKEUP:
>> +		dwc->gadget->wakeup_armed = set;
>>   		break;
>>   	/*
>>   	 * 9.4.1 says only for SS, in AddressState only for
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index 3c63fa9..b7fef5d 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -258,7 +258,7 @@ int dwc3_send_gadget_generic_command(struct dwc3 *dwc, unsigned int cmd,
>>   	return ret;
>>   }
>>   
>> -static int __dwc3_gadget_wakeup(struct dwc3 *dwc);
>> +static int __dwc3_gadget_wakeup(struct dwc3 *dwc, bool async);
>>   
>>   /**
>>    * dwc3_send_gadget_ep_cmd - issue an endpoint command
>> @@ -325,7 +325,7 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
>>   
>>   			fallthrough;
>>   		case DWC3_LINK_STATE_U3:
>> -			ret = __dwc3_gadget_wakeup(dwc);
>> +			ret = __dwc3_gadget_wakeup(dwc, false);
>>   			dev_WARN_ONCE(dwc->dev, ret, "wakeup failed --> %d\n",
>>   					ret);
>>   			break;
>> @@ -2269,6 +2269,22 @@ static const struct usb_ep_ops dwc3_gadget_ep_ops = {
>>   
>>   /* -------------------------------------------------------------------------- */
>>   
>> +static void dwc3_gadget_enable_linksts_evts(struct dwc3 *dwc, bool set)
>> +{
>> +	u32 reg;
>> +
>> +	if (DWC3_VER_IS_PRIOR(DWC3, 250A))
>> +		return;
>> +
>> +	reg = dwc3_readl(dwc->regs, DWC3_DEVTEN);
>> +	if (set)
>> +		reg |= DWC3_DEVTEN_ULSTCNGEN;
>> +	else
>> +		reg &= ~DWC3_DEVTEN_ULSTCNGEN;
>> +
>> +	dwc3_writel(dwc->regs, DWC3_DEVTEN, reg);
>> +}
>> +
>>   static int dwc3_gadget_get_frame(struct usb_gadget *g)
>>   {
>>   	struct dwc3		*dwc = gadget_to_dwc(g);
>> @@ -2276,7 +2292,7 @@ static int dwc3_gadget_get_frame(struct usb_gadget *g)
>>   	return __dwc3_gadget_get_frame(dwc);
>>   }
>>   
>> -static int __dwc3_gadget_wakeup(struct dwc3 *dwc)
>> +static int __dwc3_gadget_wakeup(struct dwc3 *dwc, bool async)
>>   {
>>   	int			retries;
>>   
>> @@ -2307,9 +2323,13 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc)
>>   		return -EINVAL;
>>   	}
>>   
>> +	if (async)
>> +		dwc3_gadget_enable_linksts_evts(dwc, true);
>> +
>>   	ret = dwc3_gadget_set_link_state(dwc, DWC3_LINK_STATE_RECOV);
>>   	if (ret < 0) {
>>   		dev_err(dwc->dev, "failed to put link in Recovery\n");
>> +		dwc3_gadget_enable_linksts_evts(dwc, false);
>>   		return ret;
>>   	}
>>   
>> @@ -2321,6 +2341,13 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc)
>>   		dwc3_writel(dwc->regs, DWC3_DCTL, reg);
>>   	}
>>   
>> +	/*
>> +	 * Since link status change events are enabled we will receive
>> +	 * an U0 event when wakeup is successful. So bail out.
>> +	 */
>> +	if (async)
>> +		return 0;
>> +
>>   	/* poll until Link State changes to ON */
>>   	retries = 20000;
>>   
>> @@ -2346,13 +2373,36 @@ static int dwc3_gadget_wakeup(struct usb_gadget *g)
>>   	unsigned long		flags;
>>   	int			ret;
>>   
>> +	if (!dwc->wakeup_configured) {
>> +		dev_err(dwc->dev, "remote wakeup not configured\n");
>> +		return -EINVAL;
>> +	}
>> +
>>   	spin_lock_irqsave(&dwc->lock, flags);
>> -	ret = __dwc3_gadget_wakeup(dwc);
>> +	if (!dwc->gadget->wakeup_armed) {
>> +		dev_err(dwc->dev, "not armed for remote wakeup\n");
>> +		spin_unlock_irqrestore(&dwc->lock, flags);
>> +		return -EINVAL;
>> +	}
>> +	ret = __dwc3_gadget_wakeup(dwc, true);
>> +
>>   	spin_unlock_irqrestore(&dwc->lock, flags);
>>   
>>   	return ret;
>>   }
>>   
>> +static int dwc3_gadget_set_remote_wakeup(struct usb_gadget *g, int set)
>> +{
>> +	struct dwc3		*dwc = gadget_to_dwc(g);
>> +	unsigned long		flags;
>> +
>> +	spin_lock_irqsave(&dwc->lock, flags);
>> +	dwc->wakeup_configured = !!set;
>> +	spin_unlock_irqrestore(&dwc->lock, flags);
>> +
>> +	return 0;
>> +}
>> +
>>   static int dwc3_gadget_set_selfpowered(struct usb_gadget *g,
>>   		int is_selfpowered)
>>   {
>> @@ -2978,6 +3028,7 @@ static void dwc3_gadget_async_callbacks(struct usb_gadget *g, bool enable)
>>   static const struct usb_gadget_ops dwc3_gadget_ops = {
>>   	.get_frame		= dwc3_gadget_get_frame,
>>   	.wakeup			= dwc3_gadget_wakeup,
>> +	.set_remote_wakeup	= dwc3_gadget_set_remote_wakeup,
>>   	.set_selfpowered	= dwc3_gadget_set_selfpowered,
>>   	.pullup			= dwc3_gadget_pullup,
>>   	.udc_start		= dwc3_gadget_start,
>> @@ -3819,6 +3870,8 @@ static void dwc3_gadget_disconnect_interrupt(struct dwc3 *dwc)
>>   
>>   	dwc->gadget->speed = USB_SPEED_UNKNOWN;
>>   	dwc->setup_packet_pending = false;
>> +	dwc->gadget->wakeup_armed = false;
>> +	dwc3_gadget_enable_linksts_evts(dwc, false);
>>   	usb_gadget_set_state(dwc->gadget, USB_STATE_NOTATTACHED);
>>   
>>   	if (dwc->ep0state != EP0_SETUP_PHASE) {
>> @@ -3912,6 +3965,8 @@ static void dwc3_gadget_reset_interrupt(struct dwc3 *dwc)
>>   	reg &= ~DWC3_DCTL_TSTCTRL_MASK;
>>   	dwc3_gadget_dctl_write_safe(dwc, reg);
>>   	dwc->test_mode = false;
>> +	dwc->gadget->wakeup_armed = false;
>> +	dwc3_gadget_enable_linksts_evts(dwc, false);
>>   	dwc3_clear_stall_all_ep(dwc);
>>   
>>   	/* Reset device address to zero */
>> @@ -4064,7 +4119,7 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
>>   	 */
>>   }
>>   
>> -static void dwc3_gadget_wakeup_interrupt(struct dwc3 *dwc)
>> +static void dwc3_gadget_wakeup_interrupt(struct dwc3 *dwc, unsigned int evtinfo)
>>   {
>>   	/*
>>   	 * TODO take core out of low power mode when that's
>> @@ -4076,6 +4131,8 @@ static void dwc3_gadget_wakeup_interrupt(struct dwc3 *dwc)
>>   		dwc->gadget_driver->resume(dwc->gadget);
>>   		spin_lock(&dwc->lock);
>>   	}
>> +
>> +	dwc->link_state = evtinfo & DWC3_LINK_STATE_MASK;
>>   }
>>   
>>   static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
>> @@ -4157,6 +4214,10 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
>>   	}
>>   
>>   	switch (next) {
>> +	case DWC3_LINK_STATE_U0:
>> +		dwc3_gadget_enable_linksts_evts(dwc, false);
>> +		dwc3_resume_gadget(dwc);
> 
> I don't think this should be a problem for dwc_usb3 2.50a and prior. But
> for a device that enables link state change event all the time, it would
> call this every time link transitions to U0. I'm not sure what the side
> effect can be. Can we add a wakeup_armed check here to prevent possible
> regression?
> 
> Thanks,
> Thinh
> 
Sure. I will upload v5 with this modification.

Thanks
Elson
>> +		break;
>>   	case DWC3_LINK_STATE_U1:
>>   		if (dwc->speed == USB_SPEED_SUPER)
>>   			dwc3_suspend_gadget(dwc);
>> @@ -4225,7 +4286,7 @@ static void dwc3_gadget_interrupt(struct dwc3 *dwc,
>>   		dwc3_gadget_conndone_interrupt(dwc);
>>   		break;
>>   	case DWC3_DEVICE_EVENT_WAKEUP:
>> -		dwc3_gadget_wakeup_interrupt(dwc);
>> +		dwc3_gadget_wakeup_interrupt(dwc, event->event_info);
>>   		break;
>>   	case DWC3_DEVICE_EVENT_HIBER_REQ:
>>   		if (dev_WARN_ONCE(dwc->dev, !dwc->has_hibernation,
>> @@ -4485,6 +4546,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
>>   	dwc->gadget->sg_supported	= true;
>>   	dwc->gadget->name		= "dwc3-gadget";
>>   	dwc->gadget->lpm_capable	= !dwc->usb2_gadget_lpm_disable;
>> +	dwc->gadget->wakeup_capable	= true;
>>   
>>   	/*
>>   	 * FIXME We might be setting max_speed to <SUPER, however versions
>> -- 
>> 2.7.4
