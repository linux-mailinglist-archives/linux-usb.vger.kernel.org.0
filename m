Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3078260D9D
	for <lists+linux-usb@lfdr.de>; Sat,  6 Jul 2019 00:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbfGEWGS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jul 2019 18:06:18 -0400
Received: from gate.crashing.org ([63.228.1.57]:39213 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725813AbfGEWGS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Jul 2019 18:06:18 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x65M694X013794;
        Fri, 5 Jul 2019 17:06:10 -0500
Message-ID: <61c9671f04cbbc085c8919430d92c7b2803378af.camel@kernel.crashing.org>
Subject: Re: Virtual hub, resets etc...
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Michal Nazarewicz <mina86@mina86.com>
Date:   Sat, 06 Jul 2019 08:06:08 +1000
In-Reply-To: <Pine.LNX.4.44L0.1907051008580.1606-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1907051008580.1606-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2019-07-05 at 10:20 -0400, Alan Stern wrote:
> 
> > Right. I do see the resume coming in, but I don't forward it to the
> > gadget because here's what happens in that order:
> > 
> >  1- Host gets shutdown (or cable disconnected)
> > 
> >  2- Upstream bus suspend: I call ->suspend on the gadgets on all
> > enabled ports that don't have USB_PORT_STAT_SUSPEND already set. I
> > don't change the port status, I don't set USB_PORT_STAT_SUSPEND
> 
> Hmmm.  Does the descriptor for your hub say that it is self-powered?  A 
> bus-powered hub would turn off completely when its upstream cable was 
> unplugged, thereby sending a disconnect signal to all its child 
> devices.
> 
> I don't recall what the USB spec says a self-powered hub should do.  
> Maybe it doesn't say anything about it.

Yes it's self powered. I took the cable as an example, this scenario
happens with a host power off as well of course whihc is more relevant
in our case since we are a BMC).

> >  3- Machine gets turned back on (or cable reconnected)
> >  
> >  4- Upstream bus resume: I call ->resume on the gadgets on all
> > enabled ports that don't have USB_PORT_STAT_SUSPEND set.
> 
> No, the upstream bus doesn't resume upon cable reconnect.

It does. At least my HW detects a resume signaling right before the but
reset.

>   A resume
> would require packets to be received over the cable, but the host won't
> send any packets to the hub until the upstream port has been reset and
> enabled.  So you should eliminate this step.

It's not a step I created. I do observe resume signaling by the hub HW
(it's an interrupt) right before the bus reset when the host comes back
up. In any case, no impact on what happens below...

> >  5- Upstream bus reset: I call ->suspend on all enabled ports after
> > clearing their status (I preserve only USB_PORT_STAT_SUSPEND and
> > USB_PORT_STAT_POWER which is always set for me). Note: I currently do
> > this even if the port had USB_PORT_STAT_SUSPEND set, so such as port
> > will get a double suspend ... maybe I shouldn't.
> 
> I believe the upstream reset should cause the hub to clear all the 
> downstream port statuses.  Even if the reset doesn't do this, the 
> Set-Config request which follows the reset should.
> 
> Whether you tell the gadget drivers they are no longer suspended is up 
> to you.  I suspect it doesn't matter much.

Typo. I preserve POWER and CONNECTION. Not SUSPEND.

POWER because I'm self powered so it's always set and CONNECTION for
obvious reasons.

> >  6- Hosts sets port reset: I reset the gadget since it's already
> > bound/enabled. It's still "suspended".
> > 
> > So we do have a legitimate case of "reset while suspended".
> 
> Ah, but it doesn't contradict what I wrote earlier.  There's a
> difference between resuming a suspended _device_ and resuming a
> suspended _port_.
> 
> Nevertheless, in practice the difference doesn't matter and the 
> composite core should do the right thing.

Yes :-)

> > I'll tidy up the patch and submit it.
> 
> Good.

Cheers,
Ben.


