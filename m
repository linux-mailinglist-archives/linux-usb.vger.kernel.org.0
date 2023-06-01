Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0D16719693
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jun 2023 11:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232546AbjFAJO2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jun 2023 05:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232558AbjFAJOY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Jun 2023 05:14:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBF99136
        for <linux-usb@vger.kernel.org>; Thu,  1 Jun 2023 02:14:21 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57A56105;
        Thu,  1 Jun 2023 11:13:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685610838;
        bh=ZpZ4ao64bELY7E0fzyhyw35CO0oLGJSJXwkyZ8SPT+g=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=XlB0fSd3b+QIbsIP/6ShFyV35egVrpsqd5WbhCMTsnKn11Gd3qv4f1D55GgotM1eH
         FyN7aBysNt6+RAW45aRGvpYYkjlkYACXIzx48H2Hku4M7E+0+IM1jeUa8Go5RlfjxK
         Tv99m9pbW3oGSHSJvm1FRq4rFNKJyMPQkkXXC/+0=
Message-ID: <78ae5641-0650-f380-feba-7e7093f8ee39@ideasonboard.com>
Date:   Thu, 1 Jun 2023 10:14:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] usb: dwc3: gadget: Clear DWC3_EP_PENDING_REQUEST from
 non-0 endpoints
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "torleiv@huddly.com" <torleiv@huddly.com>
References: <20230531085544.253363-1-dan.scally@ideasonboard.com>
 <69135fc1-5ebb-ff95-4c7b-17cf8e30c924@ideasonboard.com>
 <20230531182525.r2rf3mg3fhec2uo2@synopsys.com>
Content-Language: en-US
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230531182525.r2rf3mg3fhec2uo2@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Thinh

On 31/05/2023 19:25, Thinh Nguyen wrote:
> Hi Dan,
>
> On Wed, May 31, 2023, Dan Scally wrote:
>> Hi Thinh
>>
>> On 31/05/2023 09:55, Daniel Scally wrote:
>>> The DWC3_EP_PENDING_REQUEST flag is set against an endpoint when
>>> there are no pending or started requests available. This flag is
>>> cleared on queuing to the endpoint for endpoint 0, but not for any
>>> other endpoints. This can exacerbate timing problems by allowing a
>>> queue to go ahead for an isochronous endpoint that should not be
>>> started, so clear the flag upon a successful dwc3_gadget_ep_queue().
>>>
>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>> ---
>>
>> Just wanted to give some background on the timing issues that this is
>> helping to relieve; we spotted this issue as a result of a "No resource for
>> ep1in" error being thrown occasionally during repeated stream on/off tests
>> for the UVC gadget on a platform using the DWC3; following the error stream
>> won't restart unless you reboot. That error occurs when the gadget's
>> workqueue function runs usb_ep_queue() whilst usb_ep_disable() is running
>> during stream off. The DWC3 gadget code's locking plus the nulling of the
>> endpoint descriptor during __dwc3_gadget_ep_disable() [1] and the check for
>> that situation in __dwc3_gadget_ep_queue() [2] should make that harmless,
>> but what occasionally happens is the dwc3_gadget_ep_queue() call sometimes
>> manages to grab the lock when it's briefly unlocked during
>> dwc3_gadget_giveback() [3]. That happens after the Stop Transfer command has
>> been sent, so __dwc3_gadget_ep_queue() running through triggers a Start
>> Transfer command, the dwc3_gadget_ep_disable() then finishes and stream
>> shuts down, but when it's started back up again another Start Transfer
>> command is sent and triggers the error. This patch ameliorates the impact of
>> that race in my case, because clearing the flag prevents
>> __dwc3_gadget_ep_queue() from running either __dwc3_gadget_start_isoc() or
>> __dwc3_gadget_kick_transfer() for a non started isoc endpoint - but the race
>> is still there. I think the potential for races is probably unavoidable
>> given the unlock, but I thought it was worth explaining what lead to the
>> patch in case it raises some issue that I'm missing.
>>
>>
>> Thanks
>>
>> Dan
>>
>>
>> [1] https://urldefense.com/v3/__https://elixir.bootlin.com/linux/latest/source/drivers/usb/dwc3/gadget.c*L1044__;Iw!!A4F2R9G_pg!aqEKDZwHxzb0OYos1htFTiXTnPWcQbnNg8qezhCNJ7bVQP-Ewp4NDw2N_mijL02MRmoyOFj4dlO7vEg1NowmS4A3kjU6$
>> [2] https://urldefense.com/v3/__https://elixir.bootlin.com/linux/latest/source/drivers/usb/dwc3/gadget.c*L1923__;Iw!!A4F2R9G_pg!aqEKDZwHxzb0OYos1htFTiXTnPWcQbnNg8qezhCNJ7bVQP-Ewp4NDw2N_mijL02MRmoyOFj4dlO7vEg1NowmS7iHqZdg$
>> [3] https://urldefense.com/v3/__https://elixir.bootlin.com/linux/latest/source/drivers/usb/dwc3/gadget.c*L216__;Iw!!A4F2R9G_pg!aqEKDZwHxzb0OYos1htFTiXTnPWcQbnNg8qezhCNJ7bVQP-Ewp4NDw2N_mijL02MRmoyOFj4dlO7vEg1NowmS4WOrh98$
>>
>
> Thanks for the detail background description. This helps a lot. The
> DWC3_EP_PENDING_REQUEST flag is actually only meant for ep0 and isoc
> endpoints. Regarding isoc endpoint, the gadget driver should prepare and
> queue isoc requests prior to the host requesting for it. Should that's
> not the case, this flag is set so that dwc3 can schedule transfer later
> when the are isoc requests are queued.
>
> The "No resource for ep1in" is expected in your case. The
> usb_ep_disable() API is documented that no other task may be using the
> endpoint when it's called.


Ah - I had missed that in the kerneldoc comment for usb_ep_disable(). OK.

> The UVC gadget driver is breaking this usage
> model when it tries to queue more request after calling
> usb_ep_disable().
>
> Your patch will not resolve the issue you're trying to solve. The fix
> should be in the UVC gadget driver.


I think in that case I'll patch the gadget to wind down the workqueue before usb_ep_disable() is 
called and that should also fix it - thanks for the help.


Dan

>
> Thanks,
> Thinh
