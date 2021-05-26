Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1319391C0E
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 17:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233675AbhEZPeS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 11:34:18 -0400
Received: from netrider.rowland.org ([192.131.102.5]:39293 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S233383AbhEZPeR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 11:34:17 -0400
Received: (qmail 1400540 invoked by uid 1000); 26 May 2021 11:32:44 -0400
Date:   Wed, 26 May 2021 11:32:44 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>
Cc:     Johan Hovold <johan@kernel.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: core: Check buffer length matches wLength for control
 transfers
Message-ID: <20210526153244.GA1400430@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A type of inconsistency that can show up in control URBs is when the
setup packet's wLength value does not match the URB's
transfer_buffer_length field.  The two should always be equal;
differences could lead to information leaks or undefined behavior for
OUT transfers or overruns for IN transfers.

This patch adds a test for such mismatches during URB submission.  If
the test fails, the submission is rejected with a -EBADR error code
(which is not used elsewhere in the USB core), and a debugging message
is logged for people interested in tracking down these errors.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: Johan Hovold <johan@kernel.org>

---


[as1961]


 Documentation/driver-api/usb/error-codes.rst |    3 +++
 drivers/usb/core/urb.c                       |    6 ++++++
 2 files changed, 9 insertions(+)

Index: usb-devel/drivers/usb/core/urb.c
===================================================================
--- usb-devel.orig/drivers/usb/core/urb.c
+++ usb-devel/drivers/usb/core/urb.c
@@ -410,6 +410,12 @@ int usb_submit_urb(struct urb *urb, gfp_
 		dev_WARN_ONCE(&dev->dev, (usb_pipeout(urb->pipe) != is_out),
 				"BOGUS control dir, pipe %x doesn't match bRequestType %x\n",
 				urb->pipe, setup->bRequestType);
+		if (le16_to_cpu(setup->wLength) != urb->transfer_buffer_length) {
+			dev_dbg(&dev->dev, "BOGUS control len %d doesn't match transfer length %d\n",
+					le16_to_cpu(setup->wLength),
+					urb->transfer_buffer_length);
+			return -EBADR;
+		}
 	} else {
 		is_out = usb_endpoint_dir_out(&ep->desc);
 	}
Index: usb-devel/Documentation/driver-api/usb/error-codes.rst
===================================================================
--- usb-devel.orig/Documentation/driver-api/usb/error-codes.rst
+++ usb-devel/Documentation/driver-api/usb/error-codes.rst
@@ -61,6 +61,9 @@ USB-specific:
 			(c) requested data transfer length is invalid: negative
 			    or too large for the host controller.
 
+``-EBADR``		The wLength value in a control URB's setup packet does
+			not match the URB's transfer_buffer_length.
+
 ``-ENOSPC``		This request would overcommit the usb bandwidth reserved
 			for periodic transfers (interrupt, isochronous).
 
