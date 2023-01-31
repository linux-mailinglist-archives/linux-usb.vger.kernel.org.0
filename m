Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E284D6837DF
	for <lists+linux-usb@lfdr.de>; Tue, 31 Jan 2023 21:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbjAaUtO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Jan 2023 15:49:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbjAaUtN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Jan 2023 15:49:13 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id A2A844941F
        for <linux-usb@vger.kernel.org>; Tue, 31 Jan 2023 12:49:05 -0800 (PST)
Received: (qmail 462733 invoked by uid 1000); 31 Jan 2023 15:49:04 -0500
Date:   Tue, 31 Jan 2023 15:49:04 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Troels Liebe Bentsen <troels@connectedcars.dk>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: core: Don't hold device lock while reading the
 "descriptors" sysfs file
Message-ID: <Y9l+wDTRbuZABzsE@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Ever since commit 83e83ecb79a8 ("usb: core: get config and string
descriptors for unauthorized devices") was merged in 2013, there has
been no mechanism for reallocating the rawdescriptors buffers in
struct usb_device after the initial enumeration.  Before that commit,
the buffers would be deallocated when a device was deauthorized and
reallocated when it was authorized and enumerated.

This means that the locking in the read_descriptors() routine is not
needed, since the buffers it reads will never be reallocated while the
routine is running.  This locking can interfere with user programs
trying to read a hub's descriptors via sysfs while new child devices
of the hub are being initialized, since the hub is locked during this
procedure.

Since the locking in read_descriptors() hasn't been needed for over
nine years, we can remove it.

Reported-and-tested-by: Troels Liebe Bentsen <troels@connectedcars.dk>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: stable@vger.kernel.org

---


[as1990]


 drivers/usb/core/hub.c   |    5 ++---
 drivers/usb/core/sysfs.c |    5 -----
 2 files changed, 2 insertions(+), 8 deletions(-)

Index: usb-devel/drivers/usb/core/sysfs.c
===================================================================
--- usb-devel.orig/drivers/usb/core/sysfs.c
+++ usb-devel/drivers/usb/core/sysfs.c
@@ -869,11 +869,7 @@ read_descriptors(struct file *filp, stru
 	size_t srclen, n;
 	int cfgno;
 	void *src;
-	int retval;
 
-	retval = usb_lock_device_interruptible(udev);
-	if (retval < 0)
-		return -EINTR;
 	/* The binary attribute begins with the device descriptor.
 	 * Following that are the raw descriptor entries for all the
 	 * configurations (config plus subsidiary descriptors).
@@ -898,7 +894,6 @@ read_descriptors(struct file *filp, stru
 			off -= srclen;
 		}
 	}
-	usb_unlock_device(udev);
 	return count - nleft;
 }
 
Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -2386,9 +2386,8 @@ static int usb_enumerate_device_otg(stru
  * usb_enumerate_device - Read device configs/intfs/otg (usbcore-internal)
  * @udev: newly addressed device (in ADDRESS state)
  *
- * This is only called by usb_new_device() and usb_authorize_device()
- * and FIXME -- all comments that apply to them apply here wrt to
- * environment.
+ * This is only called by usb_new_device() -- all comments that apply there
+ * apply here wrt to environment.
  *
  * If the device is WUSB and not authorized, we don't attempt to read
  * the string descriptors, as they will be errored out by the device
