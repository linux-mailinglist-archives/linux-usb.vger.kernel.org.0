Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7E3B36DBC2
	for <lists+linux-usb@lfdr.de>; Wed, 28 Apr 2021 17:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhD1Pfw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Apr 2021 11:35:52 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:35376 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231169AbhD1Pfv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Apr 2021 11:35:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619624106; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=xd3IFW98wHc8xfKOFAXgEamkEJ3OAz2rAjqRcBg4MF0=; b=o/aYUUmSJVvcS9Yt3Xy2Jre4p0QZTzauFcC/WiZUTDt6gJFG1ZT9j3+pzi886XrF7eNJssAI
 jho5MeLawwSYIXf4F7oac6CqdIhSo0TZE7I3KC0NWSDFRfbQFr8uYBBEZBZyB6y58M+LpPRW
 QunW4ZYi/QwLUxBON36gho6uwno=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 608980a6f34440a9d4aa6b83 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 28 Apr 2021 15:35:02
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5EC5BC4338A; Wed, 28 Apr 2021 15:35:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 508A8C433F1;
        Wed, 28 Apr 2021 15:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 508A8C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Wed, 28 Apr 2021 08:34:58 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>,
        Baolin Wang <baolin.wang7@gmail.com>
Subject: Re: [PATCH 1/2] usb: dwc3: gadget: Enable suspend events
Message-ID: <20210428153458.GD20698@jackp-linux.qualcomm.com>
References: <20210428090111.3370-1-jackp@codeaurora.org>
 <87h7jqk8xk.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h7jqk8xk.fsf@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Felipe,

On Wed, Apr 28, 2021 at 01:19:51PM +0300, Felipe Balbi wrote:
> Jack Pham <jackp@codeaurora.org> writes:
> > commit 72704f876f50 ("dwc3: gadget: Implement the suspend entry event
> > handler") introduced (nearly 5 years ago!) an interrupt handler for
> > U3/L1-L2 suspend events.  The problem is that these events aren't
> 
> look deeper. They *were* enabled. We've removed because, as it turns
> out, they just add a TON of interrupts and don't give us much extra
> information. The only reason why the state change interrupts are still
> there is because of a known silicon bug in versions < 2.50a. That's all
> documented in the driver itself.

I did go through the commit history. Are you referring to your change
799e9dc82968 ("usb: dwc3: gadget: conditionally disable Link State
change events")?  If so then it sounds like you are talking about the
link state change event, defined as event value 3 and enabled with
DEVTEN bit 3.

The "link state change event" is *not* the same as the one I'm referring
to in this patch which is documented in newer revisions of the databook
(both DWC3 and DWC3.1) as "USB Suspend Entry" (event 6). It's described
as only getting generated when the link enters U3, L2 or L1 states.

> For anything that works, we *don't* want link state change interrupts.

Fully agree. I've seen the "link state change" interrupts in action and
they are very noisy as they get generated for every single link event,
particularly the USB 3.x LTSSM, including U0, U1, U2, Compliance,
Polling, etc. in addition to the above U3, L2 & L1.

But I am not proposing re-enabling that particular event type here.

> > currently enabled in the DEVTEN register so the handler is never
> > even invoked.  Fix this simply by enabling the corresponding bit
> > in dwc3_gadget_enable_irq() using the same revision check as found
> > in the handler.
> 
> More importantly, *why* do you think you need these interrupts?

Bus suspend and resume are useful conditions to be notified about--
that's why we have the .suspend() & .resume() callbacks in struct
usb_gadget_driver.  But currently the dwc3 gadget does not have any
interrupt generated for suspend, and as of now the dwc3_gadget_suspend()
does not get called, so it will never invoke the gadget driver's (let's
say composite.c) .suspend() routine.

dwc3_gadget_suspend() is called from two places:

  1. dwc3_gadget_linksts_change_interrupt() - which is the handler for
     DWC3_DEVICE_EVENT_LINK_STATUS_CHANGE, the one I believe you are
     referring to and is only enabled on revisions < 2.50a.

  2. dwc3_gadget_suspend_interrupt() - which is the handler for the
     DWC3_DEVICE_EVENT_EOPF (which I'm promptly renaming to
     DWC3_DEVICE_EVENT_SUSPEND in patch 2/2)

> > Fixes: 72704f876f50 ("dwc3: gadget: Implement the suspend entry event handler")
> > Signed-off-by: Jack Pham <jackp@codeaurora.org>
> > ---
> >  drivers/usb/dwc3/gadget.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > index dd80e5ca8c78..cab3a9184068 100644
> > --- a/drivers/usb/dwc3/gadget.c
> > +++ b/drivers/usb/dwc3/gadget.c
> > @@ -2323,6 +2323,10 @@ static void dwc3_gadget_enable_irq(struct dwc3 *dwc)
> >  	if (DWC3_VER_IS_PRIOR(DWC3, 250A))
> >  		reg |= DWC3_DEVTEN_ULSTCNGEN;
> >  
> > +	/* On 2.30a and above this bit enables U3/L2-L1 Suspend Events */
> > +	if (!DWC3_VER_IS_PRIOR(DWC3, 230A))
> > +		reg |= DWC3_DEVTEN_EOPFEN;
> 
> look at cpu usage for dwc3's interrupt before and after this
> IRQ. Specially when connected to a host that fully supports LPM. IIRC,
> recent xhci should trigger state changes fairly often.

In our experience for U3 & L2 they are only as frequent as the host
enters suspend, which is not that frequent unless the user is toggling
system suspend/resume like crazy or has autosuspend enabled with a very
short timeout.

You are right that LPM L1 might happen more often when connected to a
host that supports it. I'll try to collect some stats in that case to
see what is a typical count for a given connection. It's worth noting
that the dwc3_gadget_suspend_interrupt() handler specifically checks
whether it is U3 (L2 if 2.0) before calling dwc3_gadget_suspend()
otherwise it just stores the current link_state and exits.  So almost a
no-op but not quite since it does incur the cost of an interrupt every
time it happens.

> Still, why do you think you need these events?

Answered above. I'll add that specifically composite_suspend() also
invokes each function driver's .suspend() callback which is needed in
case functions have to stop any outstanding endpoint requests and
restart them in the .resume() handler. And finally composite_suspend()
also invokes the vbus_draw() callback which is needed to properly
inform a power supply or charger to stop drawing current to comply with
USB suspend power requirements.

Thanks,
Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
