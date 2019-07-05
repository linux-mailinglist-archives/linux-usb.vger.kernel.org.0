Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24F8B5FF69
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2019 04:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbfGECIt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jul 2019 22:08:49 -0400
Received: from gate.crashing.org ([63.228.1.57]:37511 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726404AbfGECIs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Jul 2019 22:08:48 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6528XGo004910;
        Thu, 4 Jul 2019 21:08:34 -0500
Message-ID: <03595b660f319d5fb958ccbacbfe51002bff2314.camel@kernel.crashing.org>
Subject: Re: Virtual hub, resets etc...
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Michal Nazarewicz <mina86@mina86.com>
Date:   Fri, 05 Jul 2019 12:08:33 +1000
In-Reply-To: <Pine.LNX.4.44L0.1907042125420.840-100000@netrider.rowland.org>
References: <Pine.LNX.4.44L0.1907042125420.840-100000@netrider.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2019-07-04 at 21:34 -0400, Alan Stern wrote:
> > It is the right HW behaviour. But with our gadget stack, it doesn't
> > reset or cleanup anything. Though since the port gets disabled, I
> > suppose re-enabling it will cause a reset and will sort that out.
> 
> That's right.  (Except that you got the cause and effect reversed; 
> resetting the port is what causes it to be re-enabled.  :-)

Right.

> > > > Now, a few things i noticed while at it:
> > > > 
> > > >   - At some point I had code to reject EP queue() if the device is
> > > > suspended with -ESHUTDOWN. The end result was bad ... f_mass_storage
> > > > goes into an infinite loop of trying to queue the same stuff in
> > > > start_out_transfer() when that happens. It looks like it's not really
> > > > handling errors from queue() in a particularily useful way.
> > > 
> > > Don't reject EP queue requests.  Accept them as you would at any time;
> > > they will complete after the port is resumed.
> > 
> > Except the suspend on a bus reset clears the port enable. You can't
> > resume from that, only reset the port no ? Or am I missing something ?
> 
> You're right.  Nevertheless, the driver should accept queue requests, 
> even if they will eventually fail.  It's what the gadget drivers 
> expect.

Ok. Things seem to work. I went back to suspend on bus reset, and with
some other fixes I did to my enable/reset logic and the mass storage
fix I posted yesterday it seems to be solid. Yay !

> > > As for f_mass_storage, repeatedly attempting to queue an OUT transfer
> > > is normal behavior.  The fact that one attempt gets an error doesn't
> > > stop the driver from making more attempts; the only thing that would
> > > stop it is being disabled by a config change, a suspend, a disconnect,
> > > or an unbind.
> > 
> > Except it does that in a tight loop and locks up the machine...
> 
> Well, that wouldn't happen if your UDC accepted the requests, right?  

Sure but it would be nice if the mass storage dealt with -ESHUTDOWN
properly and stopped :-) Or other errors... if the UDC HW for example
dies for some reason, mass storage will lockup.

> Besides, f_mass_storage won't repeatedly try to queue an OUT transfer 
> once it knows that it is suspended.

Not afaik. But I might have missed something. I didn't see any suspend
callback in f_mass_storage.c...

Cheers,
Ben.

> Alan Stern
> 
> > > >   - With my current code doing suspend/resume on bus resets, when I
> > > > reboot some hosts, and they re-enumerate, I tend to hit the WARN_ON
> > > > drivers/usb/gadget/function/f_mass_storage.c:341
> > > > 
> > > > static inline int __fsg_is_set(struct fsg_common *common,
> > > >                               const char *func, unsigned line)
> > > > {
> > > >        if (common->fsg)
> > > >                return 1;
> > > >        ERROR(common, "common->fsg is NULL in %s at %u\n", func, line);
> > > >        WARN_ON(1);
> > > >        return 0;
> > > > }
> > > > 
> > > > This happens a little while after a successul set_configuration. Here's
> > > > a trace:
> > > 
> > > ...
> > > 
> > > > I have to get my head around that code, but if one of you have a clue, I
> > > > would welcome it :-)
> > > > 
> > > > Interestingly it recovers. The host seems to then reset the prot, then reconfigure and
> > > > the second time around it all works fine.
> > > 
> > > I suspect this is related to the race you found.  EJ Hsu has been 
> > > working on much the same thing (see the mailing list archive).
> > 
> > Right. I debugged the race and produced the fix I posted *after* I had
> > change my code to do a reset rather than a suspend on the hub receiving
> > an upstream bus reset.
> > 
> > I will switch back to doing suspend instead and see whether that stays
> > fixed.
> > 
> > Cheers,
> > Ben.

