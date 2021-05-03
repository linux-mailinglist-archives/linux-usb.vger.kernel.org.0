Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 185F5371848
	for <lists+linux-usb@lfdr.de>; Mon,  3 May 2021 17:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbhECPsB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 May 2021 11:48:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37925 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230362AbhECPr7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 May 2021 11:47:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620056825;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OpURr7NR+2V79CCkZqiEnbmefPzTXhQ8tGeT4OPr6JM=;
        b=aAlcGb4bM4EtNPP/28JuvDyQ5KzehkGrNV713gfFYD/f5XJwHRv5aZm9ZftADAnaZdOtYU
        OzAXA4FnR2X5/onL7RlcpWE8HEs8Ikf9QPHoSJkmq0PJ3TkA/27JJtBaqXeMtirI2aulw3
        m62BZqbe2e/SxLRoDtiZe4DuaoUsoGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-P_hZVefzMVqxH4zqurvmXw-1; Mon, 03 May 2021 11:47:03 -0400
X-MC-Unique: P_hZVefzMVqxH4zqurvmXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93CF81006C80;
        Mon,  3 May 2021 15:47:01 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-158.ams2.redhat.com [10.36.112.158])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D02F51007610;
        Mon,  3 May 2021 15:46:58 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 3/9] drm/connector: Add drm_connector_find_by_fwnode() function (v2)
Date:   Mon,  3 May 2021 17:46:41 +0200
Message-Id: <20210503154647.142551-4-hdegoede@redhat.com>
In-Reply-To: <20210503154647.142551-1-hdegoede@redhat.com>
References: <20210503154647.142551-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a function to find a connector based on a fwnode.

This will be used by the new drm_connector_oob_hotplug_event()
function which is added by the next patch in this patch-set.

Changes in v2:
- Complete rewrite to use a global connector list in drm_connector.c
  rather then using a class-dev-iter in drm_sysfs.c

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_connector.c     | 50 +++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_crtc_internal.h |  1 +
 include/drm/drm_connector.h         |  8 +++++
 3 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 87c68563e6c3..ef759d6add81 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -66,6 +66,14 @@
  * support can instead use e.g. drm_helper_hpd_irq_event().
  */
 
+/*
+ * Global connector list for drm_connector_find_by_fwnode().
+ * Note drm_connector_[un]register() first take connector->lock and then
+ * take the connector_list_lock.
+ */
+static DEFINE_MUTEX(connector_list_lock);
+static LIST_HEAD(connector_list);
+
 struct drm_conn_prop_enum_list {
 	int type;
 	const char *name;
@@ -267,6 +275,7 @@ int drm_connector_init(struct drm_device *dev,
 		goto out_put_type_id;
 	}
 
+	INIT_LIST_HEAD(&connector->global_connector_list_entry);
 	INIT_LIST_HEAD(&connector->probed_modes);
 	INIT_LIST_HEAD(&connector->modes);
 	mutex_init(&connector->mutex);
@@ -540,6 +549,9 @@ int drm_connector_register(struct drm_connector *connector)
 		drm_privacy_screen_register_notifier(connector->privacy_screen,
 					   &connector->privacy_screen_notifier);
 
+	mutex_lock(&connector_list_lock);
+	list_add_tail(&connector->global_connector_list_entry, &connector_list);
+	mutex_unlock(&connector_list_lock);
 	goto unlock;
 
 err_debugfs:
@@ -568,6 +580,10 @@ void drm_connector_unregister(struct drm_connector *connector)
 		return;
 	}
 
+	mutex_lock(&connector_list_lock);
+	list_del_init(&connector->global_connector_list_entry);
+	mutex_unlock(&connector_list_lock);
+
 	if (connector->privacy_screen)
 		drm_privacy_screen_unregister_notifier(
 					connector->privacy_screen,
@@ -2676,6 +2692,40 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
 	return ret;
 }
 
+/**
+ * drm_connector_find_by_fwnode - Find a connector based on the associated fwnode
+ * @fwnode: fwnode for which to find the matching drm_connector
+ *
+ * This functions looks up a drm_connector based on its associated fwnode. When
+ * a connector is found a reference to the connector is returned. The caller must
+ * call drm_connector_put() to release this reference when it is done with the
+ * connector.
+ *
+ * Returns: A reference to the found connector or an ERR_PTR().
+ */
+struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
+{
+	struct drm_connector *connector, *found = ERR_PTR(-ENODEV);
+
+	if (!fwnode)
+		return ERR_PTR(-ENODEV);
+
+	mutex_lock(&connector_list_lock);
+
+	list_for_each_entry(connector, &connector_list, global_connector_list_entry) {
+		if (connector->fwnode == fwnode ||
+		    (connector->fwnode && connector->fwnode->secondary == fwnode)) {
+			drm_connector_get(connector);
+			found = connector;
+			break;
+		}
+	}
+
+	mutex_unlock(&connector_list_lock);
+
+	return found;
+}
+
 
 /**
  * DOC: Tile group
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 54d4cf1233e9..6e28fc00a740 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -185,6 +185,7 @@ int drm_connector_set_obj_prop(struct drm_mode_object *obj,
 int drm_connector_create_standard_properties(struct drm_device *dev);
 const char *drm_get_connector_force_name(enum drm_connector_force force);
 void drm_connector_free_work_fn(struct work_struct *work);
+struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode);
 
 /* IOCTL */
 int drm_connector_property_set_ioctl(struct drm_device *dev,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index d20bfd7576ed..ae377354e48e 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1267,6 +1267,14 @@ struct drm_connector {
 	 */
 	struct list_head head;
 
+	/**
+	 * @global_connector_list_entry:
+	 *
+	 * Connector entry in the global connector-list, used by
+	 * drm_connector_find_by_fwnode().
+	 */
+	struct list_head global_connector_list_entry;
+
 	/** @base: base KMS object */
 	struct drm_mode_object base;
 
-- 
2.31.1

