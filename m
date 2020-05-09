Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2A801CC211
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2020 16:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbgEIOQq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 May 2020 10:16:46 -0400
Received: from asav22.altibox.net ([109.247.116.9]:34102 "EHLO
        asav22.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727840AbgEIOQp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 May 2020 10:16:45 -0400
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav22.altibox.net (Postfix) with ESMTPSA id 90EB22016D;
        Sat,  9 May 2020 16:16:42 +0200 (CEST)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        lee.jones@linaro.org
Cc:     sam@ravnborg.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v2 03/10] drm/client: Add drm_client_framebuffer_flush()
Date:   Sat,  9 May 2020 16:16:12 +0200
Message-Id: <20200509141619.32970-4-noralf@tronnes.org>
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
        a=0jVh_8K4HvQRDTyCFMcA:9 a=QEXdDO2ut3YA:10 a=E9Po1WZjFZOl8hwRPBS3:22
        a=vFet0B0WnEQeilDPIY6i:22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some drivers need explicit flushing of buffer changes, add a function
that does that.

v2:
- Put all clip rect stuff inside if statement (Sam)

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/drm_client.c | 33 +++++++++++++++++++++++++++++++++
 include/drm/drm_client.h     |  1 +
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 12787915db01..827ee6422dd2 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -483,6 +483,39 @@ void drm_client_framebuffer_delete(struct drm_client_buffer *buffer)
 }
 EXPORT_SYMBOL(drm_client_framebuffer_delete);
 
+/**
+ * drm_client_framebuffer_flush - Manually flush client framebuffer
+ * @buffer: DRM client buffer (can be NULL)
+ * @rect: Damage rectangle (if NULL flushes all)
+ *
+ * This calls &drm_framebuffer_funcs->dirty (if present) to flush buffer changes
+ * for drivers that need it.
+ *
+ * Returns:
+ * Zero on success or negative error code on failure.
+ */
+int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect)
+{
+	if (!buffer || !buffer->fb || !buffer->fb->funcs->dirty)
+		return 0;
+
+	if (rect) {
+		struct drm_clip_rect clip = {
+			.x1 = rect->x1,
+			.y1 = rect->y1,
+			.x2 = rect->x2,
+			.y2 = rect->y2,
+		};
+
+		return buffer->fb->funcs->dirty(buffer->fb, buffer->client->file,
+						0, 0, &clip, 1);
+	}
+
+	return buffer->fb->funcs->dirty(buffer->fb, buffer->client->file,
+					0, 0, NULL, 0);
+}
+EXPORT_SYMBOL(drm_client_framebuffer_flush);
+
 #ifdef CONFIG_DEBUG_FS
 static int drm_client_debugfs_internal_clients(struct seq_file *m, void *data)
 {
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index 96ebc7523aa0..9737dd7b147f 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -156,6 +156,7 @@ struct drm_client_buffer {
 struct drm_client_buffer *
 drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format);
 void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);
+int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
 void *drm_client_buffer_vmap(struct drm_client_buffer *buffer);
 void drm_client_buffer_vunmap(struct drm_client_buffer *buffer);
 
-- 
2.23.0

