Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC87A3183CE
	for <lists+linux-usb@lfdr.de>; Thu, 11 Feb 2021 04:03:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbhBKDDO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Feb 2021 22:03:14 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:54459 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbhBKDDA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Feb 2021 22:03:00 -0500
Received: from fsav105.sakura.ne.jp (fsav105.sakura.ne.jp [27.133.134.232])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 11B3222H034342;
        Thu, 11 Feb 2021 12:02:02 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav105.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav105.sakura.ne.jp);
 Thu, 11 Feb 2021 12:02:02 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav105.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 11B322Q9034339
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 11 Feb 2021 12:02:02 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] usb: usbip: fix error handling of kthread_get_run()
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     Hillf Danton <hdanton@sina.com>, linux-usb@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
References: <000000000000414db905b6e9bae8@google.com>
 <20210205135707.4574-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <6b2b9f7c-a412-0f52-3373-bc58d1e95ad9@linuxfoundation.org>
 <ee936421-66ea-c6a7-fa1e-d4077ab28ed0@i-love.sakura.ne.jp>
 <1f4b36a1-460e-1154-b46c-32ba72b88205@linuxfoundation.org>
 <dffdefc9-9499-2cd0-fce9-b084df1511af@i-love.sakura.ne.jp>
 <2f922e76-623e-1d87-17a5-c4a87dc8f2fc@linuxfoundation.org>
 <bb8f438f-8a77-2aac-cb2b-b2551f6a64b0@i-love.sakura.ne.jp>
 <f97b85c7-d319-0897-e0f1-29c4154ca060@linuxfoundation.org>
 <f8cae6b1-8f84-0e6a-7d9c-fc4aec68f07b@i-love.sakura.ne.jp>
Message-ID: <16608833-02b7-7ba8-e9fc-7e45c87fc7f1@i-love.sakura.ne.jp>
Date:   Thu, 11 Feb 2021 12:01:57 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <f8cae6b1-8f84-0e6a-7d9c-fc4aec68f07b@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021/02/11 10:04, Tetsuo Handa wrote:
> On 2021/02/11 5:15, Shuah Khan wrote:
>> I you would like to fix this, please send me a complete fix.
> 
> If you want to handle the unlikely "__kthread_create_on_node() fails without
> being killed" case, such change ( the drivers/usb/usbip/vhci_sysfs.c portion in
> https://syzkaller.appspot.com/x/patch.diff?x=16c3c090d00000 ) should be a separate
> patch. Since this patch declares "Fixes: 9720b4bc76a83807 ("staging/usbip: convert to kthread")",
> this patch intends for the minimal change and does not want to do extra things.
> 

If you want a complete fix, the (untested) diff will become large.

 drivers/usb/usbip/stub_dev.c   | 61 ++++++++++++++++++++++------------
 drivers/usb/usbip/vhci_sysfs.c | 33 +++++++++++++++---
 drivers/usb/usbip/vudc_sysfs.c | 35 +++++++++++++++----
 3 files changed, 95 insertions(+), 34 deletions(-)

diff --git a/drivers/usb/usbip/stub_dev.c b/drivers/usb/usbip/stub_dev.c
index 2305d425e6c9..72c561878df7 100644
--- a/drivers/usb/usbip/stub_dev.c
+++ b/drivers/usb/usbip/stub_dev.c
@@ -39,77 +39,94 @@ static DEVICE_ATTR_RO(usbip_status);
  * is used to transfer usbip requests by kernel threads. -1 is a magic number
  * by which usbip connection is finished.
  */
 static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *attr,
 			    const char *buf, size_t count)
 {
 	struct stub_device *sdev = dev_get_drvdata(dev);
 	int sockfd = 0;
 	struct socket *socket;
 	int rv;
+	int err;
+	struct task_struct *tx = NULL;
+	struct task_struct *rx = NULL;
 
 	if (!sdev) {
 		dev_err(dev, "sdev is null\n");
 		return -ENODEV;
 	}
 
 	rv = sscanf(buf, "%d", &sockfd);
 	if (rv != 1)
 		return -EINVAL;
 
 	if (sockfd != -1) {
-		int err;
+		socket = sockfd_lookup(sockfd, &err);
+		if (!socket)
+			return -EINVAL;
+
+		/* Create threads now. */
+		rx = kthread_create(stub_rx_loop, &sdev->ud, "stub_rx");
+		tx = kthread_create(stub_tx_loop, &sdev->ud, "stub_tx");
+		if (IS_ERR(rx) || IS_ERR(tx))
+			goto thread_error;
 
 		dev_info(dev, "stub up\n");
 
 		spin_lock_irq(&sdev->ud.lock);
 
 		if (sdev->ud.status != SDEV_ST_AVAILABLE) {
+			spin_unlock_irq(&sdev->ud.lock);
 			dev_err(dev, "not ready\n");
-			goto err;
+			err = -EINVAL;
+			goto thread_error;
 		}
 
-		socket = sockfd_lookup(sockfd, &err);
-		if (!socket)
-			goto err;
-
 		sdev->ud.tcp_socket = socket;
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
 		sdev->ud.status = SDEV_ST_USED;
 		spin_unlock_irq(&sdev->ud.lock);
 
+		/* Start the threads. */
+		get_task_struct(rx);
+		sdev->ud.tcp_rx = rx;
+		wake_up_process(rx);
+		get_task_struct(tx);
+		sdev->ud.tcp_tx = tx;
+		wake_up_process(tx);
+
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
 
+		/* Race warning: sdev->ud.status == SDEV_ST_USED may be no longer true. */
 		usbip_event_add(&sdev->ud, SDEV_EVENT_DOWN);
 	}
 
 	return count;
-
-err:
-	spin_unlock_irq(&sdev->ud.lock);
-	return -EINVAL;
+thread_error:
+	sockfd_put(socket);
+	if (IS_ERR(rx))
+		err = PTR_ERR(rx);
+	else if (rx)
+		kthread_stop(rx);
+	if (IS_ERR(tx))
+		err = PTR_ERR(tx);
+	else if (tx)
+		kthread_stop(tx);
+	return err;
 }
 static DEVICE_ATTR_WO(usbip_sockfd);
 
 static struct attribute *usbip_attrs[] = {
 	&dev_attr_usbip_status.attr,
 	&dev_attr_usbip_sockfd.attr,
 	&dev_attr_usbip_debug.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(usbip);
diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
index be37aec250c2..0d10021c4186 100644
--- a/drivers/usb/usbip/vhci_sysfs.c
+++ b/drivers/usb/usbip/vhci_sysfs.c
@@ -305,20 +305,22 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
 {
 	struct socket *socket;
 	int sockfd = 0;
 	__u32 port = 0, pdev_nr = 0, rhport = 0, devid = 0, speed = 0;
 	struct usb_hcd *hcd;
 	struct vhci_hcd *vhci_hcd;
 	struct vhci_device *vdev;
 	struct vhci *vhci;
 	int err;
 	unsigned long flags;
+	struct task_struct *tx;
+	struct task_struct *rx;
 
 	/*
 	 * @rhport: port number of vhci_hcd
 	 * @sockfd: socket descriptor of an established TCP connection
 	 * @devid: unique device identifier in a remote host
 	 * @speed: usb device speed in a remote host
 	 */
 	if (sscanf(buf, "%u %u %u %u", &port, &sockfd, &devid, &speed) != 4)
 		return -EINVAL;
 	pdev_nr = port_to_pdev_nr(port);
@@ -345,62 +347,83 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
 	if (speed == USB_SPEED_SUPER)
 		vdev = &vhci->vhci_hcd_ss->vdev[rhport];
 	else
 		vdev = &vhci->vhci_hcd_hs->vdev[rhport];
 
 	/* Extract socket from fd. */
 	socket = sockfd_lookup(sockfd, &err);
 	if (!socket)
 		return -EINVAL;
 
+	/* Create threads now. */
+	rx = kthread_create(vhci_rx_loop, &vdev->ud, "vhci_rx");
+	tx = kthread_create(vhci_tx_loop, &vdev->ud, "vhci_tx");
+	if (IS_ERR(rx) || IS_ERR(tx))
+		goto thread_error;
+
 	/* now need lock until setting vdev status as used */
 
 	/* begin a lock */
 	spin_lock_irqsave(&vhci->lock, flags);
 	spin_lock(&vdev->ud.lock);
 
 	if (vdev->ud.status != VDEV_ST_NULL) {
 		/* end of the lock */
 		spin_unlock(&vdev->ud.lock);
 		spin_unlock_irqrestore(&vhci->lock, flags);
 
-		sockfd_put(socket);
-
 		dev_err(dev, "port %d already used\n", rhport);
 		/*
 		 * Will be retried from userspace
 		 * if there's another free port.
 		 */
-		return -EBUSY;
+		err = -EBUSY;
+		goto thread_error;
 	}
 
 	dev_info(dev, "pdev(%u) rhport(%u) sockfd(%d)\n",
 		 pdev_nr, rhport, sockfd);
 	dev_info(dev, "devid(%u) speed(%u) speed_str(%s)\n",
 		 devid, speed, usb_speed_string(speed));
 
 	vdev->devid         = devid;
 	vdev->speed         = speed;
 	vdev->ud.sockfd     = sockfd;
 	vdev->ud.tcp_socket = socket;
 	vdev->ud.status     = VDEV_ST_NOTASSIGNED;
 
 	spin_unlock(&vdev->ud.lock);
 	spin_unlock_irqrestore(&vhci->lock, flags);
 	/* end the lock */
 
-	vdev->ud.tcp_rx = kthread_get_run(vhci_rx_loop, &vdev->ud, "vhci_rx");
-	vdev->ud.tcp_tx = kthread_get_run(vhci_tx_loop, &vdev->ud, "vhci_tx");
+	/* Start the threads. */
+	get_task_struct(rx);
+	vdev->ud.tcp_rx = rx;
+	wake_up_process(rx);
+	get_task_struct(tx);
+	vdev->ud.tcp_tx = tx;
+	wake_up_process(tx);
 
 	rh_port_connect(vdev, speed);
 
 	return count;
+thread_error:
+	sockfd_put(socket);
+	if (IS_ERR(rx))
+		err = PTR_ERR(rx);
+	else
+		kthread_stop(rx);
+	if (IS_ERR(tx))
+		err = PTR_ERR(tx);
+	else
+		kthread_stop(tx);
+	return err;
 }
 static DEVICE_ATTR_WO(attach);
 
 #define MAX_STATUS_NAME 16
 
 struct status_attr {
 	struct device_attribute attr;
 	char name[MAX_STATUS_NAME+1];
 };
 
diff --git a/drivers/usb/usbip/vudc_sysfs.c b/drivers/usb/usbip/vudc_sysfs.c
index 100f680c572a..d01acb6d6b1c 100644
--- a/drivers/usb/usbip/vudc_sysfs.c
+++ b/drivers/usb/usbip/vudc_sysfs.c
@@ -93,29 +93,40 @@ static BIN_ATTR_RO(dev_desc, sizeof(struct usb_device_descriptor));
 static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *attr,
 		     const char *in, size_t count)
 {
 	struct vudc *udc = (struct vudc *) dev_get_drvdata(dev);
 	int rv;
 	int sockfd = 0;
 	int err;
 	struct socket *socket;
 	unsigned long flags;
 	int ret;
+	struct task_struct *tx = NULL;
+	struct task_struct *rx = NULL;
 
 	rv = kstrtoint(in, 0, &sockfd);
 	if (rv != 0)
 		return -EINVAL;
 
 	if (!udc) {
 		dev_err(dev, "no device");
 		return -ENODEV;
 	}
+
+	/* Create threads now. */
+	if (sockfd != -1) {
+		rx = kthread_create(&v_rx_loop, &udc->ud, "vudc_rx");
+		tx = kthread_create(&v_tx_loop, &udc->ud, "vudc_tx");
+		if (IS_ERR(rx) || IS_ERR(tx))
+			goto thread_error;
+	}
+
 	spin_lock_irqsave(&udc->lock, flags);
 	/* Don't export what we don't have */
 	if (!udc->driver || !udc->pullup) {
 		dev_err(dev, "gadget not bound");
 		ret = -ENODEV;
 		goto unlock;
 	}
 
 	if (sockfd != -1) {
 		if (udc->connected) {
@@ -132,33 +143,34 @@ static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *a
 		}
 
 		socket = sockfd_lookup(sockfd, &err);
 		if (!socket) {
 			dev_err(dev, "failed to lookup sock");
 			ret = -EINVAL;
 			goto unlock_ud;
 		}
 
 		udc->ud.tcp_socket = socket;
+		udc->ud.status = SDEV_ST_USED;
 
 		spin_unlock_irq(&udc->ud.lock);
 		spin_unlock_irqrestore(&udc->lock, flags);
 
-		udc->ud.tcp_rx = kthread_get_run(&v_rx_loop,
-						    &udc->ud, "vudc_rx");
-		udc->ud.tcp_tx = kthread_get_run(&v_tx_loop,
-						    &udc->ud, "vudc_tx");
+		/* Start the threads. */
+		get_task_struct(rx);
+		udc->ud.tcp_rx = rx;
+		wake_up_process(rx);
+		get_task_struct(tx);
+		udc->ud.tcp_tx = tx;
+		wake_up_process(tx);
 
 		spin_lock_irqsave(&udc->lock, flags);
-		spin_lock_irq(&udc->ud.lock);
-		udc->ud.status = SDEV_ST_USED;
-		spin_unlock_irq(&udc->ud.lock);
 
 		ktime_get_ts64(&udc->start_time);
 		v_start_timer(udc);
 		udc->connected = 1;
 	} else {
 		if (!udc->connected) {
 			dev_err(dev, "Device not connected");
 			ret = -EINVAL;
 			goto unlock;
 		}
@@ -174,20 +186,29 @@ static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *a
 	}
 
 	spin_unlock_irqrestore(&udc->lock, flags);
 
 	return count;
 
 unlock_ud:
 	spin_unlock_irq(&udc->ud.lock);
 unlock:
 	spin_unlock_irqrestore(&udc->lock, flags);
+thread_error:
+	if (IS_ERR(rx))
+		ret = PTR_ERR(rx);
+	else if (rx)
+		kthread_stop(rx);
+	if (IS_ERR(tx))
+		ret = PTR_ERR(tx);
+	else if (tx)
+		kthread_stop(tx);
 
 	return ret;
 }
 static DEVICE_ATTR_WO(usbip_sockfd);
 
 static ssize_t usbip_status_show(struct device *dev,
 			       struct device_attribute *attr, char *out)
 {
 	struct vudc *udc = (struct vudc *) dev_get_drvdata(dev);
 	int status;
