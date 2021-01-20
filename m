Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDB52FD6B9
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jan 2021 18:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728706AbhATRRM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Jan 2021 12:17:12 -0500
Received: from asav21.altibox.net ([109.247.116.8]:32934 "EHLO
        asav21.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404157AbhATRLx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Jan 2021 12:11:53 -0500
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav21.altibox.net (Postfix) with ESMTPSA id 0EE6D8015D;
        Wed, 20 Jan 2021 18:00:53 +0100 (CET)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-usb@vger.kernel.org, sam@ravnborg.org, peter@stuge.se,
        lkundrak@v3.sk, markus@raatikainen.cc, pontus.fuchs@gmail.com,
        hudson@trmm.net, th020394@gmail.com,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v4 1/3] drm/uapi: Add USB connector type
Date:   Wed, 20 Jan 2021 18:00:31 +0100
Message-Id: <20210120170033.38468-2-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210120170033.38468-1-noralf@tronnes.org>
References: <20210120170033.38468-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=LfoSFAXi c=1 sm=1 tr=0
        a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
        a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8
        a=DG4e56V3FeCVKFaCFEkA:9 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a connector type for USB connected display panels.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 include/uapi/drm/drm_mode.h | 1 +
 1 file changed, 1 insertion(+)

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

