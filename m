Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1EA3EF538
	for <lists+linux-usb@lfdr.de>; Tue, 17 Aug 2021 23:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235393AbhHQVxE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Aug 2021 17:53:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39639 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235384AbhHQVxD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Aug 2021 17:53:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629237149;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2hm5AaMZjUuTlAOdZFMz8JatVQF7oRRA32TFSnkLRF0=;
        b=FV31o2k6y20xXSmS8Onz/peTSEe/NxYs6kH2u72Lvsnf0TSyjeLXgGziodbfMW6uUELZKQ
        /wJQmpAlOXBA853YQA9DQKrg5whi3ii6JwqadcOqHA66wWQSpY5fxWaWUrfl9/k6HYE52T
        f3MY4bGT/SsYdzrxZqpLsqQBrRbzGEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-7dkJsrFlMSuAK8Sx1Coyaw-1; Tue, 17 Aug 2021 17:52:27 -0400
X-MC-Unique: 7dkJsrFlMSuAK8Sx1Coyaw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E797801E72;
        Tue, 17 Aug 2021 21:52:25 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.15])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B7513100763B;
        Tue, 17 Aug 2021 21:52:19 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Lyude <lyude@redhat.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Imre Deak <imre.deak@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org
Subject: [PATCH 5/8] drm/i915: Associate ACPI connector nodes with connector entries (v2)
Date:   Tue, 17 Aug 2021 23:51:58 +0200
Message-Id: <20210817215201.795062-6-hdegoede@redhat.com>
In-Reply-To: <20210817215201.795062-1-hdegoede@redhat.com>
References: <20210817215201.795062-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Heikki Krogerus <heikki.krogerus@linux.intel.com>

On Intel platforms we know that the ACPI connector device
node order will follow the order the driver (i915) decides.
The decision is made using the custom Intel ACPI OpRegion
(intel_opregion.c), though the driver does not actually know
that the values it sends to ACPI there are used for
associating a device node for the connectors, and assigning
address for them.

In reality that custom Intel ACPI OpRegion actually violates
ACPI specification (we supply dynamic information to objects
that are defined static, for example _ADR), however, it
makes assigning correct connector node for a connector entry
straightforward (it's one-on-one mapping).

Changes in v2 (Hans de goede):
- Take a reference on the fwnode which we assign to the connector,
  for ACPI nodes this is a no-op but in the future we may see
  software-fwnodes assigned to connectors which are ref-counted.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Tested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_acpi.c    | 46 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_acpi.h    |  3 ++
 drivers/gpu/drm/i915/display/intel_display.c |  1 +
 3 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
index 7cfe91fc05f2..72cac55c0f0f 100644
--- a/drivers/gpu/drm/i915/display/intel_acpi.c
+++ b/drivers/gpu/drm/i915/display/intel_acpi.c
@@ -282,3 +282,49 @@ void intel_acpi_device_id_update(struct drm_i915_private *dev_priv)
 	}
 	drm_connector_list_iter_end(&conn_iter);
 }
+
+/* NOTE: The connector order must be final before this is called. */
+void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915)
+{
+	struct drm_connector_list_iter conn_iter;
+	struct drm_device *drm_dev = &i915->drm;
+	struct fwnode_handle *fwnode = NULL;
+	struct drm_connector *connector;
+	struct acpi_device *adev;
+
+	drm_connector_list_iter_begin(drm_dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		/* Always getting the next, even when the last was not used. */
+		fwnode = device_get_next_child_node(drm_dev->dev, fwnode);
+		if (!fwnode)
+			break;
+
+		switch (connector->connector_type) {
+		case DRM_MODE_CONNECTOR_LVDS:
+		case DRM_MODE_CONNECTOR_eDP:
+		case DRM_MODE_CONNECTOR_DSI:
+			/*
+			 * Integrated displays have a specific address 0x1f on
+			 * most Intel platforms, but not on all of them.
+			 */
+			adev = acpi_find_child_device(ACPI_COMPANION(drm_dev->dev),
+						      0x1f, 0);
+			if (adev) {
+				connector->fwnode =
+					fwnode_handle_get(acpi_fwnode_handle(adev));
+				break;
+			}
+			fallthrough;
+		default:
+			connector->fwnode = fwnode_handle_get(fwnode);
+			break;
+		}
+	}
+	drm_connector_list_iter_end(&conn_iter);
+	/*
+	 * device_get_next_child_node() takes a reference on the fwnode, if
+	 * we stopped iterating because we are out of connectors we need to
+	 * put this, otherwise fwnode is NULL and the put is a no-op.
+	 */
+	fwnode_handle_put(fwnode);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_acpi.h b/drivers/gpu/drm/i915/display/intel_acpi.h
index 9f197401c313..4a760a2baed9 100644
--- a/drivers/gpu/drm/i915/display/intel_acpi.h
+++ b/drivers/gpu/drm/i915/display/intel_acpi.h
@@ -13,6 +13,7 @@ void intel_register_dsm_handler(void);
 void intel_unregister_dsm_handler(void);
 void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915);
 void intel_acpi_device_id_update(struct drm_i915_private *i915);
+void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915);
 #else
 static inline void intel_register_dsm_handler(void) { return; }
 static inline void intel_unregister_dsm_handler(void) { return; }
@@ -20,6 +21,8 @@ static inline
 void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915) { return; }
 static inline
 void intel_acpi_device_id_update(struct drm_i915_private *i915) { return; }
+static inline
+void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915) { return; }
 #endif /* CONFIG_ACPI */
 
 #endif /* __INTEL_ACPI_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index a257e5dc381c..88e5fff64b8c 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -12561,6 +12561,7 @@ int intel_modeset_init_nogem(struct drm_i915_private *i915)
 
 	drm_modeset_lock_all(dev);
 	intel_modeset_setup_hw_state(dev, dev->mode_config.acquire_ctx);
+	intel_acpi_assign_connector_fwnodes(i915);
 	drm_modeset_unlock_all(dev);
 
 	for_each_intel_crtc(dev, crtc) {
-- 
2.31.1

