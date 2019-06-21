Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4B44EF69
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2019 21:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbfFUT2W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jun 2019 15:28:22 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:34396 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725947AbfFUT2W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Jun 2019 15:28:22 -0400
Received: (qmail 11070 invoked by uid 2102); 21 Jun 2019 15:28:21 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 21 Jun 2019 15:28:21 -0400
Date:   Fri, 21 Jun 2019 15:28:21 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
cc:     Oliver Neukum <oneukum@suse.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        <patches@opensource.cirrus.com>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
In-Reply-To: <1561133817.11118.16.camel@opensource.cirrus.com>
Message-ID: <Pine.LNX.4.44L0.1906211319260.1471-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 21 Jun 2019, Mayuresh Kulkarni wrote:

> Hi Alan,
> 
> With the suggested modification (of having suspend/resume of usbfs at
> device level instead of interface level), looks like I am seeing a
> deadlock described as below -
> 
> Pre-condition: USB device is connected but suspended before running test
> program.
> 
> 1. The test program calls open(/dev/bus/usb/...).
> 2. This ends up calling usbdev_open().
> 3. usbdev_open() takes the lock and calls usb_autoresume_device().
> 4. usb_autoresume_device() calls pm_runtime_get_sync(). Due to _sync
> version, this call will return after calling the resume call-back of
> driver (please correct me if wrong).
> 5. This ends up calling generic_resume() which
> calls usbfs_notify_resume().
> 6. Now usbfs_notify_resume() also wants the same lock that usbdev_open()
> in (3) has already taken.

What lock are you talking about?  usbfs_notify_resume() doesn't take 
any locks.

> My observation so far is - when the USB device is connected for first
> time, Android's USB manager server is able to open the device and reads
> its descriptors using usbfs. But the test is not able to. The change is
> auto-suspend in between device connect and run of test program.
> 
> I am still analysing the situation here to see if pre-condition above
> really makes difference or not. So please take this update with pinch of
> salt. However, still I wanted send this update and get a quick review to
> ensure I am not wandering in weeds.

This doesn't sound like a real problem.

However, I have been thinking about how to do all this in light of
Oliver's comments, and it seems like we should make some changes.

First, let's change the ioctls' names.  Instead of RESUME and SUSPEND,
I'll call them FORBID_SUSPEND and ALLOW_SUSPEND.  The way they work
should be clear: ALLOW_SUSPEND will permit the device to be suspended
but might not cause a suspend to happen immediately.  FORBID_SUSPEND
will cause an immediate resume if the device is currently suspended and
will prevent the device from being suspended in the future.  The new 
names more accurately reflect what the ioctls actually do.

Second, the WAIT_FOR_RESUME ioctl will wait only until a resume has
occurred more recently than the most recent ALLOW_SUSPEND ioctl.  So
for example, if the program calls ALLOW_SUSPEND, and the device
suspends, and then the device resumes, and then the device suspends
again, and then the program calls WAIT_FOR_RESUME, the ioctl will
return immediately even though the device is currently suspended.  
Thus you don't have to worry about missing a remote resume.  This also
means that when WAIT_FOR_RESUME returns, the program should call
FORBID_SUSPEND to ensure that the device is active and doesn't go back 
into suspend.

In practice, your program would use the ioctls as follows:

	When the device file is opened, the kernel will automatically
	do the equivalent of FORBID_SUSPEND (to remain compatible 
	with the current behavior).

	When the program is ready for the device to suspend, it will
	call the ALLOW_SUSPEND ioctl.  But it won't cancel the 
	outstanding URBs; instead it will continue to interact 
	normally with the device, because the device might not be 
	suspended for some time.

	When the device does go into suspend, URBs will start failing
	with an appropriate error code (EHOSTUNREACH, ESHUTDOWN, 
	EPROTO, or something similar).  In this way the program will
	realize the device is suspended.  At that point the program
	should call the WAIT_FOR_RESUME ioctl and stop trying to 
	communicate with the device.

	When WAIT_FOR_RESUME returns, the program should call the
	FORBID_SUSPEND ioctl and resume normal communication with the 
	device.

How does that sound?

The proposed patch is below.

Alan Stern


Index: usb-devel/drivers/usb/core/devio.c
===================================================================
--- usb-devel.orig/drivers/usb/core/devio.c
+++ usb-devel/drivers/usb/core/devio.c
@@ -60,14 +60,17 @@ struct usb_dev_state {
 	struct list_head async_completed;
 	struct list_head memory_list;
 	wait_queue_head_t wait;     /* wake up if a request completed */
+	wait_queue_head_t wait_for_resume;   /* wake up upon runtime resume */
 	unsigned int discsignr;
 	struct pid *disc_pid;
 	const struct cred *cred;
 	void __user *disccontext;
 	unsigned long ifclaimed;
 	u32 disabled_bulk_eps;
-	bool privileges_dropped;
 	unsigned long interface_allowed_mask;
+	int not_yet_resumed;
+	bool suspend_allowed;
+	bool privileges_dropped;
 };
 
 struct usb_memory {
@@ -699,9 +702,7 @@ static void driver_disconnect(struct usb
 	destroy_async_on_interface(ps, ifnum);
 }
 
-/* The following routines are merely placeholders.  There is no way
- * to inform a user task about suspend or resumes.
- */
+/* We don't care about suspend/resume of claimed interfaces */
 static int driver_suspend(struct usb_interface *intf, pm_message_t msg)
 {
 	return 0;
@@ -712,12 +713,29 @@ static int driver_resume(struct usb_inte
 	return 0;
 }
 
+/* The following routines apply to the entire device, not interfaces */
+void usbfs_notify_suspend(struct usb_device *udev)
+{
+	/* We don't need to handle this */
+}
+
+void usbfs_notify_resume(struct usb_device *udev)
+{
+	struct usb_dev_state *ps;
+
+	list_for_each_entry(ps, &udev->filelist, list) {
+		WRITE_ONCE(ps->not_yet_resumed, 0);
+		wake_up_all(&ps->wait_for_resume);
+	}
+}
+
 struct usb_driver usbfs_driver = {
 	.name =		"usbfs",
 	.probe =	driver_probe,
 	.disconnect =	driver_disconnect,
 	.suspend =	driver_suspend,
 	.resume =	driver_resume,
+	.supports_autosuspend = 1,
 };
 
 static int claimintf(struct usb_dev_state *ps, unsigned int ifnum)
@@ -1008,6 +1026,7 @@ static int usbdev_open(struct inode *ino
 	INIT_LIST_HEAD(&ps->async_completed);
 	INIT_LIST_HEAD(&ps->memory_list);
 	init_waitqueue_head(&ps->wait);
+	init_waitqueue_head(&ps->wait_for_resume);
 	ps->disc_pid = get_pid(task_pid(current));
 	ps->cred = get_current_cred();
 	smp_wmb();
@@ -1032,8 +1051,11 @@ static int usbdev_release(struct inode *
 	struct usb_device *dev = ps->dev;
 	unsigned int ifnum;
 	struct async *as;
+	int rc = 0;
 
 	usb_lock_device(dev);
+	if (ps->suspend_allowed)
+		rc = usb_autoresume_device(dev);
 	usb_hub_release_all_ports(dev, ps);
 
 	list_del_init(&ps->list);
@@ -1044,7 +1066,8 @@ static int usbdev_release(struct inode *
 			releaseintf(ps, ifnum);
 	}
 	destroy_all_async(ps);
-	usb_autosuspend_device(dev);
+	if (rc == 0)
+		usb_autosuspend_device(dev);
 	usb_unlock_device(dev);
 	usb_put_dev(dev);
 	put_pid(ps->disc_pid);
@@ -2355,6 +2378,45 @@ static int proc_drop_privileges(struct u
 	return 0;
 }
 
+static int proc_forbid_suspend(struct usb_dev_state *ps)
+{
+	int ret = 0;
+
+	if (ps->suspend_allowed) {
+		ret = usb_autoresume_device(ps->dev);
+		if (ret == 0)
+			ps->suspend_allowed = false;
+		else if (ret != -ENODEV)
+			ret = -EIO;
+	}
+	return ret;
+}
+
+static int proc_allow_suspend(struct usb_dev_state *ps)
+{
+	if (!connected(ps))
+		return -ENODEV;
+
+	WRITE_ONCE(ps->not_yet_resumed, 1);
+	if (!ps->suspend_allowed) {
+		usb_autosuspend_device(ps->dev);
+		ps->suspend_allowed = true;
+	}
+	return 0;
+}
+
+static int proc_wait_for_resume(struct usb_dev_state *ps)
+{
+	int ret;
+
+	usb_unlock_device(ps->dev);
+	ret = wait_event_interruptible(ps->wait_for_resume,
+			READ_ONCE(ps->not_yet_resumed) == 0);
+	usb_lock_device(ps->dev);
+
+	return ret;
+}
+
 /*
  * NOTE:  All requests here that have interface numbers as parameters
  * are assuming that somehow the configuration has been prevented from
@@ -2549,6 +2611,15 @@ static long usbdev_do_ioctl(struct file
 	case USBDEVFS_GET_SPEED:
 		ret = ps->dev->speed;
 		break;
+	case USBDEVFS_FORBID_SUSPEND:
+		ret = proc_forbid_suspend(ps);
+		break;
+	case USBDEVFS_ALLOW_SUSPEND:
+		ret = proc_allow_suspend(ps);
+		break;
+	case USBDEVFS_WAIT_FOR_RESUME:
+		ret = proc_wait_for_resume(ps);
+		break;
 	}
 
  done:
@@ -2620,6 +2691,8 @@ static void usbdev_remove(struct usb_dev
 		ps = list_entry(udev->filelist.next, struct usb_dev_state, list);
 		destroy_all_async(ps);
 		wake_up_all(&ps->wait);
+		WRITE_ONCE(ps->not_yet_resumed, 0);
+		wake_up_all(&ps->wait_for_resume);
 		list_del_init(&ps->list);
 		if (ps->discsignr) {
 			clear_siginfo(&sinfo);
Index: usb-devel/drivers/usb/core/generic.c
===================================================================
--- usb-devel.orig/drivers/usb/core/generic.c
+++ usb-devel/drivers/usb/core/generic.c
@@ -257,6 +257,8 @@ static int generic_suspend(struct usb_de
 	else
 		rc = usb_port_suspend(udev, msg);
 
+	if (rc == 0)
+		usbfs_notify_suspend(udev);
 	return rc;
 }
 
@@ -273,6 +275,9 @@ static int generic_resume(struct usb_dev
 		rc = hcd_bus_resume(udev, msg);
 	else
 		rc = usb_port_resume(udev, msg);
+
+	if (rc == 0)
+		usbfs_notify_resume(udev);
 	return rc;
 }
 
Index: usb-devel/drivers/usb/core/usb.h
===================================================================
--- usb-devel.orig/drivers/usb/core/usb.h
+++ usb-devel/drivers/usb/core/usb.h
@@ -95,6 +95,9 @@ extern int usb_runtime_idle(struct devic
 extern int usb_enable_usb2_hardware_lpm(struct usb_device *udev);
 extern int usb_disable_usb2_hardware_lpm(struct usb_device *udev);
 
+extern void usbfs_notify_suspend(struct usb_device *udev);
+extern void usbfs_notify_resume(struct usb_device *udev);
+
 #else
 
 static inline int usb_port_suspend(struct usb_device *udev, pm_message_t msg)
Index: usb-devel/include/uapi/linux/usbdevice_fs.h
===================================================================
--- usb-devel.orig/include/uapi/linux/usbdevice_fs.h
+++ usb-devel/include/uapi/linux/usbdevice_fs.h
@@ -197,5 +197,8 @@ struct usbdevfs_streams {
 #define USBDEVFS_FREE_STREAMS      _IOR('U', 29, struct usbdevfs_streams)
 #define USBDEVFS_DROP_PRIVILEGES   _IOW('U', 30, __u32)
 #define USBDEVFS_GET_SPEED         _IO('U', 31)
+#define USBDEVFS_FORBID_SUSPEND    _IO('U', 32)
+#define USBDEVFS_ALLOW_SUSPEND     _IO('U', 33)
+#define USBDEVFS_WAIT_FOR_RESUME   _IO('U', 34)
 
 #endif /* _UAPI_LINUX_USBDEVICE_FS_H */

