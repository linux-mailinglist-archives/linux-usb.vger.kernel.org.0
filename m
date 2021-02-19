Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF3A31F950
	for <lists+linux-usb@lfdr.de>; Fri, 19 Feb 2021 13:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbhBSMSO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Feb 2021 07:18:14 -0500
Received: from asav21.altibox.net ([109.247.116.8]:50382 "EHLO
        asav21.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbhBSMSN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Feb 2021 07:18:13 -0500
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav21.altibox.net (Postfix) with ESMTPSA id 81D1280106;
        Fri, 19 Feb 2021 13:17:10 +0100 (CET)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-usb@vger.kernel.org, sam@ravnborg.org, peter@stuge.se,
        lkundrak@v3.sk, markus@raatikainen.cc, pontus.fuchs@gmail.com,
        hudson@trmm.net, th020394@gmail.com,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v6 1/3] drm/uapi: Add USB connector type
Date:   Fri, 19 Feb 2021 13:17:00 +0100
Message-Id: <20210219121702.50964-2-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210219121702.50964-1-noralf@tronnes.org>
References: <20210219121702.50964-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Kb38TzQD c=1 sm=1 tr=0
        a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
        a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8
        a=sSyzFPz0vM96QvMiUssA:9 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a connector type for USB connected display panels.

Some examples of what current userspace will name the connector:
- Weston: "UNNAMED-%d"
- Mutter: "Unknown20-%d"
- X: "Unknown20-%d"

v2:
- Update drm_connector_enum_list
- Add examples to commit message

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/drm_connector.c | 1 +
 include/uapi/drm/drm_mode.h     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 717c4e7271b0..52712daed3bc 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -94,6 +94,7 @@ static struct drm_conn_prop_enum_list drm_connector_enum_list[] = {
 	{ DRM_MODE_CONNECTOR_DPI, "DPI" },
 	{ DRM_MODE_CONNECTOR_WRITEBACK, "Writeback" },
 	{ DRM_MODE_CONNECTOR_SPI, "SPI" },
+	{ DRM_MODE_CONNECTOR_USB, "USB" },
 };
 
 void drm_connector_ida_init(void)
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index fed66a03c7ae..33024cc5d26e 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -367,6 +367,7 @@ enum drm_mode_subconnector {
 #define DRM_MODE_CONNECTOR_DPI		17
 #define DRM_MODE_CONNECTOR_WRITEBACK	18
 #define DRM_MODE_CONNECTOR_SPI		19
+#define DRM_MODE_CONNECTOR_USB		20
 
 /**
  * struct drm_mode_get_connector - Get connector metadata.
-- 
2.23.0

