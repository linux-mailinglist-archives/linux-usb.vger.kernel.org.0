Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA2D913517C
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2020 03:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727417AbgAICiO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jan 2020 21:38:14 -0500
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]:41342 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726758AbgAICiN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jan 2020 21:38:13 -0500
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 90D46C0094;
        Thu,  9 Jan 2020 02:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1578537492; bh=F+VjaBfPdwMBDLvq4ZzOx3kFbGnZ4juft2Naut8Sml4=;
        h=Date:From:Subject:To:From;
        b=MgpqNL7E6rzrZyLBhuhCCRhczttvyzQE0ow+pttpN6SpWfD1nBUFEGtu6n5m6A95G
         MyXslHOsqsfX8Fgo0ozd3c64NsrLvpGSHTuhF2SBNbfbwJF/gF9kmBGKjYXuiv5+0M
         6IaId9TQVuHzsyzH2aoU7LjvJdtKnQ35pEjXjHQeUplRBKq+lAhhMGt3BKCEfG76P0
         PrESsLa3LSXMeiqNnbzrJUhIQSYIoIa30KRqGRAITm7pjfJHUP1e8mvBqi2Q/zEHk2
         Cj7bjKHhaOlYRn4S0QCgsFzzn8JbSZ3dsMb2lc+B8eivLVRcX6oenvrlxHkvRKhK+T
         A86Xw9I5SCgpQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 1E774A007A;
        Thu,  9 Jan 2020 02:38:10 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 08 Jan 2020 18:38:10 -0800
Date:   Wed, 08 Jan 2020 18:38:10 -0800
Message-Id: <c4a428ec617a954dc27221d8a9133d22c38b2447.1578537372.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: gadget: configfs: Add max_speed setting
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some functions support speeds other than SuperSpeed. Add max_speed
attribute to configfs gadget allowing user to specify the maximum speed
the composite driver supports. The valid input speed names are
super-speed-plus, super-speed, high-speed, full-speed, and low-speed.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 Documentation/ABI/testing/configfs-usb-gadget |  4 +++
 drivers/usb/gadget/configfs.c                 | 43 +++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget b/Documentation/ABI/testing/configfs-usb-gadget
index 95a36589a66b..4594cc2435e8 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget
+++ b/Documentation/ABI/testing/configfs-usb-gadget
@@ -16,6 +16,10 @@ Description:
 				write UDC's name found in /sys/class/udc/*
 				to bind a gadget, empty string "" to unbind.
 
+		max_speed	- maximum speed the driver supports. Valid
+				names are super-speed-plus, super-speed,
+				high-speed, full-speed, and low-speed.
+
 		bDeviceClass	- USB device class code
 		bDeviceSubClass	- USB device subclass code
 		bDeviceProtocol	- USB device protocol code
diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index ab9ac48a751a..32b637e3e1fa 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -293,6 +293,47 @@ static ssize_t gadget_dev_desc_UDC_store(struct config_item *item,
 	return ret;
 }
 
+static ssize_t gadget_dev_desc_max_speed_show(struct config_item *item,
+					      char *page)
+{
+	enum usb_device_speed speed = to_gadget_info(item)->composite.max_speed;
+
+	return sprintf(page, "%s\n", usb_speed_string(speed));
+}
+
+static ssize_t gadget_dev_desc_max_speed_store(struct config_item *item,
+					       const char *page, size_t len)
+{
+	struct gadget_info *gi = to_gadget_info(item);
+
+	mutex_lock(&gi->lock);
+
+	/* Prevent changing of max_speed after the driver is binded */
+	if (gi->composite.gadget_driver.udc_name)
+		goto err;
+
+	if (strncmp(page, "super-speed-plus", 16) == 0)
+		gi->composite.max_speed = USB_SPEED_SUPER_PLUS;
+	else if (strncmp(page, "super-speed", 11) == 0)
+		gi->composite.max_speed = USB_SPEED_SUPER;
+	else if (strncmp(page, "high-speed", 10) == 0)
+		gi->composite.max_speed = USB_SPEED_HIGH;
+	else if (strncmp(page, "full-speed", 10) == 0)
+		gi->composite.max_speed = USB_SPEED_FULL;
+	else if (strncmp(page, "low-speed", 9) == 0)
+		gi->composite.max_speed = USB_SPEED_LOW;
+	else
+		goto err;
+
+	gi->composite.gadget_driver.max_speed = gi->composite.max_speed;
+
+	mutex_unlock(&gi->lock);
+	return len;
+err:
+	mutex_unlock(&gi->lock);
+	return -EINVAL;
+}
+
 CONFIGFS_ATTR(gadget_dev_desc_, bDeviceClass);
 CONFIGFS_ATTR(gadget_dev_desc_, bDeviceSubClass);
 CONFIGFS_ATTR(gadget_dev_desc_, bDeviceProtocol);
@@ -302,6 +343,7 @@ CONFIGFS_ATTR(gadget_dev_desc_, idProduct);
 CONFIGFS_ATTR(gadget_dev_desc_, bcdDevice);
 CONFIGFS_ATTR(gadget_dev_desc_, bcdUSB);
 CONFIGFS_ATTR(gadget_dev_desc_, UDC);
+CONFIGFS_ATTR(gadget_dev_desc_, max_speed);
 
 static struct configfs_attribute *gadget_root_attrs[] = {
 	&gadget_dev_desc_attr_bDeviceClass,
@@ -313,6 +355,7 @@ static struct configfs_attribute *gadget_root_attrs[] = {
 	&gadget_dev_desc_attr_bcdDevice,
 	&gadget_dev_desc_attr_bcdUSB,
 	&gadget_dev_desc_attr_UDC,
+	&gadget_dev_desc_attr_max_speed,
 	NULL,
 };
 
-- 
2.11.0

