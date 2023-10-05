Return-Path: <linux-usb+bounces-1130-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 322317B9D9C
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 15:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id D5DDE2825EF
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 13:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0951827726;
	Thu,  5 Oct 2023 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JrJ5OEH8"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D1D26E37
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 13:50:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F4C51FCF
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 06:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696513803; x=1728049803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Tq19dG8HTV0HD++pkzwJ9cD7yL1DaQZBgD7uGCv1/tY=;
  b=JrJ5OEH8mPaIJvbVMzfppoKUfY1CHEtdvjvC1KbNroyQLPMeyqwgYRbP
   rbD83OU/QI8CHB7nZ7VMvbNffm6B7TYUF/rNkpNgJVesI2RwWoP4T3JOu
   UfnIz95a8veZwlugMqDp3hMAIJZj7JT4oKSvUlBXtevJyhlFbPrH0TTVB
   ttAwi0KtghTSvIykp1OpT+e+hUTQBQvvnSINyUwwsOt7ace9KkxkaLOZT
   MebirpauyBMCLGGkpQD3uRGzSPbmnD9K+hPfdqOQP/Aey5sAQYsG/HH14
   eileXj1f77eGgezJtePq6BxLGw+JNIfLMi5W1i+wstZ5lGIURCIvDNWRj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="383355563"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="383355563"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 02:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="728369869"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="728369869"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 05 Oct 2023 02:27:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id ED3F04A0; Thu,  5 Oct 2023 12:27:29 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 03/10] thunderbolt: Make is_gen4_link() available to the rest of the driver
Date: Thu,  5 Oct 2023 12:27:22 +0300
Message-Id: <20231005092729.3595447-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231005092729.3595447-1-mika.westerberg@linux.intel.com>
References: <20231005092729.3595447-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

From: Gil Fine <gil.fine@linux.intel.com>

Rework the function to return the link generation, update the name to
tb_port_get_link_generation(), and make available to the rest of the
driver. This is needed in the subsequent patches.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 36 +++++++++++++++++++++++++++++-------
 drivers/thunderbolt/tb.h     |  1 +
 2 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index c80421eff558..bd987935d9c9 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -915,6 +915,32 @@ int tb_port_get_link_speed(struct tb_port *port)
 	}
 }
 
+/**
+ * tb_port_get_link_generation() - Returns link generation
+ * @port: Lane adapter
+ *
+ * Returns link generation as number or negative errno in case of
+ * failure. Does not distinguish between Thunderbolt 1 and Thunderbolt 2
+ * links so for those always returns 2.
+ */
+int tb_port_get_link_generation(struct tb_port *port)
+{
+	int ret;
+
+	ret = tb_port_get_link_speed(port);
+	if (ret < 0)
+		return ret;
+
+	switch (ret) {
+	case 40:
+		return 4;
+	case 20:
+		return 3;
+	default:
+		return 2;
+	}
+}
+
 /**
  * tb_port_get_link_width() - Get current link width
  * @port: Port to check (USB4 or CIO)
@@ -960,11 +986,6 @@ static bool tb_port_is_width_supported(struct tb_port *port,
 	return widths & width_mask;
 }
 
-static bool is_gen4_link(struct tb_port *port)
-{
-	return tb_port_get_link_speed(port) > 20;
-}
-
 /**
  * tb_port_set_link_width() - Set target link width of the lane adapter
  * @port: Lane adapter
@@ -992,7 +1013,7 @@ int tb_port_set_link_width(struct tb_port *port, enum tb_link_width width)
 	switch (width) {
 	case TB_LINK_WIDTH_SINGLE:
 		/* Gen 4 link cannot be single */
-		if (is_gen4_link(port))
+		if (tb_port_get_link_generation(port) >= 4)
 			return -EOPNOTSUPP;
 		val |= LANE_ADP_CS_1_TARGET_WIDTH_SINGLE <<
 			LANE_ADP_CS_1_TARGET_WIDTH_SHIFT;
@@ -1141,7 +1162,8 @@ int tb_port_wait_for_link_width(struct tb_port *port, unsigned int width_mask,
 	int ret;
 
 	/* Gen 4 link does not support single lane */
-	if ((width_mask & TB_LINK_WIDTH_SINGLE) && is_gen4_link(port))
+	if ((width_mask & TB_LINK_WIDTH_SINGLE) &&
+	    tb_port_get_link_generation(port) >= 4)
 		return -EOPNOTSUPP;
 
 	do {
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 6f15b3a3e990..f29bbafb977f 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1057,6 +1057,7 @@ static inline bool tb_port_use_credit_allocation(const struct tb_port *port)
 	     (p) = tb_next_port_on_path((src), (dst), (p)))
 
 int tb_port_get_link_speed(struct tb_port *port);
+int tb_port_get_link_generation(struct tb_port *port);
 int tb_port_get_link_width(struct tb_port *port);
 int tb_port_set_link_width(struct tb_port *port, enum tb_link_width width);
 int tb_port_lane_bonding_enable(struct tb_port *port);
-- 
2.40.1


