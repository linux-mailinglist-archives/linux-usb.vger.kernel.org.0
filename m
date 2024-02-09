Return-Path: <linux-usb+bounces-6159-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BCB84F6F2
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 15:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB8C71C20F11
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 14:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E6B6EB58;
	Fri,  9 Feb 2024 14:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FTWvXawN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AFD6A32F
	for <linux-usb@vger.kernel.org>; Fri,  9 Feb 2024 14:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707488025; cv=none; b=O8XenNVI4lzYQDnTtrVqTk4J1SwMVJiidujYF9GQKtRFfUMV95o1FxEoaPvXqT1XmFvkPvaIX7v/NLzGHr3B+h9hiLANfsfojiccK++U2kOGBNzaTsqmqkoG5sDNXSX+LUwbj5XVN1fysoXN/k3YvNdt//FmgqgkaLo/v5UXrDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707488025; c=relaxed/simple;
	bh=p4PErb2ZlcKYuDfKlHWV4bD1hOGwfKHFwWkTpyXORmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J23QuqtruIbGmgB/OuaZucBYJH+k7z+xjXkf8SabFheySHMU9UifDiVqNj7D3m3HUzas8aGuovXF3ugKpYoc8NM7kPYXRFyV0LVpcv8rkTQQtJq4DOhKOpjRT+FgAT3W4R2u6f+UyCoWod3BPYWE9/ag+3aJdEwwfuHKY2MDBms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FTWvXawN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707488023; x=1739024023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p4PErb2ZlcKYuDfKlHWV4bD1hOGwfKHFwWkTpyXORmA=;
  b=FTWvXawN071eRBKsDREwlMgmh1JShfCSMWpJO5g27LOAZ+7n8zwBTbbk
   lrh0HGsJxXMfG5LL/kqFpH6sLSapJ+nO6egDPcxjgmhn6CXn75EfQNhlR
   J0+ZHgYRobtJv8p4zjtyDePuPl+3ZCa3qP0D+84PNpj4pWEMcaYDws7bH
   8rMnaclJ/50zrAHGV+UQQzI/lpJJZeo6dP2XSsJhaLq3VXomLWlxDfCRT
   gS3e54DqoI3AsL7Qt8oDuf7PuTurE6yHkZ/lQw9FYeLj1cmTwPGHlhDzQ
   CUCi/RwcdthVKwjG2LK6FEaiq8QeAfG4Ca3T24Gyz/VB8HCK9Ok2BItxy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12082126"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="12082126"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 06:13:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="934434444"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="934434444"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2024 06:13:40 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id D070632F; Fri,  9 Feb 2024 16:13:35 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 05/10] thunderbolt: Fail the failed bandwidth request properly
Date: Fri,  9 Feb 2024 16:13:30 +0200
Message-ID: <20240209141335.2286786-6-mika.westerberg@linux.intel.com>
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

The USB4 spec says that if the Connection Manager writes Allocated_BW
that is smaller than Requested_BW, the DisplayPort IN adapter signals
this failure back to the DPTX (graphics driver). Implement this by
rewriting the same allocated bandwidth values back.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index abd86fd8d71f..9dbdf2770f0b 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2270,11 +2270,11 @@ static int tb_alloc_dp_bandwidth(struct tb_tunnel *tunnel, int *requested_up,
 	 */
 	ret = tb_tunnel_maximum_bandwidth(tunnel, &max_up, &max_down);
 	if (ret)
-		return ret;
+		goto fail;
 
 	ret = usb4_dp_port_granularity(in);
 	if (ret < 0)
-		return ret;
+		goto fail;
 	granularity = ret;
 
 	max_up_rounded = roundup(max_up, granularity);
@@ -2304,7 +2304,8 @@ static int tb_alloc_dp_bandwidth(struct tb_tunnel *tunnel, int *requested_up,
 			      "bandwidth request too high (%d/%d Mb/s > %d/%d Mb/s)\n",
 			      requested_up_corrected, requested_down_corrected,
 			      max_up_rounded, max_down_rounded);
-		return -ENOBUFS;
+		ret = -ENOBUFS;
+		goto fail;
 	}
 
 	if ((*requested_up >= 0 && requested_up_corrected <= allocated_up) ||
@@ -2332,7 +2333,7 @@ static int tb_alloc_dp_bandwidth(struct tb_tunnel *tunnel, int *requested_up,
 	 */
 	ret = tb_release_unused_usb3_bandwidth(tb, in, out);
 	if (ret)
-		return ret;
+		goto fail;
 
 	/*
 	 * Then go over all tunnels that cross the same USB4 ports (they
@@ -2357,7 +2358,7 @@ static int tb_alloc_dp_bandwidth(struct tb_tunnel *tunnel, int *requested_up,
 					*requested_down);
 		if (ret) {
 			tb_configure_sym(tb, in, out, 0, 0, true);
-			return ret;
+			goto fail;
 		}
 
 		ret = tb_tunnel_alloc_bandwidth(tunnel, requested_up,
@@ -2372,6 +2373,18 @@ static int tb_alloc_dp_bandwidth(struct tb_tunnel *tunnel, int *requested_up,
 
 reclaim:
 	tb_reclaim_usb3_bandwidth(tb, in, out);
+fail:
+	if (ret && ret != -ENODEV) {
+		/*
+		 * Write back the same allocated (so no change), this
+		 * makes the DPTX request fail on graphics side.
+		 */
+		tb_tunnel_dbg(tunnel,
+			      "failing the request by rewriting allocated %d/%d Mb/s\n",
+			      allocated_up, allocated_down);
+		tb_tunnel_alloc_bandwidth(tunnel, &allocated_up, &allocated_down);
+	}
+
 	return ret;
 }
 
-- 
2.43.0


