Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 658F632D697
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 16:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234781AbhCDP0q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Mar 2021 10:26:46 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:61975 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234315AbhCDP0W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Mar 2021 10:26:22 -0500
Received: from fsav303.sakura.ne.jp (fsav303.sakura.ne.jp [153.120.85.134])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 124FP3oh030936;
        Fri, 5 Mar 2021 00:25:03 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav303.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav303.sakura.ne.jp);
 Fri, 05 Mar 2021 00:25:03 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav303.sakura.ne.jp)
Received: from localhost.localdomain (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 124FOtn9030882
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 5 Mar 2021 00:25:02 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH v4 09/12] usb: usbip: vhci: add automatic recovery to attach_store()
Date:   Fri,  5 Mar 2021 00:24:52 +0900
Message-Id: <20210304152455.3685-10-penguin-kernel@I-love.SAKURA.ne.jp>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20210304152455.3685-1-penguin-kernel@I-love.SAKURA.ne.jp>
References: <df337d16-2a6e-f671-7134-449d7da6a9cb@linuxfoundation.org>
 <20210304152455.3685-1-penguin-kernel@I-love.SAKURA.ne.jp>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Handle kthread_create() failure by replacing kthread_get_run() with
usbip_prepare_threads()/usbip_unprepare_threads().

Tested-by: syzbot <syzbot+a93fba6d384346a761e3@syzkaller.appspotmail.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/usb/usbip/vhci_sysfs.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
index 031e21aad96a..234a133f7333 100644
--- a/drivers/usb/usbip/vhci_sysfs.c
+++ b/drivers/usb/usbip/vhci_sysfs.c
@@ -314,7 +314,7 @@ static int valid_args(__u32 *pdev_nr, __u32 *rhport,
 static ssize_t __attach_store(struct device *dev, struct device_attribute *attr,
 			      const char *buf, size_t count)
 {
-	struct socket *socket;
+	struct usbip_thread_info uti;
 	int sockfd = 0;
 	__u32 port = 0, pdev_nr = 0, rhport = 0, devid = 0, speed = 0;
 	struct usb_hcd *hcd;
@@ -358,10 +358,10 @@ static ssize_t __attach_store(struct device *dev, struct device_attribute *attr,
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
 
@@ -374,7 +374,7 @@ static ssize_t __attach_store(struct device *dev, struct device_attribute *attr,
 		spin_unlock(&vdev->ud.lock);
 		spin_unlock_irqrestore(&vhci->lock, flags);
 
-		sockfd_put(socket);
+		usbip_unprepare_threads(&uti);
 
 		dev_err(dev, "port %d already used\n", rhport);
 		/*
@@ -392,7 +392,9 @@ static ssize_t __attach_store(struct device *dev, struct device_attribute *attr,
 	vdev->devid         = devid;
 	vdev->speed         = speed;
 	vdev->ud.sockfd     = sockfd;
-	vdev->ud.tcp_socket = socket;
+	vdev->ud.tcp_socket = uti.tcp_socket;
+	vdev->ud.tcp_rx     = uti.tcp_rx;
+	vdev->ud.tcp_tx     = uti.tcp_tx;
 	vdev->ud.status     = VDEV_ST_NOTASSIGNED;
 	usbip_kcov_handle_init(&vdev->ud);
 
@@ -400,8 +402,8 @@ static ssize_t __attach_store(struct device *dev, struct device_attribute *attr,
 	spin_unlock_irqrestore(&vhci->lock, flags);
 	/* end the lock */
 
-	vdev->ud.tcp_rx = kthread_get_run(vhci_rx_loop, &vdev->ud, "vhci_rx");
-	vdev->ud.tcp_tx = kthread_get_run(vhci_tx_loop, &vdev->ud, "vhci_tx");
+	wake_up_process(vdev->ud.tcp_rx);
+	wake_up_process(vdev->ud.tcp_tx);
 
 	rh_port_connect(vdev, speed);
 
-- 
2.18.4

