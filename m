Return-Path: <linux-usb+bounces-6156-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F43C84F6EF
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 15:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A5781C23243
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 14:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179BD69DEC;
	Fri,  9 Feb 2024 14:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ffzpv8NH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3889C6A013
	for <linux-usb@vger.kernel.org>; Fri,  9 Feb 2024 14:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707488022; cv=none; b=K5TN17lYShyH9b3e1UUr9kC+3n/D94wJcytRm8ji8JPUHI0LY8DFyC9Q9Jr4R0RoMn2QyVX0Lwji+1Zo9Q73XU6qk/IyTNaOlJsZxBVvMfbqjRQEOjIztBk9KEcH1MvWK7JiZRGZpQb47FXPBkhhSKQ2bvK6uoARzJ98KgpX4l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707488022; c=relaxed/simple;
	bh=uOrwPpMveSwqAPP4dqZMly2TyvYc13tRbhk3hKEdKeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HVs/H/KL0iAUqS63hmw5eGb4HT7h9K2gfAoRWnE341tQnBpRVtzDNq9DQf1VpY+n0JsboA/OFAXLsM2ymQqYLPmvLZHV8eQ1Q1lCWOj5lJDJU7m0w7+qMDmtL+EzBxBrIoOuS7TvsMhSEM1Y/nJS0gL09NyTNut+yD/kWGzKYuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ffzpv8NH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707488021; x=1739024021;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uOrwPpMveSwqAPP4dqZMly2TyvYc13tRbhk3hKEdKeY=;
  b=Ffzpv8NHfqnl9ZKOZxmHicsiWGTZcmifGD2EXtC6+Klz6o7t9uupPB4w
   lR2EZ/bsprIjor3w8Tcre46BuS4z/m6nGNl7RsHVgT106SRPAthYOBB99
   1DEzTDCeXH2zfiHX18S8sUJ81pPCrVRA0qGYdCvssnIck/bWpQ9xx0/68
   cSpPGPvwLNSg2do8LDmVQIaznNcaHfjV3qFtrs/rYPjxnhHTqT8FIZdbG
   jK8jdPtZB1oBfw1Cli5gs3iImRaWsakxH59v8lmosU1yjfnoNiF/xT8kv
   FLFKBY+wYGWRqcWS4g4tBHo2B/5oHDWpC3uwMn051XZ1kdzKXgIVxRAMI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12082112"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="12082112"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 06:13:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="934434419"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="934434419"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2024 06:13:36 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id BCF4E1FF; Fri,  9 Feb 2024 16:13:35 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 03/10] thunderbolt: Handle bandwidth allocation mode disable request
Date: Fri,  9 Feb 2024 16:13:28 +0200
Message-ID: <20240209141335.2286786-4-mika.westerberg@linux.intel.com>
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

Graphics can disable DisplayPort bandwidth allocation mode as well so if
this make sure to reset the tunnel state accordingly.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 5b0434c140f9..abd86fd8d71f 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2406,8 +2406,23 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 
 	tb_port_dbg(in, "handling bandwidth allocation request\n");
 
+	tunnel = tb_find_tunnel(tb, TB_TUNNEL_DP, in, NULL);
+	if (!tunnel) {
+		tb_port_warn(in, "failed to find tunnel\n");
+		goto put_sw;
+	}
+
 	if (!usb4_dp_port_bandwidth_mode_enabled(in)) {
-		tb_port_warn(in, "bandwidth allocation mode not enabled\n");
+		if (tunnel->bw_mode) {
+			/*
+			 * Reset the tunnel back to use the legacy
+			 * allocation.
+			 */
+			tunnel->bw_mode = false;
+			tb_port_dbg(in, "DPTX disabled bandwidth allocation mode\n");
+		} else {
+			tb_port_warn(in, "bandwidth allocation mode not enabled\n");
+		}
 		goto put_sw;
 	}
 
@@ -2432,11 +2447,6 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 
 	tb_port_dbg(in, "requested bandwidth %d Mb/s\n", requested_bw);
 
-	tunnel = tb_find_tunnel(tb, TB_TUNNEL_DP, in, NULL);
-	if (!tunnel) {
-		tb_port_warn(in, "failed to find tunnel\n");
-		goto put_sw;
-	}
 
 	out = tunnel->dst_port;
 
-- 
2.43.0


