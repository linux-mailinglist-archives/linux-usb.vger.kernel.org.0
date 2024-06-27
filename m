Return-Path: <linux-usb+bounces-11764-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEEF91AFF5
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 21:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EDDA1F24152
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 19:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137E219ADA4;
	Thu, 27 Jun 2024 19:56:28 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 034A322F1C
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 19:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719518187; cv=none; b=ZxzPhJfibQbiRFrr5Z12LAecU387hJ3UhSG0agp1hTU3T1wNy6cuqJdVg1RxX57kyo02M1CWoQFdXaVEg6G5E/iWOQZCgQge5tKdXUsfZOD+mVRJpIpQM46Kfm8bXECr8cz4xiTh4NRfECu7i4/fW/uk0IY54wJupK+OuVsg7gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719518187; c=relaxed/simple;
	bh=OTKiY/KhmV4JRH87fOLZImywBs4YS5zPh5iqAMyOnzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lG7zVTvbGuhYdMjN/AFhTvd8JThieRH0VlkgMWDkukJcLJVSasN8s98+fr96LVb0Q3Ri1SQErkRJ+JpYNyv2O09ld1tcH7h83NpY8FkitV8K34cMnwnOeSbBeSeGup3BlTIZP/Z8DNx0iUQsQ4psAWB3x3FzeuadNVEk9kgRCIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 750549 invoked by uid 1000); 27 Jun 2024 15:56:18 -0400
Date: Thu, 27 Jun 2024 15:56:18 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>, Oliver Neukum <oneukum@suse.com>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: core: Fix duplicate endpoint bug by clearing reserved
 bits in the descriptor
Message-ID: <205a5edc-7fef-4159-b64a-80374b6b101a@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Syzbot has identified a bug in usbcore (see the Closes: tag below)
caused by our assumption that the reserved bits in an endpoint
descriptor's bEndpointAddress field will always be 0.  As a result of
the bug, the endpoint_is_duplicate() routine in config.c (and possibly
other routines as well) may believe that two descriptors are for
distinct endpoints, even though they have the same direction and
endpoint number.  This can lead to confusion, including the bug
identified by syzbot (two descriptors with matching endpoint numbers
and directions, where one was interrupt and the other was bulk).

To fix the bug, we will clear the reserved bits in bEndpointAddress
when we parse the descriptor.  (Note that both the USB-2.0 and USB-3.1
specs say these bits are "Reserved, reset to zero".)  This requires us
to make a copy of the descriptor earlier in usb_parse_endpoint() and
use the copy instead of the original when checking for duplicates.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-and-tested-by: syzbot+8693a0bb9c10b554272a@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-usb/0000000000003d868e061bc0f554@google.com/
Fixes: 0a8fd1346254 ("USB: fix problems with duplicate endpoint addresses")
CC: Oliver Neukum <oneukum@suse.com>
CC: stable@vger.kernel.org

---

This should also fix the bug that was reported for the usbtmc driver 
recently.


 drivers/usb/core/config.c |   18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

Index: usb-devel/drivers/usb/core/config.c
===================================================================
--- usb-devel.orig/drivers/usb/core/config.c
+++ usb-devel/drivers/usb/core/config.c
@@ -291,6 +291,20 @@ static int usb_parse_endpoint(struct dev
 	if (ifp->desc.bNumEndpoints >= num_ep)
 		goto skip_to_next_endpoint_or_interface_descriptor;
 
+	/* Save a copy of the descriptor and use it instead of the original */
+	endpoint = &ifp->endpoint[ifp->desc.bNumEndpoints];
+	memcpy(&endpoint->desc, d, n);
+	d = &endpoint->desc;
+
+	/* Clear the reserved bits in bEndpointAddress */
+	i = d->bEndpointAddress &
+			(USB_ENDPOINT_DIR_MASK | USB_ENDPOINT_NUMBER_MASK);
+	if (i != d->bEndpointAddress) {
+		dev_notice(ddev, "config %d interface %d altsetting %d has an endpoint descriptor with address 0x%X, changing to 0x%X\n",
+		    cfgno, inum, asnum, d->bEndpointAddress, i);
+		endpoint->desc.bEndpointAddress = i;
+	}
+
 	/* Check for duplicate endpoint addresses */
 	if (config_endpoint_is_duplicate(config, inum, asnum, d)) {
 		dev_notice(ddev, "config %d interface %d altsetting %d has a duplicate endpoint with address 0x%X, skipping\n",
@@ -308,10 +322,8 @@ static int usb_parse_endpoint(struct dev
 		}
 	}
 
-	endpoint = &ifp->endpoint[ifp->desc.bNumEndpoints];
+	/* Accept this endpoint */
 	++ifp->desc.bNumEndpoints;
-
-	memcpy(&endpoint->desc, d, n);
 	INIT_LIST_HEAD(&endpoint->urb_list);
 
 	/*

