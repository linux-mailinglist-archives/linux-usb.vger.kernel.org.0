Return-Path: <linux-usb+bounces-1021-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB1C7B65B0
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 11:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id D0E941C208DA
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 09:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71FED10798;
	Tue,  3 Oct 2023 09:40:20 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7881C6AD
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 09:40:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C744C9
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 02:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696326016; x=1727862016;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=047/H6ZHfhIFDN+OlVFlG7cVWX2p4uRzph5yzn9zEr0=;
  b=VDYuX7qdx8oox5bGG3zg0QfuUa8zvRX4YgAdpnLJuLEIFzgVLrV4TvnG
   HlgU3vabFXnkXkNvnSdntjiJ/zBTPKUAwT6Gie8Z3MBIrH+PcAPH6DJHG
   OdLK9Qyb0SmkWvE+ACdJjRzkl5kHCvTj+gjQeAwKgmD8H5UQbuchgNJZ5
   zoCAkLlFRn/n00EyTa3lGx4ecIgifqNvza5PuA7RHo90brR9YKixRmNOW
   nzP+lsmINefJLDMcLQtRrnOtHjDm8fMpmpvldYl6F1jr8wzqUL7hcwVh0
   X5vB+nHzTXwmL3WgNN5kH6BE5aHc7v8f2QaaB4kYqiOhvigaKvQwkT9NI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1424905"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="1424905"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 02:40:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="997945488"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="997945488"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 03 Oct 2023 02:40:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id D6EAF2123; Tue,  3 Oct 2023 12:40:05 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 12/13] thunderbolt: Create multiple DisplayPort tunnels if there are more DP IN/OUT pairs
Date: Tue,  3 Oct 2023 12:40:04 +0300
Message-Id: <20231003094005.2676823-13-mika.westerberg@linux.intel.com>
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

From: Gil Fine <gil.fine@linux.intel.com>

Currently we only create one DisplayPort tunnel even if there would be
more DP IN/OUT pairs available. Specifically this happens when a router
is unplugged and we check if a new DisplayPort tunnel can be created. To
cover this create tunnels as long as we find suitable DP IN/OUT pairs.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 3b3f46edfb70..238156358849 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1284,18 +1284,13 @@ static struct tb_port *tb_find_dp_out(struct tb *tb, struct tb_port *in)
 	return NULL;
 }
 
-static void tb_tunnel_dp(struct tb *tb)
+static bool tb_tunnel_one_dp(struct tb *tb)
 {
 	int available_up, available_down, ret, link_nr;
 	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_port *port, *in, *out;
 	struct tb_tunnel *tunnel;
 
-	if (!tb_acpi_may_tunnel_dp()) {
-		tb_dbg(tb, "DP tunneling disabled, not creating tunnel\n");
-		return;
-	}
-
 	/*
 	 * Find pair of inactive DP IN and DP OUT adapters and then
 	 * establish a DP tunnel between them.
@@ -1323,11 +1318,11 @@ static void tb_tunnel_dp(struct tb *tb)
 
 	if (!in) {
 		tb_dbg(tb, "no suitable DP IN adapter available, not tunneling\n");
-		return;
+		return false;
 	}
 	if (!out) {
 		tb_dbg(tb, "no suitable DP OUT adapter available, not tunneling\n");
-		return;
+		return false;
 	}
 
 	/*
@@ -1400,7 +1395,7 @@ static void tb_tunnel_dp(struct tb *tb)
 	 * TMU mode to HiFi for CL0s to work.
 	 */
 	tb_increase_tmu_accuracy(tunnel);
-	return;
+	return true;
 
 err_free:
 	tb_tunnel_free(tunnel);
@@ -1415,6 +1410,19 @@ static void tb_tunnel_dp(struct tb *tb)
 	pm_runtime_put_autosuspend(&out->sw->dev);
 	pm_runtime_mark_last_busy(&in->sw->dev);
 	pm_runtime_put_autosuspend(&in->sw->dev);
+
+	return false;
+}
+
+static void tb_tunnel_dp(struct tb *tb)
+{
+	if (!tb_acpi_may_tunnel_dp()) {
+		tb_dbg(tb, "DP tunneling disabled, not creating tunnel\n");
+		return;
+	}
+
+	while (tb_tunnel_one_dp(tb))
+		;
 }
 
 static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port)
-- 
2.40.1


