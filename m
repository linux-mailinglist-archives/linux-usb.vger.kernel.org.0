Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1E950E185
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 15:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237164AbiDYN02 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 09:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236284AbiDYN00 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 09:26:26 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 093C033E0D
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 06:23:21 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 4A8F4C0006;
        Mon, 25 Apr 2022 13:23:16 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Bastien Nocera <hadess@hadess.net>
Subject: [RFC v1] USB: core: add USBDEVFS_REVOKE ioctl
Date:   Mon, 25 Apr 2022 15:23:15 +0200
Message-Id: <20220425132315.924477-1-hadess@hadess.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is a need for userspace applications to open USB devices directly,
for all the USB devices without a kernel-level class driver, and
implemented in user-space.

End-user access is usually handled by the uaccess tag in systemd,
shipping application-specific udev rules that implement this without too
much care for sandboxed applications, or overall security, or just sudo.

A better approach is what we already have for evdev devices: give the
application a file descriptor and revoke it when it may no longer access
that device.

This patch is the USB equivalent to the EVIOCREVOKE ioctl, see
commit c7dc65737c9a607d3e6f8478659876074ad129b8 for full details.

Note that this variant needs to do a few things that the evdev revoke
doesn't need to handle, particular:
- cancelling pending async transfers
- making sure to release claimed interfaces on revoke so they can be
  opened by another process/user, as USB interfaces require being
  exclusively claimed to be used.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/usb/core/devio.c          | 54 ++++++++++++++++++++++++++++---
 include/uapi/linux/usbdevice_fs.h |  1 +
 2 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 6abb7294e919..959c5ce4ab37 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -78,6 +78,7 @@ struct usb_dev_state {
 	int not_yet_resumed;
 	bool suspend_allowed;
 	bool privileges_dropped;
+	bool revoked;
 };
 
 struct usb_memory {
@@ -237,6 +238,9 @@ static int usbdev_mmap(struct file *file, struct vm_area_struct *vma)
 	dma_addr_t dma_handle;
 	int ret;
 
+	if (!connected(ps) || ps->revoked)
+		return -ENODEV;
+
 	ret = usbfs_increase_memory_usage(size + sizeof(struct usb_memory));
 	if (ret)
 		goto error;
@@ -298,6 +302,15 @@ static int usbdev_mmap(struct file *file, struct vm_area_struct *vma)
 	return ret;
 }
 
+static loff_t usbdev_llseek(struct file *file, loff_t offset, int whence)
+{
+	struct usb_dev_state *ps = file->private_data;
+
+	if (!connected(ps) || ps->revoked)
+		return -ENODEV;
+	return no_seek_end_llseek(file, offset, whence);
+}
+
 static ssize_t usbdev_read(struct file *file, char __user *buf, size_t nbytes,
 			   loff_t *ppos)
 {
@@ -310,7 +323,7 @@ static ssize_t usbdev_read(struct file *file, char __user *buf, size_t nbytes,
 
 	pos = *ppos;
 	usb_lock_device(dev);
-	if (!connected(ps)) {
+	if (!connected(ps) || ps->revoked) {
 		ret = -ENODEV;
 		goto err;
 	} else if (pos < 0) {
@@ -2576,6 +2589,34 @@ static int proc_wait_for_resume(struct usb_dev_state *ps)
 	return proc_forbid_suspend(ps);
 }
 
+static int usbdev_revoke(struct usb_dev_state *ps)
+{
+	struct usb_device *dev = ps->dev;
+	unsigned int ifnum;
+	struct async *as;
+
+	if (ps->revoked)
+		return -ENODEV;
+	ps->revoked = true;
+
+	usb_lock_device(dev);
+	for (ifnum = 0; ps->ifclaimed && ifnum < 8*sizeof(ps->ifclaimed);
+			ifnum++) {
+		if (test_bit(ifnum, &ps->ifclaimed))
+			releaseintf(ps, ifnum);
+	}
+	destroy_all_async(ps);
+	usb_unlock_device(dev);
+
+	as = async_getcompleted(ps);
+	while (as) {
+		free_async(as);
+		as = async_getcompleted(ps);
+	}
+
+	return 0;
+}
+
 /*
  * NOTE:  All requests here that have interface numbers as parameters
  * are assuming that somehow the configuration has been prevented from
@@ -2619,7 +2660,7 @@ static long usbdev_do_ioctl(struct file *file, unsigned int cmd,
 #endif
 	}
 
-	if (!connected(ps)) {
+	if (!connected(ps) || ps->revoked) {
 		usb_unlock_device(dev);
 		return -ENODEV;
 	}
@@ -2779,6 +2820,11 @@ static long usbdev_do_ioctl(struct file *file, unsigned int cmd,
 	case USBDEVFS_WAIT_FOR_RESUME:
 		ret = proc_wait_for_resume(ps);
 		break;
+	case USBDEVFS_REVOKE:
+		ret = usbdev_revoke(ps);
+		snoop(&dev->dev, "%s: REVOKE by PID %d: %s\n", __func__,
+		      task_pid_nr(current), current->comm);
+		break;
 	}
 
 	/* Handle variable-length commands */
@@ -2815,7 +2861,7 @@ static __poll_t usbdev_poll(struct file *file,
 	poll_wait(file, &ps->wait, wait);
 	if (file->f_mode & FMODE_WRITE && !list_empty(&ps->async_completed))
 		mask |= EPOLLOUT | EPOLLWRNORM;
-	if (!connected(ps))
+	if (!connected(ps) || ps->revoked)
 		mask |= EPOLLHUP;
 	if (list_empty(&ps->list))
 		mask |= EPOLLERR;
@@ -2824,7 +2870,7 @@ static __poll_t usbdev_poll(struct file *file,
 
 const struct file_operations usbdev_file_operations = {
 	.owner =	  THIS_MODULE,
-	.llseek =	  no_seek_end_llseek,
+	.llseek =	  usbdev_llseek,
 	.read =		  usbdev_read,
 	.poll =		  usbdev_poll,
 	.unlocked_ioctl = usbdev_ioctl,
diff --git a/include/uapi/linux/usbdevice_fs.h b/include/uapi/linux/usbdevice_fs.h
index cf525cddeb94..2ad44328c337 100644
--- a/include/uapi/linux/usbdevice_fs.h
+++ b/include/uapi/linux/usbdevice_fs.h
@@ -227,5 +227,6 @@ struct usbdevfs_streams {
 #define USBDEVFS_FORBID_SUSPEND    _IO('U', 33)
 #define USBDEVFS_ALLOW_SUSPEND     _IO('U', 34)
 #define USBDEVFS_WAIT_FOR_RESUME   _IO('U', 35)
+#define USBDEVFS_REVOKE            _IO('U', 36)
 
 #endif /* _UAPI_LINUX_USBDEVICE_FS_H */
-- 
2.35.1

