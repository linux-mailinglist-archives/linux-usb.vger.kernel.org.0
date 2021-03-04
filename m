Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B36E32D689
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 16:26:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234305AbhCDP0O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Mar 2021 10:26:14 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:61806 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233643AbhCDP0J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Mar 2021 10:26:09 -0500
Received: from fsav302.sakura.ne.jp (fsav302.sakura.ne.jp [153.120.85.133])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 124FP2Ts030909;
        Fri, 5 Mar 2021 00:25:02 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav302.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp);
 Fri, 05 Mar 2021 00:25:02 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp)
Received: from localhost.localdomain (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 124FOtn3030882
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 5 Mar 2021 00:25:02 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH v4 03/12] usb: usbip: vudc: serialize usbip_sockfd_store() against event_handler()
Date:   Fri,  5 Mar 2021 00:24:46 +0900
Message-Id: <20210304152455.3685-4-penguin-kernel@I-love.SAKURA.ne.jp>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20210304152455.3685-1-penguin-kernel@I-love.SAKURA.ne.jp>
References: <df337d16-2a6e-f671-7134-449d7da6a9cb@linuxfoundation.org>
 <20210304152455.3685-1-penguin-kernel@I-love.SAKURA.ne.jp>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usbip_sockfd_store() must perform

      if (udc->ud.status != SDEV_ST_AVAILABLE) {
        /* misc assignments for attach operation */
        udc->ud.status = SDEV_ST_USED;
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
 drivers/usb/usbip/vudc_sysfs.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/usbip/vudc_sysfs.c b/drivers/usb/usbip/vudc_sysfs.c
index 100f680c572a..ebf6a127fcc3 100644
--- a/drivers/usb/usbip/vudc_sysfs.c
+++ b/drivers/usb/usbip/vudc_sysfs.c
@@ -90,8 +90,8 @@ static ssize_t dev_desc_read(struct file *file, struct kobject *kobj,
 }
 static BIN_ATTR_RO(dev_desc, sizeof(struct usb_device_descriptor));
 
-static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *attr,
-		     const char *in, size_t count)
+static ssize_t __usbip_sockfd_store(struct device *dev, struct device_attribute *attr,
+				    const char *in, size_t count)
 {
 	struct vudc *udc = (struct vudc *) dev_get_drvdata(dev);
 	int rv;
@@ -184,6 +184,17 @@ static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *a
 
 	return ret;
 }
+static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *attr,
+				  const char *in, size_t count)
+{
+	ssize_t ret = usbip_event_lock_killable();
+
+	if (ret)
+		return ret;
+	ret = __usbip_sockfd_store(dev, attr, in, count);
+	usbip_event_unlock();
+	return ret;
+}
 static DEVICE_ATTR_WO(usbip_sockfd);
 
 static ssize_t usbip_status_show(struct device *dev,
-- 
2.18.4

