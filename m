Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8280134A5C
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2020 19:18:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729057AbgAHSSz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jan 2020 13:18:55 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:49290 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727507AbgAHSSz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jan 2020 13:18:55 -0500
Received: (qmail 5455 invoked by uid 2102); 8 Jan 2020 13:18:54 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 8 Jan 2020 13:18:54 -0500
Date:   Wed, 8 Jan 2020 13:18:54 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     syzbot <syzbot+10e5f68920f13587ab12@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <gregkh@linuxfoundation.org>,
        <gustavo@embeddedor.com>, <ingrassia@epigenesys.com>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: WARNING in usbhid_raw_request/usb_submit_urb (2)
In-Reply-To: <000000000000b962af059b9429bd@google.com>
Message-ID: <Pine.LNX.4.44L0.2001081314471.1468-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 7 Jan 2020, syzbot wrote:

> Hello,
> 
> syzbot has tested the proposed patch but the reproducer still triggered  
> crash:
> WARNING in usbhid_raw_request/usb_submit_urb

Given this result, let's try again the slightly larger patch.  The
difference between the patch just tested and this one is very small
indeed, although it's hard to predict how that difference will affect
the object code.

Alan Stern

#syz test: https://github.com/google/kasan.git ecdf2214

Index: usb-devel/drivers/usb/core/urb.c
===================================================================
--- usb-devel.orig/drivers/usb/core/urb.c
+++ usb-devel/drivers/usb/core/urb.c
@@ -205,7 +205,7 @@ int usb_urb_ep_type_check(const struct u
 
 	ep = usb_pipe_endpoint(urb->dev, urb->pipe);
 	if (!ep)
-		return -EINVAL;
+		return -EBADF;
 	if (usb_pipetype(urb->pipe) != pipetypes[usb_endpoint_type(&ep->desc)])
 		return -EINVAL;
 	return 0;
@@ -356,6 +356,7 @@ int usb_submit_urb(struct urb *urb, gfp_
 	struct usb_host_endpoint	*ep;
 	int				is_out;
 	unsigned int			allowed;
+	int				c;
 
 	if (!urb || !urb->complete)
 		return -EINVAL;
@@ -474,9 +475,10 @@ int usb_submit_urb(struct urb *urb, gfp_
 	 */
 
 	/* Check that the pipe's type matches the endpoint's type */
-	if (usb_urb_ep_type_check(urb))
-		dev_WARN(&dev->dev, "BOGUS urb xfer, pipe %x != type %x\n",
-			usb_pipetype(urb->pipe), pipetypes[xfertype]);
+	c = usb_urb_ep_type_check(urb);
+	if (c)
+		dev_WARN(&dev->dev, "BOGUS urb xfer %d, pipe %x != type %x\n",
+			c, usb_pipetype(urb->pipe), pipetypes[xfertype]);
 
 	/* Check against a simple/standard policy */
 	allowed = (URB_NO_TRANSFER_DMA_MAP | URB_NO_INTERRUPT | URB_DIR_MASK |

