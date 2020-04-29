Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 940771BDCCF
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 14:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbgD2M56 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 08:57:58 -0400
Received: from asav21.altibox.net ([109.247.116.8]:58610 "EHLO
        asav21.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbgD2M55 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Apr 2020 08:57:57 -0400
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav21.altibox.net (Postfix) with ESMTPSA id 3A4178018F;
        Wed, 29 Apr 2020 14:48:51 +0200 (CEST)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org
Cc:     =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH 06/10] drm/client: Add a way to set modeset, properties and rotation
Date:   Wed, 29 Apr 2020 14:48:26 +0200
Message-Id: <20200429124830.27475-7-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200429124830.27475-1-noralf@tronnes.org>
References: <20200429124830.27475-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=AvXAIt1P c=1 sm=1 tr=0
        a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
        a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8
        a=M-TpJSvIHFVSw-O4hR8A:9 a=U4fVIzcjXVGbKNhq:21 a=33y9_LKcbowkTFL6:21
        a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This adds functions for clients that need more control over the
configuration than what's setup by drm_client_modeset_probe().
Connector, fb and display mode can be set using drm_client_modeset_set().
Plane rotation can be set using drm_client_modeset_set_rotation() and
other properties using drm_client_modeset_set_property(). Property
setting is only implemented for atomic drivers.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/drm_client_modeset.c | 139 +++++++++++++++++++++++++++
 include/drm/drm_client.h             |  38 +++++++-
 2 files changed, 176 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 177158ff2a40..1eef6869cae1 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -83,6 +83,10 @@ static void drm_client_modeset_release(struct drm_client_dev *client)
 		}
 		modeset->num_connectors = 0;
 	}
+
+	kfree(client->properties);
+	client->properties = NULL;
+	client->num_properties = 0;
 }
 
 void drm_client_modeset_free(struct drm_client_dev *client)
@@ -879,6 +883,132 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 }
 EXPORT_SYMBOL(drm_client_modeset_probe);
 
+/**
+ * drm_client_modeset_set() - Set modeset configuration
+ * @client: DRM client
+ * @connector: Connector
+ * @mode: Display mode
+ * @fb: Framebuffer
+ *
+ * This function releases any current modeset info, including properties, and
+ * sets the new modeset in the client's modeset array.
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
+		drm_mode_set_crtcinfo(modeset->mode, CRTC_INTERLACE_HALVE_V);
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
+/**
+ * drm_client_modeset_set_property() - Set a property on the current configuration
+ * @client: DRM client
+ * @obj: DRM Mode Object
+ * @prop: DRM Property
+ * @value: Property value
+ *
+ * Note: Currently only implemented for atomic drivers.
+ *
+ * Returns:
+ * Zero on success or negative error code on failure.
+ */
+int drm_client_modeset_set_property(struct drm_client_dev *client, struct drm_mode_object *obj,
+				    struct drm_property *prop, u64 value)
+{
+	struct drm_client_property *properties;
+	int ret = 0;
+
+	if (!prop)
+		return -EINVAL;
+
+	mutex_lock(&client->modeset_mutex);
+
+	properties = krealloc(client->properties,
+			      (client->num_properties + 1) * sizeof(*properties), GFP_KERNEL);
+	if (!properties) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
+
+	properties[client->num_properties].obj = obj;
+	properties[client->num_properties].prop = prop;
+	properties[client->num_properties].value = value;
+	client->properties = properties;
+	client->num_properties++;
+unlock:
+	mutex_unlock(&client->modeset_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_client_modeset_set_property);
+
+/**
+ * drm_client_modeset_set_rotation() - Set rotation on the current configuration
+ * @client: DRM client
+ * @value: Rotation value
+ *
+ * Returns:
+ * Zero on success or negative error code on failure.
+ */
+int drm_client_modeset_set_rotation(struct drm_client_dev *client, u64 value)
+{
+	struct drm_plane *plane = NULL;
+	struct drm_mode_set *modeset;
+
+	mutex_lock(&client->modeset_mutex);
+	drm_client_for_each_modeset(modeset, client) {
+		if (modeset->mode) {
+			plane = modeset->crtc->primary;
+			break;
+		}
+	}
+	mutex_unlock(&client->modeset_mutex);
+
+	if (!plane)
+		return -ENOENT;
+
+	return drm_client_modeset_set_property(client, &plane->base,
+					       plane->rotation_property, value);
+}
+EXPORT_SYMBOL(drm_client_modeset_set_rotation);
+
 /**
  * drm_client_rotation() - Check the initial rotation value
  * @modeset: DRM modeset
@@ -973,6 +1103,7 @@ static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool
 	struct drm_atomic_state *state;
 	struct drm_modeset_acquire_ctx ctx;
 	struct drm_mode_set *mode_set;
+	unsigned int i;
 	int ret;
 
 	drm_modeset_acquire_init(&ctx, 0);
@@ -1033,6 +1164,14 @@ static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool
 		}
 	}
 
+	for (i = 0; i < client->num_properties; i++) {
+		struct drm_client_property *prop = &client->properties[i];
+
+		ret = drm_atomic_set_property(state, NULL, prop->obj, prop->prop, prop->value);
+		if (ret)
+			goto out_state;
+	}
+
 	if (check)
 		ret = drm_atomic_check_only(state);
 	else
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index b6ffa4863e45..4b266741ec0e 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -16,6 +16,7 @@ struct drm_file;
 struct drm_framebuffer;
 struct drm_gem_object;
 struct drm_minor;
+struct drm_property;
 struct module;
 
 /**
@@ -64,6 +65,26 @@ struct drm_client_funcs {
 	int (*hotplug)(struct drm_client_dev *client);
 };
 
+/**
+ * struct drm_client_property - DRM client property
+ */
+struct drm_client_property {
+	/**
+	 * @obj: DRM Mode Object to which the property belongs.
+	 */
+	struct drm_mode_object *obj;
+
+	/**
+	 * @prop: DRM Property.
+	 */
+	struct drm_property *prop;
+
+	/**
+	 * @value: Property value.
+	 */
+	u64 value;
+};
+
 /**
  * struct drm_client_dev - DRM client instance
  */
@@ -97,7 +118,7 @@ struct drm_client_dev {
 	struct drm_file *file;
 
 	/**
-	 * @modeset_mutex: Protects @modesets.
+	 * @modeset_mutex: Protects @modesets and @properties.
 	 */
 	struct mutex modeset_mutex;
 
@@ -105,6 +126,16 @@ struct drm_client_dev {
 	 * @modesets: CRTC configurations
 	 */
 	struct drm_mode_set *modesets;
+
+	/**
+	 * @properties: DRM properties attached to the configuration.
+	 */
+	struct drm_client_property *properties;
+
+	/**
+	 * @num_properties: Number of attached properties.
+	 */
+	unsigned int num_properties;
 };
 
 int drm_client_init(struct drm_device *dev, struct drm_client_dev *client,
@@ -163,6 +194,11 @@ void drm_client_buffer_vunmap(struct drm_client_buffer *buffer);
 int drm_client_modeset_create(struct drm_client_dev *client);
 void drm_client_modeset_free(struct drm_client_dev *client);
 int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width, unsigned int height);
+int drm_client_modeset_set(struct drm_client_dev *client, struct drm_connector *connector,
+			   struct drm_display_mode *mode, struct drm_framebuffer *fb);
+int drm_client_modeset_set_property(struct drm_client_dev *client, struct drm_mode_object *obj,
+				    struct drm_property *prop, u64 value);
+int drm_client_modeset_set_rotation(struct drm_client_dev *client, u64 value);
 bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation);
 int drm_client_modeset_check(struct drm_client_dev *client);
 int drm_client_modeset_commit_locked(struct drm_client_dev *client);
-- 
2.23.0

