Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 720B655841
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2019 22:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728070AbfFYUA1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jun 2019 16:00:27 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:46558 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726455AbfFYUA1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jun 2019 16:00:27 -0400
Received: (qmail 8974 invoked by uid 2102); 25 Jun 2019 16:00:26 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 25 Jun 2019 16:00:26 -0400
Date:   Tue, 25 Jun 2019 16:00:26 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg KH <greg@kroah.com>
cc:     USB list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: core: Fix compiler warnings in devio.c
Message-ID: <Pine.LNX.4.44L0.1906251556520.1493-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In the current kernel, devio.c generates a number of compiler warnings
about taking the address of a member of a packed structure.  The
warnings all look like this one:

	drivers/usb/core/devio.c: In function ‘proc_do_submiturb’:
	drivers/usb/core/devio.c:1489:43: warning: taking address of packed member of ‘struct usb_ctrlrequest’ may result in an unaligned pointer value [-Waddress-of-packed-member]
	 1489 |   if (uurb->buffer_length < (le16_to_cpup(&dr->wLength) + 8)) {
	      |                                           ^~~~~~~~~~~~

These warnings can easily be eliminated by changing various
le16_to_cpup() calls to use le16_to_cpu() instead.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---


[as1903]


 drivers/usb/core/devio.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

Index: usb-devel/drivers/usb/core/devio.c
===================================================================
--- usb-devel.orig/drivers/usb/core/devio.c
+++ usb-devel/drivers/usb/core/devio.c
@@ -1486,15 +1486,15 @@ static int proc_do_submiturb(struct usb_
 			ret = -EFAULT;
 			goto error;
 		}
-		if (uurb->buffer_length < (le16_to_cpup(&dr->wLength) + 8)) {
+		if (uurb->buffer_length < (le16_to_cpu(dr->wLength) + 8)) {
 			ret = -EINVAL;
 			goto error;
 		}
 		ret = check_ctrlrecip(ps, dr->bRequestType, dr->bRequest,
-				      le16_to_cpup(&dr->wIndex));
+				      le16_to_cpu(dr->wIndex));
 		if (ret)
 			goto error;
-		uurb->buffer_length = le16_to_cpup(&dr->wLength);
+		uurb->buffer_length = le16_to_cpu(dr->wLength);
 		uurb->buffer += 8;
 		if ((dr->bRequestType & USB_DIR_IN) && uurb->buffer_length) {
 			is_in = 1;
@@ -1509,9 +1509,9 @@ static int proc_do_submiturb(struct usb_
 			"bRequest=%02x wValue=%04x "
 			"wIndex=%04x wLength=%04x\n",
 			dr->bRequestType, dr->bRequest,
-			__le16_to_cpup(&dr->wValue),
-			__le16_to_cpup(&dr->wIndex),
-			__le16_to_cpup(&dr->wLength));
+			__le16_to_cpu(dr->wValue),
+			__le16_to_cpu(dr->wIndex),
+			__le16_to_cpu(dr->wLength));
 		u = sizeof(struct usb_ctrlrequest);
 		break;
 

