Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C56F8D8CAF
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 11:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392034AbfJPJjk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Oct 2019 05:39:40 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:43967 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390231AbfJPJjk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Oct 2019 05:39:40 -0400
X-Originating-IP: 83.155.44.161
Received: from classic.redhat.com (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 9808820013;
        Wed, 16 Oct 2019 09:39:37 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3 3/6] USB: Implement usb_device_match_id()
Date:   Wed, 16 Oct 2019 11:39:30 +0200
Message-Id: <20191016093933.693-4-hadess@hadess.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191016093933.693-1-hadess@hadess.net>
References: <20191016093933.693-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Match a usb_device with a table of IDs.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
 drivers/usb/core/driver.c | 14 ++++++++++++++
 drivers/usb/core/usb.h    |  2 ++
 2 files changed, 16 insertions(+)

diff --git drivers/usb/core/driver.c drivers/usb/core/driver.c
index d3787d084937..697898327b44 100644
--- drivers/usb/core/driver.c
+++ drivers/usb/core/driver.c
@@ -800,6 +800,20 @@ const struct usb_device_id *usb_match_id(struct usb_interface *interface,
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
+
 static int usb_device_match(struct device *dev, struct device_driver *drv)
 {
 	/* devices and interfaces are handled separately */
diff --git drivers/usb/core/usb.h drivers/usb/core/usb.h
index bbe24817315e..f1dc63848219 100644
--- drivers/usb/core/usb.h
+++ drivers/usb/core/usb.h
@@ -69,6 +69,8 @@ extern int usb_match_one_id_intf(struct usb_device *dev,
 				 const struct usb_device_id *id);
 extern int usb_match_device(struct usb_device *dev,
 			    const struct usb_device_id *id);
+extern const struct usb_device_id *usb_device_match_id(struct usb_device *udev,
+				const struct usb_device_id *id);
 extern void usb_forced_unbind_intf(struct usb_interface *intf);
 extern void usb_unbind_and_rebind_marked_interfaces(struct usb_device *udev);
 
-- 
2.21.0

