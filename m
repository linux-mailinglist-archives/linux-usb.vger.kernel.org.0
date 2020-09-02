Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFF6D25A2C8
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 03:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgIBBuo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 21:50:44 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:54440 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726559AbgIBBud (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Sep 2020 21:50:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599011432; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To: From:
 Subject: Sender; bh=qGQD9FVdDgPtJP+qhoj+CSZtmOexIA7A0nEKdaWSXso=; b=wKGz12/a02BhvZfJBa9A2WXmgcn7wwmvWyFzeNh68/xr9hT7tl6keEqc6QPa5xqPTFc4cyp4
 QmCZwJkDxqiX7YddeF3f7qL7VOCpVNek/Lf1vZu094Wx3A/76tbrEhB8YvaHgObaNJGT3ogU
 Wu4dI56FSH5tOOADwJRcqFLojbk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f4efa6625e1ee75864976d2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Sep 2020 01:50:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0C541C433CA; Wed,  2 Sep 2020 01:50:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.67.49] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B42D8C433C6;
        Wed,  2 Sep 2020 01:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B42D8C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v2] usb: dwc3: Stop active transfers before halting the
 controller
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "jackp@codeaurora.org" <jackp@codeaurora.org>
References: <20200828224440.22091-1-wcheng@codeaurora.org>
 <e7e0cac8-b0f1-3173-a54a-ccf061807c0c@synopsys.com>
 <d9ff68b0-6f5e-bf6d-9dfb-daac8b0a7abe@codeaurora.org>
Message-ID: <ee3b5178-1c8e-0758-1181-b28af2a51572@codeaurora.org>
Date:   Tue, 1 Sep 2020 18:50:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <d9ff68b0-6f5e-bf6d-9dfb-daac8b0a7abe@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 9/1/2020 3:14 PM, Wesley Cheng wrote:
> 
> 
> On 8/29/2020 2:35 PM, Thinh Nguyen wrote:
>> Wesley Cheng wrote:
>>> In the DWC3 databook, for a device initiated disconnect or bus reset, the
>>> driver is required to send dependxfer commands for any pending transfers.
>>> In addition, before the controller can move to the halted state, the SW
>>> needs to acknowledge any pending events.  If the controller is not halted
>>> properly, there is a chance the controller will continue accessing stale or
>>> freed TRBs and buffers.
>>>
>>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>>>
>>> ---
>>> Changes in v2:
>>>  - Moved cleanup code to the pullup() API to differentiate between device
>>>    disconnect and hibernation.
>>>  - Added cleanup code to the bus reset case as well.
>>>  - Verified the move to pullup() did not reproduce the problen using the
>>>    same test sequence.
>>>
>>> Verified fix by adding a check for ETIMEDOUT during the run stop call.
>>> Shell script writing to the configfs UDC file to trigger disconnect and
>>> connect.  Batch script to have PC execute data transfers over adb (ie adb
>>> push)  After a few iterations, we'd run into a scenario where the
>>> controller wasn't halted.  With the following change, no failed halts after
>>> many iterations.
>>> ---
>>>  drivers/usb/dwc3/ep0.c    |  2 +-
>>>  drivers/usb/dwc3/gadget.c | 52 ++++++++++++++++++++++++++++++++++++++-
>>>  2 files changed, 52 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
>>> index 59f2e8c31bd1..456aa87e8778 100644
>>> --- a/drivers/usb/dwc3/ep0.c
>>> +++ b/drivers/usb/dwc3/ep0.c
>>> @@ -197,7 +197,7 @@ int dwc3_gadget_ep0_queue(struct usb_ep *ep, struct usb_request *request,
>>>  	int				ret;
>>>  
>>>  	spin_lock_irqsave(&dwc->lock, flags);
>>> -	if (!dep->endpoint.desc) {
>>> +	if (!dep->endpoint.desc || !dwc->pullups_connected) {
>>>  		dev_err(dwc->dev, "%s: can't queue to disabled endpoint\n",
>>>  				dep->name);
>>>  		ret = -ESHUTDOWN;
>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>> index 3ab6f118c508..df8d89d6bdc9 100644
>>> --- a/drivers/usb/dwc3/gadget.c
>>> +++ b/drivers/usb/dwc3/gadget.c
>>> @@ -1516,7 +1516,7 @@ static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct dwc3_request *req)
>>>  {
>>>  	struct dwc3		*dwc = dep->dwc;
>>>  
>>> -	if (!dep->endpoint.desc) {
>>> +	if (!dep->endpoint.desc || !dwc->pullups_connected) {
>>>  		dev_err(dwc->dev, "%s: can't queue to disabled endpoint\n",
>>>  				dep->name);
>>>  		return -ESHUTDOWN;
>>> @@ -1926,6 +1926,24 @@ static int dwc3_gadget_set_selfpowered(struct usb_gadget *g,
>>>  	return 0;
>>>  }
>>>  
>>> +static void dwc3_stop_active_transfers(struct dwc3 *dwc)
>>> +{
>>> +	u32 epnum;
>>> +
>>> +	for (epnum = 2; epnum < DWC3_ENDPOINTS_NUM; epnum++) {
>>> +		struct dwc3_ep *dep;
>>> +
>>> +		dep = dwc->eps[epnum];
>>> +		if (!dep)
>>> +			continue;
>>> +
>>> +		if (!(dep->flags & DWC3_EP_ENABLED))
>>> +			continue;
>>
>> Don't do the enabled check here. Let the dwc3_stop_active_transfer() do
>> that checking.
>>
> 
> Hi Thinh,
> 
> Thanks for the detailed review, as always.  Got it, we can allow that to
> catch it based off the DWC3_EP_TRANSFER_STARTED.
> 
>>> +
>>> +		dwc3_remove_requests(dwc, dep);
>>> +	}
>>> +}
>>> +
>>>  static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on, int suspend)
>>>  {
>>>  	u32			reg;
>>> @@ -1994,9 +2012,39 @@ static int dwc3_gadget_pullup(struct usb_gadget *g, int is_on)
>>>  		}
>>>  	}
>>>  
>>> +	/*
>>> +	 * Synchronize and disable any further event handling while controller
>>> +	 * is being enabled/disabled.
>>> +	 */
>>> +	disable_irq(dwc->irq_gadget);
>>
>> I think it's better to do dwc3_gadget_disable_irq(). This only stops
>> handling events. Although it's unlikely, the controller may still
>> generate events before it's halted.
>>
> 
> I think its better if we can do both.  At least with the disable_irq()
> call present, we can ensure the irq handlers are complete, or we can do
> as Felipe suggested, and first disable the controller events (using
> dwc3_gadget_disable_irq()) and then calling synchronize_irq().
> 
> The concern I had is the pullup() API updating the lpos, and the hardirq
> handler referencing it to update the evt buf cache and waking up the
> threaded irq handler. (since we don't clear the evt->count explicitly,
> it may reference empty/stale events)
> 
>>>  	spin_lock_irqsave(&dwc->lock, flags);
>>> +
>>> +	/* Controller is not halted until pending events are acknowledged */
>>> +	if (!is_on) {
>>> +		u32 reg;
>>> +
>>> +		__dwc3_gadget_ep_disable(dwc->eps[0]);
>>> +		__dwc3_gadget_ep_disable(dwc->eps[1]);
>>
>> You can just do __dwc3_gadget_stop(), and do that after
>> dwc3_stop_active_transfers().
>>
> 
> Got it.
> 

Hi Thinh,

Maybe we can ignore calling dwc3_gadget_disable_irq() separately if we
are going to use __dwc3_gadget_stop(), since gadget stop will call
dwc3_gadget_disable_irq().  Also, it would be executed before the event
count clearing, so if there was an event (unlikely) that was generated,
we would discard it.

Something like:

	disable_irq(dwc->irq_gadget);
	spin_lock_irqsave(&dwc->lock, flags);

	if (!is_on) {
		u32 count;

		dwc3_stop_active_transfers(dwc);
		__dwc3_gadget_stop(dwc);

		count = dwc3_readl(dwc->regs, DWC3_GEVNTCOUNT(0));
		count &= DWC3_GEVNTCOUNT_MASK;

Thanks
Wesley

>>> +
>>> +		/*
>>> +		 * The databook explicitly mentions for a device-initiated
>>> +		 * disconnect sequence, the SW needs to ensure that it ends any
>>> +		 * active transfers.
>>> +		 */
>>> +		dwc3_stop_active_transfers(dwc);
>>> +
>>> +		reg = dwc3_readl(dwc->regs, DWC3_GEVNTCOUNT(0));
>>> +		reg &= DWC3_GEVNTCOUNT_MASK;
>>
>> Can we use another variable "count" instead of reusing reg to make it a
>> little clearer?
>>
> 
> Sure, I'll add another variable.
> 
> Thanks
> Wesley
> 
>>> +		if (reg > 0) {
>>> +			dwc3_writel(dwc->regs, DWC3_GEVNTCOUNT(0), reg);
>>> +			dwc->ev_buf->lpos = (dwc->ev_buf->lpos + reg) %
>>> +						dwc->ev_buf->length;
>>> +		}
>>> +	}
>>> +
>>>  	ret = dwc3_gadget_run_stop(dwc, is_on, false);
>>>  	spin_unlock_irqrestore(&dwc->lock, flags);
>>> +	enable_irq(dwc->irq_gadget);
>>>  
>>>  	return ret;
>>>  }
>>> @@ -3100,6 +3148,8 @@ static void dwc3_gadget_reset_interrupt(struct dwc3 *dwc)
>>>  	}
>>>  
>>>  	dwc3_reset_gadget(dwc);
>>> +	/* Stop any active/pending transfers when receiving bus reset */
>>> +	dwc3_stop_active_transfers(dwc);
>>>  
>>>  	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
>>>  	reg &= ~DWC3_DCTL_TSTCTRL_MASK;
>>
>> Looks good to me.
>>
>> Thanks,
>> Thinh
>>
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
