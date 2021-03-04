Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E06AE32D69E
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 16:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234804AbhCDP0s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Mar 2021 10:26:48 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:62431 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234737AbhCDP0j (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Mar 2021 10:26:39 -0500
Received: from fsav302.sakura.ne.jp (fsav302.sakura.ne.jp [153.120.85.133])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 124FP2Er030912;
        Fri, 5 Mar 2021 00:25:02 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav302.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp);
 Fri, 05 Mar 2021 00:25:02 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp)
Received: from localhost.localdomain (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 124FOtn4030882
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 5 Mar 2021 00:25:02 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH v4 04/12] usb: usbip: stub: serialize usbip_sockfd_store() against event_handler()
Date:   Fri,  5 Mar 2021 00:24:47 +0900
Message-Id: <20210304152455.3685-5-penguin-kernel@I-love.SAKURA.ne.jp>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20210304152455.3685-1-penguin-kernel@I-love.SAKURA.ne.jp>
References: <df337d16-2a6e-f671-7134-449d7da6a9cb@linuxfoundation.org>
 <20210304152455.3685-1-penguin-kernel@I-love.SAKURA.ne.jp>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usbip_sockfd_store() must perform

      if (sdev->ud.status != SDEV_ST_AVAILABLE) {
        /* misc assignments for attach operation */
        sdev->ud.status = SDEV_ST_USED;
      }

under a lock, or multiple ud->tcp_{tx,rx} are created (which will later
cause a crash like [1]) and refcount on ud->tcp_socket is leaked when
usbip_sockfd_store() is concurrently called.

Since I don't want to replace "return" with "goto" in order to call
usbip_event_unlock(), wrap whole function in order to keep changes
minimal.

[1] https://syzkaller.appspot.com/bug?extid=95ce4b142579611ef0a9

Reported-by: syzbot <syzbot+95ce4b142579611ef0a9@syzkaller.appspotmail.com>
Tested-by: syzbot <syzbot+a93fba6d384346a761e3@syzkaller.appspotmail.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/usb/usbip/stub_dev.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/usbip/stub_dev.c b/drivers/usb/usbip/stub_dev.c
index 2305d425e6c9..cea5663d1994 100644
--- a/drivers/usb/usbip/stub_dev.c
+++ b/drivers/usb/usbip/stub_dev.c
@@ -39,8 +39,8 @@ static DEVICE_ATTR_RO(usbip_status);
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
@@ -104,6 +104,17 @@ static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *a
 	spin_unlock_irq(&sdev->ud.lock);
 	return -EINVAL;
 }
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
+}
 static DEVICE_ATTR_WO(usbip_sockfd);
 
 static struct attribute *usbip_attrs[] = {
-- 
2.18.4

