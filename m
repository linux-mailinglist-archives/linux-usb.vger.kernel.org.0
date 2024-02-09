Return-Path: <linux-usb+bounces-6162-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F8284F6F5
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 15:16:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CD741F228BA
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 14:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5535A745C8;
	Fri,  9 Feb 2024 14:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKs/TPh1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229796A8AB
	for <linux-usb@vger.kernel.org>; Fri,  9 Feb 2024 14:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707488026; cv=none; b=d6oKWLZnuCEWDkDC/1bNE3Q/aWWKNB2xyUmMcglQhj91TzNYiWpBdT2wy9pQW5K9pq5v7guEPEcw+k3mjTvKn7Us+xc3MygHteroj7+gfKPI85VWEx4M60Dcxmzfas+FNp2K848Jf0WAYwKMIkj1K6odSFVkCJq6lMDSZjJpzcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707488026; c=relaxed/simple;
	bh=iTDKHIBodDKuw0g9lRLNElQMT2IsQWp6pRpcPWav0AE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sWy0LbigMTWYdBQNUDkTpIBxc7lhQvmYDLqiMh0Xzslj0sinlIsWM0/JZe5wc2uJj5TRGM3dZe3u361IMEz4EZs75qEq6L5nZFHvetZkofhTRMDvcQqvtlRyZKQQu3xm43KMxjhvG/X4XwOOMmTYd6PMYFy6kjsp0Bz7o9WAu3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FKs/TPh1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707488025; x=1739024025;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iTDKHIBodDKuw0g9lRLNElQMT2IsQWp6pRpcPWav0AE=;
  b=FKs/TPh19UvJQuJDj75TRKuRht8X9rM01xqzW+jVyGLJjVA6cKu1aH/i
   s35BHs6GOuSFaQUEgePLaxPVyjkVaGj8xNSSl66giRDnDSpQJ3/UK6gA9
   /IYQSPA02u6vYKIoZuhA03JjDhlJhQNIePn6cwfdpUiYROBcqnQF/G9td
   3PRc2qa303uzWSxnaNQH+tKhG8JAUjelTC13iULVpseHalOtDLrzZb6Yx
   zj3iosqzk754rleFYnj/fCGKQsohN9YTP4082NDorjTLRGCxyoVB2hQu7
   f4zi/bMwx2eaFlEBCjfGZWBhj1hjUqtq1AhSohviJzdbiaGm9xi7Asb5O
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12082132"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="12082132"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 06:13:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="934434446"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="934434446"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2024 06:13:40 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 10FD1F23; Fri,  9 Feb 2024 16:13:36 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 10/10] thunderbolt: Improve DisplayPort tunnel setup process to be more robust
Date: Fri,  9 Feb 2024 16:13:35 +0200
Message-ID: <20240209141335.2286786-11-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209141335.2286786-1-mika.westerberg@linux.intel.com>
References: <20240209141335.2286786-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gil Fine <gil.fine@linux.intel.com>

After DisplayPort tunnel setup, we add verification that the DPRX
capabilities read process completed. Otherwise, we bail out, teardown
the tunnel, and try setup another DisplayPort tunnel using next
available DP IN adapter. We do so till all DP IN adapters tried. This
way, we avoid allocating DP IN adapter and (bandwidth for it) for
unusable tunnel.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 84 ++++++++++++++++++++--------------------
 1 file changed, 43 insertions(+), 41 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index eda53567fa4a..306c62c35a05 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1821,48 +1821,14 @@ static struct tb_port *tb_find_dp_out(struct tb *tb, struct tb_port *in)
 	return NULL;
 }
 
-static bool tb_tunnel_one_dp(struct tb *tb)
+static bool tb_tunnel_one_dp(struct tb *tb, struct tb_port *in,
+			     struct tb_port *out)
 {
 	int available_up, available_down, ret, link_nr;
 	struct tb_cm *tcm = tb_priv(tb);
-	struct tb_port *port, *in, *out;
 	int consumed_up, consumed_down;
 	struct tb_tunnel *tunnel;
 
-	/*
-	 * Find pair of inactive DP IN and DP OUT adapters and then
-	 * establish a DP tunnel between them.
-	 */
-	tb_dbg(tb, "looking for DP IN <-> DP OUT pairs:\n");
-
-	in = NULL;
-	out = NULL;
-	list_for_each_entry(port, &tcm->dp_resources, list) {
-		if (!tb_port_is_dpin(port))
-			continue;
-
-		if (tb_port_is_enabled(port)) {
-			tb_port_dbg(port, "DP IN in use\n");
-			continue;
-		}
-
-		in = port;
-		tb_port_dbg(in, "DP IN available\n");
-
-		out = tb_find_dp_out(tb, port);
-		if (out)
-			break;
-	}
-
-	if (!in) {
-		tb_dbg(tb, "no suitable DP IN adapter available, not tunneling\n");
-		return false;
-	}
-	if (!out) {
-		tb_dbg(tb, "no suitable DP OUT adapter available, not tunneling\n");
-		return false;
-	}
-
 	/*
 	 * This is only applicable to links that are not bonded (so
 	 * when Thunderbolt 1 hardware is involved somewhere in the
@@ -1923,15 +1889,19 @@ static bool tb_tunnel_one_dp(struct tb *tb)
 		goto err_free;
 	}
 
+	/* If fail reading tunnel's consumed bandwidth, tear it down */
+	ret = tb_tunnel_consumed_bandwidth(tunnel, &consumed_up, &consumed_down);
+	if (ret)
+		goto err_deactivate;
+
 	list_add_tail(&tunnel->list, &tcm->tunnel_list);
-	tb_reclaim_usb3_bandwidth(tb, in, out);
 
+	tb_reclaim_usb3_bandwidth(tb, in, out);
 	/*
 	 * Transition the links to asymmetric if the consumption exceeds
 	 * the threshold.
 	 */
-	if (!tb_tunnel_consumed_bandwidth(tunnel, &consumed_up, &consumed_down))
-		tb_configure_asym(tb, in, out, consumed_up, consumed_down);
+	tb_configure_asym(tb, in, out, consumed_up, consumed_down);
 
 	/* Update the domain with the new bandwidth estimation */
 	tb_recalc_estimated_bandwidth(tb);
@@ -1943,6 +1913,8 @@ static bool tb_tunnel_one_dp(struct tb *tb)
 	tb_increase_tmu_accuracy(tunnel);
 	return true;
 
+err_deactivate:
+	tb_tunnel_deactivate(tunnel);
 err_free:
 	tb_tunnel_free(tunnel);
 err_reclaim_usb:
@@ -1962,13 +1934,43 @@ static bool tb_tunnel_one_dp(struct tb *tb)
 
 static void tb_tunnel_dp(struct tb *tb)
 {
+	struct tb_cm *tcm = tb_priv(tb);
+	struct tb_port *port, *in, *out;
+
 	if (!tb_acpi_may_tunnel_dp()) {
 		tb_dbg(tb, "DP tunneling disabled, not creating tunnel\n");
 		return;
 	}
 
-	while (tb_tunnel_one_dp(tb))
-		;
+	/*
+	 * Find pair of inactive DP IN and DP OUT adapters and then
+	 * establish a DP tunnel between them.
+	 */
+	tb_dbg(tb, "looking for DP IN <-> DP OUT pairs:\n");
+
+	in = NULL;
+	out = NULL;
+	list_for_each_entry(port, &tcm->dp_resources, list) {
+		if (!tb_port_is_dpin(port))
+			continue;
+
+		if (tb_port_is_enabled(port)) {
+			tb_port_dbg(port, "DP IN in use\n");
+			continue;
+		}
+
+		in = port;
+		tb_port_dbg(in, "DP IN available\n");
+
+		out = tb_find_dp_out(tb, port);
+		if (out)
+			tb_tunnel_one_dp(tb, in, out);
+		else
+			tb_port_dbg(in, "no suitable DP OUT adapter available, not tunneling\n");
+	}
+
+	if (!in)
+		tb_dbg(tb, "no suitable DP IN adapter available, not tunneling\n");
 }
 
 static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port)
-- 
2.43.0


