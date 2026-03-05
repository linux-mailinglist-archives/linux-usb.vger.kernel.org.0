Return-Path: <linux-usb+bounces-34114-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDlgCcyfqWnGAwEAu9opvQ
	(envelope-from <linux-usb+bounces-34114-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 16:22:52 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5092146AF
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 16:22:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4F7833031389
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 15:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947023C3C12;
	Thu,  5 Mar 2026 15:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IL8LTSRp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9973BED60;
	Thu,  5 Mar 2026 15:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723872; cv=none; b=ostj2Q3xypVXm5CxDLe4L1C6S288dUChpuoSxtIIlNUYEtnWwZcQ5aNoVEyYJuBz6Hz91qiDFlxRr1nXIKtw36zoQOxtoHSd48rRrhQAvSxLDe79U28xORO4TG4nHWUkU1Rdc25sqCXH8WJu6Jveg7CmHHdq7AyNSfG71DGBITg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723872; c=relaxed/simple;
	bh=5DDR9N2RtjyHXUC2ckTtft4E3KUUe+nALLz2dcoHg90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pFcOmysl2Wvmjg8A4Y1/Xzve7lrk/eBNxe5/+biDPJM1/PiHFivUqx8z46F/fZqkMgkLwMl9P8TQLzvsqa9PVpKTof4n8/6XjGH2U17MCfAgUbhHlv89f6vU8GwMsLsldfWBUYMLPyQQqdJxVx8C9Nmvam6Qbwov4+jJJtneJ7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IL8LTSRp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E3A1C2BC87;
	Thu,  5 Mar 2026 15:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772723871;
	bh=5DDR9N2RtjyHXUC2ckTtft4E3KUUe+nALLz2dcoHg90=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IL8LTSRpTJ9nJz3pd/0vEKsVbWodIqo6ECvOB7GD71uUv3yFAcM6D2VgQ/chjsO/P
	 LX1mWgINhmEzjN9JNrCaIq3GhCPbG3t87BZao7qstFvFHhOEDbamu6VwVb+sAFWGo/
	 sWFbwECMv3KKbgo4EHfIWkUeXimEliV8rWajJuI6ntOKis+RdvoxXHycJhBfstLg9Z
	 DILG0tn1UjrQcwbKz1otzvf0z3cov+Bw/IhXiLIpwFEung247ezrh3G5WNkS73Q7IL
	 MnVa/nz2SbWoECTbZK7Sja1mmKFufDZSSGhD36wl5M8ylVmDlkhB6/9zOcLU2as1xL
	 AbSWlv2E6JrUw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vyAST-000000002jz-1QLg;
	Thu, 05 Mar 2026 16:17:49 +0100
From: Johan Hovold <johan@kernel.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 2/2] gpib: lpvo_usb: rename driver symbol prefix
Date: Thu,  5 Mar 2026 16:17:29 +0100
Message-ID: <20260305151729.10501-3-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305151729.10501-1-johan@kernel.org>
References: <20260305151729.10501-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BC5092146AF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34114-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

The LPVO driver apparently includes a more or less verbatim copy of the
USB skeleton driver.

Replace the "skel_" symbol prefix with "lpvo_" and rename the "usb_skel"
struct "lpvo" to avoid symbol name clashes and make this a bit more
palatable.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 206 ++++++++++-----------
 1 file changed, 101 insertions(+), 105 deletions(-)

diff --git a/drivers/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index ee781d2f0b8e..389dde5a8481 100644
--- a/drivers/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -51,10 +51,10 @@ MODULE_DESCRIPTION("GPIB driver for LPVO usb devices");
  *
  */
 
-static const struct usb_device_id skel_table[] = {
+static const struct usb_device_id lpvo_table[] = {
 	{ }					   /* Terminating entry */
 };
-MODULE_DEVICE_TABLE(usb, skel_table);
+MODULE_DEVICE_TABLE(usb, lpvo_table);
 
 /*
  *   ***  Diagnostics and Debug  ***
@@ -182,15 +182,11 @@ static int usb_minors[MAX_DEV];			   /* usb minors */
 static int assigned_usb_minors;		   /* mask of filled slots */
 static struct mutex minors_lock;     /* operations on usb_minors are to be protected */
 
-/*
- * usb-skeleton prototypes
- */
-
-struct usb_skel;
-static ssize_t skel_do_write(struct usb_skel *, const char *, size_t);
-static ssize_t skel_do_read(struct usb_skel *, char *, size_t);
-static int skel_do_open(struct gpib_board *, int);
-static int skel_do_release(struct gpib_board *);
+struct lpvo;
+static ssize_t lpvo_do_write(struct lpvo *, const char *, size_t);
+static ssize_t lpvo_do_read(struct lpvo *, char *, size_t);
+static int lpvo_do_open(struct gpib_board *, int);
+static int lpvo_do_release(struct gpib_board *);
 
 /*
  *  usec_diff : take difference in MICROsec between two 'timespec'
@@ -218,7 +214,7 @@ static inline int usec_diff(struct timespec64 *a, struct timespec64 *b)
 
 static int write_loop(void *dev, char *msg, int leng)
 {
-	return skel_do_write(dev, msg, leng);
+	return lpvo_do_write(dev, msg, leng);
 }
 
 /**
@@ -246,7 +242,7 @@ static int send_command(struct gpib_board *board, char *msg, int leng)
 	if (retval < 0)
 		return retval;
 
-	nchar = skel_do_read(GPIB_DEV, buffer, 64);
+	nchar = lpvo_do_read(GPIB_DEV, buffer, 64);
 
 	if (nchar < 0) {
 		dev_err(board->gpib_dev, " return from read: %d\n", nchar);
@@ -310,7 +306,7 @@ static int one_char(struct gpib_board *board, struct char_buf *b)
 		return b->inbuf[b->last - b->nchar--];
 	}
 	ktime_get_real_ts64 (&before);
-	b->nchar = skel_do_read(GPIB_DEV, b->inbuf, INBUF_SIZE);
+	b->nchar = lpvo_do_read(GPIB_DEV, b->inbuf, INBUF_SIZE);
 	b->last = b->nchar;
 	ktime_get_real_ts64 (&after);
 
@@ -445,12 +441,12 @@ static int usb_gpib_attach(struct gpib_board *board, const struct gpib_board_con
 	if (!board->private_data)
 		return -ENOMEM;
 
-	retval = skel_do_open(board, usb_minors[j]);
+	retval = lpvo_do_open(board, usb_minors[j]);
 
-	DIA_LOG(1, "Skel open: %d\n", retval);
+	DIA_LOG(1, "lpvo open: %d\n", retval);
 
 	if (retval) {
-		dev_err(board->gpib_dev, "skel open failed.\n");
+		dev_err(board->gpib_dev, "lpvo open failed.\n");
 		kfree(board->private_data);
 		board->private_data = NULL;
 		return -ENODEV;
@@ -517,8 +513,8 @@ static void usb_gpib_detach(struct gpib_board *board)
 			write_loop(GPIB_DEV, USB_GPIB_OFF, strlen(USB_GPIB_OFF));
 			msleep(100);
 			DIA_LOG(1, "%s", "GPIB off\n");
-			retval = skel_do_release(board);
-			DIA_LOG(1, "skel release -> %d\n", retval);
+			retval = lpvo_do_release(board);
+			DIA_LOG(1, "lpvo release -> %d\n", retval);
 		}
 		kfree(board->private_data);
 		board->private_data = NULL;
@@ -772,8 +768,8 @@ static int usb_gpib_read(struct gpib_board *board,
 		if (retval < 0)
 			return retval;
 
-		retval = skel_do_read(GPIB_DEV, inbuf, 1);
-		retval += skel_do_read(GPIB_DEV, inbuf + 1, 1);
+		retval = lpvo_do_read(GPIB_DEV, inbuf, 1);
+		retval += lpvo_do_read(GPIB_DEV, inbuf + 1, 1);
 
 		ktime_get_real_ts64 (&after);
 
@@ -1197,12 +1193,12 @@ static int write_latency_timer(struct usb_device *udev)
  *  written by Greg Kroah-Hartman and available in the kernel tree.	     *
  *									     *
  *  Functions skel_open() and skel_release() have been rewritten and named   *
- *  skel_do_open() and skel_do_release() to process the attach and detach    *
+ *  lpvo_do_open() and lpvo_do_release() to process the attach and detach    *
  *  requests coming from gpib_config.					     *
  *									     *
- *  Functions skel_read() and skel_write() have been split into a	     *
- *  skel_do_read() and skel_do_write(), that cover the kernel stuff of read  *
- *  and write operations, and the original skel_read() and skel_write(),     *
+ *  Functions lpvo_read() and lpvo_write() have been split into a	     *
+ *  lpvo_do_read() and lpvo_do_write(), that cover the kernel stuff of read  *
+ *  and write operations, and the original lpvo_read() and lpvo_write(),     *
  *  that handle communication with user space and call their _do_ companion. *
  *									     *
  *  Only the _do_ versions are used by the lpvo_usb_gpib driver; other ones  *
@@ -1230,7 +1226,7 @@ static int write_latency_timer(struct usb_device *udev)
 #include <linux/mutex.h>
 
 /* Get a minor range for your devices from the usb maintainer */
-#define USB_SKEL_MINOR_BASE	   192
+#define USB_LPVO_MINOR_BASE	   192
 
 /*   private defines   */
 
@@ -1245,7 +1241,7 @@ static int write_latency_timer(struct usb_device *udev)
 #define USER_DEVICE 1		      /* compile for device(s) in user space */
 
 /* Structure to hold all of our device specific stuff */
-struct usb_skel {
+struct lpvo {
 	struct usb_device     *udev;		     /* the usb device for this device */
 	struct usb_interface  *interface;	     /* the interface for this device */
 	struct semaphore      limit_sem;	     /* limiting the number of writes in progress */
@@ -1265,14 +1261,14 @@ struct usb_skel {
 	wait_queue_head_t     bulk_in_wait;	     /* to wait for an ongoing read */
 };
 
-#define to_skel_dev(d) container_of(d, struct usb_skel, kref)
+#define to_lpvo_dev(d) container_of(d, struct lpvo, kref)
 
-static struct usb_driver skel_driver;
-static void skel_draw_down(struct usb_skel *dev);
+static struct usb_driver lpvo_driver;
+static void lpvo_draw_down(struct lpvo *dev);
 
-static void skel_delete(struct kref *kref)
+static void lpvo_delete(struct kref *kref)
 {
-	struct usb_skel *dev = to_skel_dev(kref);
+	struct lpvo *dev = to_lpvo_dev(kref);
 
 	usb_free_urb(dev->bulk_in_urb);
 	usb_put_dev(dev->udev);
@@ -1281,16 +1277,16 @@ static void skel_delete(struct kref *kref)
 }
 
 /*
- * skel_do_open() - to be called by usb_gpib_attach
+ * lpvo_do_open() - to be called by usb_gpib_attach
  */
 
-static int skel_do_open(struct gpib_board *board, int subminor)
+static int lpvo_do_open(struct gpib_board *board, int subminor)
 {
-	struct usb_skel *dev;
+	struct lpvo *dev;
 	struct usb_interface *interface;
 	int retval = 0;
 
-	interface = usb_find_interface(&skel_driver, subminor);
+	interface = usb_find_interface(&lpvo_driver, subminor);
 	if (!interface) {
 		dev_err(board->gpib_dev, "can't find device for minor %d\n", subminor);
 		retval = -ENODEV;
@@ -1318,12 +1314,12 @@ static int skel_do_open(struct gpib_board *board, int subminor)
 }
 
 /*
- * skel_do_release() - to be called by usb_gpib_detach
+ * lpvo_do_release() - to be called by usb_gpib_detach
  */
 
-static int skel_do_release(struct gpib_board *board)
+static int lpvo_do_release(struct gpib_board *board)
 {
-	struct usb_skel *dev;
+	struct lpvo *dev;
 
 	dev = GPIB_DEV;
 	if (!dev)
@@ -1336,7 +1332,7 @@ static int skel_do_release(struct gpib_board *board)
 	mutex_unlock(&dev->io_mutex);
 
 	/* decrement the count on our device */
-	kref_put(&dev->kref, skel_delete);
+	kref_put(&dev->kref, lpvo_delete);
 	return 0;
 }
 
@@ -1344,9 +1340,9 @@ static int skel_do_release(struct gpib_board *board)
  * read functions
  */
 
-static void skel_read_bulk_callback(struct urb *urb)
+static void lpvo_read_bulk_callback(struct urb *urb)
 {
-	struct usb_skel *dev;
+	struct lpvo *dev;
 	unsigned long flags;
 
 	dev = urb->context;
@@ -1370,7 +1366,7 @@ static void skel_read_bulk_callback(struct urb *urb)
 	wake_up_interruptible(&dev->bulk_in_wait);
 }
 
-static int skel_do_read_io(struct usb_skel *dev, size_t count)
+static int lpvo_do_read_io(struct lpvo *dev, size_t count)
 {
 	int rv;
 
@@ -1381,7 +1377,7 @@ static int skel_do_read_io(struct usb_skel *dev, size_t count)
 					  dev->bulk_in_endpoint_addr),
 			  dev->bulk_in_buffer,
 			  min(dev->bulk_in_size, count),
-			  skel_read_bulk_callback,
+			  lpvo_read_bulk_callback,
 			  dev);
 	/* tell everybody to leave the URB alone */
 	spin_lock_irq(&dev->err_lock);
@@ -1406,10 +1402,10 @@ static int skel_do_read_io(struct usb_skel *dev, size_t count)
 }
 
 /*
- * skel_do_read() - read operations from lpvo_usb_gpib
+ * lpvo_do_read() - read operations from lpvo_usb_gpib
  */
 
-static ssize_t skel_do_read(struct usb_skel *dev, char *buffer, size_t count)
+static ssize_t lpvo_do_read(struct lpvo *dev, char *buffer, size_t count)
 {
 	int rv;
 	bool ongoing_io;
@@ -1487,7 +1483,7 @@ static ssize_t skel_do_read(struct usb_skel *dev, char *buffer, size_t count)
 			 * it seems that requests for less than dev->bulk_in_size
 			 *  are not accepted
 			 */
-			rv = skel_do_read_io(dev, dev->bulk_in_size);
+			rv = lpvo_do_read_io(dev, dev->bulk_in_size);
 			if (rv < 0)
 				goto exit;
 			else
@@ -1534,10 +1530,10 @@ static ssize_t skel_do_read(struct usb_skel *dev, char *buffer, size_t count)
 		 * asked for by the lpvo_usb_gpib layer.
 		 */
 //		  if (available < count)
-//			  skel_do_read_io(dev, dev->bulk_in_size);
+//			  lpvo_do_read_io(dev, dev->bulk_in_size);
 	} else {
 		/* no data in the buffer */
-		rv = skel_do_read_io(dev, dev->bulk_in_size);
+		rv = lpvo_do_read_io(dev, dev->bulk_in_size);
 		if (rv < 0)
 			goto exit;
 		else
@@ -1557,9 +1553,9 @@ static ssize_t skel_do_read(struct usb_skel *dev, char *buffer, size_t count)
  * write functions
  */
 
-static void skel_write_bulk_callback(struct urb *urb)
+static void lpvo_write_bulk_callback(struct urb *urb)
 {
-	struct usb_skel *dev;
+	struct lpvo *dev;
 	unsigned long flags;
 
 	dev = urb->context;
@@ -1584,10 +1580,10 @@ static void skel_write_bulk_callback(struct urb *urb)
 }
 
 /*
- * skel_do_write() - write operations from lpvo_usb_gpib
+ * lpvo_do_write() - write operations from lpvo_usb_gpib
  */
 
-static ssize_t skel_do_write(struct usb_skel *dev, const char *buffer, size_t count)
+static ssize_t lpvo_do_write(struct lpvo *dev, const char *buffer, size_t count)
 {
 	int retval = 0;
 	struct urb *urb = NULL;
@@ -1655,7 +1651,7 @@ static ssize_t skel_do_write(struct usb_skel *dev, const char *buffer, size_t co
 	/* initialize the urb properly */
 	usb_fill_bulk_urb(urb, dev->udev,
 			  usb_sndbulkpipe(dev->udev, dev->bulk_out_endpoint_addr),
-			  buf, writesize, skel_write_bulk_callback, dev);
+			  buf, writesize, lpvo_write_bulk_callback, dev);
 	urb->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
 	usb_anchor_urb(urb, &dev->submitted);
 
@@ -1694,9 +1690,9 @@ static ssize_t skel_do_write(struct usb_skel *dev, const char *buffer, size_t co
 
 #if USER_DEVICE	 /* conditional compilation of user space device */
 
-static int skel_flush(struct file *file, fl_owner_t id)
+static int lpvo_flush(struct file *file, fl_owner_t id)
 {
-	struct usb_skel *dev;
+	struct lpvo *dev;
 	int res;
 
 	dev = file->private_data;
@@ -1705,7 +1701,7 @@ static int skel_flush(struct file *file, fl_owner_t id)
 
 	/* wait for io to stop */
 	mutex_lock(&dev->io_mutex);
-	skel_draw_down(dev);
+	lpvo_draw_down(dev);
 
 	/* read out errors, leave subsequent opens a clean slate */
 	spin_lock_irq(&dev->err_lock);
@@ -1718,16 +1714,16 @@ static int skel_flush(struct file *file, fl_owner_t id)
 	return res;
 }
 
-static int skel_open(struct inode *inode, struct file *file)
+static int lpvo_open(struct inode *inode, struct file *file)
 {
-	struct usb_skel *dev;
+	struct lpvo *dev;
 	struct usb_interface *interface;
 	int subminor;
 	int retval = 0;
 
 	subminor = iminor(inode);
 
-	interface = usb_find_interface(&skel_driver, subminor);
+	interface = usb_find_interface(&lpvo_driver, subminor);
 	if (!interface) {
 		pr_err("can't find device for minor %d\n", subminor);
 		retval = -ENODEV;
@@ -1754,9 +1750,9 @@ static int skel_open(struct inode *inode, struct file *file)
 	return retval;
 }
 
-static int skel_release(struct inode *inode, struct file *file)
+static int lpvo_release(struct inode *inode, struct file *file)
 {
-	struct usb_skel *dev;
+	struct lpvo *dev;
 
 	dev = file->private_data;
 	if (!dev)
@@ -1769,7 +1765,7 @@ static int skel_release(struct inode *inode, struct file *file)
 	mutex_unlock(&dev->io_mutex);
 
 	/* decrement the count on our device */
-	kref_put(&dev->kref, skel_delete);
+	kref_put(&dev->kref, lpvo_delete);
 	return 0;
 }
 
@@ -1777,10 +1773,10 @@ static int skel_release(struct inode *inode, struct file *file)
  * user space access to read function
  */
 
-static ssize_t skel_read(struct file *file, char __user *buffer, size_t count,
+static ssize_t lpvo_read(struct file *file, char __user *buffer, size_t count,
 			 loff_t *ppos)
 {
-	struct usb_skel *dev;
+	struct lpvo *dev;
 	char *buf;
 	ssize_t rv;
 
@@ -1790,7 +1786,7 @@ static ssize_t skel_read(struct file *file, char __user *buffer, size_t count,
 	if (!buf)
 		return -ENOMEM;
 
-	rv = skel_do_read(dev, buf, count);
+	rv = lpvo_do_read(dev, buf, count);
 
 	if (rv > 0) {
 		if (copy_to_user(buffer, buf, rv)) {
@@ -1806,10 +1802,10 @@ static ssize_t skel_read(struct file *file, char __user *buffer, size_t count,
  * user space access to write function
  */
 
-static ssize_t skel_write(struct file *file, const char __user *user_buffer,
+static ssize_t lpvo_write(struct file *file, const char __user *user_buffer,
 			  size_t count, loff_t *ppos)
 {
-	struct usb_skel *dev;
+	struct lpvo *dev;
 	char *buf;
 	ssize_t rv;
 
@@ -1824,20 +1820,20 @@ static ssize_t skel_write(struct file *file, const char __user *user_buffer,
 		return -EFAULT;
 	}
 
-	rv = skel_do_write(dev, buf, count);
+	rv = lpvo_do_write(dev, buf, count);
 	kfree(buf);
 	return rv;
 }
 #endif
 
-static const struct file_operations skel_fops = {
+static const struct file_operations lpvo_fops = {
 	.owner =	THIS_MODULE,
 #if USER_DEVICE
-	.read =	   skel_read,
-	.write =   skel_write,
-	.open =	   skel_open,
-	.release = skel_release,
-	.flush =   skel_flush,
+	.read =	   lpvo_read,
+	.write =   lpvo_write,
+	.open =	   lpvo_open,
+	.release = lpvo_release,
+	.flush =   lpvo_flush,
 	.llseek =  noop_llseek,
 #endif
 };
@@ -1847,17 +1843,17 @@ static const struct file_operations skel_fops = {
  * and to have the device registered with the driver core
  */
 #if USER_DEVICE
-static struct usb_class_driver skel_class = {
+static struct usb_class_driver lpvo_class = {
 	.name =		       "lpvo_raw%d",
-	.fops =		       &skel_fops,
-	.minor_base =	     USB_SKEL_MINOR_BASE,
+	.fops =		       &lpvo_fops,
+	.minor_base =	     USB_LPVO_MINOR_BASE,
 };
 #endif
 
-static int skel_probe(struct usb_interface *interface,
+static int lpvo_probe(struct usb_interface *interface,
 		      const struct usb_device_id *id)
 {
-	struct usb_skel *dev;
+	struct lpvo *dev;
 	struct usb_endpoint_descriptor *bulk_in, *bulk_out;
 	int retval;
 	char *device_path;
@@ -1916,7 +1912,7 @@ static int skel_probe(struct usb_interface *interface,
 
 #if USER_DEVICE
 	/* we can register the device now, as it is ready */
-	retval = usb_register_dev(interface, &skel_class);
+	retval = usb_register_dev(interface, &lpvo_class);
 	if (retval) {
 		/* something prevented us from registering this driver */
 		dev_err(&interface->dev,
@@ -1934,14 +1930,14 @@ static int skel_probe(struct usb_interface *interface,
 
 error:
 	/* this frees allocated memory */
-	kref_put(&dev->kref, skel_delete);
+	kref_put(&dev->kref, lpvo_delete);
 
 	return retval;
 }
 
-static void skel_disconnect(struct usb_interface *interface)
+static void lpvo_disconnect(struct usb_interface *interface)
 {
-	struct usb_skel *dev;
+	struct lpvo *dev;
 	int minor = interface->minor;
 
 	usb_gpib_exit_module(minor);	  /* first, disactivate the lpvo */
@@ -1951,7 +1947,7 @@ static void skel_disconnect(struct usb_interface *interface)
 
 #if USER_DEVICE
 	/* give back our minor */
-	usb_deregister_dev(interface, &skel_class);
+	usb_deregister_dev(interface, &lpvo_class);
 #endif
 
 	/* prevent more I/O from starting */
@@ -1962,10 +1958,10 @@ static void skel_disconnect(struct usb_interface *interface)
 	usb_kill_anchored_urbs(&dev->submitted);
 
 	/* decrement our usage count */
-	kref_put(&dev->kref, skel_delete);
+	kref_put(&dev->kref, lpvo_delete);
 }
 
-static void skel_draw_down(struct usb_skel *dev)
+static void lpvo_draw_down(struct lpvo *dev)
 {
 	int time;
 
@@ -1975,34 +1971,34 @@ static void skel_draw_down(struct usb_skel *dev)
 	usb_kill_urb(dev->bulk_in_urb);
 }
 
-static int skel_suspend(struct usb_interface *intf, pm_message_t message)
+static int lpvo_suspend(struct usb_interface *intf, pm_message_t message)
 {
-	struct usb_skel *dev = usb_get_intfdata(intf);
+	struct lpvo *dev = usb_get_intfdata(intf);
 
 	if (!dev)
 		return 0;
-	skel_draw_down(dev);
+	lpvo_draw_down(dev);
 	return 0;
 }
 
-static int skel_resume(struct usb_interface *intf)
+static int lpvo_resume(struct usb_interface *intf)
 {
 	return 0;
 }
 
-static int skel_pre_reset(struct usb_interface *intf)
+static int lpvo_pre_reset(struct usb_interface *intf)
 {
-	struct usb_skel *dev = usb_get_intfdata(intf);
+	struct lpvo *dev = usb_get_intfdata(intf);
 
 	mutex_lock(&dev->io_mutex);
-	skel_draw_down(dev);
+	lpvo_draw_down(dev);
 
 	return 0;
 }
 
-static int skel_post_reset(struct usb_interface *intf)
+static int lpvo_post_reset(struct usb_interface *intf)
 {
-	struct usb_skel *dev = usb_get_intfdata(intf);
+	struct lpvo *dev = usb_get_intfdata(intf);
 
 	/* we are sure no URBs are active - no locking needed */
 	dev->errors = -EPIPE;
@@ -2011,16 +2007,16 @@ static int skel_post_reset(struct usb_interface *intf)
 	return 0;
 }
 
-static struct usb_driver skel_driver = {
+static struct usb_driver lpvo_driver = {
 	.name =			NAME,
-	.probe =		skel_probe,
-	.disconnect =		skel_disconnect,
-	.suspend =		skel_suspend,
-	.resume =		skel_resume,
-	.pre_reset =		skel_pre_reset,
-	.post_reset =		skel_post_reset,
-	.id_table =		skel_table,
+	.probe =		lpvo_probe,
+	.disconnect =		lpvo_disconnect,
+	.suspend =		lpvo_suspend,
+	.resume =		lpvo_resume,
+	.pre_reset =		lpvo_pre_reset,
+	.post_reset =		lpvo_post_reset,
+	.id_table =		lpvo_table,
 	.supports_autosuspend = 1,
 };
 
-module_usb_driver(skel_driver);
+module_usb_driver(lpvo_driver);
-- 
2.52.0


