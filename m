Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB7F9531F3C
	for <lists+linux-usb@lfdr.de>; Tue, 24 May 2022 01:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbiEWXdV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 May 2022 19:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbiEWXdU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 May 2022 19:33:20 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38CAC77F23
        for <linux-usb@vger.kernel.org>; Mon, 23 May 2022 16:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1653348799; x=1684884799;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WQPJxXGyVHsEOVt5PPtq5h941keNoAUKabVAqNDj6no=;
  b=mJ/RvdkJz8BTBpf2BLbnKDPsMY22ODDY33wxNI1/9tFsHVOZlyIVIh9F
   3jaPqQeqIRLG4MTGd3tN2emIP4VF0A431Z2UUQt1YO1UPnF71HJOyDngI
   jLu9gxD2sfMLH369TZ4YoKjhrchRHsutZo33Zc+6COQ2mDjbnGu1PDxxD
   4=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 23 May 2022 16:33:18 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2022 16:33:18 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 23 May 2022 16:33:18 -0700
Received: from [10.110.113.252] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 23 May
 2022 16:33:17 -0700
Message-ID: <33e8af67-9893-848f-d81d-2d4430002e01@quicinc.com>
Date:   Mon, 23 May 2022 16:33:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 4/6] usb: dwc3: ep0: Don't prepare beyond Setup stage
Content-Language: en-US
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Pavan Kondeti <quic_pkondeti@quicinc.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
References: <cover.1650593829.git.Thinh.Nguyen@synopsys.com>
 <6bacec56ecabb2c6e49a09cedfcac281fdc97de0.1650593829.git.Thinh.Nguyen@synopsys.com>
 <20220503110115.GA21427@hu-pkondeti-hyd.qualcomm.com>
 <c4aefadb-80a3-1a4b-9e33-14f9340b597e@synopsys.com>
From:   Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <c4aefadb-80a3-1a4b-9e33-14f9340b597e@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Thinh,

On 5/23/2022 4:22 PM, Thinh Nguyen wrote:
> Hi,
> 
> Pavan Kondeti wrote:
>> On Thu, Apr 21, 2022 at 07:22:50PM -0700, Thinh Nguyen wrote:
>>> Since we can't guarantee that the host won't send new Setup packet
>>> before going through the device-initiated disconnect, don't prepare
>>> beyond the Setup stage and keep the device in EP0_SETUP_PHASE. This
>>> ensures that the device-initated disconnect sequence can go through
>>> gracefully. Note that the controller won't service the End Transfer
>>> command if it can't DMA out the Setup packet.
>>>
>>> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>>> ---
>>>   drivers/usb/dwc3/ep0.c    |  2 +-
>>>   drivers/usb/dwc3/gadget.c | 29 +++++++++++++++++------------
>>>   2 files changed, 18 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
>>> index 1064be5518f6..c47c696316dd 100644
>>> --- a/drivers/usb/dwc3/ep0.c
>>> +++ b/drivers/usb/dwc3/ep0.c
>>> @@ -813,7 +813,7 @@ static void dwc3_ep0_inspect_setup(struct dwc3 *dwc,
>>>   	int ret = -EINVAL;
>>>   	u32 len;
>>>   
>>> -	if (!dwc->gadget_driver)
>>> +	if (!dwc->gadget_driver || !dwc->connected)
>>>   		goto out;
>>>   
>>>   	trace_dwc3_ctrl_req(ctrl);
>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>> index a86225dbaa2c..e5f07c0e8ad9 100644
>>> --- a/drivers/usb/dwc3/gadget.c
>>> +++ b/drivers/usb/dwc3/gadget.c
>>> @@ -2505,6 +2505,23 @@ static int dwc3_gadget_soft_disconnect(struct dwc3 *dwc)
>>>   	spin_lock_irqsave(&dwc->lock, flags);
>>>   	dwc->connected = false;
>>>   
>>> +	/*
>>> +	 * Per databook, when we want to stop the gadget, if a control transfer
>>> +	 * is still in process, complete it and get the core into setup phase.
>>> +	 */
>>> +	if (dwc->ep0state != EP0_SETUP_PHASE) {
>>> +		int ret;
>>> +
>>> +		reinit_completion(&dwc->ep0_in_setup);
>>> +
>>> +		spin_unlock_irqrestore(&dwc->lock, flags);
>>> +		ret = wait_for_completion_timeout(&dwc->ep0_in_setup,
>>> +				msecs_to_jiffies(DWC3_PULL_UP_TIMEOUT));
>>> +		spin_lock_irqsave(&dwc->lock, flags);
>>> +		if (ret == 0)
>>> +			dev_warn(dwc->dev, "timed out waiting for SETUP phase\n");
>>
>> DWC3_PULL_UP_TIMEOUT is 500 msec. If the ongoing control transfer is delayed
>> (dwc3::delayed_status), for whatever reason, would there be a problem?
>>
> 
> Sorry for the delayed response. I was away.
> 
> If the control transfer takes longer than 500ms, then we'd get this
> timed out warning. However, it should be fine because
> 
> 1) If the function driver hasn't sent the status, then the host won't be
> sending a new SETUP packet.
> 
> 2) If the delayed status was sent and completed immediately after the
> timeout but before the dwc3_gadget_soft_disconnect holding the
> spin_lock, then we may see End Transfer command timeout. It may not look
> like the cleanup was done gracefully, but that should be fine. The
> command should be able to complete once the spin_lock is released and
> Setup packet handled. The controller should halt within the polling period.
> 
> 3) If the host misbehaves and ignores the status stage/abort the control
> transfer to send a new setup packet, I don't think the current dwc3
> driver handles that case properly. But that should be for a separate
> patch fix.
> 

In the trace that I sent you where the controller halt fails, it is due 
to the above condition that Pavan mentioned.  We're in a situation where 
if the function driver dequeues an USB request, and we are not in the 
proper ep0state to handle, we'll set the DWC3_EP_DELAY_STOP flag.

Soon after, if a soft disconnect occurs, and we're in a situation where 
delayed_status == 1, then most likely, we'll see the SETUP packet 
timeout (depending on when the function queues the status phase) and 
proceed w/ stop active xfers and gadget.  Since we do not wait for the 
delayed stop condition to be handled before attempting to halt the 
controller, we'll run into a timeout when clearing Run/Stop.  In this 
situation, this is why you don't see the endxfer command being send for 
endpoints.

Thanks
Wesley Cheng
