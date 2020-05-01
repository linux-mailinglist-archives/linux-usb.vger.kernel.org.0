Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3821C1E33
	for <lists+linux-usb@lfdr.de>; Fri,  1 May 2020 22:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgEAUHa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 May 2020 16:07:30 -0400
Received: from netrider.rowland.org ([192.131.102.5]:32835 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726307AbgEAUH3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 May 2020 16:07:29 -0400
Received: (qmail 2143 invoked by uid 500); 1 May 2020 16:07:28 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 1 May 2020 16:07:28 -0400
Date:   Fri, 1 May 2020 16:07:28 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Greg KH <greg@kroah.com>
cc:     andreyknvl@google.com, <ingrassia@epigenesys.com>,
        USB list <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: [PATCH] USB: core: Fix misleading driver bug report
In-Reply-To: <0000000000002a7b2905a4839206@google.com>
Message-ID: <Pine.LNX.4.44L0.2005011558590.903-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The syzbot fuzzer found a race between URB submission to endpoint 0
and device reset.  Namely, during the reset we call usb_ep0_reinit()
because the characteristics of ep0 may have changed (if the reset
follows a firmware update, for example).  While usb_ep0_reinit() is
running there is a brief period during which the pointers stored in
udev->ep_in[0] and udev->ep_out[0] are set to NULL, and if an URB is
submitted to ep0 during that period, usb_urb_ep_type_check() will
report it as a driver bug.  In the absence of those pointers, the
routine thinks that the endpoint doesn't exist.  The log message looks
like this:

------------[ cut here ]------------
usb 2-1: BOGUS urb xfer, pipe 2 != type 2
WARNING: CPU: 0 PID: 9241 at drivers/usb/core/urb.c:478
usb_submit_urb+0x1188/0x1460 drivers/usb/core/urb.c:478

Now, although submitting an URB while the device is being reset is a
questionable thing to do, it shouldn't count as a driver bug as severe
as submitting an URB for an endpoint that doesn't exist.  Indeed,
endpoint 0 always exists, even while the device is in its unconfigured
state.

To prevent these misleading driver bug reports, this patch updates
usb_disable_endpoint() to avoid clearing the ep_in[] and ep_out[]
pointers when the endpoint being disabled is ep0.  There's no danger
of leaving a stale pointer in place, because the usb_host_endpoint
structure being pointed to is stored permanently in udev->ep0; it
doesn't get deallocated until the entire usb_device structure does.

Reported-and-tested-by: syzbot+db339689b2101f6f6071@syzkaller.appspotmail.com
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---

I don't think this needs to go into the stable kernels.  It only avoids
a dev_WARN() call, and the problem only occurs under fairly unlikely
circumstances.


[as1938]


 drivers/usb/core/message.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: usb-devel/drivers/usb/core/message.c
===================================================================
--- usb-devel.orig/drivers/usb/core/message.c
+++ usb-devel/drivers/usb/core/message.c
@@ -1143,11 +1143,11 @@ void usb_disable_endpoint(struct usb_dev
 
 	if (usb_endpoint_out(epaddr)) {
 		ep = dev->ep_out[epnum];
-		if (reset_hardware)
+		if (reset_hardware && epnum != 0)
 			dev->ep_out[epnum] = NULL;
 	} else {
 		ep = dev->ep_in[epnum];
-		if (reset_hardware)
+		if (reset_hardware && epnum != 0)
 			dev->ep_in[epnum] = NULL;
 	}
 	if (ep) {

