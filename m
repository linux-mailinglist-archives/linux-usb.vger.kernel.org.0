Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9117C5FE3D
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jul 2019 23:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbfGDVox (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jul 2019 17:44:53 -0400
Received: from gate.crashing.org ([63.228.1.57]:47761 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725917AbfGDVox (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Jul 2019 17:44:53 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x64LifPd031202;
        Thu, 4 Jul 2019 16:44:42 -0500
Message-ID: <776c8b72bff0d7dc80d56e58a0c8c1f46b882eb5.camel@kernel.crashing.org>
Subject: Re: Virtual hub, resets etc...
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Michal Nazarewicz <mina86@mina86.com>
Date:   Fri, 05 Jul 2019 07:44:39 +1000
In-Reply-To: <Pine.LNX.4.44L0.1907041142410.18767-100000@netrider.rowland.org>
References: <Pine.LNX.4.44L0.1907041142410.18767-100000@netrider.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2019-07-04 at 12:13 -0400, Alan Stern wrote:
> >   - bus reset: When I sense a bus reset, that's where I'm not too sure
> > what to do. Currently I clear all the status bits of the ports
> > except USB_PORT_STAT_SUSPEND. Thus I clear USB_PORT_STAT_ENABLE.
> > But I'm not sure what to do with the gadget. I currently call
> > the gadget suspend as "hinted" by the spec calling for S0 state iirc,
> > but I don't think it's the best thing to do, it doesn't make that much
> > sense... Should I do a gadget reset instead ? 
> 
> You should also clear USB_PORT_STAT_SUSPEND.  Calling the gadget's
> suspend routine (if the gadget isn't already suspended) is the right
> thing to do; the spec says a USB device goes into suspend if it doesn't
> receive any packets for a period of 3 (or 5? -- something like that)  
> ms, and that certainly would be the case here.
> 
> >   - If the host clears USB_PORT_STAT_ENABLE, what should I do ? I
> > currently do a suspend as well, which isn't great... mostly it does
> > nothing and keep potentially the gadget trying to do stuff. I could
> > do a reset. I don't want to do a disconnect because we are still
> > connected to the hub so that's not really the right call, but at least
> > for composite it's the same thing...
> 
> As above, doing a suspend is the right thing.

It is the right HW behaviour. But with our gadget stack, it doesn't
reset or cleanup anything. Though since the port gets disabled, I
suppose re-enabling it will cause a reset and will sort that out.

> > Now, a few things i noticed while at it:
> > 
> >   - At some point I had code to reject EP queue() if the device is
> > suspended with -ESHUTDOWN. The end result was bad ... f_mass_storage
> > goes into an infinite loop of trying to queue the same stuff in
> > start_out_transfer() when that happens. It looks like it's not really
> > handling errors from queue() in a particularily useful way.
> 
> Don't reject EP queue requests.  Accept them as you would at any time;
> they will complete after the port is resumed.

Except the suspend on a bus reset clears the port enable. You can't
resume from that, only reset the port no ? Or am I missing something ?

> As for f_mass_storage, repeatedly attempting to queue an OUT transfer
> is normal behavior.  The fact that one attempt gets an error doesn't
> stop the driver from making more attempts; the only thing that would
> stop it is being disabled by a config change, a suspend, a disconnect,
> or an unbind.

Except it does that in a tight loop and locks up the machine...

> >   - With my current code doing suspend/resume on bus resets, when I
> > reboot some hosts, and they re-enumerate, I tend to hit the WARN_ON
> > drivers/usb/gadget/function/f_mass_storage.c:341
> > 
> > static inline int __fsg_is_set(struct fsg_common *common,
> >                               const char *func, unsigned line)
> > {
> >        if (common->fsg)
> >                return 1;
> >        ERROR(common, "common->fsg is NULL in %s at %u\n", func, line);
> >        WARN_ON(1);
> >        return 0;
> > }
> > 
> > This happens a little while after a successul set_configuration. Here's
> > a trace:
> 
> ...
> 
> > I have to get my head around that code, but if one of you have a clue, I
> > would welcome it :-)
> > 
> > Interestingly it recovers. The host seems to then reset the prot, then reconfigure and
> > the second time around it all works fine.
> 
> I suspect this is related to the race you found.  EJ Hsu has been 
> working on much the same thing (see the mailing list archive).

Right. I debugged the race and produced the fix I posted *after* I had
change my code to do a reset rather than a suspend on the hub receiving
an upstream bus reset.

I will switch back to doing suspend instead and see whether that stays
fixed.

Cheers,
Ben.


