Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B624D1CC223
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2020 16:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727953AbgEIOQp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 May 2020 10:16:45 -0400
Received: from asav22.altibox.net ([109.247.116.9]:34074 "EHLO
        asav22.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726782AbgEIOQo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 May 2020 10:16:44 -0400
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav22.altibox.net (Postfix) with ESMTPSA id E812F200AA;
        Sat,  9 May 2020 16:16:41 +0200 (CEST)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        lee.jones@linaro.org
Cc:     sam@ravnborg.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v2 01/10] backlight: Add backlight_device_get_by_name()
Date:   Sat,  9 May 2020 16:16:10 +0200
Message-Id: <20200509141619.32970-2-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200509141619.32970-1-noralf@tronnes.org>
References: <20200509141619.32970-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=R7It5+ZX c=1 sm=1 tr=0
        a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
        a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8
        a=7gkXJVJtAAAA:8 a=SJz97ENfAAAA:8 a=vKVk4XFhGoKKoRoBPQAA:9
        a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=E9Po1WZjFZOl8hwRPBS3:22
        a=vFet0B0WnEQeilDPIY6i:22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a way to lookup a backlight device based on its name.
Will be used by a USB display gadget getting the name from configfs.

Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Acked-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/video/backlight/backlight.c | 21 +++++++++++++++++++++
 include/linux/backlight.h           |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index cac3e35d7630..92d80aa0c0ef 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -432,6 +432,27 @@ struct backlight_device *backlight_device_get_by_type(enum backlight_type type)
 }
 EXPORT_SYMBOL(backlight_device_get_by_type);
 
+/**
+ * backlight_device_get_by_name - Get backlight device by name
+ * @name: Device name
+ *
+ * This function looks up a backlight device by its name. It obtains a reference
+ * on the backlight device and it is the caller's responsibility to drop the
+ * reference by calling backlight_put().
+ *
+ * Returns:
+ * A pointer to the backlight device if found, otherwise NULL.
+ */
+struct backlight_device *backlight_device_get_by_name(const char *name)
+{
+	struct device *dev;
+
+	dev = class_find_device_by_name(backlight_class, name);
+
+	return dev ? to_backlight_device(dev) : NULL;
+}
+EXPORT_SYMBOL(backlight_device_get_by_name);
+
 /**
  * backlight_device_unregister - unregisters a backlight device object.
  * @bd: the backlight device object to be unregistered and freed.
diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index c7d6b2e8c3b5..56e4580d4f55 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -190,6 +190,7 @@ extern void backlight_force_update(struct backlight_device *bd,
 extern int backlight_register_notifier(struct notifier_block *nb);
 extern int backlight_unregister_notifier(struct notifier_block *nb);
 extern struct backlight_device *backlight_device_get_by_type(enum backlight_type type);
+struct backlight_device *backlight_device_get_by_name(const char *name);
 extern int backlight_device_set_brightness(struct backlight_device *bd, unsigned long brightness);
 
 #define to_backlight_device(obj) container_of(obj, struct backlight_device, dev)
-- 
2.23.0

