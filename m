Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF8F338390
	for <lists+linux-usb@lfdr.de>; Fri, 12 Mar 2021 03:28:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbhCLC2N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 21:28:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231241AbhCLC1l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Mar 2021 21:27:41 -0500
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A06E8C061760
        for <linux-usb@vger.kernel.org>; Thu, 11 Mar 2021 18:27:41 -0800 (PST)
Received: by mail-il1-x132.google.com with SMTP id z9so1271628iln.1
        for <linux-usb@vger.kernel.org>; Thu, 11 Mar 2021 18:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pVKZJZEml+o0E/LOpnCX8ittkUy/sokAotEeA3aRVZo=;
        b=M+yAYkCWTQMG+o+rxLxnSCx7JEAyasyQ0tAsmZzr2U/mAo7y5MbNvKi0gx5CbcXE00
         yjJnj3mymjrkRj0ymBb6jIjCCMMPIFCySJX7sWUHpTR97EDjtlndjL2MKMoLRIcrTHfa
         5EllKmlPfR//3wfMPlXiBXI3GiyXVE9RPzKdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pVKZJZEml+o0E/LOpnCX8ittkUy/sokAotEeA3aRVZo=;
        b=ryfcbOXGdtVgr+N0jIoX4VXDwy8lxnYVdjVd+MxdBKqlfBl7hDEBbYi6qE9j+LvTri
         1No1J692htpJLZHNGV1UabZznutsZ6naXVnFi+WiWCGvRpI6D1tvRHFrBfwNC6QKCLyC
         O3/UQ30ydc37S8r0w7QVSwh1mxFI6JmqYnL4gAdDJJrgNQRcruxXfiVuVWQF7UTOfe91
         L+Js2CBbd3oMpW6GL/mCTszYYzMlKKmKztfZjmq8X8YXQzz1ZSEIe1gIrodISZy7+4Wm
         V2+yQyUaksYH4cgE4GFfgGXo9heRcz+N2T26tuaNSDoDQO+GOlch9auNmh8DT5JQvGt/
         JP4g==
X-Gm-Message-State: AOAM533qe8wnN2cH8LuLUjATeo3Y4dyzbvvGudhZYfDR6Y+7+CWpaN14
        Bvlwz/44ja2+WG8+EPdvst8+QQ==
X-Google-Smtp-Source: ABdhPJyJkOC4OCQExHmboSfs8a84+HGznLOti2Z6YqiVSYpNwmRg+ixBL/aw4LWtxvE4kPA14r2hmg==
X-Received: by 2002:a92:cda1:: with SMTP id g1mr1154050ild.267.1615516060527;
        Thu, 11 Mar 2021 18:27:40 -0800 (PST)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id c5sm416269ioi.0.2021.03.11.18.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 18:27:40 -0800 (PST)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     valentina.manea.m@gmail.com, shuah@kernel.org,
        gregkh@linuxfoundation.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot+a93fba6d384346a761e3@syzkaller.appspotmail.com
Subject: [PATCH] usbip: fix vhci races in connection tear down
Date:   Thu, 11 Mar 2021 19:27:37 -0700
Message-Id: <20210312022737.44122-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

vhci_shutdown_connection() references connection state (tcp_socket,
tcp_rx, tcp_tx, sockfd) saved in usbpip_device without holding the
lock.

Current connection tear down sequence:
Step 1: shutdown the socket
Step 2: stop rx thread and reset tcp_rx pointer
Step 3: stop tx thread and reset tcp_tx pointer
Step 4: Reset tcp_socket and sockfd

There are several race windows between these steps. In addition, device
reset routine (vhci_device_reset) resets tcp_socket and sockfd holding
the lock.

Fix these races:
- Introduce in_disconnect flag to ensure vhci_shutdown_connection() runs
  only once.
- Change attach_store() to initialize in_disconnect to false while
  initializing connection status (tcp_socket, tcp_rx, tcp_tx, sockfd)
- Change vhci_shutdown_connection() to check in_disconnect and bail
  out if disconnect is in progress.
- Change vhci_shutdown_connection() to
  -- hold lock to save connection state pointers and unlock.
  -- Shutdown the socket and stop threads.
  -- Hold lock to clear connection status and in_disconnect flag.
- Change vhci_device_reset() to reset tcp_socket and sockfd.
  if !in_disconnect

Tested syzbot and the reproducer did not trigger any issue.

Reported-and-tested-by: syzbot+a93fba6d384346a761e3@syzkaller.appspotmail.com
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/usb/usbip/usbip_common.h |  1 +
 drivers/usb/usbip/vhci_hcd.c     | 55 +++++++++++++++++++++++---------
 drivers/usb/usbip/vhci_sysfs.c   |  4 +++
 3 files changed, 45 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/usbip/usbip_common.h b/drivers/usb/usbip/usbip_common.h
index d60ce17d3dd2..f6261c5a8c91 100644
--- a/drivers/usb/usbip/usbip_common.h
+++ b/drivers/usb/usbip/usbip_common.h
@@ -268,6 +268,7 @@ struct usbip_device {
 
 	struct task_struct *tcp_rx;
 	struct task_struct *tcp_tx;
+	bool in_disconnect; /* run device disconnect just once */
 
 	unsigned long event;
 	wait_queue_head_t eh_waitq;
diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 3209b5ddd30c..c1917efe5737 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -1007,31 +1007,54 @@ static void vhci_device_unlink_cleanup(struct vhci_device *vdev)
 static void vhci_shutdown_connection(struct usbip_device *ud)
 {
 	struct vhci_device *vdev = container_of(ud, struct vhci_device, ud);
+	unsigned long flags;
+	struct socket *socket;
+	struct task_struct *tcp_rx = NULL;
+	struct task_struct *tcp_tx = NULL;
+	int sockfd = 0;
+
+	spin_lock_irqsave(&ud->lock, flags);
+	if (vdev->ud.in_disconnect) {
+		pr_info("%s: Disconnect in progress for sockfd %d\n",
+			__func__, ud->sockfd);
+		spin_unlock_irqrestore(&ud->lock, flags);
+		return;
+	}
+	vdev->ud.in_disconnect = true;
+	socket = ud->tcp_socket;
+	tcp_rx = vdev->ud.tcp_rx;
+	tcp_tx = vdev->ud.tcp_tx;
+	sockfd = ud->sockfd;
+	spin_unlock_irqrestore(&ud->lock, flags);
 
 	/* need this? see stub_dev.c */
-	if (ud->tcp_socket) {
-		pr_debug("shutdown tcp_socket %d\n", ud->sockfd);
-		kernel_sock_shutdown(ud->tcp_socket, SHUT_RDWR);
+	if (socket) {
+		pr_info("%s: shutdown tcp_socket %d\n", __func__, sockfd);
+		kernel_sock_shutdown(socket, SHUT_RDWR);
 	}
 
-	/* kill threads related to this sdev */
-	if (vdev->ud.tcp_rx) {
-		kthread_stop_put(vdev->ud.tcp_rx);
-		vdev->ud.tcp_rx = NULL;
+	/* kill threads related to this vdev */
+	if (tcp_rx) {
+		pr_info("%s: stop rx thread\n", __func__);
+		kthread_stop_put(tcp_rx);
 	}
-	if (vdev->ud.tcp_tx) {
-		kthread_stop_put(vdev->ud.tcp_tx);
-		vdev->ud.tcp_tx = NULL;
+	if (tcp_tx) {
+		pr_info("%s: stop tx thread\n", __func__);
+		kthread_stop_put(tcp_tx);
 	}
-	pr_info("stop threads\n");
 
+	spin_lock_irqsave(&ud->lock, flags);
 	/* active connection is closed */
-	if (vdev->ud.tcp_socket) {
+	if (ud->tcp_socket) {
+		vdev->ud.tcp_rx = NULL;
+		vdev->ud.tcp_tx = NULL;
 		sockfd_put(vdev->ud.tcp_socket);
 		vdev->ud.tcp_socket = NULL;
 		vdev->ud.sockfd = -1;
 	}
-	pr_info("release socket\n");
+	vdev->ud.in_disconnect = false;
+	spin_unlock_irqrestore(&ud->lock, flags);
+	pr_info("%s: release socket\n", __func__);
 
 	vhci_device_unlink_cleanup(vdev);
 
@@ -1057,7 +1080,7 @@ static void vhci_shutdown_connection(struct usbip_device *ud)
 	 */
 	rh_port_disconnect(vdev);
 
-	pr_info("disconnect device\n");
+	pr_info("%s: disconnect device\n", __func__);
 }
 
 static void vhci_device_reset(struct usbip_device *ud)
@@ -1073,7 +1096,9 @@ static void vhci_device_reset(struct usbip_device *ud)
 	usb_put_dev(vdev->udev);
 	vdev->udev = NULL;
 
-	if (ud->tcp_socket) {
+	if (!vdev->ud.in_disconnect && ud->tcp_socket) {
+		pr_info("%s: release tcp_socket %d\n",
+			__func__, ud->sockfd);
 		sockfd_put(ud->tcp_socket);
 		ud->tcp_socket = NULL;
 		ud->sockfd = -1;
diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
index c4b4256e5dad..c4457026d5ad 100644
--- a/drivers/usb/usbip/vhci_sysfs.c
+++ b/drivers/usb/usbip/vhci_sysfs.c
@@ -412,6 +412,10 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
 	vdev->ud.tcp_rx     = tcp_rx;
 	vdev->ud.tcp_tx     = tcp_tx;
 	vdev->ud.status     = VDEV_ST_NOTASSIGNED;
+
+	/* used to run socket shutdown just once */
+	vdev->ud.in_disconnect = false;
+
 	usbip_kcov_handle_init(&vdev->ud);
 
 	spin_unlock(&vdev->ud.lock);
-- 
2.27.0

