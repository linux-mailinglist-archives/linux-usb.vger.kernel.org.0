Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0529D7892
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2019 16:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732820AbfJOObj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Oct 2019 10:31:39 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:42959 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732819AbfJOObi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Oct 2019 10:31:38 -0400
X-Originating-IP: 83.155.44.161
Received: from localhost.localdomain (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 06CA8240007;
        Tue, 15 Oct 2019 14:31:35 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bastien Nocera <hadess@hadess.net>
Subject: [PATCH v2 1/6] USB: Export generic USB device driver functions
Date:   Tue, 15 Oct 2019 16:31:27 +0200
Message-Id: <20191015143132.8099-2-hadess@hadess.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191015143132.8099-1-hadess@hadess.net>
References: <20191015143132.8099-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This will make it possible to implement device drivers which extend the
generic driver without needing to reimplement it.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/usb/core/generic.c | 16 ++++++++--------
 drivers/usb/core/usb.h     |  6 ++++++
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
index 38f8b3e31762..28ece4d77749 100644
--- a/drivers/usb/core/generic.c
+++ b/drivers/usb/core/generic.c
@@ -195,7 +195,7 @@ int usb_choose_configuration(struct usb_device *udev)
 }
 EXPORT_SYMBOL_GPL(usb_choose_configuration);
 
-static int generic_probe(struct usb_device *udev)
+int usb_generic_driver_probe(struct usb_device *udev)
 {
 	int err, c;
 
@@ -222,7 +222,7 @@ static int generic_probe(struct usb_device *udev)
 	return 0;
 }
 
-static void generic_disconnect(struct usb_device *udev)
+void usb_generic_driver_disconnect(struct usb_device *udev)
 {
 	usb_notify_remove_device(udev);
 
@@ -234,7 +234,7 @@ static void generic_disconnect(struct usb_device *udev)
 
 #ifdef	CONFIG_PM
 
-static int generic_suspend(struct usb_device *udev, pm_message_t msg)
+int usb_generic_driver_suspend(struct usb_device *udev, pm_message_t msg)
 {
 	int rc;
 
@@ -262,7 +262,7 @@ static int generic_suspend(struct usb_device *udev, pm_message_t msg)
 	return rc;
 }
 
-static int generic_resume(struct usb_device *udev, pm_message_t msg)
+int usb_generic_driver_resume(struct usb_device *udev, pm_message_t msg)
 {
 	int rc;
 
@@ -285,11 +285,11 @@ static int generic_resume(struct usb_device *udev, pm_message_t msg)
 
 struct usb_device_driver usb_generic_driver = {
 	.name =	"usb",
-	.probe = generic_probe,
-	.disconnect = generic_disconnect,
+	.probe = usb_generic_driver_probe,
+	.disconnect = usb_generic_driver_disconnect,
 #ifdef	CONFIG_PM
-	.suspend = generic_suspend,
-	.resume = generic_resume,
+	.suspend = usb_generic_driver_suspend,
+	.resume = usb_generic_driver_resume,
 #endif
 	.supports_autosuspend = 1,
 };
diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
index cf4783cf661a..bbe24817315e 100644
--- a/drivers/usb/core/usb.h
+++ b/drivers/usb/core/usb.h
@@ -47,6 +47,12 @@ extern void usb_release_bos_descriptor(struct usb_device *dev);
 extern char *usb_cache_string(struct usb_device *udev, int index);
 extern int usb_set_configuration(struct usb_device *dev, int configuration);
 extern int usb_choose_configuration(struct usb_device *udev);
+extern int usb_generic_driver_probe(struct usb_device *udev);
+extern void usb_generic_driver_disconnect(struct usb_device *udev);
+extern int usb_generic_driver_suspend(struct usb_device *udev,
+		pm_message_t msg);
+extern int usb_generic_driver_resume(struct usb_device *udev,
+		pm_message_t msg);
 
 static inline unsigned usb_get_max_power(struct usb_device *udev,
 		struct usb_host_config *c)
-- 
2.21.0

