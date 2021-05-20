Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA70838B5C4
	for <lists+linux-usb@lfdr.de>; Thu, 20 May 2021 20:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232438AbhETSJn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 May 2021 14:09:43 -0400
Received: from m.b4.vu ([203.16.231.148]:50516 "EHLO m.b4.vu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231648AbhETSJm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 May 2021 14:09:42 -0400
Received: by m.b4.vu (Postfix, from userid 1000)
        id 28913604B6D7; Fri, 21 May 2021 03:38:19 +0930 (ACST)
Date:   Fri, 21 May 2021 03:38:19 +0930
From:   "Geoffrey D. Bennett" <g@b4.vu>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Subject: Re: ehci-pci: Scarlett Gen 2 mixer driver init failure
Message-ID: <20210520180819.GA95348@m.b4.vu>
References: <20210518202823.GA89630@m.b4.vu>
 <20210519145246.GC1165692@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519145246.GC1165692@rowland.harvard.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

Thank you so much for your help! With your hint...

On Wed, May 19, 2021 at 10:52:46AM -0400, Alan Stern wrote:
[...]
> The actual packets sent by ehci-hcd are exactly the same, regardless of
> whether they were submitted by a kernel driver or by userspace.  (In
> fact, userspace submits URBs by way of usbfs, which is itself a kernel
> driver.)

...I started comparing how usbfs submitted the packet in
do_proc_control() vs. how I was submitting the packet.

It turns out that in the name usb_sndctrlpipe(), "snd" is *not*
shorthand for "sound", but is in fact "send". So...

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 560c2ade829d..dcff3e3a49f3 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -635,7 +635,7 @@ static int scarlett2_usb(
        /* send a second message to get the response */

        err = snd_usb_ctl_msg(mixer->chip->dev,
-                       usb_sndctrlpipe(mixer->chip->dev, 0),
+                       usb_rcvctrlpipe(mixer->chip->dev, 0),
                        SCARLETT2_USB_VENDOR_SPECIFIC_CMD_RESP,
                        USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
                        0,

...works for me now. I will prepare and submit a patch to alsa-devel.

[...]
> Have you looked at a complete usbmon record of _all_ the packets sent,
> starting from the time when the Focusrite Scarlett mixer is plugged in?
> It could be that some difference in the sequence of packets leading up
> to the one in question is what triggers the error.

That's what I actually thought the problem was for such a long time
until I could do a test setup that produced a clean diff of all the
packets from plug-in between working and not working which is what led
me here.

I'm not sure if there's anything that could reasonably be added to
make this sort of error easier to spot, such as warn if the pipe
direction doesn't match the requesttype direction? Or have the ehci
driver fix it up like the xhci driver appears to do?

A small aside; I did notice that usb_sndctrlpipe(dev, 0) is evaluated
twice in do_proc_control(), vs. usb_rcvctrlpipe(dev, 0) which is not;
you might like to make this change:

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 533236366a03..4a8ec136460c 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -1162,7 +1162,7 @@ static int do_proc_control(struct usb_dev_state *ps,
 			tbuf, ctrl->wLength);
 
 		usb_unlock_device(dev);
-		i = usb_control_msg(dev, usb_sndctrlpipe(dev, 0), ctrl->bRequest,
+		i = usb_control_msg(dev, pipe, ctrl->bRequest,
 				    ctrl->bRequestType, ctrl->wValue, ctrl->wIndex,
 				    tbuf, ctrl->wLength, tmo);
 		usb_lock_device(dev);

Thanks again!

Regards,
Geoffrey.
