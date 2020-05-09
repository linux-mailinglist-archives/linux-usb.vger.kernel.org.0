Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A834C1CC225
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2020 16:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728058AbgEIOQv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 May 2020 10:16:51 -0400
Received: from asav22.altibox.net ([109.247.116.9]:34162 "EHLO
        asav22.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727940AbgEIOQr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 May 2020 10:16:47 -0400
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav22.altibox.net (Postfix) with ESMTPSA id DF53B20192;
        Sat,  9 May 2020 16:16:43 +0200 (CEST)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        lee.jones@linaro.org
Cc:     sam@ravnborg.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v2 07/10] drm/format-helper: Add drm_fb_swab()
Date:   Sat,  9 May 2020 16:16:16 +0200
Message-Id: <20200509141619.32970-8-noralf@tronnes.org>
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
        a=-9A2zdw3ca-yCi4n-HUA:9 a=QEXdDO2ut3YA:10 a=E9Po1WZjFZOl8hwRPBS3:22
        a=vFet0B0WnEQeilDPIY6i:22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This replaces drm_fb_swab16() with drm_fb_swab() supporting 16 and 32-bit.
Also make pixel line caching optional.

v2:
- Bail out on cpp != 2 && 4 (Sam)

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/drm_format_helper.c | 61 +++++++++++++++++++----------
 drivers/gpu/drm/drm_mipi_dbi.c      |  2 +-
 include/drm/drm_format_helper.h     |  4 +-
 3 files changed, 44 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 0897cb9aeaff..07c9999f1527 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -79,39 +79,60 @@ void drm_fb_memcpy_dstclip(void __iomem *dst, void *vaddr,
 EXPORT_SYMBOL(drm_fb_memcpy_dstclip);
 
 /**
- * drm_fb_swab16 - Swap bytes into clip buffer
- * @dst: RGB565 destination buffer
- * @vaddr: RGB565 source buffer
+ * drm_fb_swab - Swap bytes into clip buffer
+ * @dst: Destination buffer
+ * @src: Source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
+ * @cached: Source buffer is mapped cached (eg. not write-combined)
+ *
+ * If @cached is false a temporary buffer is used to cache one pixel line at a
+ * time to speed up slow uncached reads.
+ *
+ * This function does not apply clipping on dst, i.e. the destination
+ * is a small buffer containing the clip rect only.
  */
-void drm_fb_swab16(u16 *dst, void *vaddr, struct drm_framebuffer *fb,
-		   struct drm_rect *clip)
+void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
+		 struct drm_rect *clip, bool cached)
 {
-	size_t len = (clip->x2 - clip->x1) * sizeof(u16);
+	u8 cpp = fb->format->cpp[0];
+	size_t len = drm_rect_width(clip) * cpp;
+	u16 *src16, *dst16 = dst;
+	u32 *src32, *dst32 = dst;
 	unsigned int x, y;
-	u16 *src, *buf;
+	void *buf = NULL;
 
-	/*
-	 * The cma memory is write-combined so reads are uncached.
-	 * Speed up by fetching one line at a time.
-	 */
-	buf = kmalloc(len, GFP_KERNEL);
-	if (!buf)
+	if (WARN_ON_ONCE(cpp != 2 && cpp != 4))
 		return;
 
+	if (!cached)
+		buf = kmalloc(len, GFP_KERNEL);
+
+	src += clip_offset(clip, fb->pitches[0], cpp);
+
 	for (y = clip->y1; y < clip->y2; y++) {
-		src = vaddr + (y * fb->pitches[0]);
-		src += clip->x1;
-		memcpy(buf, src, len);
-		src = buf;
-		for (x = clip->x1; x < clip->x2; x++)
-			*dst++ = swab16(*src++);
+		if (buf) {
+			memcpy(buf, src, len);
+			src16 = buf;
+			src32 = buf;
+		} else {
+			src16 = src;
+			src32 = src;
+		}
+
+		for (x = clip->x1; x < clip->x2; x++) {
+			if (cpp == 4)
+				*dst32++ = swab32(*src32++);
+			else
+				*dst16++ = swab16(*src16++);
+		}
+
+		src += fb->pitches[0];
 	}
 
 	kfree(buf);
 }
-EXPORT_SYMBOL(drm_fb_swab16);
+EXPORT_SYMBOL(drm_fb_swab);
 
 static void drm_fb_xrgb8888_to_rgb565_line(u16 *dbuf, u32 *sbuf,
 					   unsigned int pixels,
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 69e2b4122ce4..1447e26c0145 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -217,7 +217,7 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 	switch (fb->format->format) {
 	case DRM_FORMAT_RGB565:
 		if (swap)
-			drm_fb_swab16(dst, src, fb, clip);
+			drm_fb_swab(dst, src, fb, clip, !import_attach);
 		else
 			drm_fb_memcpy(dst, src, fb, clip);
 		break;
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index ac220aa1a245..5f9e37032468 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -14,8 +14,8 @@ void drm_fb_memcpy(void *dst, void *vaddr, struct drm_framebuffer *fb,
 void drm_fb_memcpy_dstclip(void __iomem *dst, void *vaddr,
 			   struct drm_framebuffer *fb,
 			   struct drm_rect *clip);
-void drm_fb_swab16(u16 *dst, void *vaddr, struct drm_framebuffer *fb,
-		   struct drm_rect *clip);
+void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
+		 struct drm_rect *clip, bool cached);
 void drm_fb_xrgb8888_to_rgb565(void *dst, void *vaddr,
 			       struct drm_framebuffer *fb,
 			       struct drm_rect *clip, bool swab);
-- 
2.23.0

