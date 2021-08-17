Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A73F23EF533
	for <lists+linux-usb@lfdr.de>; Tue, 17 Aug 2021 23:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235302AbhHQVw4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Aug 2021 17:52:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24563 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235119AbhHQVwz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Aug 2021 17:52:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629237141;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yoxvHs+GVn920JzJXPiCKVAkkszCn+hFKLsyaq62GSk=;
        b=TAJ2U6bpvryYufREji0i11xL89vhEW+3EijNK5qtYybOLaxuxdxqGokxEE+jpMl6T3zWpd
        ONtTkE5+G5mE+wB0Uu0UPzUlYLPQSVcWsZTsFSrtWcUc74QZiZ+m6dW4+G/Nt0MqbZi7eK
        rnErWUTC2vOL+Ah0Z8O72z4PTkK1IiI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-IxX3GabzMTKv8jX0PMmnzw-1; Tue, 17 Aug 2021 17:52:18 -0400
X-MC-Unique: IxX3GabzMTKv8jX0PMmnzw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52A511008063;
        Tue, 17 Aug 2021 21:52:16 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.15])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0802610013D6;
        Tue, 17 Aug 2021 21:52:12 +0000 (UTC)
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
Subject: [PATCH 3/8] drm/connector: Add drm_connector_find_by_fwnode() function (v3)
Date:   Tue, 17 Aug 2021 23:51:56 +0200
Message-Id: <20210817215201.795062-4-hdegoede@redhat.com>
In-Reply-To: <20210817215201.795062-1-hdegoede@redhat.com>
References: <20210817215201.795062-1-hdegoede@redhat.com>
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

Changes in v3:
- Add forward declaration for struct fwnode_handle to drm_crtc_internal.h
  (fixes warning reported by kernel test robot <lkp@intel.com>)

Tested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_connector.c     | 50 +++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_crtc_internal.h |  2 ++
 include/drm/drm_connector.h         |  8 +++++
 3 files changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 3ad359a216ff..7d72bcefa4d6 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -65,6 +65,14 @@
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
@@ -534,6 +543,9 @@ int drm_connector_register(struct drm_connector *connector)
 	/* Let userspace know we have a new connector */
 	drm_sysfs_hotplug_event(connector->dev);
 
+	mutex_lock(&connector_list_lock);
+	list_add_tail(&connector->global_connector_list_entry, &connector_list);
+	mutex_unlock(&connector_list_lock);
 	goto unlock;
 
 err_debugfs:
@@ -562,6 +574,10 @@ void drm_connector_unregister(struct drm_connector *connector)
 		return;
 	}
 
+	mutex_lock(&connector_list_lock);
+	list_del_init(&connector->global_connector_list_entry);
+	mutex_unlock(&connector_list_lock);
+
 	if (connector->funcs->early_unregister)
 		connector->funcs->early_unregister(connector);
 
@@ -2545,6 +2561,40 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
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
index edb772947cb4..63279e984342 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -58,6 +58,7 @@ struct drm_property;
 struct edid;
 struct kref;
 struct work_struct;
+struct fwnode_handle;
 
 /* drm_crtc.c */
 int drm_mode_crtc_set_obj_prop(struct drm_mode_object *obj,
@@ -186,6 +187,7 @@ int drm_connector_set_obj_prop(struct drm_mode_object *obj,
 int drm_connector_create_standard_properties(struct drm_device *dev);
 const char *drm_get_connector_force_name(enum drm_connector_force force);
 void drm_connector_free_work_fn(struct work_struct *work);
+struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode);
 
 /* IOCTL */
 int drm_connector_property_set_ioctl(struct drm_device *dev,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 69dd488a2154..8132c48b56ae 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1247,6 +1247,14 @@ struct drm_connector {
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

