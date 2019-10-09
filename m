Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD167D1076
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 15:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731316AbfJINns (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 09:43:48 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:47059 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731037AbfJINns (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Oct 2019 09:43:48 -0400
X-Originating-IP: 83.155.44.161
Received: from localhost.localdomain (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id EC0B51BF204;
        Wed,  9 Oct 2019 13:43:45 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 3/5] USB: Implement usb_device_match_id()
Date:   Wed,  9 Oct 2019 15:43:40 +0200
Message-Id: <20191009134342.6476-4-hadess@hadess.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191009134342.6476-1-hadess@hadess.net>
References: <20191009134342.6476-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Match a usb_device with a table of IDs.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/usb/core/driver.c | 15 +++++++++++++++
 include/linux/usb.h       |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 863e380a272b..50f92da8afcf 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -800,6 +800,21 @@ const struct usb_device_id *usb_match_id(struct usb_interface *interface,
 }
 EXPORT_SYMBOL_GPL(usb_match_id);
 
+const struct usb_device_id *usb_device_match_id(struct usb_device *udev,
+				const struct usb_device_id *id)
+{
+	if (!id)
+		return NULL;
+
+	for (; id->idVendor || id->idProduct ; id++) {
+		if (usb_match_device(udev, id))
+			return id;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(usb_device_match_id);
+
 static int usb_device_match(struct device *dev, struct device_driver *drv)
 {
 	/* devices and interfaces are handled separately */
diff --git a/include/linux/usb.h b/include/linux/usb.h
index fb9ad3511e55..66bd4344e298 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -864,6 +864,8 @@ const struct usb_device_id *usb_match_id(struct usb_interface *interface,
 					 const struct usb_device_id *id);
 extern int usb_match_one_id(struct usb_interface *interface,
 			    const struct usb_device_id *id);
+const struct usb_device_id *usb_device_match_id(struct usb_device *udev,
+				const struct usb_device_id *id);
 
 extern int usb_for_each_dev(void *data, int (*fn)(struct usb_device *, void *));
 extern struct usb_interface *usb_find_interface(struct usb_driver *drv,
-- 
2.21.0

