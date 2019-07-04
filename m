Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31A4D5F272
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jul 2019 07:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbfGDFxJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jul 2019 01:53:09 -0400
Received: from gate.crashing.org ([63.228.1.57]:51924 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725917AbfGDFxI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Jul 2019 01:53:08 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x645qco0024383;
        Thu, 4 Jul 2019 00:52:39 -0500
Message-ID: <617c4ba96b9664377c24444e8b82ffa75a8a5357.camel@kernel.crashing.org>
Subject: Virtual hub, resets etc...
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Michal Nazarewicz <mina86@mina86.com>
Date:   Thu, 04 Jul 2019 15:52:38 +1000
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Folks !

(Michal: Mass storage issue near the end...)

So I'd like to pick your brains on what you think is the best policy to
implement for this case:

The issue is around the Aspeed vhub driver which I wrote.

To recap, the HW shows on the host as a USB hub with 5 ports for which
I create five UDC for gadgets. The actual hub emulation is largely done
in SW with HW assist.

At the moment, the hub always pulls up, so it's always present on the
host when there's a host connected. So far so good (this is the subject
of another discussion).

When any of the child UDC pulls up, I show the USB_PORT_STAT_CONNECTION
on that port, so the host enumerates. At the moment,
USB_PORT_STAT_POWER is always set and I don't emulate power control.

The opposite with the child pulling down of course.

The interesting question however is how to react to events on the
upstream leg of the hub such as suspend, resume and USB reset. So far I
don't seem to be able to detect connection/disconnection but I'll dig a
bit more.

So far, I've tried to implement what I understand of the USB spec (I
might have misread) which consists of the following:

 - suspend: For each enabled port that isn't explicitely in
USB_PORT_STAT_SUSPEND state already (host initiated port suspend), call
the corresponding gadget suspend callback if any. I do NOT set
USB_PORT_STAT_SUSPEND in the port state.

 - resume: As above but with the resume callback

(Note: See below about issues with suspend)

 - bus reset: When I sense a bus reset, that's where I'm not too sure
what to do. Currently I clear all the status bits of the ports
except USB_PORT_STAT_SUSPEND. Thus I clear USB_PORT_STAT_ENABLE.
But I'm not sure what to do with the gadget. I currently call
the gadget suspend as "hinted" by the spec calling for S0 state iirc,
but I don't think it's the best thing to do, it doesn't make that much
sense... Should I do a gadget reset instead ? 

 - If the host clears USB_PORT_STAT_ENABLE, what should I do ? I
currently do a suspend as well, which isn't great... mostly it does
nothing and keep potentially the gadget trying to do stuff. I could
do a reset. I don't want to do a disconnect because we are still
connected to the hub so that's not really the right call, but at least
for composite it's the same thing...

Now, a few things i noticed while at it:

 - At some point I had code to reject EP queue() if the device is
suspended with -ESHUTDOWN. The end result was bad ... f_mass_storage
goes into an infinite loop of trying to queue the same stuff in
start_out_transfer() when that happens. It looks like it's not really
handling errors from queue() in a particularily useful way.

 - With my current code doing suspend/resume on bus resets, when I
reboot some hosts, and they re-enumerate, I tend to hit the WARN_ON
drivers/usb/gadget/function/f_mass_storage.c:341

static inline int __fsg_is_set(struct fsg_common *common,
			       const char *func, unsigned line)
{
	if (common->fsg)
		return 1;
	ERROR(common, "common->fsg is NULL in %s at %u\n", func, line);
	WARN_ON(1);
	return 0;
}

This happens a little while after a successul set_configuration. Here's
a trace:

[   94.918471] 1e6a0000.usb-vhub: port1:EP0 SETUP packet 00/09/0001/0000/0000 [out] st=0
[   94.918487] 1e6a0000.usb-vhub: port1:EP0 forwarding to gadget...
[   94.918501] gadget: high-speed config #1: c
[   94.918522] gadget: raise_exception: 3 (was 0)
[   94.918543] gadget: set_config: interface 0 (Mass Storage Function) requested delayed status
[   94.918550] gadget: delayed_status count 1
[   94.918567] 1e6a0000.usb-vhub: port1:EP0 driver returned 32767
[   95.009831] 1e6a0000.usb-vhub: port1:EP1 Disabling !
[   95.014894] 1e6a0000.usb-vhub: port1:EP1 Nuking...
[   95.019706] 1e6a0000.usb-vhub: port1:EP1 Nuked 0 request(s)
[   95.025367] 1e6a0000.usb-vhub: port1:EP2 Disabling !
[   95.030426] 1e6a0000.usb-vhub: port1:EP2 Nuking...
[   95.035231] 1e6a0000.usb-vhub: port1:EP2 Nuked 0 request(s)
[   95.040882] gadget: usb_composite_setup_continue
[   95.045514] gadget: usb_composite_setup_continue: Completing delayed status
[   95.052571] gadget: handle_exception
[   95.056188] 1e6a0000.usb-vhub: port1:EP0 SETUP packet 80/06/0300/0000/0002 [in] st=0
[   95.056205] 1e6a0000.usb-vhub: port1:EP0 forwarding to gadget...
[   95.056234] 1e6a0000.usb-vhub: port1:EP0 driver returned 0
[   95.064016] 1e6a0000.usb-vhub: port1:EP0 SETUP packet 80/06/0300/0000/0004 [in] st=0
[   95.064031] 1e6a0000.usb-vhub: port1:EP0 forwarding to gadget...
[   95.064056] 1e6a0000.usb-vhub: port1:EP0 driver returned 0
[   95.070215] 1e6a0000.usb-vhub: port1:EP0 SETUP packet 80/06/0301/0409/0002 [in] st=0
[   95.070232] 1e6a0000.usb-vhub: port1:EP0 forwarding to gadget...
[   95.070261] 1e6a0000.usb-vhub: port1:EP0 driver returned 0
[   95.075888] 1e6a0000.usb-vhub: port1:EP0 SETUP packet 80/06/0301/0409/0020 [in] st=0
[   95.075904] 1e6a0000.usb-vhub: port1:EP0 forwarding to gadget...
[   95.075932] 1e6a0000.usb-vhub: port1:EP0 driver returned 0
[   95.083714] 1e6a0000.usb-vhub: port1:EP0 SETUP packet 80/06/0302/0409/0002 [in] st=0
[   95.083728] 1e6a0000.usb-vhub: port1:EP0 forwarding to gadget...
[   95.083755] 1e6a0000.usb-vhub: port1:EP0 driver returned 0
[   95.089893] 1e6a0000.usb-vhub: port1:EP0 SETUP packet 80/06/0302/0409/0026 [in] st=0
[   95.089909] 1e6a0000.usb-vhub: port1:EP0 forwarding to gadget...
[   95.089937] 1e6a0000.usb-vhub: port1:EP0 driver returned 0
[   95.095468] 1e6a0000.usb-vhub: port1:EP0 SETUP packet 80/06/0303/0409/0002 [in] st=0
[   95.095482] 1e6a0000.usb-vhub: port1:EP0 forwarding to gadget...
[   95.095506] 1e6a0000.usb-vhub: port1:EP0 driver returned 0
[   95.103379] 1e6a0000.usb-vhub: port1:EP0 SETUP packet 80/06/0303/0409/0016 [in] st=0
[   95.103395] 1e6a0000.usb-vhub: port1:EP0 forwarding to gadget...
[   95.103422] 1e6a0000.usb-vhub: port1:EP0 driver returned 0
[   95.109558] 1e6a0000.usb-vhub: port1:EP0 SETUP packet a1/fe/0000/0000/0001 [in] st=0
[   95.109575] 1e6a0000.usb-vhub: port1:EP0 forwarding to gadget...
[   95.109590] gadget: common->fsg is NULL in fsg_setup at 489
[   95.109597] ------------[ cut here ]------------

I have to get my head around that code, but if one of you have a clue, I
would welcome it :-)

Interestingly it recovers. The host seems to then reset the prot, then reconfigure and
the second time around it all works fine.

Cheers,
Ben.

