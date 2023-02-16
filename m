Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C646699E11
	for <lists+linux-usb@lfdr.de>; Thu, 16 Feb 2023 21:44:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbjBPUoH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Feb 2023 15:44:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjBPUoG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Feb 2023 15:44:06 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 134805035C
        for <linux-usb@vger.kernel.org>; Thu, 16 Feb 2023 12:44:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9EACE60A65
        for <linux-usb@vger.kernel.org>; Thu, 16 Feb 2023 20:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F943C433D2;
        Thu, 16 Feb 2023 20:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676580241;
        bh=/f/1wn/J4Uxrx4ZEzH8V2+IYjDgntehAALzuvvzMxbs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=O5/9GAa01Hj8QnkE2IDQyGaSSBNbmfkR+HEdDbx8odprwKLFaM4hxRO6kSKun1AWt
         sqwM8YoZbMBrwr12b3EarcA3LbY4YbKmune69n2FDRjOWvPtPXp9wEOSsWNZuAWR0w
         74mkVI1nKCH462KI1blCtkFeuxaXtAGr0RjW8pR8Ij2Xfkg5/GN47tuesVTOd69BHB
         WjToZrhWDd7mzQ4yCIAPyI2r0JLdxQfFUBhqwucyl64CmE6MQ2U5wcIvK2RtohWemH
         EeiiRPj7Bhxrg10GM5HknbV9AY/5D8RPkOknBJu6359+Xnf5kbKdyc3JiOTJCrTKs5
         DoMRRio3t/2zA==
Message-ID: <00e5e799-6cf0-b6f1-4eb4-0bd0c57e91c8@kernel.org>
Date:   Thu, 16 Feb 2023 22:43:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: dwc3: gadget suspend/resume vs system suspend/resume
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <7e28eb10-f27b-682a-dfb3-fec3e70b01f6@kernel.org>
 <Y+z9NK6AyhvTQMir@rowland.harvard.edu>
 <3b530a74-0fb9-432b-b1d9-606a9694ce1e@kernel.org>
 <Y+0jZScRX80mF8tS@rowland.harvard.edu>
 <20230215225337.wuzhpmikiqz5htqk@synopsys.com>
 <3b6f29e9-cc6b-d834-7c7e-7ae47b9fc44e@kernel.org>
 <20230216181132.k2jate2uwqadpqfh@synopsys.com>
Content-Language: en-US
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20230216181132.k2jate2uwqadpqfh@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 16/02/2023 20:11, Thinh Nguyen wrote:
> On Thu, Feb 16, 2023, Roger Quadros wrote:
>>
>>
>> On 16/02/2023 00:53, Thinh Nguyen wrote:
>>> On Wed, Feb 15, 2023, Alan Stern wrote:
>>>> On Wed, Feb 15, 2023 at 07:29:52PM +0200, Roger Quadros wrote:
>>>>> I was more interested in this case where USB is suspended and then system suspends.
>>>>> Waking up the system on USB activity (while suspended) is taken care of by hardware.
>>>>> But I'm not sure if gadget driver will be up in time to respond to the request
>>>>> reasonably quickly. It would take a couple of seconds and is not hard time bound.
>>>>> Is this time mandated by the USB Spec or is it host implementation specific?
>>>>
>>>> The USB spec doesn't say very much about it.  One part of the USB 2.0 
>>>> spec seems relevant; it says:
>>>>
>>>> 	9.2.6.2 Reset/Resume Recovery Time
>>>>
>>>> 	After a port is reset or resumed, the USB System Software is 
>>>> 	expected to provide a “recovery” interval of 10 ms before the 
>>>> 	device attached to the port is expected to respond to data 
>>>> 	transfers. The device may ignore any data transfers during the 
>>>> 	recovery interval.
>>>>
>>>> 	After the end of the recovery interval (measured from the end 
>>>> 	of the reset or the end of the EOP at the end of the resume 
>>>> 	signaling), the device must accept data transfers at any time.
>>>>
>>>> Accepting a data transfer doesn't necessarily mean completing it, 
>>>> though.  The Linux USB core does send a request to a device 10 ms 
>>>> after resuming it, but the timeout period on this request is 5 seconds.  
>>>> This gives you some leeway.
>>>>
>>>
>>> For most standard control requests, the spec indicates that the device
>>> must respond within 500ms. But that's not the case for some real devices
>>
>> I could not find any reference to 500ms time limit for suspend/resume case.
>> The only mention of 500ms in USB2.0 spec is:
>>
>> 	9.2.6.4 Standard Device Requests
>> 	...
>> 	For standard device requests that require data stage transfer
>> 	to the host, the device must be able to return the first data
>> 	packet to the host within 500 ms of receipt of the request.
>> 	For subsequent data packets, if any, the device must be able to
>> 	return them within 500 ms of successful completion of the
>> 	transmission of the previous packet. The device must then be
>> 	able to successfully complete the status stage within 50 ms after
>> 	returning the last data packet.
>>
>> I don't think this applies to suspend/resume.
> 
> Are you referring to the handshake timeout when the host tries to
> initiate resume at the link layer? It's relatively short compare to the
> software timeout and will vary depending on how many hub tiers in the
> topology. Also, that's handled by the host and device controller. We
> should care more about the software timeout after resume completed. The
> 500ms here applies if the device couldn't resume fast enough for the
> driver to prepare a transfer response to the host.
> 
>>
>>> so we have a 5 second timeout in Linux. For other requests, it's up to
>>> the class drivers. For most drivers on Linux, it's typically 5 seconds
>>> also.
>>
>> So it looks doable with Linux host. I'll have to check how other
>> USB hosts behave.
>>
>>>
>>> IMO, the system suspend on the gadget side should take precedence. That
>>> is, it shouldn't depend on whether the usb gadget is in suspend or not
>>> to go through system suspend. For that to happen, the gadget must
>>> initiate soft-disconnect. Otherwise I can see we may run into
>>> complications from the delay from the system suspend. For example, what
>>> if the host initiates resume right after suspend while the gadget side
>>> is still suspending?
>>
>> In this case, system will go all the way to suspend and then wake up.
>> It will take a few seconds more to respond than if system was already suspended.
> 
> Yes, my concern is the suspend/resume is measured in seconds.
> 
>>
>>> What if there are other gadgets on the setup that
>>> want or not want to go to suspend also? How can the system decide when
>>> it can go into suspend then?
>>
>> I think this is a policy decision and we cannot force one way or the other
>> in the kernel but allow user space to decide what must be done.
>> It would really depend on what the end application needs.
>>
>> So, does a gadget specific user settable flag seem reasonable to decide
>> if gadget driver should:
>> a) disconnect on system suspend regardless of USB state (current behavior)
>> b) prevent a system suspend if gadget is not in USB suspend. Allow otherwise.
>>
>> Or any better ideas?
>>
> 
> What's the use case here? Are you trying to drive the gadget system
> suspend via the host? That is, if the host resumes, the system on the
> gadget side would resume also? If that's the case, then perhaps that can
> be triggered in the gadget driver suspend instead?

The use case is:
The Linux System is a USB gadget which
1) If plugged to USB host and USB gadget is active the system will remain active
2) If plugged to USB host and USB gadget is suspended, it can transition to system suspend
(but may not always) (this check and trigger to system suspend is user space driven)
3) If system has suspended, any USB activity should resume the system and USB gadget should
resume (preferably without a disconnect/re-enumeration)
There can be exceptions if we don't meet certain host software timeout criteria,
in which case we simply re-enumerate.

> 
> Otherwise, it makes more sense to let the user control when he/she wants
> to resume if the user is the one that triggers the system suspend. On
> resume, the connection can be reestablished.

This is how it already is now no?

cheers,
-roger
