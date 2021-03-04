Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC3932D699
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 16:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234340AbhCDP0q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Mar 2021 10:26:46 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:62162 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234330AbhCDP0Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Mar 2021 10:26:24 -0500
Received: from fsav302.sakura.ne.jp (fsav302.sakura.ne.jp [153.120.85.133])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 124FP2T1030906;
        Fri, 5 Mar 2021 00:25:02 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav302.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp);
 Fri, 05 Mar 2021 00:25:02 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp)
Received: from localhost.localdomain (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 124FOtn2030882
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 5 Mar 2021 00:25:02 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH v4 02/12] usb: usbip: vhci: serialize attach_store()/detach_store() against event_handler()
Date:   Fri,  5 Mar 2021 00:24:45 +0900
Message-Id: <20210304152455.3685-3-penguin-kernel@I-love.SAKURA.ne.jp>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20210304152455.3685-1-penguin-kernel@I-love.SAKURA.ne.jp>
References: <df337d16-2a6e-f671-7134-449d7da6a9cb@linuxfoundation.org>
 <20210304152455.3685-1-penguin-kernel@I-love.SAKURA.ne.jp>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot is reporting a NULL pointer dereference at sock_sendmsg() [1], for
lack of serialization between attach_store() and event_handler() causes
vhci_shutdown_connection() to observe vdev->ud.tcp_tx == NULL while
vdev->ud.tcp_socket != NULL. Please read the reference link for details of
this race window.

Since I don't want to replace "return" with "goto" in order to call
usbip_event_unlock(), wrap whole functions in order to keep changes
minimal.

[1] https://syzkaller.appspot.com/bug?extid=95ce4b142579611ef0a9

Reported-by: syzbot <syzbot+95ce4b142579611ef0a9@syzkaller.appspotmail.com>
Tested-by: syzbot <syzbot+a93fba6d384346a761e3@syzkaller.appspotmail.com>
References: https://lkml.kernel.org/r/676d4518-0faa-9fab-15db-0db8d216d7fb@i-love.sakura.ne.jp
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/usb/usbip/vhci_sysfs.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
index 96e5371dc335..031e21aad96a 100644
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
@@ -300,8 +311,8 @@ static int valid_args(__u32 *pdev_nr, __u32 *rhport,
  *
  * write() returns 0 on success, else negative errno.
  */
-static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
+static ssize_t __attach_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count)
 {
 	struct socket *socket;
 	int sockfd = 0;
@@ -396,6 +407,17 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
 
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
-- 
2.18.4

