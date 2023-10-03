Return-Path: <linux-usb+bounces-1013-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C33C7B65A8
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 11:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id C2A9B2820D2
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 09:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A4E1DA21;
	Tue,  3 Oct 2023 09:40:17 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF99FC1A
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 09:40:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3C4EB3
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 02:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696326011; x=1727862011;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1GzGGqL3eYCWF6uioQFuYyJ2Ng0zkPlAmFBTlWWOXIw=;
  b=jORfcnzUJ/6Q+HcX1GX+HdbtEpbJalRhETIC5boKNxjIOMaveMWHFaWt
   DqO8ot0sxBwPhK1DqpNjGprWN/4wdjE1ofk5vqJc6UhclqWBEPRylMe4q
   P2yHC+920jvt+xjF2SLqJXmWAyNxo1B1uahnaAcjkBraacDFJ0SOEC+91
   WzJOMvjPQ0gdoYqwbgFsDVkIO35d7kiYHtNyMhrM8JLhHlzz8NnaJSVQc
   qCA8JGPX228c3BfcpYufye2AH26LMktiS0d2e5xjtd1EV+Zgjq0I29np0
   XbSA1lGYBLsfOdzKwWgftqcAQOMCWLuo3SG7nJ6dckwvwpMpI5vkatGgv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="362204830"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="362204830"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 02:40:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="727558484"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="727558484"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 03 Oct 2023 02:40:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 8F1A618AE; Tue,  3 Oct 2023 12:40:05 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 03/13] thunderbolt: Make tb_switch_clx_is_supported() static
Date: Tue,  3 Oct 2023 12:39:55 +0300
Message-Id: <20231003094005.2676823-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231003094005.2676823-1-mika.westerberg@linux.intel.com>
References: <20231003094005.2676823-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This function is not used outside of clx.c so make it static. No
functional changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/clx.c | 44 +++++++++++++++++++--------------------
 drivers/thunderbolt/tb.h  |  1 -
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/drivers/thunderbolt/clx.c b/drivers/thunderbolt/clx.c
index 13d217ae98e6..c08b9cf0371e 100644
--- a/drivers/thunderbolt/clx.c
+++ b/drivers/thunderbolt/clx.c
@@ -174,6 +174,28 @@ bool tb_port_clx_is_enabled(struct tb_port *port, unsigned int clx)
 	return !!(tb_port_clx(port) & clx);
 }
 
+/**
+ * tb_switch_clx_is_supported() - Is CLx supported on this type of router
+ * @sw: The router to check CLx support for
+ */
+static bool tb_switch_clx_is_supported(const struct tb_switch *sw)
+{
+	if (!clx_enabled)
+		return false;
+
+	if (sw->quirks & QUIRK_NO_CLX)
+		return false;
+
+	/*
+	 * CLx is not enabled and validated on Intel USB4 platforms
+	 * before Alder Lake.
+	 */
+	if (tb_switch_is_tiger_lake(sw))
+		return false;
+
+	return tb_switch_is_usb4(sw) || tb_switch_is_titan_ridge(sw);
+}
+
 /**
  * tb_switch_clx_init() - Initialize router CL states
  * @sw: Router
@@ -273,28 +295,6 @@ static int tb_switch_mask_clx_objections(struct tb_switch *sw)
 			   sw->cap_lp + offset, ARRAY_SIZE(val));
 }
 
-/**
- * tb_switch_clx_is_supported() - Is CLx supported on this type of router
- * @sw: The router to check CLx support for
- */
-bool tb_switch_clx_is_supported(const struct tb_switch *sw)
-{
-	if (!clx_enabled)
-		return false;
-
-	if (sw->quirks & QUIRK_NO_CLX)
-		return false;
-
-	/*
-	 * CLx is not enabled and validated on Intel USB4 platforms
-	 * before Alder Lake.
-	 */
-	if (tb_switch_is_tiger_lake(sw))
-		return false;
-
-	return tb_switch_is_usb4(sw) || tb_switch_is_titan_ridge(sw);
-}
-
 static bool validate_mask(unsigned int clx)
 {
 	/* Previous states need to be enabled */
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 06046f8ce50c..6f15b3a3e990 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1001,7 +1001,6 @@ static inline bool tb_switch_tmu_is_enabled(const struct tb_switch *sw)
 bool tb_port_clx_is_enabled(struct tb_port *port, unsigned int clx);
 
 int tb_switch_clx_init(struct tb_switch *sw);
-bool tb_switch_clx_is_supported(const struct tb_switch *sw);
 int tb_switch_clx_enable(struct tb_switch *sw, unsigned int clx);
 int tb_switch_clx_disable(struct tb_switch *sw);
 
-- 
2.40.1


