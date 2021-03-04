Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 206EE32D693
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 16:28:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234775AbhCDP0p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Mar 2021 10:26:45 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:61875 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234072AbhCDP0T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Mar 2021 10:26:19 -0500
Received: from fsav303.sakura.ne.jp (fsav303.sakura.ne.jp [153.120.85.134])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 124FP3mS030943;
        Fri, 5 Mar 2021 00:25:03 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav303.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav303.sakura.ne.jp);
 Fri, 05 Mar 2021 00:25:03 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav303.sakura.ne.jp)
Received: from localhost.localdomain (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 124FOtnA030882
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 5 Mar 2021 00:25:03 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH v4 10/12] usb: usbip: vudc: add automatic recovery to usbip_sockfd_store()
Date:   Fri,  5 Mar 2021 00:24:53 +0900
Message-Id: <20210304152455.3685-11-penguin-kernel@I-love.SAKURA.ne.jp>
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
 drivers/usb/usbip/vudc_sysfs.c | 37 ++++++++++++++++------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/usbip/vudc_sysfs.c b/drivers/usb/usbip/vudc_sysfs.c
index ebf6a127fcc3..ff3cf225a4fa 100644
--- a/drivers/usb/usbip/vudc_sysfs.c
+++ b/drivers/usb/usbip/vudc_sysfs.c
@@ -96,8 +96,7 @@ static ssize_t __usbip_sockfd_store(struct device *dev, struct device_attribute
 	struct vudc *udc = (struct vudc *) dev_get_drvdata(dev);
 	int rv;
 	int sockfd = 0;
-	int err;
-	struct socket *socket;
+	struct usbip_thread_info uti = { };
 	unsigned long flags;
 	int ret;
 
@@ -109,6 +108,14 @@ static ssize_t __usbip_sockfd_store(struct device *dev, struct device_attribute
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
@@ -130,28 +137,17 @@ static ssize_t __usbip_sockfd_store(struct device *dev, struct device_attribute
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
@@ -181,7 +177,8 @@ static ssize_t __usbip_sockfd_store(struct device *dev, struct device_attribute
 	spin_unlock_irq(&udc->ud.lock);
 unlock:
 	spin_unlock_irqrestore(&udc->lock, flags);
-
+	if (uti.tcp_socket)
+		usbip_unprepare_threads(&uti);
 	return ret;
 }
 static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *attr,
-- 
2.18.4

