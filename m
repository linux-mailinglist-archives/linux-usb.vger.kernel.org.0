Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 060245FB90
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jul 2019 18:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbfGDQNk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jul 2019 12:13:40 -0400
Received: from netrider.rowland.org ([192.131.102.5]:53649 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726038AbfGDQNk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Jul 2019 12:13:40 -0400
Received: (qmail 19777 invoked by uid 500); 4 Jul 2019 12:13:39 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 4 Jul 2019 12:13:39 -0400
Date:   Thu, 4 Jul 2019 12:13:39 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>
cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Michal Nazarewicz <mina86@mina86.com>
Subject: Re: Virtual hub, resets etc...
In-Reply-To: <617c4ba96b9664377c24444e8b82ffa75a8a5357.camel@kernel.crashing.org>
Message-ID: <Pine.LNX.4.44L0.1907041142410.18767-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 4 Jul 2019, Benjamin Herrenschmidt wrote:

> Hi Folks !
> 
> (Michal: Mass storage issue near the end...)
> 
> So I'd like to pick your brains on what you think is the best policy to
> implement for this case:
> 
> The issue is around the Aspeed vhub driver which I wrote.
> 
> To recap, the HW shows on the host as a USB hub with 5 ports for which
> I create five UDC for gadgets. The actual hub emulation is largely done
> in SW with HW assist.
> 
> At the moment, the hub always pulls up, so it's always present on the
> host when there's a host connected. So far so good (this is the subject
> of another discussion).
> 
> When any of the child UDC pulls up, I show the USB_PORT_STAT_CONNECTION
> on that port, so the host enumerates. At the moment,
> USB_PORT_STAT_POWER is always set and I don't emulate power control.
> 
> The opposite with the child pulling down of course.
> 
> The interesting question however is how to react to events on the
> upstream leg of the hub such as suspend, resume and USB reset. So far I
> don't seem to be able to detect connection/disconnection but I'll dig a
> bit more.
> 
> So far, I've tried to implement what I understand of the USB spec (I
> might have misread) which consists of the following:
> 
>  - suspend: For each enabled port that isn't explicitely in
> USB_PORT_STAT_SUSPEND state already (host initiated port suspend), call
> the corresponding gadget suspend callback if any. I do NOT set
> USB_PORT_STAT_SUSPEND in the port state.
> 
>  - resume: As above but with the resume callback

That sounds right.

> (Note: See below about issues with suspend)
> 
>  - bus reset: When I sense a bus reset, that's where I'm not too sure
> what to do. Currently I clear all the status bits of the ports
> except USB_PORT_STAT_SUSPEND. Thus I clear USB_PORT_STAT_ENABLE.
> But I'm not sure what to do with the gadget. I currently call
> the gadget suspend as "hinted" by the spec calling for S0 state iirc,
> but I don't think it's the best thing to do, it doesn't make that much
> sense... Should I do a gadget reset instead ? 

You should also clear USB_PORT_STAT_SUSPEND.  Calling the gadget's
suspend routine (if the gadget isn't already suspended) is the right
thing to do; the spec says a USB device goes into suspend if it doesn't
receive any packets for a period of 3 (or 5? -- something like that)  
ms, and that certainly would be the case here.

>  - If the host clears USB_PORT_STAT_ENABLE, what should I do ? I
> currently do a suspend as well, which isn't great... mostly it does
> nothing and keep potentially the gadget trying to do stuff. I could
> do a reset. I don't want to do a disconnect because we are still
> connected to the hub so that's not really the right call, but at least
> for composite it's the same thing...

As above, doing a suspend is the right thing.

> Now, a few things i noticed while at it:
> 
>  - At some point I had code to reject EP queue() if the device is
> suspended with -ESHUTDOWN. The end result was bad ... f_mass_storage
> goes into an infinite loop of trying to queue the same stuff in
> start_out_transfer() when that happens. It looks like it's not really
> handling errors from queue() in a particularily useful way.

Don't reject EP queue requests.  Accept them as you would at any time;
they will complete after the port is resumed.

As for f_mass_storage, repeatedly attempting to queue an OUT transfer
is normal behavior.  The fact that one attempt gets an error doesn't
stop the driver from making more attempts; the only thing that would
stop it is being disabled by a config change, a suspend, a disconnect,
or an unbind.

>  - With my current code doing suspend/resume on bus resets, when I
> reboot some hosts, and they re-enumerate, I tend to hit the WARN_ON
> drivers/usb/gadget/function/f_mass_storage.c:341
> 
> static inline int __fsg_is_set(struct fsg_common *common,
> 			       const char *func, unsigned line)
> {
> 	if (common->fsg)
> 		return 1;
> 	ERROR(common, "common->fsg is NULL in %s at %u\n", func, line);
> 	WARN_ON(1);
> 	return 0;
> }
> 
> This happens a little while after a successul set_configuration. Here's
> a trace:

...

> I have to get my head around that code, but if one of you have a clue, I
> would welcome it :-)
> 
> Interestingly it recovers. The host seems to then reset the prot, then reconfigure and
> the second time around it all works fine.

I suspect this is related to the race you found.  EJ Hsu has been 
working on much the same thing (see the mailing list archive).

Alan Stern

