Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41DC186825
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 19:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404279AbfHHReJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 13:34:09 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:58112 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2404225AbfHHReJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Aug 2019 13:34:09 -0400
Received: (qmail 2998 invoked by uid 2102); 8 Aug 2019 13:34:08 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 8 Aug 2019 13:34:08 -0400
Date:   Thu, 8 Aug 2019 13:34:08 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg KH <greg@kroah.com>
cc:     Andrey Konovalov <andreyknvl@google.com>,
        Oliver Neukum <oneukum@suse.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: rio500: Fix lockdep violation
In-Reply-To: <CAAeHK+z7a3R+Lvo_0VeeMYZZqjWXgcX0qBmi0-Gcx=rDQsBPNA@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1908081329240.1319-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The syzbot fuzzer found a lockdep violation in the rio500 driver:

	======================================================
	WARNING: possible circular locking dependency detected
	5.3.0-rc2+ #23 Not tainted
	------------------------------------------------------
	syz-executor.2/20386 is trying to acquire lock:
	00000000772249c6 (rio500_mutex){+.+.}, at: open_rio+0x16/0xc0  
	drivers/usb/misc/rio500.c:64

	but task is already holding lock:
	00000000d3e8f4b9 (minor_rwsem){++++}, at: usb_open+0x23/0x270  
	drivers/usb/core/file.c:39

	which lock already depends on the new lock.

The problem is that the driver's open_rio() routine is called while
the usbcore's minor_rwsem is locked for reading, and it acquires the
rio500_mutex; whereas conversely, probe_rio() and disconnect_rio()
first acquire the rio500_mutex and then call usb_register_dev() or
usb_deregister_dev(), which lock minor_rwsem for writing.

The correct ordering of acquisition should be: minor_rwsem first, then
rio500_mutex (since the locking in open_rio() cannot be changed).
Thus, the probe and disconnect routines should avoid holding
rio500_mutex while doing their registration and deregistration.

This patch adjusts the code in those two routines to do just that.  It
also relies on the fact that the probe and disconnect routines are
protected by the device mutex, so the initial test of rio->present
needs no extra locking.

Reported-by: syzbot+7bbcbe9c9ff0cd49592a@syzkaller.appspotmail.com
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Fixes: d710734b0677 ("USB: rio500: simplify locking")
CC: Oliver Neukum <oneukum@suse.com>
CC: <stable@vger.kernel.org>

---

This patch is different from the one I posted earlier.  I realized that 
we don't want to register the device's char file until after the 
buffers have been allocated.


[as1906]


 drivers/usb/misc/rio500.c |   66 ++++++++++++++++++++++++----------------------
 1 file changed, 35 insertions(+), 31 deletions(-)

Index: usb-devel/drivers/usb/misc/rio500.c
===================================================================
--- usb-devel.orig/drivers/usb/misc/rio500.c
+++ usb-devel/drivers/usb/misc/rio500.c
@@ -454,51 +454,55 @@ static int probe_rio(struct usb_interfac
 {
 	struct usb_device *dev = interface_to_usbdev(intf);
 	struct rio_usb_data *rio = &rio_instance;
-	int retval = 0;
+	int retval = -ENOMEM;
+	char *ibuf, *obuf;
 
-	mutex_lock(&rio500_mutex);
 	if (rio->present) {
 		dev_info(&intf->dev, "Second USB Rio at address %d refused\n", dev->devnum);
-		retval = -EBUSY;
-		goto bail_out;
-	} else {
-		dev_info(&intf->dev, "USB Rio found at address %d\n", dev->devnum);
+		return -EBUSY;
 	}
+	dev_info(&intf->dev, "USB Rio found at address %d\n", dev->devnum);
 
-	retval = usb_register_dev(intf, &usb_rio_class);
-	if (retval) {
-		dev_err(&dev->dev,
-			"Not able to get a minor for this device.\n");
-		retval = -ENOMEM;
-		goto bail_out;
-	}
-
-	rio->rio_dev = dev;
-
-	if (!(rio->obuf = kmalloc(OBUF_SIZE, GFP_KERNEL))) {
+	obuf = kmalloc(OBUF_SIZE, GFP_KERNEL);
+	if (!obuf) {
 		dev_err(&dev->dev,
 			"probe_rio: Not enough memory for the output buffer\n");
-		usb_deregister_dev(intf, &usb_rio_class);
-		retval = -ENOMEM;
-		goto bail_out;
+		goto err_obuf;
 	}
-	dev_dbg(&intf->dev, "obuf address:%p\n", rio->obuf);
+	dev_dbg(&intf->dev, "obuf address: %p\n", obuf);
 
-	if (!(rio->ibuf = kmalloc(IBUF_SIZE, GFP_KERNEL))) {
+	ibuf = kmalloc(IBUF_SIZE, GFP_KERNEL);
+	if (!ibuf) {
 		dev_err(&dev->dev,
 			"probe_rio: Not enough memory for the input buffer\n");
-		usb_deregister_dev(intf, &usb_rio_class);
-		kfree(rio->obuf);
-		retval = -ENOMEM;
-		goto bail_out;
+		goto err_ibuf;
 	}
-	dev_dbg(&intf->dev, "ibuf address:%p\n", rio->ibuf);
+	dev_dbg(&intf->dev, "ibuf address: %p\n", ibuf);
 
-	usb_set_intfdata (intf, rio);
+	mutex_lock(&rio500_mutex);
+	rio->rio_dev = dev;
+	rio->ibuf = ibuf;
+	rio->obuf = obuf;
 	rio->present = 1;
-bail_out:
 	mutex_unlock(&rio500_mutex);
 
+	retval = usb_register_dev(intf, &usb_rio_class);
+	if (retval) {
+		dev_err(&dev->dev,
+			"Not able to get a minor for this device.\n");
+		goto err_register;
+	}
+
+	usb_set_intfdata(intf, rio);
+	return retval;
+
+ err_register:
+	mutex_lock(&rio500_mutex);
+	rio->present = 0;
+	mutex_unlock(&rio500_mutex);
+ err_ibuf:
+	kfree(obuf);
+ err_obuf:
 	return retval;
 }
 
@@ -507,10 +511,10 @@ static void disconnect_rio(struct usb_in
 	struct rio_usb_data *rio = usb_get_intfdata (intf);
 
 	usb_set_intfdata (intf, NULL);
-	mutex_lock(&rio500_mutex);
 	if (rio) {
 		usb_deregister_dev(intf, &usb_rio_class);
 
+		mutex_lock(&rio500_mutex);
 		if (rio->isopen) {
 			rio->isopen = 0;
 			/* better let it finish - the release will do whats needed */
@@ -524,8 +528,8 @@ static void disconnect_rio(struct usb_in
 		dev_info(&intf->dev, "USB Rio disconnected.\n");
 
 		rio->present = 0;
+		mutex_unlock(&rio500_mutex);
 	}
-	mutex_unlock(&rio500_mutex);
 }
 
 static const struct usb_device_id rio_table[] = {


