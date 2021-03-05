Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C814532F019
	for <lists+linux-usb@lfdr.de>; Fri,  5 Mar 2021 17:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbhCEQbl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Mar 2021 11:31:41 -0500
Received: from asav21.altibox.net ([109.247.116.8]:37740 "EHLO
        asav21.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbhCEQbX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Mar 2021 11:31:23 -0500
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav21.altibox.net (Postfix) with ESMTPSA id C57B480199;
        Fri,  5 Mar 2021 17:31:16 +0100 (CET)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-usb@vger.kernel.org, sam@ravnborg.org, peter@stuge.se,
        lkundrak@v3.sk, markus@raatikainen.cc, pontus.fuchs@gmail.com,
        hudson@trmm.net, th020394@gmail.com,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v7 2/3] drm/probe-helper: Check epoch counter in output_poll_execute()
Date:   Fri,  5 Mar 2021 17:31:03 +0100
Message-Id: <20210305163104.30756-3-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210305163104.30756-1-noralf@tronnes.org>
References: <20210305163104.30756-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=PJ4hB8iC c=1 sm=1 tr=0
        a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
        a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8
        a=rnb-knuk5dQJkhbuddwA:9 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
        a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

drm_helper_hpd_irq_event() checks the epoch counter to determine
connector status change. This was introduced in
commit 5186421cbfe2 ("drm: Introduce epoch counter to drm_connector").
Do the same for output_poll_execute() so it can detect other changes
beside connection status value changes.

v2:
- Add Fixes tag (Daniel)

Fixes: 5186421cbfe2 ("drm: Introduce epoch counter to drm_connector")
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/drm_probe_helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index d6017726cc2a..e5432dcf6999 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -623,6 +623,7 @@ static void output_poll_execute(struct work_struct *work)
 	struct drm_connector_list_iter conn_iter;
 	enum drm_connector_status old_status;
 	bool repoll = false, changed;
+	u64 old_epoch_counter;
 
 	if (!dev->mode_config.poll_enabled)
 		return;
@@ -659,8 +660,9 @@ static void output_poll_execute(struct work_struct *work)
 
 		repoll = true;
 
+		old_epoch_counter = connector->epoch_counter;
 		connector->status = drm_helper_probe_detect(connector, NULL, false);
-		if (old_status != connector->status) {
+		if (old_epoch_counter != connector->epoch_counter) {
 			const char *old, *new;
 
 			/*
@@ -689,6 +691,9 @@ static void output_poll_execute(struct work_struct *work)
 				      connector->base.id,
 				      connector->name,
 				      old, new);
+			DRM_DEBUG_KMS("[CONNECTOR:%d:%s] epoch counter %llu -> %llu\n",
+				      connector->base.id, connector->name,
+				      old_epoch_counter, connector->epoch_counter);
 
 			changed = true;
 		}
-- 
2.23.0

