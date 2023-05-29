Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFA597147AF
	for <lists+linux-usb@lfdr.de>; Mon, 29 May 2023 12:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231958AbjE2KEo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 06:04:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231936AbjE2KEi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 06:04:38 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8845BC7
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 03:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685354677; x=1716890677;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tdwqur24UfFHd+KSL34nx+mjjTyCGH6ENa9Hg34uMhs=;
  b=a6EnofdDRjinMMTsDOQke/Ez1W9YDMVvWy2ofLb67TVk41EFRxuq7JT+
   bCnl4Y07XMknVzaPCr48OxmBl5xXhw9J6h0YguYN6aYeGNK/0YoDIEHRV
   QYJwF5CgAD7yoNB+CGNgS9Rr0QhsRienBM4I0gAGFz4KF7Lr1bJQThByy
   E8nokIVMA7xu/BR3Wxsc5pCDG8CjXwBq6Q0HJa3TsS+3TalFNNqvyYMFj
   /WohZPFlqoNbA+3Mx2qCg2JH6mG1M7KsmoIcM/Y2OWAtmJ4BKkucIXvJD
   i59NRwPAPnXkMyEowK4AI5gTzCT5T7tuosfHXGSs0m8tnfhF8tz18I/um
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="354684450"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="354684450"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 03:04:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="683518494"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="683518494"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2023 03:04:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 592E6C51; Mon, 29 May 2023 13:04:26 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 14/20] thunderbolt: Check for first depth router in tb.c
Date:   Mon, 29 May 2023 13:04:19 +0300
Message-Id: <20230529100425.6125-15-mika.westerberg@linux.intel.com>
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

Currently tb_switch_clx_enable() enables CL states only for the first
depth router. This is something we may want to change in the future and
in addition it is not visible from the calling path at all. For this
reason do the check in the tb.c so it is immediately visible that we
only do this for the first depth router. Fix the kernel-docs
accordingly.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/clx.c | 22 ++++++----------------
 drivers/thunderbolt/tb.c  | 10 ++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/thunderbolt/clx.c b/drivers/thunderbolt/clx.c
index 4601607f1901..b8cfbd643311 100644
--- a/drivers/thunderbolt/clx.c
+++ b/drivers/thunderbolt/clx.c
@@ -257,14 +257,12 @@ static const char *clx_name(unsigned int clx)
  * @sw: Router to enable CLx for
  * @clx: The CLx state to enable
  *
- * Enable CLx state only for first hop router. That is the most common
- * use-case, that is intended for better thermal management, and so helps
- * to improve performance. CLx is enabled only if both sides of the link
- * support CLx, and if both sides of the link are not configured as two
- * single lane links and only if the link is not inter-domain link. The
- * complete set of conditions is described in CM Guide 1.0 section 8.1.
+ * CLx is enabled only if both sides of the link support CLx, and if both sides
+ * of the link are not configured as two single lane links and only if the link
+ * is not inter-domain link. The complete set of conditions is described in CM
+ * Guide 1.0 section 8.1.
  *
- * Return: Returns 0 on success or an error code on failure.
+ * Returns %0 on success or an error code on failure.
  */
 int tb_switch_clx_enable(struct tb_switch *sw, unsigned int clx)
 {
@@ -284,10 +282,6 @@ int tb_switch_clx_enable(struct tb_switch *sw, unsigned int clx)
 	    !tb_switch_clx_is_supported(sw))
 		return 0;
 
-	/* Enable CLx only for first hop router (depth = 1) */
-	if (tb_route(tb_switch_parent(sw)))
-		return 0;
-
 	/* CL2 is not yet supported */
 	if (clx & TB_CL2)
 		return -EOPNOTSUPP;
@@ -340,7 +334,7 @@ int tb_switch_clx_enable(struct tb_switch *sw, unsigned int clx)
  * Disables all CL states of the given router. Can be called on any
  * router and if the states were not enabled already does nothing.
  *
- * Return: Returns 0 on success or an error code on failure.
+ * Returns %0 on success or an error code on failure.
  */
 int tb_switch_clx_disable(struct tb_switch *sw)
 {
@@ -351,10 +345,6 @@ int tb_switch_clx_disable(struct tb_switch *sw)
 	if (!tb_switch_clx_is_supported(sw))
 		return 0;
 
-	/* Disable CLx only for first hop router (depth = 1) */
-	if (tb_route(tb_switch_parent(sw)))
-		return 0;
-
 	if (!clx)
 		return 0;
 
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 2d360508aeeb..1d056ff6d77f 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -244,6 +244,16 @@ static int tb_enable_clx(struct tb_switch *sw)
 {
 	int ret;
 
+	/*
+	 * Currently only enable CLx for the first link. This is enough
+	 * to allow the CPU to save energy at least on Intel hardware
+	 * and makes it slightly simpler to implement. We may change
+	 * this in the future to cover the whole topology if it turns
+	 * out to be beneficial.
+	 */
+	if (sw->config.depth != 1)
+		return 0;
+
 	/*
 	 * CL0s and CL1 are enabled and supported together.
 	 * Silently ignore CLx enabling in case CLx is not supported.
-- 
2.39.2

