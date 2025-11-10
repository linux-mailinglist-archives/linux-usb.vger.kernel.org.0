Return-Path: <linux-usb+bounces-30277-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 881FEC469D6
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 13:32:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E02573BC9E4
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 12:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B403101D3;
	Mon, 10 Nov 2025 12:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bokeYA4s"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8451830E846
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 12:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762777858; cv=none; b=hrWyHK2zAUrvd1NpK7ELpjdWrnecEJBXO1MG3RmRuRxwbxcAtZ8L0Ori2fDeN2PevqBjr+sPrgTU4ip2pOrFEEp93+5rw83TBLrGHXusw0byJ2Tjw9JALKjAWFzj/0uU4BWRb1Pje3RwIdMk7jkFiv0LX3zjuv+SS9QYQNskrUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762777858; c=relaxed/simple;
	bh=Sc+i0bjAM+ezSwRoh0u2hm+qkTtFIxOSSpw06tMvaWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FiUswGsShUOysFAkYtcHbi8B7D9H3pFv1WyvkMLhRbt6FfOQW0lbJreWkDWCWYrsDH/k4zQ46stvMifmYFms1SV/7sA9tWrihGs3cp3wSr7EFmt7a9ZQd0OanN5Z6+fKkuE04flwfPZe1T5xjgFzWkRQM6M3VKZTwua8bGWSyMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bokeYA4s; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762777856; x=1794313856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Sc+i0bjAM+ezSwRoh0u2hm+qkTtFIxOSSpw06tMvaWg=;
  b=bokeYA4ssCiSj2LLiqpjikED6u78K6hutCzYxR0Q7uDVd569mJkZLlhA
   TbpKSWMCT2EDlAEXv9N4tmf4C2NruLTpsNTilEeidL2fTjwUdqtAaYolD
   wbUlP9ScZyZD8faJ/YBffrWIfCNiDrBI3r5OgSU4c51Lvi2nT23H5y/qP
   qe3RuV8+VgSSDeO2R2WPMf/sPdq5h0+0ibRIT8NKFmQq6/k+BOmDyj/OD
   PPT9fsV3nyqoxpCn4cvo0BAUSpJaJQZEvjypYEtqeufbCjfLQ7lzagzhj
   uBd+BVMQUJ8jEkWBySsdJbvscwN8gJb+j7DxXIIUM7Y0DVSvWCGIRdlJO
   A==;
X-CSE-ConnectionGUID: GK37DjPPRRmO9/ARdm0Ppg==
X-CSE-MsgGUID: xjyYg3MESAuLlluYGf5qEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="63831522"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="63831522"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 04:30:56 -0800
X-CSE-ConnectionGUID: 7BcuSm1QSfOsonOGk7f2ew==
X-CSE-MsgGUID: I7tDmLw2TtaZ9LrzwvEolQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="188499785"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 10 Nov 2025 04:30:53 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 9A9FC9F; Mon, 10 Nov 2025 13:30:50 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 10/16] thunderbolt: Fix typos in tb.c
Date: Mon, 10 Nov 2025 13:30:44 +0100
Message-ID: <20251110123050.3959188-11-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110123050.3959188-1-mika.westerberg@linux.intel.com>
References: <20251110123050.3959188-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Fix typos in tb.c. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 4a94cb406bdf..f38479cc34c5 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -322,7 +322,7 @@ static int tb_enable_tmu(struct tb_switch *sw)
 
 	/*
 	 * If both routers at the end of the link are v2 we simply
-	 * enable the enhanched uni-directional mode. That covers all
+	 * enable the enhanced uni-directional mode. That covers all
 	 * the CL states. For v1 and before we need to use the normal
 	 * rate to allow CL1 (when supported). Otherwise we keep the TMU
 	 * running at the highest accuracy.
@@ -538,7 +538,7 @@ static struct tb_tunnel *tb_find_first_usb3_tunnel(struct tb *tb,
  * @src_port: Source protocol adapter
  * @dst_port: Destination protocol adapter
  * @port: USB4 port the consumed bandwidth is calculated
- * @consumed_up: Consumed upsream bandwidth (Mb/s)
+ * @consumed_up: Consumed upstream bandwidth (Mb/s)
  * @consumed_down: Consumed downstream bandwidth (Mb/s)
  *
  * Calculates consumed USB3 and PCIe bandwidth at @port between path
@@ -589,7 +589,7 @@ static int tb_consumed_usb3_pcie_bandwidth(struct tb *tb,
  * @src_port: Source protocol adapter
  * @dst_port: Destination protocol adapter
  * @port: USB4 port the consumed bandwidth is calculated
- * @consumed_up: Consumed upsream bandwidth (Mb/s)
+ * @consumed_up: Consumed upstream bandwidth (Mb/s)
  * @consumed_down: Consumed downstream bandwidth (Mb/s)
  *
  * Calculates consumed DP bandwidth at @port between path from @src_port
@@ -1115,7 +1115,7 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
 
 		/*
 		 * Here requested + consumed > threshold so we need to
-		 * transtion the link into asymmetric now.
+		 * transition the link into asymmetric now.
 		 */
 		ret = tb_switch_set_link_width(up->sw, width_up);
 		if (ret) {
@@ -1936,7 +1936,7 @@ static void tb_dp_tunnel_active(struct tb_tunnel *tunnel, void *data)
 			 */
 			tb_recalc_estimated_bandwidth(tb);
 			/*
-			 * In case of DP tunnel exists, change host
+			 * In case DP tunnel exists, change host
 			 * router's 1st children TMU mode to HiFi for
 			 * CL0s to work.
 			 */
@@ -2786,8 +2786,8 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 			 * There is no request active so this means the
 			 * BW allocation mode was enabled from graphics
 			 * side. At this point we know that the graphics
-			 * driver has read the DRPX capabilities so we
-			 * can offer an better bandwidth estimatation.
+			 * driver has read the DPRX capabilities so we
+			 * can offer better bandwidth estimation.
 			 */
 			tb_port_dbg(in, "DPTX enabled bandwidth allocation mode, updating estimated bandwidth\n");
 			tb_recalc_estimated_bandwidth(tb);
-- 
2.50.1


