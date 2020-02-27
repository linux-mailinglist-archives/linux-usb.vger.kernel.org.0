Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11834171AC3
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 14:56:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731985AbgB0N4p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 08:56:45 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56011 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732191AbgB0N4p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Feb 2020 08:56:45 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7JeX-0001bH-7W; Thu, 27 Feb 2020 14:56:37 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7JeT-0004VH-8w; Thu, 27 Feb 2020 14:56:33 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        Thinh.Nguyen@synopsys.com, harry.pan@intel.com,
        nobuta.keiya@fujitsu.com, malat@debian.org,
        kai.heng.feng@canonical.com, chiasheng.lee@intel.com,
        andreyknvl@google.com, heinzelmann.david@gmail.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, kbuild test robot <lkp@intel.com>
Subject: [RFC PATCH v2] USB: hub: fix port suspend/resume
Date:   Thu, 27 Feb 2020 14:56:31 +0100
Message-Id: <20200227135631.13983-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

At the momemnt the usb-port driver has only runime_pm hooks.
Suspending the port and turn off the VBUS supply should be triggered by
the hub device suspend callback usb_port_suspend() which calls the
pm_runtime_put_sync() if all pre-conditions are meet. This mechanism
don't work correctly due to the global PM behaviour, for more information
see [1]. According [1] I added the suspend/resume callbacks for the port
device to fix this.

[1] https://www.spinics.net/lists/linux-usb/msg190537.html

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Hi,

this v2 contains the fixes

Reported-by: kbuild test robot <lkp@intel.com>

Regards,
  Marco

Changes:
- init retval to zero
- keep CONFIG_PM due to do_remote_wakeup availability
- adapt commit message

 drivers/usb/core/hub.c  | 13 -------------
 drivers/usb/core/port.c | 35 ++++++++++++++++++++++++++++++-----
 2 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 3405b146edc9..c294484e478d 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3323,10 +3323,6 @@ int usb_port_suspend(struct usb_device *udev, pm_message_t msg)
 		usb_set_device_state(udev, USB_STATE_SUSPENDED);
 	}
 
-	if (status == 0 && !udev->do_remote_wakeup && udev->persist_enabled
-			&& test_and_clear_bit(port1, hub->child_usage_bits))
-		pm_runtime_put_sync(&port_dev->dev);
-
 	usb_mark_last_busy(hub->hdev);
 
 	usb_unlock_port(port_dev);
@@ -3514,15 +3510,6 @@ int usb_port_resume(struct usb_device *udev, pm_message_t msg)
 	int		status;
 	u16		portchange, portstatus;
 
-	if (!test_and_set_bit(port1, hub->child_usage_bits)) {
-		status = pm_runtime_get_sync(&port_dev->dev);
-		if (status < 0) {
-			dev_dbg(&udev->dev, "can't resume usb port, status %d\n",
-					status);
-			return status;
-		}
-	}
-
 	usb_lock_port(port_dev);
 
 	/* Skip the initial Clear-Suspend step for a remote wakeup */
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index bbbb35fa639f..13f130b67efe 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -283,7 +283,34 @@ static int usb_port_runtime_suspend(struct device *dev)
 
 	return retval;
 }
-#endif
+
+static int __maybe_unused _usb_port_suspend(struct device *dev)
+{
+	struct usb_port *port_dev = to_usb_port(dev);
+	struct usb_device *udev = port_dev->child;
+	int retval = 0;
+
+	if (!udev->do_remote_wakeup && udev->persist_enabled)
+		retval = usb_port_runtime_suspend(dev);
+
+	/* Do not force the user to enable the power-off feature */
+	if (retval && retval != -EAGAIN)
+		return retval;
+
+	return 0;
+}
+
+static int __maybe_unused _usb_port_resume(struct device *dev)
+{
+	struct usb_port *port_dev = to_usb_port(dev);
+	struct usb_device *udev = port_dev->child;
+
+	if (!udev->do_remote_wakeup && udev->persist_enabled)
+		return usb_port_runtime_resume(dev);
+
+	return 0;
+}
+#endif /* CONFIG_PM */
 
 static void usb_port_shutdown(struct device *dev)
 {
@@ -294,10 +321,8 @@ static void usb_port_shutdown(struct device *dev)
 }
 
 static const struct dev_pm_ops usb_port_pm_ops = {
-#ifdef CONFIG_PM
-	.runtime_suspend =	usb_port_runtime_suspend,
-	.runtime_resume =	usb_port_runtime_resume,
-#endif
+	SET_SYSTEM_SLEEP_PM_OPS(_usb_port_suspend, _usb_port_resume)
+	SET_RUNTIME_PM_OPS(usb_port_runtime_suspend, usb_port_runtime_resume, NULL)
 };
 
 struct device_type usb_port_device_type = {
-- 
2.20.1

