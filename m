Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 847BE84EC3
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 16:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729968AbfHGO3v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 10:29:51 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:42602 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729808AbfHGO3v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Aug 2019 10:29:51 -0400
Received: (qmail 18834 invoked by uid 2102); 7 Aug 2019 10:29:50 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 7 Aug 2019 10:29:50 -0400
Date:   Wed, 7 Aug 2019 10:29:50 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg KH <greg@kroah.com>
cc:     Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: [PATCH v2] usbfs: Add ioctls for runtime power management
In-Reply-To: <1565163465.8136.36.camel@suse.com>
Message-ID: <Pine.LNX.4.44L0.1908071013220.1514-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It has been requested that usbfs should implement runtime power
management, instead of forcing the device to remain at full power as
long as the device file is open.  This patch introduces that new
feature.

It does so by adding three new usbfs ioctls:

	USBDEVFS_FORBID_SUSPEND: Prevents the device from going into
	runtime suspend (and causes a resume if the device is already
	suspended).

	USBDEVFS_ALLOW_SUSPEND: Allows the device to go into runtime
	suspend.  Some time may elapse before the device actually is
	suspended, depending on things like the autosuspend delay.

	USBDEVFS_WAIT_FOR_RESUME: Blocks until the call is interrupted
	by a signal or at least one runtime resume has occurred since
	the most recent ALLOW_SUSPEND ioctl call (which may mean
	immediately, even if the device is currently suspended).  In
	the latter case, the device is prevented from suspending again
	just as if FORBID_SUSPEND was called before the ioctl returns.

For backward compatibility, when the device file is first opened
runtime suspends are forbidden.  The userspace program can then allow
suspends whenever it wants, and either resume the device directly (by
forbidding suspends again) or wait for a resume from some other source
(such as a remote wakeup).  URBs submitted to a suspended device will
fail or will complete with an appropriate error code.

This combination of ioctls is sufficient for user programs to have
nearly the same degree of control over a device's runtime power
behavior as kernel drivers do.

Still lacking is documentation for the new ioctls.  I intend to add it
later, after the existing documentation for the usbfs userspace API is
straightened out into a reasonable form.

Suggested-by: Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---

v2: Return -EINTR instead of -ERESTARTSYS when proc_wait_for_resume()
is interrupted by a signal.


[as1905b]


 drivers/usb/core/devio.c          |   96 ++++++++++++++++++++++++++++++++++++--
 drivers/usb/core/generic.c        |    5 +
 drivers/usb/core/usb.h            |    3 +
 include/uapi/linux/usbdevice_fs.h |    3 +
 4 files changed, 102 insertions(+), 5 deletions(-)

Index: usb-devel/drivers/usb/core/devio.c
===================================================================
--- usb-devel.orig/drivers/usb/core/devio.c
+++ usb-devel/drivers/usb/core/devio.c
@@ -48,6 +48,9 @@
 #define USB_DEVICE_MAX			(USB_MAXBUS * 128)
 #define USB_SG_SIZE			16384 /* split-size for large txs */
 
+/* Mutual exclusion for ps->list in resume vs. release and remove */
+static DEFINE_MUTEX(usbfs_mutex);
+
 struct usb_dev_state {
 	struct list_head list;      /* state list */
 	struct usb_device *dev;
@@ -57,14 +60,17 @@ struct usb_dev_state {
 	struct list_head async_completed;
 	struct list_head memory_list;
 	wait_queue_head_t wait;     /* wake up if a request completed */
+	wait_queue_head_t wait_for_resume;   /* wake up upon runtime resume */
 	unsigned int discsignr;
 	struct pid *disc_pid;
 	const struct cred *cred;
 	sigval_t disccontext;
 	unsigned long ifclaimed;
 	u32 disabled_bulk_eps;
-	bool privileges_dropped;
 	unsigned long interface_allowed_mask;
+	int not_yet_resumed;
+	bool suspend_allowed;
+	bool privileges_dropped;
 };
 
 struct usb_memory {
@@ -694,9 +700,7 @@ static void driver_disconnect(struct usb
 	destroy_async_on_interface(ps, ifnum);
 }
 
-/* The following routines are merely placeholders.  There is no way
- * to inform a user task about suspend or resumes.
- */
+/* We don't care about suspend/resume of claimed interfaces */
 static int driver_suspend(struct usb_interface *intf, pm_message_t msg)
 {
 	return 0;
@@ -707,12 +711,32 @@ static int driver_resume(struct usb_inte
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
+	/* Protect against simultaneous remove or release */
+	mutex_lock(&usbfs_mutex);
+	list_for_each_entry(ps, &udev->filelist, list) {
+		WRITE_ONCE(ps->not_yet_resumed, 0);
+		wake_up_all(&ps->wait_for_resume);
+	}
+	mutex_unlock(&usbfs_mutex);
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
@@ -997,9 +1021,12 @@ static int usbdev_open(struct inode *ino
 	INIT_LIST_HEAD(&ps->async_completed);
 	INIT_LIST_HEAD(&ps->memory_list);
 	init_waitqueue_head(&ps->wait);
+	init_waitqueue_head(&ps->wait_for_resume);
 	ps->disc_pid = get_pid(task_pid(current));
 	ps->cred = get_current_cred();
 	smp_wmb();
+
+	/* Can't race with resume; the device is already active */
 	list_add_tail(&ps->list, &dev->filelist);
 	file->private_data = ps;
 	usb_unlock_device(dev);
@@ -1025,7 +1052,10 @@ static int usbdev_release(struct inode *
 	usb_lock_device(dev);
 	usb_hub_release_all_ports(dev, ps);
 
+	/* Protect against simultaneous resume */
+	mutex_lock(&usbfs_mutex);
 	list_del_init(&ps->list);
+	mutex_unlock(&usbfs_mutex);
 
 	for (ifnum = 0; ps->ifclaimed && ifnum < 8*sizeof(ps->ifclaimed);
 			ifnum++) {
@@ -1033,7 +1063,8 @@ static int usbdev_release(struct inode *
 			releaseintf(ps, ifnum);
 	}
 	destroy_all_async(ps);
-	usb_autosuspend_device(dev);
+	if (!ps->suspend_allowed)
+		usb_autosuspend_device(dev);
 	usb_unlock_device(dev);
 	usb_put_dev(dev);
 	put_pid(ps->disc_pid);
@@ -2384,6 +2415,47 @@ static int proc_drop_privileges(struct u
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
+	if (ret != 0)
+		return -EINTR;
+	return proc_forbid_suspend(ps);
+}
+
 /*
  * NOTE:  All requests here that have interface numbers as parameters
  * are assuming that somehow the configuration has been prevented from
@@ -2578,6 +2650,15 @@ static long usbdev_do_ioctl(struct file
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
 
 	/* Handle variable-length commands */
@@ -2651,15 +2732,20 @@ static void usbdev_remove(struct usb_dev
 {
 	struct usb_dev_state *ps;
 
+	/* Protect against simultaneous resume */
+	mutex_lock(&usbfs_mutex);
 	while (!list_empty(&udev->filelist)) {
 		ps = list_entry(udev->filelist.next, struct usb_dev_state, list);
 		destroy_all_async(ps);
 		wake_up_all(&ps->wait);
+		WRITE_ONCE(ps->not_yet_resumed, 0);
+		wake_up_all(&ps->wait_for_resume);
 		list_del_init(&ps->list);
 		if (ps->discsignr)
 			kill_pid_usb_asyncio(ps->discsignr, EPIPE, ps->disccontext,
 					     ps->disc_pid, ps->cred);
 	}
+	mutex_unlock(&usbfs_mutex);
 }
 
 static int usbdev_notify(struct notifier_block *self,
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
@@ -223,5 +223,8 @@ struct usbdevfs_streams {
  * extending size of the data returned.
  */
 #define USBDEVFS_CONNINFO_EX(len)  _IOC(_IOC_READ, 'U', 32, len)
+#define USBDEVFS_FORBID_SUSPEND    _IO('U', 33)
+#define USBDEVFS_ALLOW_SUSPEND     _IO('U', 34)
+#define USBDEVFS_WAIT_FOR_RESUME   _IO('U', 35)
 
 #endif /* _UAPI_LINUX_USBDEVICE_FS_H */

