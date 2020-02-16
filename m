Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DAF51604F7
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2020 18:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728511AbgBPR1C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Feb 2020 12:27:02 -0500
Received: from asav22.altibox.net ([109.247.116.9]:50656 "EHLO
        asav22.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728370AbgBPR1C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Feb 2020 12:27:02 -0500
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav22.altibox.net (Postfix) with ESMTPSA id 8D66F200F4;
        Sun, 16 Feb 2020 18:21:41 +0100 (CET)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     broonie@kernel.org, balbi@kernel.org, lee.jones@linaro.org
Cc:     linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [RFC 8/9] drm/client: Add drm_client_init_from_id() and drm_client_modeset_set()
Date:   Sun, 16 Feb 2020 18:21:16 +0100
Message-Id: <20200216172117.49832-9-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200216172117.49832-1-noralf@tronnes.org>
References: <20200216172117.49832-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ZvHD1ezG c=1 sm=1 tr=0
        a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10
        a=SJz97ENfAAAA:8 a=MRF-nNKL37wAc8rothMA:9 a=QEXdDO2ut3YA:10
        a=vFet0B0WnEQeilDPIY6i:22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

drm_client_init_from_id() provides a way for clients to add a client based
on the minor. drm_client_modeset_set() provides a way to set the modeset
for clients that handles connectors and display mode on their own.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/drm_client.c         | 37 ++++++++++++++++++++
 drivers/gpu/drm/drm_client_modeset.c | 52 ++++++++++++++++++++++++++++
 include/drm/drm_client.h             |  4 +++
 3 files changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index d9a2e3695525..dbd73fe8d987 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -112,6 +112,43 @@ int drm_client_init(struct drm_device *dev, struct drm_client_dev *client,
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
+ * It also registeres the client to avoid a possible race with DRM device unregister.
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
+	if (!ret)
+		list_add(&client->list, &minor->dev->clientlist);
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
diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 895b73f23079..9396267e646c 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -807,6 +807,58 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 }
 EXPORT_SYMBOL(drm_client_modeset_probe);
 
+/**
+ * drm_client_modeset_set() - Set modeset
+ * @client: DRM client
+ * @connector: Connector
+ * @mode: Display mode
+ * @fb: Framebuffer
+ *
+ * This function releases any current modeset info and sets the new modeset in
+ * the client's modeset array.
+ *
+ * Returns:
+ * Zero on success or negative error code on failure.
+ */
+int drm_client_modeset_set(struct drm_client_dev *client, struct drm_connector *connector,
+			   struct drm_display_mode *mode, struct drm_framebuffer *fb)
+{
+	struct drm_mode_set *modeset;
+	int ret = -ENOENT;
+
+	mutex_lock(&client->modeset_mutex);
+
+	drm_client_modeset_release(client);
+
+	if (!connector || !mode || !fb) {
+		ret = 0;
+		goto unlock;
+	}
+
+	drm_client_for_each_modeset(modeset, client) {
+		if (!connector_has_possible_crtc(connector, modeset->crtc))
+			continue;
+
+		modeset->mode = drm_mode_duplicate(client->dev, mode);
+		if (!modeset->mode) {
+			ret = -ENOMEM;
+			break;
+		}
+
+		drm_connector_get(connector);
+		modeset->connectors[modeset->num_connectors++] = connector;
+
+		modeset->fb = fb;
+		ret = 0;
+		break;
+	}
+unlock:
+	mutex_unlock(&client->modeset_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_client_modeset_set);
+
 /**
  * drm_client_rotation() - Check the initial rotation value
  * @modeset: DRM modeset
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index 5cf2c5dd8b1e..97e4157d07c5 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -104,6 +104,8 @@ struct drm_client_dev {
 
 int drm_client_init(struct drm_device *dev, struct drm_client_dev *client,
 		    const char *name, const struct drm_client_funcs *funcs);
+int drm_client_init_from_id(unsigned int minor_id, struct drm_client_dev *client,
+			    const char *name, const struct drm_client_funcs *funcs);
 void drm_client_release(struct drm_client_dev *client);
 void drm_client_register(struct drm_client_dev *client);
 
@@ -155,6 +157,8 @@ void drm_client_buffer_vunmap(struct drm_client_buffer *buffer);
 int drm_client_modeset_create(struct drm_client_dev *client);
 void drm_client_modeset_free(struct drm_client_dev *client);
 int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width, unsigned int height);
+int drm_client_modeset_set(struct drm_client_dev *client, struct drm_connector *connector,
+			   struct drm_display_mode *mode, struct drm_framebuffer *fb);
 bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation);
 int drm_client_modeset_commit_force(struct drm_client_dev *client);
 int drm_client_modeset_commit(struct drm_client_dev *client);
-- 
2.23.0

