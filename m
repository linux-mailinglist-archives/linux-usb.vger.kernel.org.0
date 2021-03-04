Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3CF832D688
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 16:26:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234214AbhCDP0N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Mar 2021 10:26:13 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:61804 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234048AbhCDP0J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Mar 2021 10:26:09 -0500
Received: from fsav303.sakura.ne.jp (fsav303.sakura.ne.jp [153.120.85.134])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 124FP3M3030950;
        Fri, 5 Mar 2021 00:25:03 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav303.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav303.sakura.ne.jp);
 Fri, 05 Mar 2021 00:25:03 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav303.sakura.ne.jp)
Received: from localhost.localdomain (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 124FOtnB030882
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 5 Mar 2021 00:25:03 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH v4 11/12] usb: usbip: stub: add automatic recovery to usbip_sockfd_store()
Date:   Fri,  5 Mar 2021 00:24:54 +0900
Message-Id: <20210304152455.3685-12-penguin-kernel@I-love.SAKURA.ne.jp>
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
 drivers/usb/usbip/stub_dev.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/usbip/stub_dev.c b/drivers/usb/usbip/stub_dev.c
index cea5663d1994..ff7d0cd5a557 100644
--- a/drivers/usb/usbip/stub_dev.c
+++ b/drivers/usb/usbip/stub_dev.c
@@ -44,7 +44,7 @@ static ssize_t __usbip_sockfd_store(struct device *dev, struct device_attribute
 {
 	struct stub_device *sdev = dev_get_drvdata(dev);
 	int sockfd = 0;
-	struct socket *socket;
+	struct usbip_thread_info uti = { };
 	int rv;
 
 	if (!sdev) {
@@ -57,7 +57,11 @@ static ssize_t __usbip_sockfd_store(struct device *dev, struct device_attribute
 		return -EINVAL;
 
 	if (sockfd != -1) {
-		int err;
+		int err = usbip_prepare_threads(&uti, &sdev->ud, sockfd,
+						stub_tx_loop, "stub_tx", stub_rx_loop, "stub_rx");
+
+		if (err)
+			return err;
 
 		dev_info(dev, "stub up\n");
 
@@ -68,24 +72,15 @@ static ssize_t __usbip_sockfd_store(struct device *dev, struct device_attribute
 			goto err;
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
 
@@ -102,6 +97,8 @@ static ssize_t __usbip_sockfd_store(struct device *dev, struct device_attribute
 
 err:
 	spin_unlock_irq(&sdev->ud.lock);
+	if (uti.tcp_socket)
+		usbip_unprepare_threads(&uti);
 	return -EINVAL;
 }
 static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *attr,
-- 
2.18.4

