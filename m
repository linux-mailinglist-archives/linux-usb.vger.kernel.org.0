Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06E643B5B72
	for <lists+linux-usb@lfdr.de>; Mon, 28 Jun 2021 11:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232516AbhF1JjR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Jun 2021 05:39:17 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:54822 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232315AbhF1JjQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Jun 2021 05:39:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624873011; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Ix1sjBb6toi9CPLsHl8ZR2Ej/57+qjdBVCoGLPP6RZY=;
 b=gDZu/pj2RYwUoNWxNAo9ubILMD2RRnQiz7DaX8aL0oot6bav4w3YQE/XM36nlvXK8tWuZRFd
 v/W2YwmATzUacW9eJOBPg/HOy8KC5QvRX5vzAlQ6fZhccF3PxWYwsOqMxIOxVm1kelFZBB7H
 YVfRzLRt0NxE2b+XspEAGa0HUNI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60d998173a8b6d0a4531dde9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Jun 2021 09:36:23
 GMT
Sender: linyyuan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B83FAC43217; Mon, 28 Jun 2021 09:36:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: linyyuan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C05F4C433D3;
        Mon, 28 Jun 2021 09:36:22 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 28 Jun 2021 17:36:22 +0800
From:   linyyuan@codeaurora.org
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jack Pham <jackp@codeaurora.org>
Subject: Re: [PATCH] usb: dwc3: fix race of usb_gadget_driver operation
In-Reply-To: <20210627140903.GB624763@rowland.harvard.edu>
References: <20210625104415.8072-1-linyyuan@codeaurora.org>
 <20210625163707.GC574023@rowland.harvard.edu>
 <b24825113327c72c742d55e89ec2726e@codeaurora.org>
 <20210626150304.GA601624@rowland.harvard.edu>
 <1d1f06763c7cdeb67264128537c6a8f4@codeaurora.org>
 <20210627140903.GB624763@rowland.harvard.edu>
Message-ID: <ca669cb24f424e1c28adfa3a84d7bad2@codeaurora.org>
X-Sender: linyyuan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021-06-27 22:09, Alan Stern wrote:
> On Sun, Jun 27, 2021 at 10:48:56AM +0800, linyyuan@codeaurora.org 
> wrote:
>> On 2021-06-26 23:03, Alan Stern wrote:
>> > On Sat, Jun 26, 2021 at 09:16:25AM +0800, linyyuan@codeaurora.org wrote:
>> > > On 2021-06-26 00:37, Alan Stern wrote:
> 
>> > > > Here and in the other places, you should test dwc->async_callbacks
>> > > > _before_ dropping the spinlock.  Otherwise there is a race (the flag
>> > > > could be written at about the same time it is checked).
>> > > thanks for your comments,
>> > >
>> > > if you think there is race here, how to make sure gadget_driver
>> > > pointer is
>> > > safe,
>> > > this is closest place where we can confirm it is non-NULL by checking
>> > > async_callbacks ?
>> >
>> > I explained this twice already: We know that gadget_driver is not
>> > NULL because usb_gadget_remove_driver calls synchronize_irq before
>> > doing usb_gadget_udc_stop.
>> >
>> > Look at this timing diagram:
>> >
>> > 	CPU0				CPU1
>> > 	----				----
>> > 	IRQ happens for setup packet
>> > 	  Handler sees async_callbacks
>> > 	    is enabled
>> > 	  Handler unlocks dwc->lock
>> > 					usb_gadget_remove_driver runs
>> > 					  Disables async callbacks
>> > 					  Calls synchronize_irq
>> > 	  Handler calls dwc->		  . waits for IRQ handler to
>> > 	    gadget_driver->setup	  .   return
>> > 	  Handler locks dwc-lock	  .
>> > 	  ...				  .
>> > 	  Handler returns		  .
>> > 					  . synchronize_irq returns
>> > 					  Calls usb_gadget_udc_stop
>> > 					    dwc->gadget_driver is
>> > 					      set to NULL
>> >
>> > As you can see, dwc->gadget_driver is non-NULL when CPU0 uses it,
>> > even though async_callbacks gets cleared during the time when the
>> > lock is released.
>> thanks for your patient explanation,
>> but from this part, seem it is synchronize_irq() help to avoid NULL 
>> pointer
>> crash.
> 
> That's right.
> 
>> can you also explain how async_callbacks flag help here  ?
> 
> It doesn't help in the situation shown above, but it does help in other
> situations.  Consider this timing diagram:
> 
> 	CPU0				CPU1
> 	----				----
> 					usb_gadget_remove_driver runs
> 					  Disables async callbacks
> 					  Calls synchronize_irq
> 					    synchronize_irq returns
> 					  Calls udc_driver_unbind
> 	IRQ happens for disconnect
> 	  Handler sees async_callbacks
> 	    is disabled
> 	  Handler returns
> 					  Calls usb_gadget_udc_stop
> 					    dwc->gadget_driver is
> 					      set to NULL
> 
> With the async_callbacks check, everything works okay.  But now look at
> what would happen without the async_callbacks mechanism:
> 
> 	CPU0				CPU1
> 	----				----
> 					usb_gadget_remove_driver runs
> 					  Calls synchronize_irq
> 					    synchronize_irq returns
> 					  Calls udc_driver_unbind
> 	IRQ happens for disconnect
> 	  Handler unlocks dwc->lock
> 	  Calls dwc->gadget_driver->disconnect
> 	    Gadget driver has already been unbound
> 	      and is not prepared to handle a
> 	      callback, so it crashes
> 					  Calls usb_gadget_udc_stop
> 					    dwc->gadget_driver is
> 					      set to NULL
> 
> Without the async_callbacks mechanism, the gadget driver can get a
> callback at the wrong time (after it has been unbound), which might
> cause it to crash.
1. do you think we need to back to my original patch,
https://lore.kernel.org/linux-usb/20210619154309.52127-1-linyyuan@codeaurora.org/T/#t

i think we can add the spin lock or mutex lock to protect this kind of 
race from UDC layer, it will be easy understanding.


2. if you insist this kind of change, how to change following code in 
dwc3 ?
if (dwc->gadget_driver && dwc->gadget_driver->disconnect) {

2.1 if (dwc->async_callbacks && dwc->gadget_driver->disconnect) {
or
2.2 if (dwc->async_callbacks && vdwc->gadget_driver && 
dwc->gadget_driver->disconnect) {


> 
> Alan Stern
