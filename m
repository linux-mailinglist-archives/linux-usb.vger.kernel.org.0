Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A53938813A
	for <lists+linux-usb@lfdr.de>; Tue, 18 May 2021 22:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235795AbhERUTy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 May 2021 16:19:54 -0400
Received: from netrider.rowland.org ([192.131.102.5]:57007 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230248AbhERUTy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 May 2021 16:19:54 -0400
Received: (qmail 1142007 invoked by uid 1000); 18 May 2021 16:18:35 -0400
Date:   Tue, 18 May 2021 16:18:35 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: usbfs: Don't WARN about excessively large memory
 allocations
Message-ID: <20210518201835.GA1140918@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Syzbot found that the kernel generates a WARNing if the user tries to
submit a bulk transfer through usbfs with a buffer that is way too
large.  This isn't a bug in the kernel; it's merely an invalid request
from the user and the usbfs code does handle it correctly.

In theory the same thing can happen with async transfers, or with the
packet descriptor table for isochronous transfers.

To prevent the MM subsystem from complaining about these bad
allocation requests, add the __GFP_NOWARN flag to the kmalloc calls
for these buffers.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-and-tested-by: syzbot+882a85c0c8ec4a3e2281@syzkaller.appspotmail.com
CC: Andrew Morton <akpm@linux-foundation.org>
CC: <stable@vger.kernel.org>

---


[as1955]


 drivers/usb/core/devio.c |   11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

Index: usb-devel/drivers/usb/core/devio.c
===================================================================
--- usb-devel.orig/drivers/usb/core/devio.c
+++ usb-devel/drivers/usb/core/devio.c
@@ -1218,7 +1218,12 @@ static int do_proc_bulk(struct usb_dev_s
 	ret = usbfs_increase_memory_usage(len1 + sizeof(struct urb));
 	if (ret)
 		return ret;
-	tbuf = kmalloc(len1, GFP_KERNEL);
+
+	/*
+	 * len1 can be almost arbitrarily large.  Don't WARN if it's
+	 * too big, just fail the request.
+	 */
+	tbuf = kmalloc(len1, GFP_KERNEL | __GFP_NOWARN);
 	if (!tbuf) {
 		ret = -ENOMEM;
 		goto done;
@@ -1696,7 +1701,7 @@ static int proc_do_submiturb(struct usb_
 	if (num_sgs) {
 		as->urb->sg = kmalloc_array(num_sgs,
 					    sizeof(struct scatterlist),
-					    GFP_KERNEL);
+					    GFP_KERNEL | __GFP_NOWARN);
 		if (!as->urb->sg) {
 			ret = -ENOMEM;
 			goto error;
@@ -1731,7 +1736,7 @@ static int proc_do_submiturb(struct usb_
 					(uurb_start - as->usbm->vm_start);
 		} else {
 			as->urb->transfer_buffer = kmalloc(uurb->buffer_length,
-					GFP_KERNEL);
+					GFP_KERNEL | __GFP_NOWARN);
 			if (!as->urb->transfer_buffer) {
 				ret = -ENOMEM;
 				goto error;
