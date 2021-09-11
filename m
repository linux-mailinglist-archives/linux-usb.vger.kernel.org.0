Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9A3540746E
	for <lists+linux-usb@lfdr.de>; Sat, 11 Sep 2021 03:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235063AbhIKBbL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Sep 2021 21:31:11 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:14553 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234989AbhIKBbK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Sep 2021 21:31:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631323798; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=uBDuLnXhdx6KlAcdKDQK7T/HxuuvGrvSvqOrT02nCkk=; b=VePF2TyPykBHaXiajywpV9mUpaR/lkV4dVNunic5OejKrLW0oP8mlYwtjq6TNopzDx77vOGc
 oemOhegjpudCPwXI5QAqhGtyKCNiSsV+3Te60DFkoa24uL0k2iOeEVBmNTu5PsKgSMm6dPJi
 dyjPG1+R9JWGMxGEWRbal7ndKJ4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 613c0694648642cc1c4c4783 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 11 Sep 2021 01:29:56
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 02DFCC4360C; Sat, 11 Sep 2021 01:29:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.0
Received: from [10.71.83.156] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D55DC4338F;
        Sat, 11 Sep 2021 01:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 6D55DC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] usb: dwc3: gadget: Skip resizing EP's TX FIFO if already
 resized
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Jack Pham <jackp@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
References: <20210909083120.15350-1-jackp@codeaurora.org>
 <6a4bb7a9-2c63-5e1e-f4fc-a5bbc7aaa168@synopsys.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <db0664a9-575f-1c6a-2efc-ec8372e2f1d4@codeaurora.org>
Date:   Fri, 10 Sep 2021 18:29:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6a4bb7a9-2c63-5e1e-f4fc-a5bbc7aaa168@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 9/9/2021 6:15 PM, Thinh Nguyen wrote:
> Jack Pham wrote:
>> Some functions may dynamically enable and disable their endpoints
>> regularly throughout their operation, particularly when Set Interface
>> is employed to switch between Alternate Settings.  For instance the
>> UAC2 function has its respective endpoints for playback & capture
>> associated with AltSetting 1, in which case those endpoints would not
>> get enabled until the host activates the AltSetting.  And they
>> conversely become disabled when the interfaces' AltSetting 0 is
>> chosen.
>>
>> With the DWC3 FIFO resizing algorithm recently added, every
>> usb_ep_enable() call results in a call to resize that EP's TXFIFO,
>> but if the same endpoint is enabled again and again, this incorrectly
>> leads to FIFO RAM allocation exhaustion as the mechanism did not
>> account for the possibility that endpoints can be re-enabled many
>> times.
>>
>> Example log splat:
>>
>> 	dwc3 a600000.dwc3: Fifosize(3717) > RAM size(3462) ep3in depth:217973127
>> 	configfs-gadget gadget: u_audio_start_capture:521 Error!
>> 	dwc3 a600000.dwc3: request 000000000be13e18 was not queued to ep3in
>>
>> This is easily fixed by bailing out of dwc3_gadget_resize_tx_fifos()
>> if an endpoint is already resized, avoiding the calculation error
>> resulting from accumulating the EP's FIFO depth repeatedly.
>>
>> Fixes: 9f607a309fbe9 ("usb: dwc3: Resize TX FIFOs to meet EP bursting requirements")
>> Signed-off-by: Jack Pham <jackp@codeaurora.org>
>> ---
>>  drivers/usb/dwc3/gadget.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index 804b50548163..c647c76d7361 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -747,6 +747,10 @@ static int dwc3_gadget_resize_tx_fifos(struct dwc3_ep *dep)
>>  	if (!usb_endpoint_dir_in(dep->endpoint.desc) || dep->number <= 1)
>>  		return 0;
>>  
>> +	/* bail if already resized */
>> +	if (dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(dep->number >> 1)))
>> +		return 0;
>> +
>>  	ram1_depth = DWC3_RAM1_DEPTH(dwc->hwparams.hwparams7);
>>  
>>  	if ((dep->endpoint.maxburst > 1 &&
>>

Hi Thinh,

> 
> This seems like a workaround more than a fix. As previously pointed out,
> there will be problems when there are multiple alternate setting
> interface [2]. If we're doing this way, are we properly allocating the
> fifo size for the alternate setting that requires the most fifo size and
> not just the first alt-setting 0? Also different alt-setting can have

Each alt interface will call usb_ep_autoconfig() which should be
assigned different endpoint numbers.  This would mean that if alt intf#0
gets selected, and EP is enabled, then we will resize the TXFIFO and map
that FIFO to the physical EP.  Then when/if the host requests the other
alt intf#1, and that calls EP enable, then the logic will then attempt
to resize based on the parameters, and again map that FIFO to the
physical EP. (since we call autoconfig on all interfaces, they should be
assigned different endpoints)

I agree that there is currently a limitation because we are going to
reserve at minimum 1 FIFO for BOTH alt interfaces, even though there is
only 1 interface active at a time.  The missing logic that we might be
missing is seeing how we can re-purpose the FIFO that is being disabled.
 However, I think Jack's fix here would be applicable to the improvement
in logic to re-use/re-assign FIFO space allocated by disabled EPs also.

> different endpoints, the logic handling this may not be simple.
> 
> There are a few review comments for Wesley. Hopefully they get resolved
> eventually.

As mentioned above, there is a lot of considerations we need to make
when looking at the amount of combinations that can be done for a USB
configuration.  We obviously want to see if we can find a way to
re-allocate FIFO space, but it gets complicated if we run into a
"fragmented" situation where the RAM associated to the EP being
re-allocated is in between 2 that are active.

Thanks
Wesley Cheng

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
