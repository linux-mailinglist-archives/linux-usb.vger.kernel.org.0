Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE1D87147AE
	for <lists+linux-usb@lfdr.de>; Mon, 29 May 2023 12:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbjE2KEn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 06:04:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231932AbjE2KEi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 06:04:38 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C29DBBE
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 03:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685354676; x=1716890676;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HCL2y1xXfnUz7sRHFmtysR58hKnSfNBw2Kd0xE9pgmo=;
  b=SXnOH7ekejKrE/YgWWGzs7aF/FTonF9MFw9Ye0fGcyGHsudPJLMGjZUW
   WBjNUrr0i3c7FjZegbbim0vu9bNOHh+bx11LOQLH5IOAqZ8AhXcy6g7SN
   +yxoyyNbVI/0chkOthyRwt8ZpjUn8JIZOjSW7KoKVruiP+KZNQinqVOKe
   WuA2jb/D37+kNDo1XGaWWyJMNR73BwkJq3XN/dXYYwL2YUb6s6Pxyth4I
   qGGgl56EPv48KHOvPGNuQFq9z8Jj8W72UW8AURBMYMnTfDayn/KyDBFnG
   iXOD7us8auobH5G31mJ38prG8ZPdhS8Pv7zw438ZRkN4swabjZVWwLzib
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="354684447"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="354684447"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 03:04:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="683518474"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="683518474"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2023 03:04:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 426CE943; Mon, 29 May 2023 13:04:26 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 11/20] thunderbolt: Get rid of __tb_switch_[en|dis]able_clx()
Date:   Mon, 29 May 2023 13:04:16 +0300
Message-Id: <20230529100425.6125-12-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230529100425.6125-1-mika.westerberg@linux.intel.com>
References: <20230529100425.6125-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No need to have separate functions for these so fold them into
tb_switch_clx_enable() and tb_switch_clx_disable() accordingly.

No functional changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/clx.c | 91 ++++++++++++++++++---------------------
 1 file changed, 42 insertions(+), 49 deletions(-)

diff --git a/drivers/thunderbolt/clx.c b/drivers/thunderbolt/clx.c
index d5b46a8e57c9..d1a502525425 100644
--- a/drivers/thunderbolt/clx.c
+++ b/drivers/thunderbolt/clx.c
@@ -205,12 +205,46 @@ static int tb_switch_mask_clx_objections(struct tb_switch *sw)
 			   sw->cap_lp + offset, ARRAY_SIZE(val));
 }
 
-static int __tb_switch_enable_clx(struct tb_switch *sw, enum tb_clx clx)
+/**
+ * tb_switch_clx_enable() - Enable CLx on upstream port of specified router
+ * @sw: Router to enable CLx for
+ * @clx: The CLx state to enable
+ *
+ * Enable CLx state only for first hop router. That is the most common
+ * use-case, that is intended for better thermal management, and so helps
+ * to improve performance. CLx is enabled only if both sides of the link
+ * support CLx, and if both sides of the link are not configured as two
+ * single lane links and only if the link is not inter-domain link. The
+ * complete set of conditions is described in CM Guide 1.0 section 8.1.
+ *
+ * Return: Returns 0 on success or an error code on failure.
+ */
+int tb_switch_clx_enable(struct tb_switch *sw, enum tb_clx clx)
 {
+	struct tb_switch *root_sw = sw->tb->root_switch;
 	bool up_clx_support, down_clx_support;
 	struct tb_port *up, *down;
 	int ret;
 
+	if (!clx_enabled)
+		return 0;
+
+	/*
+	 * CLx is not enabled and validated on Intel USB4 platforms before
+	 * Alder Lake.
+	 */
+	if (root_sw->generation < 4 || tb_switch_is_tiger_lake(root_sw))
+		return 0;
+
+	switch (clx) {
+	case TB_CL1:
+		/* CL0s and CL1 are enabled and supported together */
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
 	if (!tb_switch_clx_is_supported(sw))
 		return 0;
 
@@ -267,47 +301,28 @@ static int __tb_switch_enable_clx(struct tb_switch *sw, enum tb_clx clx)
 }
 
 /**
- * tb_switch_clx_enable() - Enable CLx on upstream port of specified router
- * @sw: Router to enable CLx for
- * @clx: The CLx state to enable
- *
- * Enable CLx state only for first hop router. That is the most common
- * use-case, that is intended for better thermal management, and so helps
- * to improve performance. CLx is enabled only if both sides of the link
- * support CLx, and if both sides of the link are not configured as two
- * single lane links and only if the link is not inter-domain link. The
- * complete set of conditions is described in CM Guide 1.0 section 8.1.
+ * tb_switch_clx_disable() - Disable CLx on upstream port of specified router
+ * @sw: Router to disable CLx for
+ * @clx: The CLx state to disable
  *
  * Return: Returns 0 on success or an error code on failure.
  */
-int tb_switch_clx_enable(struct tb_switch *sw, enum tb_clx clx)
+int tb_switch_clx_disable(struct tb_switch *sw, enum tb_clx clx)
 {
-	struct tb_switch *root_sw = sw->tb->root_switch;
+	struct tb_port *up, *down;
+	int ret;
 
 	if (!clx_enabled)
 		return 0;
 
-	/*
-	 * CLx is not enabled and validated on Intel USB4 platforms before
-	 * Alder Lake.
-	 */
-	if (root_sw->generation < 4 || tb_switch_is_tiger_lake(root_sw))
-		return 0;
-
 	switch (clx) {
 	case TB_CL1:
 		/* CL0s and CL1 are enabled and supported together */
-		return __tb_switch_enable_clx(sw, clx);
+		break;
 
 	default:
 		return -EOPNOTSUPP;
 	}
-}
-
-static int __tb_switch_disable_clx(struct tb_switch *sw, enum tb_clx clx)
-{
-	struct tb_port *up, *down;
-	int ret;
 
 	if (!tb_switch_clx_is_supported(sw))
 		return 0;
@@ -338,25 +353,3 @@ static int __tb_switch_disable_clx(struct tb_switch *sw, enum tb_clx clx)
 	tb_port_dbg(up, "%s disabled\n", tb_switch_clx_name(clx));
 	return 0;
 }
-
-/**
- * tb_switch_cls_disable() - Disable CLx on upstream port of specified router
- * @sw: Router to disable CLx for
- * @clx: The CLx state to disable
- *
- * Return: Returns 0 on success or an error code on failure.
- */
-int tb_switch_clx_disable(struct tb_switch *sw, enum tb_clx clx)
-{
-	if (!clx_enabled)
-		return 0;
-
-	switch (clx) {
-	case TB_CL1:
-		/* CL0s and CL1 are enabled and supported together */
-		return __tb_switch_disable_clx(sw, clx);
-
-	default:
-		return -EOPNOTSUPP;
-	}
-}
-- 
2.39.2

