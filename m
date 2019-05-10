Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E06519AF8
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2019 12:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbfEJKBR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 May 2019 06:01:17 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:58826 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727079AbfEJKBR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 May 2019 06:01:17 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4A9sn1S014333;
        Fri, 10 May 2019 05:01:12 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=mkulkarni@opensource.cirrus.com
Received: from mail4.cirrus.com ([87.246.98.35])
        by mx0a-001ae601.pphosted.com with ESMTP id 2sca0s2t1v-1;
        Fri, 10 May 2019 05:01:10 -0500
Received: from EDIEX01.ad.cirrus.com (ediex01.ad.cirrus.com [198.61.84.80])
        by mail4.cirrus.com (Postfix) with ESMTP id 2055B611C8AF;
        Fri, 10 May 2019 05:02:40 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 10 May
 2019 11:01:09 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Fri, 10 May 2019 11:01:09 +0100
Received: from mkulkarni-laptop.ad.cirrus.com (mkulkarni-laptop.ad.cirrus.com [198.90.199.28])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 789A544;
        Fri, 10 May 2019 11:01:09 +0100 (BST)
From:   Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
To:     <linux-usb@vger.kernel.org>
CC:     <patches@opensource.cirrus.com>, <gregkh@linuxfoundation.org>,
        <stern@rowland.harvard.edu>, <oneukum@suse.com>
Subject: [PATCH] usb: core: devio: add ioctls for suspend and resume
Date:   Fri, 10 May 2019 11:01:09 +0100
Message-ID: <1557482469-6834-1-git-send-email-mkulkarni@opensource.cirrus.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905100071
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

- The current driver increments the PM ref-count in its .open
API and decrements it in its .close API.
- Due to this, it is not possible for the usb_device to go into
suspend (L2) even if all of its interfaces report idle to usb-core.
- In order to allow the suspend, 2 new ioctls are added:
1. USBDEVFS_SUSPEND: calls auto-suspend and indicates to usb/pm core
to attempt suspend, if appropriate. This is a non-blocking call.
2. USBDEVFS_WAIT_RESUME: waits for resume. This is a blocking call.
The resume could happen due to:
host-wake (i.e.: any driver bound to interface(s) of device wants to
send/receive control/data)
OR
remote-wake (i.e.: when remote-wake enabled device generates a
remote-wake to host).
In both these conditions, this call will return.
- It is expected that:
1. When user-space thinks the device is idle from its point-of-view,
it calls USBDEVFS_SUSPEND.
2. After USBDEVFS_WAIT_RESUME call returns,
the callers queries the device/interface of its interest to see
what caused resume and take appropriate action on it.

The link to relevant discussion about this patch on linux-usb is -
https://www.spinics.net/lists/linux-usb/msg173285.html

Signed-off-by: Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
---
 drivers/usb/core/devio.c          | 114 ++++++++++++++++++++++++++++++++++++--
 include/uapi/linux/usbdevice_fs.h |   2 +
 2 files changed, 112 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index fa783531..67dc326 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -68,6 +68,9 @@ struct usb_dev_state {
 	u32 disabled_bulk_eps;
 	bool privileges_dropped;
 	unsigned long interface_allowed_mask;
+	bool runtime_active;
+	bool is_suspended;
+	wait_queue_head_t wait_resume;
 };
 
 struct usb_memory {
@@ -444,6 +447,23 @@ static struct async *async_getpending(struct usb_dev_state *ps,
 	return NULL;
 }
 
+static int async_getpending_count(struct usb_dev_state *ps)
+{
+	struct async *as;
+	int count;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ps->lock, flags);
+	if (list_empty(&ps->async_pending))
+		count = 0;
+	else
+		list_for_each_entry(as, &ps->async_pending, asynclist)
+			count++;
+	spin_unlock_irqrestore(&ps->lock, flags);
+
+	return count;
+}
+
 static void snoop_urb(struct usb_device *udev,
 		void __user *userurb, int pipe, unsigned length,
 		int timeout_or_status, enum snoop_when when,
@@ -699,16 +719,26 @@ static void driver_disconnect(struct usb_interface *intf)
 	destroy_async_on_interface(ps, ifnum);
 }
 
-/* The following routines are merely placeholders.  There is no way
- * to inform a user task about suspend or resumes.
- */
 static int driver_suspend(struct usb_interface *intf, pm_message_t msg)
 {
+	struct usb_dev_state *ps = usb_get_intfdata(intf);
+
+	ps->is_suspended = true;
+	snoop(&ps->dev->dev, "driver-suspend\n");
+
 	return 0;
 }
 
 static int driver_resume(struct usb_interface *intf)
 {
+	struct usb_dev_state *ps = usb_get_intfdata(intf);
+
+	ps->runtime_active = true;
+	wake_up(&ps->wait_resume);
+
+	snoop(&ps->dev->dev, "driver-resume: runtime-active = %d\n",
+		ps->runtime_active);
+
 	return 0;
 }
 
@@ -718,6 +748,7 @@ struct usb_driver usbfs_driver = {
 	.disconnect =	driver_disconnect,
 	.suspend =	driver_suspend,
 	.resume =	driver_resume,
+	.supports_autosuspend = 1,
 };
 
 static int claimintf(struct usb_dev_state *ps, unsigned int ifnum)
@@ -963,6 +994,27 @@ static struct usb_device *usbdev_lookup_by_devt(dev_t devt)
 	return to_usb_device(dev);
 }
 
+/* must be called with usb-dev lock held */
+static int usbdev_do_resume(struct usb_dev_state *ps)
+{
+	int ret = 0;
+
+	if (!ps->runtime_active) {
+		snoop(&ps->dev->dev, "suspended..resume now\n");
+		ps->is_suspended = false;
+		if (usb_autoresume_device(ps->dev)) {
+			ret = -EIO;
+			goto _out;
+		}
+		snoop(&ps->dev->dev, "resume done..active now\n");
+		ps->runtime_active = true;
+		wake_up(&ps->wait_resume);
+	}
+
+_out:
+	return ret;
+}
+
 /*
  * file operations
  */
@@ -1008,6 +1060,9 @@ static int usbdev_open(struct inode *inode, struct file *file)
 	INIT_LIST_HEAD(&ps->async_completed);
 	INIT_LIST_HEAD(&ps->memory_list);
 	init_waitqueue_head(&ps->wait);
+	init_waitqueue_head(&ps->wait_resume);
+	ps->runtime_active = true;
+	ps->is_suspended = false;
 	ps->disc_pid = get_pid(task_pid(current));
 	ps->cred = get_current_cred();
 	smp_wmb();
@@ -1034,6 +1089,10 @@ static int usbdev_release(struct inode *inode, struct file *file)
 	struct async *as;
 
 	usb_lock_device(dev);
+
+	/* what can we can do if resume fails? */
+	usbdev_do_resume(ps);
+
 	usb_hub_release_all_ports(dev, ps);
 
 	list_del_init(&ps->list);
@@ -2355,6 +2414,18 @@ static int proc_drop_privileges(struct usb_dev_state *ps, void __user *arg)
 	return 0;
 }
 
+static int proc_wait_resume(struct usb_dev_state *ps)
+{
+	int ret;
+
+	snoop(&ps->dev->dev, "wait-for-resume\n");
+	ret = wait_event_interruptible(ps->wait_resume,
+		(ps->runtime_active == true));
+	snoop(&ps->dev->dev, "wait-for-resume...done\n");
+
+	return ret;
+}
+
 /*
  * NOTE:  All requests here that have interface numbers as parameters
  * are assuming that somehow the configuration has been prevented from
@@ -2373,6 +2444,25 @@ static long usbdev_do_ioctl(struct file *file, unsigned int cmd,
 
 	usb_lock_device(dev);
 
+	if (cmd != USBDEVFS_WAIT_RESUME) {
+		ret = usbdev_do_resume(ps);
+		if (ret)
+			goto done;
+	} else {
+		usb_unlock_device(dev);
+		ret = proc_wait_resume(ps);
+
+		/* Call auto-resume to balance auto-suspend of suspend-ioctl */
+		usb_lock_device(dev);
+		if (ps->is_suspended) {
+			ret = usb_autoresume_device(ps->dev);
+			ps->is_suspended = false;
+		}
+		usb_unlock_device(dev);
+
+		goto _done;
+	}
+
 	/* Reap operations are allowed even after disconnection */
 	switch (cmd) {
 	case USBDEVFS_REAPURB:
@@ -2549,10 +2639,26 @@ static long usbdev_do_ioctl(struct file *file, unsigned int cmd,
 	case USBDEVFS_GET_SPEED:
 		ret = ps->dev->speed;
 		break;
+	case USBDEVFS_SUSPEND:
+		ret = 0;
+
+		/* we cannot suspend when URB is pending */
+		if (async_getpending_count(ps)) {
+			snoop(&ps->dev->dev, "ioctl-suspend but URB pending\n");
+			ret = -EINVAL;
+		} else {
+			if (ps->runtime_active) {
+				snoop(&ps->dev->dev, "ioctl-suspend\n");
+				ps->runtime_active = false;
+				usb_autosuspend_device(ps->dev);
+			}
+		}
+		break;
 	}
 
- done:
+done:
 	usb_unlock_device(dev);
+_done:
 	if (ret >= 0)
 		inode->i_atime = current_time(inode);
 	return ret;
diff --git a/include/uapi/linux/usbdevice_fs.h b/include/uapi/linux/usbdevice_fs.h
index 964e872..ae46beb 100644
--- a/include/uapi/linux/usbdevice_fs.h
+++ b/include/uapi/linux/usbdevice_fs.h
@@ -197,5 +197,7 @@ struct usbdevfs_streams {
 #define USBDEVFS_FREE_STREAMS      _IOR('U', 29, struct usbdevfs_streams)
 #define USBDEVFS_DROP_PRIVILEGES   _IOW('U', 30, __u32)
 #define USBDEVFS_GET_SPEED         _IO('U', 31)
+#define USBDEVFS_SUSPEND           _IO('U', 32)
+#define USBDEVFS_WAIT_RESUME       _IO('U', 33)
 
 #endif /* _UAPI_LINUX_USBDEVICE_FS_H */
-- 
2.7.4

