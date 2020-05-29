Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADD521E85F8
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 19:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728181AbgE2R5G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 13:57:06 -0400
Received: from asav22.altibox.net ([109.247.116.9]:39046 "EHLO
        asav22.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728030AbgE2R5G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 13:57:06 -0400
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav22.altibox.net (Postfix) with ESMTPSA id 6198A200C5;
        Fri, 29 May 2020 19:57:03 +0200 (CEST)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     dri-devel@lists.freedesktop.org, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, sam@ravnborg.org,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v3 2/6] drm/client: Add drm_client_modeset_disable()
Date:   Fri, 29 May 2020 19:56:39 +0200
Message-Id: <20200529175643.46094-3-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200529175643.46094-1-noralf@tronnes.org>
References: <20200529175643.46094-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=LvK8NEVc c=1 sm=1 tr=0
        a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
        a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8
        a=0d597LMeBdbU6fJEcaIA:9 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a way for clients to disable all outputs.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/drm_client_modeset.c | 20 ++++++++++++++++++++
 include/drm/drm_client.h             |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 27e2fb41f14d..977bcd063520 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -1225,3 +1225,23 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
 	return ret;
 }
 EXPORT_SYMBOL(drm_client_modeset_dpms);
+
+/**
+ * drm_client_modeset_disable() - Disable all outputs
+ * @client: DRM client
+ *
+ * This function disables all outputs by first clearing the modeset array and
+ * then committing the empty modesets.
+ *
+ * Returns:
+ * Zero on success or negative error code on failure.
+ */
+int drm_client_modeset_disable(struct drm_client_dev *client)
+{
+	mutex_lock(&client->modeset_mutex);
+	drm_client_modeset_release(client);
+	mutex_unlock(&client->modeset_mutex);
+
+	return drm_client_modeset_commit(client);
+}
+EXPORT_SYMBOL(drm_client_modeset_disable);
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index 76704f48fc46..498089b647da 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -168,6 +168,7 @@ int drm_client_modeset_check(struct drm_client_dev *client);
 int drm_client_modeset_commit_locked(struct drm_client_dev *client);
 int drm_client_modeset_commit(struct drm_client_dev *client);
 int drm_client_modeset_dpms(struct drm_client_dev *client, int mode);
+int drm_client_modeset_disable(struct drm_client_dev *client);
 
 /**
  * drm_client_for_each_modeset() - Iterate over client modesets
-- 
2.23.0

