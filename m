Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2E2512E9DD
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2020 19:24:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbgABSYd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jan 2020 13:24:33 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:54966 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727942AbgABSYd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jan 2020 13:24:33 -0500
Received: (qmail 20177 invoked by uid 2102); 2 Jan 2020 13:24:32 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 2 Jan 2020 13:24:32 -0500
Date:   Thu, 2 Jan 2020 13:24:32 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Johan Hovold <johan@kernel.org>
cc:     Takashi Iwai <tiwai@suse.de>, Greg KH <gregkh@linuxfoundation.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Roger Whittaker <Roger.Whittaker@suse.com>,
        Takashi Iwai <tiwai@suse.com>, <linux-usb@vger.kernel.org>
Subject: Re: Certain cameras no longer working with uvcvideo on recent
 (openSUSE) kernels
In-Reply-To: <20200102153241.GA4683@localhost>
Message-ID: <Pine.LNX.4.44L0.2001021321060.1309-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2 Jan 2020, Johan Hovold wrote:

> > > FWIW, Roger confirmed that reverting the commit d482c7bb0541 does
> > > indeed fix the issue (with the latest 5.4.y kernel).
> > 
> > All right.  Suppose instead of reverting that commit, I change the code
> > so that it only logs a warning when it finds an endpoint descriptor
> > with maxpacket = 0 (and it skips the warning for isochronous endpoints
> > in altsetting 0).  At the same time, we can add a check to
> > usb_submit_urb() to refuse URBs if the endpoint's maxpacket is 0.
> > 
> > Sounds good?
> 
> Sounds good to me.
> 
> Just make sure not to add a WARN() in usb_submit_urb() so that we end up
> having to add maxpacket checks to every USB driver when syzbot starts
> hitting this (only driver's doing maxpacket divisions or similar should
> need that).

Heh.  Yes, syzbot interprets WARN() very differently from dev_warn().

Okay, here's a patch for testing.  This is meant to go on top of the 
existing commit; instead of rejecting bogus endpoints entirely it just 
issues a warning.

And it turns out that usb_submit_urb() already checks for maxpacket = 
0, so no changes are needed there.

Alan Stern



Index: usb-devel/drivers/usb/core/config.c
===================================================================
--- usb-devel.orig/drivers/usb/core/config.c
+++ usb-devel/drivers/usb/core/config.c
@@ -346,12 +346,16 @@ static int usb_parse_endpoint(struct dev
 			endpoint->desc.wMaxPacketSize = cpu_to_le16(8);
 	}
 
-	/* Validate the wMaxPacketSize field */
+	/*
+	 * Validate the wMaxPacketSize field.
+	 * Some devices have isochronous endpoints in altsetting 0;
+	 * the USB-2 spec requires such endpoints to have wMaxPacketSize = 0
+	 * (see the end of section 5.6.3), so don't warn about them.
+	 */
 	maxp = usb_endpoint_maxp(&endpoint->desc);
-	if (maxp == 0) {
-		dev_warn(ddev, "config %d interface %d altsetting %d endpoint 0x%X has wMaxPacketSize 0, skipping\n",
+	if (maxp == 0 && !(usb_endpoint_xfer_isoc(d) && asnum == 0)) {
+		dev_warn(ddev, "config %d interface %d altsetting %d endpoint 0x%X has invalid wMaxPacketSize 0\n",
 		    cfgno, inum, asnum, d->bEndpointAddress);
-		goto skip_to_next_endpoint_or_interface_descriptor;
 	}
 
 	/* Find the highest legal maxpacket size for this endpoint */

