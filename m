Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 912B53EF543
	for <lists+linux-usb@lfdr.de>; Tue, 17 Aug 2021 23:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235403AbhHQVxN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Aug 2021 17:53:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60343 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235384AbhHQVxM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Aug 2021 17:53:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629237158;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f4jIl7S9wDq/SPEA83mol1nOQbqHjQRoUaDkzD/cpq0=;
        b=UaWc6TcaZY6bUS6Ae+SfUvzOkBR3/9qNRuNV9/ZUXWKzzi11rIRa3p4nJn1/GEuV3s3yEW
        5H22g7O3uCcYy1RjIJ+uMHjGjVv3GY2VLWc/7VaiJC/8gfdlkQRtTcyzDp9aFD+hT1SR8w
        6X9dvjMk0Luh2F1IM+hLly1s+WbnIHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-n05-6c8BMEiTur4weApZww-1; Tue, 17 Aug 2021 17:52:37 -0400
X-MC-Unique: n05-6c8BMEiTur4weApZww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D5381008066;
        Tue, 17 Aug 2021 21:52:35 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.15])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8A60710016FB;
        Tue, 17 Aug 2021 21:52:32 +0000 (UTC)
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
Subject: [PATCH 8/8] usb: typec: altmodes/displayport: Notify drm subsys of hotplug events
Date:   Tue, 17 Aug 2021 23:52:01 +0200
Message-Id: <20210817215201.795062-9-hdegoede@redhat.com>
In-Reply-To: <20210817215201.795062-1-hdegoede@redhat.com>
References: <20210817215201.795062-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use the new drm_connector_oob_hotplug_event() functions to let drm/kms
drivers know about DisplayPort over Type-C hotplug events.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Tested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- Only call drm_connector_oob_hotplug_event() on hpd status bit change
- Adjust for drm_connector_oob_hotplug_event() no longer having a data
  argument

Changes in v2:
- Add missing depends on DRM to TYPEC_DP_ALTMODE Kconfig entry
---
 drivers/usb/typec/altmodes/Kconfig       |  1 +
 drivers/usb/typec/altmodes/displayport.c | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/usb/typec/altmodes/Kconfig b/drivers/usb/typec/altmodes/Kconfig
index 60d375e9c3c7..1a6b5e872b0d 100644
--- a/drivers/usb/typec/altmodes/Kconfig
+++ b/drivers/usb/typec/altmodes/Kconfig
@@ -4,6 +4,7 @@ menu "USB Type-C Alternate Mode drivers"
 
 config TYPEC_DP_ALTMODE
 	tristate "DisplayPort Alternate Mode driver"
+	depends on DRM
 	help
 	  DisplayPort USB Type-C Alternate Mode allows DisplayPort
 	  displays and adapters to be attached to the USB Type-C
diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index aa669b9cf70e..c1d8c23baa39 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -11,8 +11,10 @@
 #include <linux/delay.h>
 #include <linux/mutex.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/usb/pd_vdo.h>
 #include <linux/usb/typec_dp.h>
+#include <drm/drm_connector.h>
 #include "displayport.h"
 
 #define DP_HEADER(_dp, ver, cmd)	(VDO((_dp)->alt->svid, 1, ver, cmd)	\
@@ -57,11 +59,13 @@ struct dp_altmode {
 	struct typec_displayport_data data;
 
 	enum dp_state state;
+	bool hpd;
 
 	struct mutex lock; /* device lock */
 	struct work_struct work;
 	struct typec_altmode *alt;
 	const struct typec_altmode *port;
+	struct fwnode_handle *connector_fwnode;
 };
 
 static int dp_altmode_notify(struct dp_altmode *dp)
@@ -125,6 +129,7 @@ static int dp_altmode_configure(struct dp_altmode *dp, u8 con)
 static int dp_altmode_status_update(struct dp_altmode *dp)
 {
 	bool configured = !!DP_CONF_GET_PIN_ASSIGN(dp->data.conf);
+	bool hpd = !!(dp->data.status & DP_STATUS_HPD_STATE);
 	u8 con = DP_STATUS_CONNECTION(dp->data.status);
 	int ret = 0;
 
@@ -137,6 +142,11 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 		ret = dp_altmode_configure(dp, con);
 		if (!ret)
 			dp->state = DP_STATE_CONFIGURE;
+	} else {
+		if (dp->hpd != hpd) {
+			drm_connector_oob_hotplug_event(dp->connector_fwnode);
+			dp->hpd = hpd;
+		}
 	}
 
 	return ret;
@@ -512,6 +522,7 @@ static const struct attribute_group dp_altmode_group = {
 int dp_altmode_probe(struct typec_altmode *alt)
 {
 	const struct typec_altmode *port = typec_altmode_get_partner(alt);
+	struct fwnode_handle *fwnode;
 	struct dp_altmode *dp;
 	int ret;
 
@@ -540,6 +551,11 @@ int dp_altmode_probe(struct typec_altmode *alt)
 	alt->desc = "DisplayPort";
 	alt->ops = &dp_altmode_ops;
 
+	fwnode = dev_fwnode(alt->dev.parent->parent); /* typec_port fwnode */
+	dp->connector_fwnode = fwnode_find_reference(fwnode, "displayport", 0);
+	if (IS_ERR(dp->connector_fwnode))
+		dp->connector_fwnode = NULL;
+
 	typec_altmode_set_drvdata(alt, dp);
 
 	dp->state = DP_STATE_ENTER;
@@ -555,6 +571,13 @@ void dp_altmode_remove(struct typec_altmode *alt)
 
 	sysfs_remove_group(&alt->dev.kobj, &dp_altmode_group);
 	cancel_work_sync(&dp->work);
+
+	if (dp->connector_fwnode) {
+		if (dp->hpd)
+			drm_connector_oob_hotplug_event(dp->connector_fwnode);
+
+		fwnode_handle_put(dp->connector_fwnode);
+	}
 }
 EXPORT_SYMBOL_GPL(dp_altmode_remove);
 
-- 
2.31.1

