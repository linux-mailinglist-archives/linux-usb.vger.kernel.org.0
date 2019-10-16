Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 939B8D8CB0
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 11:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390244AbfJPJjm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Oct 2019 05:39:42 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:43967 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390231AbfJPJjl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Oct 2019 05:39:41 -0400
X-Originating-IP: 83.155.44.161
Received: from classic.redhat.com (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id D4A462000C;
        Wed, 16 Oct 2019 09:39:39 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3 5/6] USB: Fallback to generic driver when specific driver fails
Date:   Wed, 16 Oct 2019 11:39:32 +0200
Message-Id: <20191016093933.693-6-hadess@hadess.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191016093933.693-1-hadess@hadess.net>
References: <20191016093933.693-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If ->probe fails for a device specific driver, ask the driver core to
reprobe us, after having flagged the device for the generic driver to be
forced.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
 drivers/usb/core/driver.c  | 5 ++++-
 drivers/usb/core/generic.c | 3 +++
 include/linux/usb.h        | 1 +
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git drivers/usb/core/driver.c drivers/usb/core/driver.c
index 9d1502a9571d..f81606c6a35b 100644
--- drivers/usb/core/driver.c
+++ drivers/usb/core/driver.c
@@ -270,7 +270,10 @@ static int usb_probe_device(struct device *dev)
 		return error;
 
 	error = udriver->probe(udev);
-	/* TODO: fallback to generic driver in case of error */
+	if (error == -ENODEV && udriver != &usb_generic_driver) {
+		udev->use_generic_driver = 1;
+		return -EPROBE_DEFER;
+	}
 	return error;
 }
 
diff --git drivers/usb/core/generic.c drivers/usb/core/generic.c
index 84da85c13825..4626227a6dd2 100644
--- drivers/usb/core/generic.c
+++ drivers/usb/core/generic.c
@@ -213,6 +213,9 @@ static int __check_usb_generic(struct device_driver *drv, void *data)
 
 static bool usb_generic_driver_match(struct usb_device *udev)
 {
+	if (udev->use_generic_driver)
+		return true;
+
 	/*
 	 * If any other driver wants the device, leave the device to this other
 	 * driver.
diff --git include/linux/usb.h include/linux/usb.h
index 3663bd7b1fa4..ca1a5f1e1c5e 100644
--- include/linux/usb.h
+++ include/linux/usb.h
@@ -708,6 +708,7 @@ struct usb_device {
 	unsigned lpm_disable_count;
 
 	u16 hub_delay;
+	unsigned use_generic_driver:1;
 };
 #define	to_usb_device(d) container_of(d, struct usb_device, dev)
 
-- 
2.21.0

