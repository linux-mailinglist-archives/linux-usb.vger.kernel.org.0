Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 717A01B4941
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2020 17:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgDVP5X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Apr 2020 11:57:23 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:24374 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726057AbgDVP5X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Apr 2020 11:57:23 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03MFiG0F021686;
        Wed, 22 Apr 2020 17:57:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=/JIrCxzSO0ZBPQ8v+cRwA4K5IMUfs3ZP++PD6X/KBMI=;
 b=wkq3WMts6Hmf/dzSoTmMQJvx4l/V+mon3WyE3PuwdKrSsa7p+ZgLZ0k0usbP8VIXmnjg
 eb9zNcwxIn49uwrEf7yJKFWWhvSt4RFVxOc+ow0iIcupVRQ2tZVhBnLpQuHJnwEJuhN9
 15YHsh+2esM736HCyAcpr/qkCPaaKUQkjgtVnrpAA6fSJMOgg9ai/gm4EVf4MJzgonqo
 G0g8blsp6GpeRvGFgr+glwSsm1ZaG4jO9TTdeXcXjSXP336J80AN33oY4ku6GgRI+vRh
 46lkbYztRmUNh/jkbWwwN/hBtDjg04DtlzrQxLh5mRoNc7oMojvQ9SUVvitBQqYWHEi7 Yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 30fq11qfrt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 22 Apr 2020 17:57:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A48A3100038;
        Wed, 22 Apr 2020 17:57:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 953F92BEC5E;
        Wed, 22 Apr 2020 17:57:10 +0200 (CEST)
Received: from [10.211.11.103] (10.75.127.46) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 22 Apr
 2020 17:57:09 +0200
Subject: Re: [PATCH 1/4] usb: dwc2: gadget: move gadget resume after the core
 is in L0 state
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "balbi@kernel.org" <balbi@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "amelie.delaunay@st.com" <amelie.delaunay@st.com>
References: <1587472341-17935-1-git-send-email-fabrice.gasnier@st.com>
 <1587472341-17935-2-git-send-email-fabrice.gasnier@st.com>
 <5391768a-da52-def8-9b2a-aeb559d8e26b@synopsys.com>
From:   Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <ba525953-fbab-c2cf-beba-8755846cd27e@st.com>
Date:   Wed, 22 Apr 2020 17:57:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5391768a-da52-def8-9b2a-aeb559d8e26b@synopsys.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-22_06:2020-04-22,2020-04-22 signatures=0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/22/20 4:48 PM, Minas Harutyunyan wrote:
> Hi Fabrice,
> 
> On 4/21/2020 4:32 PM, Fabrice Gasnier wrote:
>> When the remote wakeup interrupt is triggered, lx_state is resumed from L2
>> to L0 state. But when the gadget resume is called, lx_state is still L2.
>> This prevents the resume callback to queue any request. Any attempt
>> to queue a request from resume callback will result in:
>> - "submit request only in active state" debug message to be issued
>> - dwc2_hsotg_ep_queue() returns -EAGAIN
>>
>> Move the call to resume gadget after the core is put in DWC2_L0 state.
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
>> ---
>>   drivers/usb/dwc2/core_intr.c | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
>> index 876ff31..b8ebda5 100644
>> --- a/drivers/usb/dwc2/core_intr.c
>> +++ b/drivers/usb/dwc2/core_intr.c
>> @@ -404,9 +404,11 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>>   	}
>>   
>>   	if (dwc2_is_device_mode(hsotg)) {
>> +		enum dwc2_lx_state lx_state = hsotg->lx_state;
>> +
>>   		dev_dbg(hsotg->dev, "DSTS=0x%0x\n",
>>   			dwc2_readl(hsotg, DSTS));
>> -		if (hsotg->lx_state == DWC2_L2) {
>> +		if (lx_state == DWC2_L2) {
>>   			u32 dctl = dwc2_readl(hsotg, DCTL);
>>   
>>   			/* Clear Remote Wakeup Signaling */
>> @@ -415,11 +417,13 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>>   			ret = dwc2_exit_partial_power_down(hsotg, true);
>>   			if (ret && (ret != -ENOTSUPP))
>>   				dev_err(hsotg->dev, "exit power_down failed\n");
>> -
>> -			call_gadget(hsotg, resume);
>>   		}
>>   		/* Change to L0 state */
>>   		hsotg->lx_state = DWC2_L0;
>> +
>> +		/* Gadget may queue new requests upon resume to L0 state */
>> +		if (lx_state == DWC2_L2)
>> +			call_gadget(hsotg, resume);
>>   	} else {
>>   		if (hsotg->params.power_down)
>>   			return;
>>
> 
> What about below patch without introducing additional variable.
> 
> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
> index 876ff31261d5..543865e31c72 100644
> --- a/drivers/usb/dwc2/core_intr.c
> +++ b/drivers/usb/dwc2/core_intr.c
> @@ -416,6 +416,8 @@ static void dwc2_handle_wakeup_detected_intr(struct 
> dwc2_hsotg *hsotg)
>                          if (ret && (ret != -ENOTSUPP))
>                                  dev_err(hsotg->dev, "exit power_down 
> failed\n");
> 
> +                       /* Change to L0 state */
> +                       hsotg->lx_state = DWC2_L0;

Hi Minas,

That was my first approach locally, but I added a variable to avoid do
it twice... few lines after.

But if you prefer, I can change in V2 ?

Please let me know.

Thanks,
Fabrice

>                          call_gadget(hsotg, resume);
>                  }
>                  /* Change to L0 state */
> 
> 
> Thanks,
> Minas
> 
