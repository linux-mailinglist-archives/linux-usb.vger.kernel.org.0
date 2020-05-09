Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACE481CC213
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2020 16:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727982AbgEIOQp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 May 2020 10:16:45 -0400
Received: from asav22.altibox.net ([109.247.116.9]:34116 "EHLO
        asav22.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727845AbgEIOQp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 May 2020 10:16:45 -0400
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav22.altibox.net (Postfix) with ESMTPSA id DCFB52018B;
        Sat,  9 May 2020 16:16:42 +0200 (CEST)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        lee.jones@linaro.org
Cc:     sam@ravnborg.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v2 04/10] drm/client: Add drm_client_modeset_check()
Date:   Sat,  9 May 2020 16:16:13 +0200
Message-Id: <20200509141619.32970-5-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200509141619.32970-1-noralf@tronnes.org>
References: <20200509141619.32970-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=R7It5+ZX c=1 sm=1 tr=0
        a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
        a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=7gkXJVJtAAAA:8 a=SJz97ENfAAAA:8
        a=NCESiyWrsFzEEJbiIYUA:9 a=QEXdDO2ut3YA:10 a=E9Po1WZjFZOl8hwRPBS3:22
        a=vFet0B0WnEQeilDPIY6i:22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a way for client to check the configuration before comitting.

v2:
- Fix docs (Sam)

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/drm_client_modeset.c | 35 ++++++++++++++++++++++++----
 include/drm/drm_client.h             |  1 +
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 7443114bd713..9d1ab69dd8d0 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -966,7 +966,7 @@ bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation)
 }
 EXPORT_SYMBOL(drm_client_rotation);
 
-static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool active)
+static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool active, bool check)
 {
 	struct drm_device *dev = client->dev;
 	struct drm_plane *plane;
@@ -1033,7 +1033,10 @@ static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool
 		}
 	}
 
-	ret = drm_atomic_commit(state);
+	if (check)
+		ret = drm_atomic_check_only(state);
+	else
+		ret = drm_atomic_commit(state);
 
 out_state:
 	if (ret == -EDEADLK)
@@ -1094,6 +1097,30 @@ static int drm_client_modeset_commit_legacy(struct drm_client_dev *client)
 	return ret;
 }
 
+/**
+ * drm_client_modeset_check() - Check modeset configuration
+ * @client: DRM client
+ *
+ * Check modeset configuration.
+ *
+ * Returns:
+ * Zero on success or negative error code on failure.
+ */
+int drm_client_modeset_check(struct drm_client_dev *client)
+{
+	int ret;
+
+	if (!drm_drv_uses_atomic_modeset(client->dev))
+		return 0;
+
+	mutex_lock(&client->modeset_mutex);
+	ret = drm_client_modeset_commit_atomic(client, true, true);
+	mutex_unlock(&client->modeset_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_client_modeset_check);
+
 /**
  * drm_client_modeset_commit_locked() - Force commit CRTC configuration
  * @client: DRM client
@@ -1112,7 +1139,7 @@ int drm_client_modeset_commit_locked(struct drm_client_dev *client)
 
 	mutex_lock(&client->modeset_mutex);
 	if (drm_drv_uses_atomic_modeset(dev))
-		ret = drm_client_modeset_commit_atomic(client, true);
+		ret = drm_client_modeset_commit_atomic(client, true, false);
 	else
 		ret = drm_client_modeset_commit_legacy(client);
 	mutex_unlock(&client->modeset_mutex);
@@ -1188,7 +1215,7 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
 
 	mutex_lock(&client->modeset_mutex);
 	if (drm_drv_uses_atomic_modeset(dev))
-		ret = drm_client_modeset_commit_atomic(client, mode == DRM_MODE_DPMS_ON);
+		ret = drm_client_modeset_commit_atomic(client, mode == DRM_MODE_DPMS_ON, false);
 	else
 		drm_client_modeset_dpms_legacy(client, mode);
 	mutex_unlock(&client->modeset_mutex);
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index 9737dd7b147f..76704f48fc46 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -164,6 +164,7 @@ int drm_client_modeset_create(struct drm_client_dev *client);
 void drm_client_modeset_free(struct drm_client_dev *client);
 int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width, unsigned int height);
 bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation);
+int drm_client_modeset_check(struct drm_client_dev *client);
 int drm_client_modeset_commit_locked(struct drm_client_dev *client);
 int drm_client_modeset_commit(struct drm_client_dev *client);
 int drm_client_modeset_dpms(struct drm_client_dev *client, int mode);
-- 
2.23.0

