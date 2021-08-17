Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8523EF52E
	for <lists+linux-usb@lfdr.de>; Tue, 17 Aug 2021 23:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234888AbhHQVwt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Aug 2021 17:52:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20197 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232564AbhHQVws (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Aug 2021 17:52:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629237134;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pv//Oq4MQWb5fLTHqPLMxqfYs75MmmXZqmA+EkBN9pI=;
        b=Niu+O2ZRNqJ/3AVZlWySC/B0kKcJUhAE7h7EUhgzOEdy9dSUKsC7gU4EvzgiPbu49sAbDq
        g31wCDB6Qt0Yv0MO+2aTxutPE2nyNCEKdsYwPhfxxtPskHdtwNMBaWtWFFM3+VDGmP91d1
        j8cBNoNWOCCtBWt28uZktHjXFwCzeR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-DaCZezIvMBKtY63xIjJuhg-1; Tue, 17 Aug 2021 17:52:11 -0400
X-MC-Unique: DaCZezIvMBKtY63xIjJuhg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91FBB1008060;
        Tue, 17 Aug 2021 21:52:09 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.15])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9BBCA1036D2E;
        Tue, 17 Aug 2021 21:52:06 +0000 (UTC)
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
Subject: [PATCH 1/8] drm/connector: Give connector sysfs devices there own device_type
Date:   Tue, 17 Aug 2021 23:51:54 +0200
Message-Id: <20210817215201.795062-2-hdegoede@redhat.com>
In-Reply-To: <20210817215201.795062-1-hdegoede@redhat.com>
References: <20210817215201.795062-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Give connector sysfs devices there own device_type, this allows us to
check if a device passed to functions dealing with generic devices is
a drm_connector or not.

A check like this is necessary in the drm_connector_acpi_bus_match()
function added in the next patch in this series.

Tested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_sysfs.c | 50 +++++++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 968a9560b4aa..f9d92bbb1f98 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -50,6 +50,10 @@ static struct device_type drm_sysfs_device_minor = {
 	.name = "drm_minor"
 };
 
+static struct device_type drm_sysfs_device_connector = {
+	.name = "drm_connector",
+};
+
 struct class *drm_class;
 
 static char *drm_devnode(struct device *dev, umode_t *mode)
@@ -102,6 +106,11 @@ void drm_sysfs_destroy(void)
 	drm_class = NULL;
 }
 
+static void drm_sysfs_release(struct device *dev)
+{
+	kfree(dev);
+}
+
 /*
  * Connector properties
  */
@@ -273,27 +282,47 @@ static const struct attribute_group *connector_dev_groups[] = {
 int drm_sysfs_connector_add(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
+	struct device *kdev;
+	int r;
 
 	if (connector->kdev)
 		return 0;
 
-	connector->kdev =
-		device_create_with_groups(drm_class, dev->primary->kdev, 0,
-					  connector, connector_dev_groups,
-					  "card%d-%s", dev->primary->index,
-					  connector->name);
+	kdev = kzalloc(sizeof(*kdev), GFP_KERNEL);
+	if (!kdev)
+		return -ENOMEM;
+
+	device_initialize(kdev);
+	kdev->class = drm_class;
+	kdev->type = &drm_sysfs_device_connector;
+	kdev->parent = dev->primary->kdev;
+	kdev->groups = connector_dev_groups;
+	kdev->release = drm_sysfs_release;
+	dev_set_drvdata(kdev, connector);
+
+	r = dev_set_name(kdev, "card%d-%s", dev->primary->index, connector->name);
+	if (r)
+		goto err_free;
+
 	DRM_DEBUG("adding \"%s\" to sysfs\n",
 		  connector->name);
 
-	if (IS_ERR(connector->kdev)) {
-		DRM_ERROR("failed to register connector device: %ld\n", PTR_ERR(connector->kdev));
-		return PTR_ERR(connector->kdev);
+	r = device_add(kdev);
+	if (r) {
+		DRM_ERROR("failed to register connector device: %d\n", r);
+		goto err_free;
 	}
 
+	connector->kdev = kdev;
+
 	if (connector->ddc)
 		return sysfs_create_link(&connector->kdev->kobj,
 				 &connector->ddc->dev.kobj, "ddc");
 	return 0;
+
+err_free:
+	put_device(kdev);
+	return r;
 }
 
 void drm_sysfs_connector_remove(struct drm_connector *connector)
@@ -374,11 +403,6 @@ void drm_sysfs_connector_status_event(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_sysfs_connector_status_event);
 
-static void drm_sysfs_release(struct device *dev)
-{
-	kfree(dev);
-}
-
 struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
 {
 	const char *minor_str;
-- 
2.31.1

