Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C30633223F0
	for <lists+linux-usb@lfdr.de>; Tue, 23 Feb 2021 03:00:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbhBWCAI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Feb 2021 21:00:08 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:49610 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230367AbhBWCAF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Feb 2021 21:00:05 -0500
Received: from fsav102.sakura.ne.jp (fsav102.sakura.ne.jp [27.133.134.229])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 11N1xKCd054868;
        Tue, 23 Feb 2021 10:59:20 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav102.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav102.sakura.ne.jp);
 Tue, 23 Feb 2021 10:59:20 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav102.sakura.ne.jp)
Received: from localhost.localdomain (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 11N1xD9F054833
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 23 Feb 2021 10:59:20 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Julia Lawall <julia.lawall@inria.fr>,
        The kernel test robot <lkp@intel.com>
Subject: [PATCH v3] usb: usbip: serialize attach/detach operations
Date:   Tue, 23 Feb 2021 10:59:07 +0900
Message-Id: <20210223015907.3506-1-penguin-kernel@I-love.SAKURA.ne.jp>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <YDCzLfhawx4u28dd@kroah.com>
References: <YDCzLfhawx4u28dd@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot is reporting an ERR_PTR(-EINTR) pointer dereference at
vhci_shutdown_connection() [1], for kthread_create() became killable due
to commit 786235eeba0e1e85 ("kthread: make kthread_create() killable").

When SIGKILLed while attach_store() is calling kthread_get_run(),
ERR_PTR(-EINTR) is stored into vdev->ud.tcp_{rx,tx}, and then
kthread_stop_put() is called on vdev->ud.tcp_{rx,tx} from
vhci_shutdown_connection() because vdev->ud.tcp_{rx,tx} != NULL.

Prior to commit 9720b4bc76a83807 ("staging/usbip: convert to kthread"),
"current" pointer is assigned to vdev->ud.tcp_{rx,tx} by usbip_thread()
kernel thread, and hence vdev->ud.tcp_{rx,tx} != NULL means a valid task
pointer. However, this patch does not make kthread_get_run() return NULL
when kthread_create() failed, for this patch removes kthread_get_run() in
order to fix the other bug described below.

syzbot is also reporting a NULL pointer dereference at sock_sendmsg() [2],
for lack of serialization between attach_store() and event_handler()
causes vhci_shutdown_connection() to observe vdev->ud.tcp_tx == NULL while
vdev->ud.tcp_socket != NULL. Please read the reference link for details of
this race window.

Therefore, this patch does the following things in order to fix reported
bugs and other possible bugs.

(1) Handle kthread_create() failure (which fixes [1]) by grouping socket
    lookup, kthread_create() and get_task_struct() into
    usbip_prepare_threads() function.

(2) Serialize usbip_sockfd_store(), detach_store(), attach_store() and
    ud->eh_ops.{shutdown,reset,unusable}() operations using
    usbip_event_mutex mutex (which fixes [2]). Introducing such large
    mutex should be safe because ud->tcp_{tx,rx} must not wait for
    event_handler() to flush because event_handler() is processed by a
    singlethreaded workqueue.

(3) Add SOCK_STREAM check into usbip_prepare_threads(), for current code
    is not verifying that a file descriptor passed is actually a stream
    socket. If the file descriptor passed was a SOCK_DGRAM socket,
    sock_recvmsg() can't detect end of stream.

(4) Don't perform ud->tcp_socket = NULL in vhci_device_reset().
    Since ud->tcp_{tx,rx} depend on ud->tcp_socket != NULL whereas
    ud->tcp_socket and ud->tcp_{tx,rx} are assigned at the same time,
    it is never safe to reset ud->tcp_socket from vhci_device_reset()
    without calling kthread_stop_put() from vhci_shutdown_connection().

(5) usbip_sockfd_store() must perform

      if ({sdev,udc}->ud.status != SDEV_ST_AVAILABLE) {
        /* misc assignments for attach operation */
        {sdev,udc}->ud.status = SDEV_ST_USED;
      }

    atomically, or multiple ud->tcp_{tx,rx} are created (which will later
    cause a crash like [2]) and refcount on ud->tcp_socket is leaked when
    usbip_sockfd_store() is concurrently called.

[1] https://syzkaller.appspot.com/bug?extid=a93fba6d384346a761e3
[2] https://syzkaller.appspot.com/bug?extid=95ce4b142579611ef0a9

Reported-and-tested-by: syzbot <syzbot+a93fba6d384346a761e3@syzkaller.appspotmail.com>
Reported-by: syzbot <syzbot+bf1a360e305ee719e364@syzkaller.appspotmail.com>
Reported-by: syzbot <syzbot+95ce4b142579611ef0a9@syzkaller.appspotmail.com>
References: https://lkml.kernel.org/r/676d4518-0faa-9fab-15db-0db8d216d7fb@i-love.sakura.ne.jp
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Fixes: 9720b4bc76a83807 ("staging/usbip: convert to kthread")
---
Changes since v1:

  Tetsuo Handa found that the PTR_ERR() access in usbip_prepare_threads()
  in v1 was wrong, and fixed it in v2.

Changes since v2:

  The kernel test robot <lkp@intel.com> found the same error using
  scripts/coccinelle/tests/odd_ptr_err.cocci and
  Julia Lawall <julia.lawall@inria.fr> sent us a patch, but nothing
  changed because that error was already fixed in v2.

 drivers/usb/usbip/stub_dev.c     | 56 ++++++++++++++++++--------------
 drivers/usb/usbip/usbip_common.c | 55 +++++++++++++++++++++++++++++++
 drivers/usb/usbip/usbip_common.h | 25 +++++++-------
 drivers/usb/usbip/usbip_event.c  | 15 +++++++++
 drivers/usb/usbip/vhci_hcd.c     |  6 ----
 drivers/usb/usbip/vhci_sysfs.c   | 50 ++++++++++++++++++++--------
 drivers/usb/usbip/vudc_sysfs.c   | 50 ++++++++++++++++------------
 7 files changed, 181 insertions(+), 76 deletions(-)

diff --git a/drivers/usb/usbip/stub_dev.c b/drivers/usb/usbip/stub_dev.c
index 2305d425e6c9..f63a22562ead 100644
--- a/drivers/usb/usbip/stub_dev.c
+++ b/drivers/usb/usbip/stub_dev.c
@@ -39,12 +39,11 @@ static DEVICE_ATTR_RO(usbip_status);
  * is used to transfer usbip requests by kernel threads. -1 is a magic number
  * by which usbip connection is finished.
  */
-static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
+static ssize_t __usbip_sockfd_store(struct device *dev, struct device_attribute *attr,
+				    const char *buf, size_t count)
 {
 	struct stub_device *sdev = dev_get_drvdata(dev);
 	int sockfd = 0;
-	struct socket *socket;
 	int rv;
 
 	if (!sdev) {
@@ -57,7 +56,12 @@ static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *a
 		return -EINVAL;
 
 	if (sockfd != -1) {
-		int err;
+		struct usbip_thread_info uti;
+		int err = usbip_prepare_threads(&uti, &sdev->ud, sockfd,
+						stub_tx_loop, "stub_tx", stub_rx_loop, "stub_rx");
+
+		if (err)
+			return err;
 
 		dev_info(dev, "stub up\n");
 
@@ -65,44 +69,46 @@ static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *a
 
 		if (sdev->ud.status != SDEV_ST_AVAILABLE) {
 			dev_err(dev, "not ready\n");
-			goto err;
+			spin_unlock_irq(&sdev->ud.lock);
+			usbip_unprepare_threads(&uti);
+			return -EINVAL;
 		}
 
-		socket = sockfd_lookup(sockfd, &err);
-		if (!socket)
-			goto err;
-
-		sdev->ud.tcp_socket = socket;
+		sdev->ud.tcp_socket = uti.tcp_socket;
 		sdev->ud.sockfd = sockfd;
-
-		spin_unlock_irq(&sdev->ud.lock);
-
-		sdev->ud.tcp_rx = kthread_get_run(stub_rx_loop, &sdev->ud,
-						  "stub_rx");
-		sdev->ud.tcp_tx = kthread_get_run(stub_tx_loop, &sdev->ud,
-						  "stub_tx");
-
-		spin_lock_irq(&sdev->ud.lock);
+		sdev->ud.tcp_rx = uti.tcp_rx;
+		sdev->ud.tcp_tx = uti.tcp_tx;
 		sdev->ud.status = SDEV_ST_USED;
 		spin_unlock_irq(&sdev->ud.lock);
 
+		wake_up_process(sdev->ud.tcp_rx);
+		wake_up_process(sdev->ud.tcp_tx);
 	} else {
 		dev_info(dev, "stub down\n");
 
 		spin_lock_irq(&sdev->ud.lock);
-		if (sdev->ud.status != SDEV_ST_USED)
-			goto err;
-
+		if (sdev->ud.status != SDEV_ST_USED) {
+			spin_unlock_irq(&sdev->ud.lock);
+			return -EINVAL;
+		}
 		spin_unlock_irq(&sdev->ud.lock);
 
 		usbip_event_add(&sdev->ud, SDEV_EVENT_DOWN);
 	}
 
 	return count;
+}
 
-err:
-	spin_unlock_irq(&sdev->ud.lock);
-	return -EINVAL;
+static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *attr,
+				  const char *buf, size_t count)
+{
+	ssize_t ret = usbip_event_lock_killable();
+
+	if (ret)
+		return ret;
+	ret = __usbip_sockfd_store(dev, attr, buf, count);
+	usbip_event_unlock();
+	return ret;
 }
 static DEVICE_ATTR_WO(usbip_sockfd);
 
diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
index 2ab99244bc31..f80098c3dd10 100644
--- a/drivers/usb/usbip/usbip_common.c
+++ b/drivers/usb/usbip/usbip_common.c
@@ -748,6 +748,61 @@ int usbip_recv_xbuff(struct usbip_device *ud, struct urb *urb)
 }
 EXPORT_SYMBOL_GPL(usbip_recv_xbuff);
 
+int usbip_prepare_threads(struct usbip_thread_info *uti,
+			  struct usbip_device *ud, int sockfd,
+			  int (*tx_fn)(void *data), const char *tx_name,
+			  int (*rx_fn)(void *data), const char *rx_name)
+{
+	int err;
+	struct socket *socket;
+	struct task_struct *tx;
+	struct task_struct *rx;
+
+	/* Extract socket from fd. */
+	socket = sockfd_lookup(sockfd, &err);
+	if (!socket)
+		return -EINVAL;
+	/* Verify that this is a stream socket. */
+	if (socket->type != SOCK_STREAM) {
+		err = -EINVAL;
+		goto out_socket;
+	}
+	/* Create threads for this socket. */
+	rx = kthread_create(rx_fn, ud, rx_name);
+	if (IS_ERR(rx)) {
+		err = PTR_ERR(rx);
+		goto out_socket;
+	}
+	tx = kthread_create(tx_fn, ud, tx_name);
+	if (IS_ERR(tx)) {
+		err = PTR_ERR(tx);
+		goto out_rx;
+	}
+	uti->tcp_socket = socket;
+	get_task_struct(rx);
+	uti->tcp_rx = rx;
+	get_task_struct(tx);
+	uti->tcp_tx = tx;
+	return 0;
+ out_rx:
+	kthread_stop(rx);
+ out_socket:
+	sockfd_put(socket);
+	return err;
+}
+EXPORT_SYMBOL_GPL(usbip_prepare_threads);
+
+void usbip_unprepare_threads(struct usbip_thread_info *uti)
+{
+	kthread_stop_put(uti->tcp_tx);
+	uti->tcp_tx = NULL;
+	kthread_stop_put(uti->tcp_rx);
+	uti->tcp_rx = NULL;
+	sockfd_put(uti->tcp_socket);
+	uti->tcp_socket = NULL;
+}
+EXPORT_SYMBOL_GPL(usbip_unprepare_threads);
+
 static int __init usbip_core_init(void)
 {
 	return usbip_init_eh();
diff --git a/drivers/usb/usbip/usbip_common.h b/drivers/usb/usbip/usbip_common.h
index 8be857a4fa13..c5e8e61ddf91 100644
--- a/drivers/usb/usbip/usbip_common.h
+++ b/drivers/usb/usbip/usbip_common.h
@@ -279,17 +279,6 @@ struct usbip_device {
 	} eh_ops;
 };
 
-#define kthread_get_run(threadfn, data, namefmt, ...)			   \
-({									   \
-	struct task_struct *__k						   \
-		= kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
-	if (!IS_ERR(__k)) {						   \
-		get_task_struct(__k);					   \
-		wake_up_process(__k);					   \
-	}								   \
-	__k;								   \
-})
-
 #define kthread_stop_put(k)		\
 	do {				\
 		kthread_stop(k);	\
@@ -309,6 +298,18 @@ void usbip_header_correct_endian(struct usbip_header *pdu, int send);
 struct usbip_iso_packet_descriptor*
 usbip_alloc_iso_desc_pdu(struct urb *urb, ssize_t *bufflen);
 
+struct usbip_thread_info {
+	struct socket *tcp_socket;
+	struct task_struct *tcp_tx;
+	struct task_struct *tcp_rx;
+};
+
+int usbip_prepare_threads(struct usbip_thread_info *uti,
+			  struct usbip_device *ud, int sockfd,
+			  int (*tx_fn)(void *data), const char *tx_name,
+			  int (*rx_fn)(void *data), const char *rx_name);
+void usbip_unprepare_threads(struct usbip_thread_info *uti);
+
 /* some members of urb must be substituted before. */
 int usbip_recv_iso(struct usbip_device *ud, struct urb *urb);
 void usbip_pad_iso(struct usbip_device *ud, struct urb *urb);
@@ -322,6 +323,8 @@ void usbip_stop_eh(struct usbip_device *ud);
 void usbip_event_add(struct usbip_device *ud, unsigned long event);
 int usbip_event_happened(struct usbip_device *ud);
 int usbip_in_eh(struct task_struct *task);
+int usbip_event_lock_killable(void);
+void usbip_event_unlock(void);
 
 static inline int interface_to_busnum(struct usb_interface *interface)
 {
diff --git a/drivers/usb/usbip/usbip_event.c b/drivers/usb/usbip/usbip_event.c
index 5d88917c9631..e05b858f346d 100644
--- a/drivers/usb/usbip/usbip_event.c
+++ b/drivers/usb/usbip/usbip_event.c
@@ -58,6 +58,19 @@ static struct usbip_device *get_event(void)
 }
 
 static struct task_struct *worker_context;
+static DEFINE_MUTEX(usbip_event_mutex);
+
+int usbip_event_lock_killable(void)
+{
+	return mutex_lock_killable(&usbip_event_mutex);
+}
+EXPORT_SYMBOL_GPL(usbip_event_lock_killable);
+
+void usbip_event_unlock(void)
+{
+	mutex_unlock(&usbip_event_mutex);
+}
+EXPORT_SYMBOL_GPL(usbip_event_unlock);
 
 static void event_handler(struct work_struct *work)
 {
@@ -68,6 +81,7 @@ static void event_handler(struct work_struct *work)
 	}
 
 	while ((ud = get_event()) != NULL) {
+		mutex_lock(&usbip_event_mutex);
 		usbip_dbg_eh("pending event %lx\n", ud->event);
 
 		/*
@@ -91,6 +105,7 @@ static void event_handler(struct work_struct *work)
 			unset_event(ud, USBIP_EH_UNUSABLE);
 		}
 
+		mutex_unlock(&usbip_event_mutex);
 		wake_up(&ud->eh_waitq);
 	}
 }
diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 3209b5ddd30c..326182bf062d 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -1072,12 +1072,6 @@ static void vhci_device_reset(struct usbip_device *ud)
 
 	usb_put_dev(vdev->udev);
 	vdev->udev = NULL;
-
-	if (ud->tcp_socket) {
-		sockfd_put(ud->tcp_socket);
-		ud->tcp_socket = NULL;
-		ud->sockfd = -1;
-	}
 	ud->status = VDEV_ST_NULL;
 
 	spin_unlock_irqrestore(&ud->lock, flags);
diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
index be37aec250c2..4d7afd1bf890 100644
--- a/drivers/usb/usbip/vhci_sysfs.c
+++ b/drivers/usb/usbip/vhci_sysfs.c
@@ -225,8 +225,8 @@ static int valid_port(__u32 *pdev_nr, __u32 *rhport)
 	return 1;
 }
 
-static ssize_t detach_store(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
+static ssize_t __detach_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count)
 {
 	__u32 port = 0, pdev_nr = 0, rhport = 0;
 	struct usb_hcd *hcd;
@@ -263,6 +263,17 @@ static ssize_t detach_store(struct device *dev, struct device_attribute *attr,
 
 	return count;
 }
+static ssize_t detach_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
+{
+	ssize_t ret = usbip_event_lock_killable();
+
+	if (ret)
+		return ret;
+	ret = __detach_store(dev, attr, buf, count);
+	usbip_event_unlock();
+	return ret;
+}
 static DEVICE_ATTR_WO(detach);
 
 static int valid_args(__u32 *pdev_nr, __u32 *rhport,
@@ -300,10 +311,10 @@ static int valid_args(__u32 *pdev_nr, __u32 *rhport,
  *
  * write() returns 0 on success, else negative errno.
  */
-static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
+static ssize_t __attach_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count)
 {
-	struct socket *socket;
+	struct usbip_thread_info uti;
 	int sockfd = 0;
 	__u32 port = 0, pdev_nr = 0, rhport = 0, devid = 0, speed = 0;
 	struct usb_hcd *hcd;
@@ -347,10 +358,10 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
 	else
 		vdev = &vhci->vhci_hcd_hs->vdev[rhport];
 
-	/* Extract socket from fd. */
-	socket = sockfd_lookup(sockfd, &err);
-	if (!socket)
-		return -EINVAL;
+	err = usbip_prepare_threads(&uti, &vdev->ud, sockfd,
+				    vhci_tx_loop, "vhci_tx", vhci_rx_loop, "vhci_rx");
+	if (err)
+		return err;
 
 	/* now need lock until setting vdev status as used */
 
@@ -363,7 +374,7 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
 		spin_unlock(&vdev->ud.lock);
 		spin_unlock_irqrestore(&vhci->lock, flags);
 
-		sockfd_put(socket);
+		usbip_unprepare_threads(&uti);
 
 		dev_err(dev, "port %d already used\n", rhport);
 		/*
@@ -381,20 +392,33 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
 	vdev->devid         = devid;
 	vdev->speed         = speed;
 	vdev->ud.sockfd     = sockfd;
-	vdev->ud.tcp_socket = socket;
+	vdev->ud.tcp_socket = uti.tcp_socket;
+	vdev->ud.tcp_rx     = uti.tcp_rx;
+	vdev->ud.tcp_tx     = uti.tcp_tx;
 	vdev->ud.status     = VDEV_ST_NOTASSIGNED;
 
 	spin_unlock(&vdev->ud.lock);
 	spin_unlock_irqrestore(&vhci->lock, flags);
 	/* end the lock */
 
-	vdev->ud.tcp_rx = kthread_get_run(vhci_rx_loop, &vdev->ud, "vhci_rx");
-	vdev->ud.tcp_tx = kthread_get_run(vhci_tx_loop, &vdev->ud, "vhci_tx");
+	wake_up_process(vdev->ud.tcp_rx);
+	wake_up_process(vdev->ud.tcp_tx);
 
 	rh_port_connect(vdev, speed);
 
 	return count;
 }
+static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
+{
+	ssize_t ret = usbip_event_lock_killable();
+
+	if (ret)
+		return ret;
+	ret = __attach_store(dev, attr, buf, count);
+	usbip_event_unlock();
+	return ret;
+}
 static DEVICE_ATTR_WO(attach);
 
 #define MAX_STATUS_NAME 16
diff --git a/drivers/usb/usbip/vudc_sysfs.c b/drivers/usb/usbip/vudc_sysfs.c
index 100f680c572a..ff3cf225a4fa 100644
--- a/drivers/usb/usbip/vudc_sysfs.c
+++ b/drivers/usb/usbip/vudc_sysfs.c
@@ -90,14 +90,13 @@ static ssize_t dev_desc_read(struct file *file, struct kobject *kobj,
 }
 static BIN_ATTR_RO(dev_desc, sizeof(struct usb_device_descriptor));
 
-static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *attr,
-		     const char *in, size_t count)
+static ssize_t __usbip_sockfd_store(struct device *dev, struct device_attribute *attr,
+				    const char *in, size_t count)
 {
 	struct vudc *udc = (struct vudc *) dev_get_drvdata(dev);
 	int rv;
 	int sockfd = 0;
-	int err;
-	struct socket *socket;
+	struct usbip_thread_info uti = { };
 	unsigned long flags;
 	int ret;
 
@@ -109,6 +108,14 @@ static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *a
 		dev_err(dev, "no device");
 		return -ENODEV;
 	}
+
+	if (sockfd != -1) {
+		ret = usbip_prepare_threads(&uti, &udc->ud, sockfd,
+					    v_tx_loop, "vudc_tx", v_rx_loop, "vudc_rx");
+		if (ret)
+			return ret;
+	}
+
 	spin_lock_irqsave(&udc->lock, flags);
 	/* Don't export what we don't have */
 	if (!udc->driver || !udc->pullup) {
@@ -130,28 +137,17 @@ static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *a
 			ret = -EINVAL;
 			goto unlock_ud;
 		}
-
-		socket = sockfd_lookup(sockfd, &err);
-		if (!socket) {
-			dev_err(dev, "failed to lookup sock");
-			ret = -EINVAL;
-			goto unlock_ud;
-		}
-
-		udc->ud.tcp_socket = socket;
-
+		udc->ud.tcp_socket = uti.tcp_socket;
+		udc->ud.tcp_rx = uti.tcp_rx;
+		udc->ud.tcp_tx = uti.tcp_tx;
+		udc->ud.status = SDEV_ST_USED;
 		spin_unlock_irq(&udc->ud.lock);
 		spin_unlock_irqrestore(&udc->lock, flags);
 
-		udc->ud.tcp_rx = kthread_get_run(&v_rx_loop,
-						    &udc->ud, "vudc_rx");
-		udc->ud.tcp_tx = kthread_get_run(&v_tx_loop,
-						    &udc->ud, "vudc_tx");
+		wake_up_process(udc->ud.tcp_rx);
+		wake_up_process(udc->ud.tcp_tx);
 
 		spin_lock_irqsave(&udc->lock, flags);
-		spin_lock_irq(&udc->ud.lock);
-		udc->ud.status = SDEV_ST_USED;
-		spin_unlock_irq(&udc->ud.lock);
 
 		ktime_get_ts64(&udc->start_time);
 		v_start_timer(udc);
@@ -181,7 +177,19 @@ static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *a
 	spin_unlock_irq(&udc->ud.lock);
 unlock:
 	spin_unlock_irqrestore(&udc->lock, flags);
+	if (uti.tcp_socket)
+		usbip_unprepare_threads(&uti);
+	return ret;
+}
+static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *attr,
+				  const char *in, size_t count)
+{
+	ssize_t ret = usbip_event_lock_killable();
 
+	if (ret)
+		return ret;
+	ret = __usbip_sockfd_store(dev, attr, in, count);
+	usbip_event_unlock();
 	return ret;
 }
 static DEVICE_ATTR_WO(usbip_sockfd);
-- 
2.25.1

