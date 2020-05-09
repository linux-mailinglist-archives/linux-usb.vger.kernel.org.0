Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51F011CC210
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2020 16:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727926AbgEIOQo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 May 2020 10:16:44 -0400
Received: from asav22.altibox.net ([109.247.116.9]:34090 "EHLO
        asav22.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727790AbgEIOQo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 May 2020 10:16:44 -0400
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav22.altibox.net (Postfix) with ESMTPSA id 454AA20188;
        Sat,  9 May 2020 16:16:42 +0200 (CEST)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        lee.jones@linaro.org
Cc:     sam@ravnborg.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v2 02/10] drm/client: Add drm_client_init_from_id()
Date:   Sat,  9 May 2020 16:16:11 +0200
Message-Id: <20200509141619.32970-3-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200509141619.32970-1-noralf@tronnes.org>
References: <20200509141619.32970-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=R7It5+ZX c=1 sm=1 tr=0
        a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
        a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8
        a=K4G_t0gYd1P4o9CfPpEA:9 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

drm_client_init_from_id() provides a way for clients to add a client based
on the minor. drm_client_register() is changed to return whether it was
registered or not depending on the unplugged status of the DRM device.
Its only caller drm_fbdev_generic_setup() runs inside probe() so it
doesn't have to check.

v2:
- Move drm_client_modeset_set() to a separate patch with added functions.
- Previous version had drm_client_init_from_id() call
  drm_client_register(). This put the client in a position where it could
  receive hotplugs during init in addition to akward error paths. Instead
  let drm_client_register() return status so clients can know if the DRM
  device is gone or not.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/drm_client.c | 48 +++++++++++++++++++++++++++++++++++-
 include/drm/drm_client.h     |  4 ++-
 2 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 2a147d1c3a13..12787915db01 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -112,6 +112,40 @@ int drm_client_init(struct drm_device *dev, struct drm_client_dev *client,
 }
 EXPORT_SYMBOL(drm_client_init);
 
+/**
+ * drm_client_init_from_id - Initialise a DRM client
+ * @minor_id: DRM minor id
+ * @client: DRM client
+ * @name: Client name
+ * @funcs: DRM client functions (optional)
+ *
+ * This function looks up the drm_device using the minor id and initializes the client.
+ *
+ * See drm_client_init() and drm_client_register().
+ *
+ * Returns:
+ * Zero on success or negative error code on failure.
+ */
+int drm_client_init_from_id(unsigned int minor_id, struct drm_client_dev *client,
+			    const char *name, const struct drm_client_funcs *funcs)
+{
+	struct drm_minor *minor;
+	int ret;
+
+	minor = drm_minor_acquire(minor_id);
+	if (IS_ERR(minor))
+		return PTR_ERR(minor);
+
+	mutex_lock(&minor->dev->clientlist_mutex);
+	ret = drm_client_init(minor->dev, client, name, funcs);
+	mutex_unlock(&minor->dev->clientlist_mutex);
+
+	drm_minor_release(minor);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_client_init_from_id);
+
 /**
  * drm_client_register - Register client
  * @client: DRM client
@@ -121,14 +155,26 @@ EXPORT_SYMBOL(drm_client_init);
  * drm_client_register() it is no longer permissible to call drm_client_release()
  * directly (outside the unregister callback), instead cleanup will happen
  * automatically on driver unload.
+ *
+ * Returns:
+ * True if the client has been registered, false if the DRM device has already
+ * been unregistered.
  */
-void drm_client_register(struct drm_client_dev *client)
+bool drm_client_register(struct drm_client_dev *client)
 {
 	struct drm_device *dev = client->dev;
+	int idx;
+
+	if (!drm_dev_enter(client->dev, &idx))
+		return false;
 
 	mutex_lock(&dev->clientlist_mutex);
 	list_add(&client->list, &dev->clientlist);
 	mutex_unlock(&dev->clientlist_mutex);
+
+	drm_dev_exit(idx);
+
+	return true;
 }
 EXPORT_SYMBOL(drm_client_register);
 
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index 7402f852d3c4..96ebc7523aa0 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -109,8 +109,10 @@ struct drm_client_dev {
 
 int drm_client_init(struct drm_device *dev, struct drm_client_dev *client,
 		    const char *name, const struct drm_client_funcs *funcs);
+int drm_client_init_from_id(unsigned int minor_id, struct drm_client_dev *client,
+			    const char *name, const struct drm_client_funcs *funcs);
 void drm_client_release(struct drm_client_dev *client);
-void drm_client_register(struct drm_client_dev *client);
+bool drm_client_register(struct drm_client_dev *client);
 
 void drm_client_dev_unregister(struct drm_device *dev);
 void drm_client_dev_hotplug(struct drm_device *dev);
-- 
2.23.0

