Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 831CE698EE2
	for <lists+linux-usb@lfdr.de>; Thu, 16 Feb 2023 09:40:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbjBPIkX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Feb 2023 03:40:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbjBPIkW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Feb 2023 03:40:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E457355AB
        for <linux-usb@vger.kernel.org>; Thu, 16 Feb 2023 00:40:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 95DD6B823E0
        for <linux-usb@vger.kernel.org>; Thu, 16 Feb 2023 08:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD84C433D2;
        Thu, 16 Feb 2023 08:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676536818;
        bh=d4a3EYMDhCsRjBctuSGeENHEQESunwhkWLZiOQBA+e8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=c8QyLhE7xdmwe+c5LC8+HEjcNcTPgl5ITLLPWq+eV6aAiGUxXYz2NqUbvWJ8EkjgN
         vSzxK3s+vNvQkTLYd4kyAWgk2DQ9liOeMmz2qT8e+b9vE/qTZCMqDfVAwb2agmatdV
         Djkc02kvG7rAissqVIyfqv+00yw3b0diBrjv+dH83wJni69SSe6H7cYssSWiyACc2a
         jvToZNTvebPzHzXJ5eeRffv59l8Qq14iKt2pSaSFDf6dZSKqc5Coac6kKvTfqiljr9
         lPZJRNgGODsb1IY8dVrbjBmyGh3hdlZltreR/wYf/jNAKAw7JssoXhblUg05qZPwPI
         HcpqgX2DbLCDw==
Message-ID: <3b6f29e9-cc6b-d834-7c7e-7ae47b9fc44e@kernel.org>
Date:   Thu, 16 Feb 2023 10:40:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: dwc3: gadget suspend/resume vs system suspend/resume
Content-Language: en-US
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <7e28eb10-f27b-682a-dfb3-fec3e70b01f6@kernel.org>
 <Y+z9NK6AyhvTQMir@rowland.harvard.edu>
 <3b530a74-0fb9-432b-b1d9-606a9694ce1e@kernel.org>
 <Y+0jZScRX80mF8tS@rowland.harvard.edu>
 <20230215225337.wuzhpmikiqz5htqk@synopsys.com>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20230215225337.wuzhpmikiqz5htqk@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 16/02/2023 00:53, Thinh Nguyen wrote:
> On Wed, Feb 15, 2023, Alan Stern wrote:
>> On Wed, Feb 15, 2023 at 07:29:52PM +0200, Roger Quadros wrote:
>>> I was more interested in this case where USB is suspended and then system suspends.
>>> Waking up the system on USB activity (while suspended) is taken care of by hardware.
>>> But I'm not sure if gadget driver will be up in time to respond to the request
>>> reasonably quickly. It would take a couple of seconds and is not hard time bound.
>>> Is this time mandated by the USB Spec or is it host implementation specific?
>>
>> The USB spec doesn't say very much about it.  One part of the USB 2.0 
>> spec seems relevant; it says:
>>
>> 	9.2.6.2 Reset/Resume Recovery Time
>>
>> 	After a port is reset or resumed, the USB System Software is 
>> 	expected to provide a “recovery” interval of 10 ms before the 
>> 	device attached to the port is expected to respond to data 
>> 	transfers. The device may ignore any data transfers during the 
>> 	recovery interval.
>>
>> 	After the end of the recovery interval (measured from the end 
>> 	of the reset or the end of the EOP at the end of the resume 
>> 	signaling), the device must accept data transfers at any time.
>>
>> Accepting a data transfer doesn't necessarily mean completing it, 
>> though.  The Linux USB core does send a request to a device 10 ms 
>> after resuming it, but the timeout period on this request is 5 seconds.  
>> This gives you some leeway.
>>
> 
> For most standard control requests, the spec indicates that the device
> must respond within 500ms. But that's not the case for some real devices

I could not find any reference to 500ms time limit for suspend/resume case.
The only mention of 500ms in USB2.0 spec is:

	9.2.6.4 Standard Device Requests
	...
	For standard device requests that require data stage transfer
	to the host, the device must be able to return the first data
	packet to the host within 500 ms of receipt of the request.
	For subsequent data packets, if any, the device must be able to
	return them within 500 ms of successful completion of the
	transmission of the previous packet. The device must then be
	able to successfully complete the status stage within 50 ms after
	returning the last data packet.

I don't think this applies to suspend/resume.

> so we have a 5 second timeout in Linux. For other requests, it's up to
> the class drivers. For most drivers on Linux, it's typically 5 seconds
> also.

So it looks doable with Linux host. I'll have to check how other
USB hosts behave.

> 
> IMO, the system suspend on the gadget side should take precedence. That
> is, it shouldn't depend on whether the usb gadget is in suspend or not
> to go through system suspend. For that to happen, the gadget must
> initiate soft-disconnect. Otherwise I can see we may run into
> complications from the delay from the system suspend. For example, what
> if the host initiates resume right after suspend while the gadget side
> is still suspending?

In this case, system will go all the way to suspend and then wake up.
It will take a few seconds more to respond than if system was already suspended.

> What if there are other gadgets on the setup that
> want or not want to go to suspend also? How can the system decide when
> it can go into suspend then?

I think this is a policy decision and we cannot force one way or the other
in the kernel but allow user space to decide what must be done.
It would really depend on what the end application needs.

So, does a gadget specific user settable flag seem reasonable to decide
if gadget driver should:
a) disconnect on system suspend regardless of USB state (current behavior)
b) prevent a system suspend if gadget is not in USB suspend. Allow otherwise.

Or any better ideas?

cheers,
-roger
