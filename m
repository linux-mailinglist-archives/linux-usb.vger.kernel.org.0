Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98FA6D7894
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2019 16:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732836AbfJOObk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Oct 2019 10:31:40 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:42547 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732087AbfJOObk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Oct 2019 10:31:40 -0400
X-Originating-IP: 83.155.44.161
Received: from localhost.localdomain (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id ECBE524001B;
        Tue, 15 Oct 2019 14:31:37 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bastien Nocera <hadess@hadess.net>
Subject: [PATCH v2 3/6] USB: Implement usb_device_match_id()
Date:   Tue, 15 Oct 2019 16:31:29 +0200
Message-Id: <20191015143132.8099-4-hadess@hadess.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191015143132.8099-1-hadess@hadess.net>
References: <20191015143132.8099-1-hadess@hadess.net>
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
index d3787d084937..cc3ca62111b4 100644
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
index 94bd3b48a485..7bf9b9b9e81b 100644
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

