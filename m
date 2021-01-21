Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60B0F2FE445
	for <lists+linux-usb@lfdr.de>; Thu, 21 Jan 2021 08:46:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727511AbhAUHp2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Jan 2021 02:45:28 -0500
Received: from a1.mail.mailgun.net ([198.61.254.60]:55449 "EHLO
        a1.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbhAUHpA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Jan 2021 02:45:00 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611215080; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=45SHXNGLf2GW49IFygSLw/pVD2P3JuS39NiipoEW1UQ=; b=U3bvABjJ1Fih3qHbVB/rBq8r+naO4d159jEIKnOHdVLjaB5cdTcdssQ/VkBbHta/lgg3nXgu
 3t0vZSO0fHAatxSSbNy7NXARtv7vaN/hdHVd7q0nye1cKI5Fj6yVV2E5xIMPrjPmdzh8/u/o
 3Rv6B2yNwiUlnq5IblTPtCBRMHc=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 600930c95677aca7bdbe0b15 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 Jan 2021 07:44:09
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 573DFC43464; Thu, 21 Jan 2021 07:44:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.110.7.112] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 185CCC433CA;
        Thu, 21 Jan 2021 07:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 185CCC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: usb: dwc3: gadget: skip pullup and set_speed after suspend
To:     Jung Daehwan <dh10.jung@samsung.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CGME20210120035123epcas2p2048f6d9896bd21f19d939a56fe0b6610@epcas2p2.samsung.com>
 <1611113968-102424-1-git-send-email-dh10.jung@samsung.com>
 <fbde7781-8eef-ab3a-a339-8a2f61ca83be@synopsys.com>
 <20210121064956.GA69382@ubuntu>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <6c6429da-5d27-2d6a-9bcf-3606810e71a6@codeaurora.org>
Date:   Wed, 20 Jan 2021 23:44:05 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210121064956.GA69382@ubuntu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 1/20/2021 10:49 PM, Jung Daehwan wrote:
> Hi,
> 
> On Thu, Jan 21, 2021 at 01:00:32AM +0000, Thinh Nguyen wrote:
>> Hi,
>>
>> Daehwan Jung wrote:
>>> Sometimes dwc3_gadget_pullup and dwc3_gadget_set_speed are called after
>>> entering suspend. That's why it needs to check whether suspend
>>>
>>> 1. dwc3 sends disconnect uevent and turn off. (suspend)
>>> 2. Platform side causes pullup or set_speed(e.g., adbd closes ffs node)
>>> 3. It causes unexpected behavior like ITMON error.
>>>
>>> Signed-off-by: Daehwan Jung <dh10.jung@samsung.com>
>>> ---
>>>  drivers/usb/dwc3/gadget.c | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>> index ee44321..d7d4202 100644
>>> --- a/drivers/usb/dwc3/gadget.c
>>> +++ b/drivers/usb/dwc3/gadget.c
>>> @@ -2093,6 +2093,9 @@ static int dwc3_gadget_pullup(struct usb_gadget *g, int is_on)
>>>  	unsigned long		flags;
>>>  	int			ret;
>>>  
>>> +	if (pm_runtime_suspended(dwc->dev))
>>> +		return 0;
>>> +
>>>  	is_on = !!is_on;
>>>  
>>>  	/*
>>> @@ -2403,6 +2406,9 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
>>>  	unsigned long		flags;
>>>  	u32			reg;
>>>  
>>> +	if (pm_runtime_suspended(dwc->dev))
>>> +		return;
>>> +
>>>  	spin_lock_irqsave(&dwc->lock, flags);
>>>  	reg = dwc3_readl(dwc->regs, DWC3_DCFG);
>>>  	reg &= ~(DWC3_DCFG_SPEED_MASK);
>>
>> This is already addressed in Wesley Cheng's patches. Can you try the
>> latest changes of DWC3 in Greg's usb-next branch?
>>
>> Thanks,
>> Thinh
> 
> I checked Wesly Cheng's pathces but it's not same.
> What I want to do for this patch is to avoid pullup from platform side.
> (android in my case)
> 
> It's possible that platform side tries to pullup by UDC_Store after usb is already disconnected.
> It can finally run controller and enable irq.
> 
> I think we have to avoid it and other possible things related to platform side.
> 
> 

Hi Daehwan,

I think what you're trying to do is to avoid the unnecessary runtime
resume if the cable is disconnected and userspace attempts to
bind/unbind the UDC.

I'm not exactly sure what patches you've pulled in, but assuming you
didn't pull in any of the recent suspend changes:

usb: dwc3: gadget: Allow runtime suspend if UDC unbinded
usb: dwc3: gadget: Preserve UDC max speed setting

Please consider the following scenario:
1.  USB connected
2.  UDC unbinded
3.  DWC3 will continue to stay in runtime active, since dwc->connected =
true

In this scenario, we should allow the DWC3 to enter runtime suspend,
since runstop has been disabled.

If you have pulled in the above changes, and adding your changes on top
of it, then consider the following:
1.  USB connected
2.  UDC unbinded
3.  DWC enters runtime suspend (due to the above changes)
4.  UDC binded

The check for pm_runtime_suspended() will block step#4 from re-enabling
the runstop bit even if the USB cable is connected.

Thanks
Wesley Cheng

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
