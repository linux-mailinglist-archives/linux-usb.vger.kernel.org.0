Return-Path: <linux-usb+bounces-3647-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 757D880308A
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 208A31F2123E
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07166224FA;
	Mon,  4 Dec 2023 10:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eiw5PYcT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EDA7BB
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701686313; x=1733222313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RU3N8iuAomagZOqiT2yTYYpVSTyy9g+XgfW+GOXPsrc=;
  b=eiw5PYcTdL3RbvikS0BQiaJ4T+5pmJzKMM7fap6meRO6MGMjkVpH1z9+
   YyRbMPRj43jk439M3EmyRt5251yRwsOMmreCndt6SHglSrLRqKjs29Dhg
   IydYX/R2uDrSFw18Eq2uQnsyBbb9NL7j5EAtgQ7CYFpWqNvqa/orC2St+
   xNFgcoRzTMzLKXARqfh1o2+xIbJYUMec+EXES+QEHzsKg/PjC3mnrJivZ
   ylcP/VdbrAn+JN4yBVSmGiLSi9r1QJjQXYtrBctgvzJLiANmJB1n+8nR2
   VU41TzBAuNcRejhLHX+XSilZPrP7rvYROogP3TLuxlEuArjj0lRf6t6JH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="384116737"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="384116737"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:38:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="804861257"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="804861257"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 04 Dec 2023 02:38:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 6D3C4881; Mon,  4 Dec 2023 12:38:28 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Gil Fine <gil.fine@linux.intel.com>,
	Pengfei Xu <pengfei.xu@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 03/11] thunderbolt: Move width_name() helper to tb.h
Date: Mon,  4 Dec 2023 12:38:20 +0200
Message-ID: <20231204103828.1635531-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204103828.1635531-1-mika.westerberg@linux.intel.com>
References: <20231204103828.1635531-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gil Fine <gil.fine@linux.intel.com>

We are going to use it in subsequent patches, so make it available outside of
switch.c. Also, change the name to tb_width_name() to follow the naming
conventions.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 20 ++------------------
 drivers/thunderbolt/tb.h     | 16 ++++++++++++++++
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 44e9b09de47a..dbab551ac7b3 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -941,22 +941,6 @@ int tb_port_get_link_generation(struct tb_port *port)
 	}
 }
 
-static const char *width_name(enum tb_link_width width)
-{
-	switch (width) {
-	case TB_LINK_WIDTH_SINGLE:
-		return "symmetric, single lane";
-	case TB_LINK_WIDTH_DUAL:
-		return "symmetric, dual lanes";
-	case TB_LINK_WIDTH_ASYM_TX:
-		return "asymmetric, 3 transmitters, 1 receiver";
-	case TB_LINK_WIDTH_ASYM_RX:
-		return "asymmetric, 3 receivers, 1 transmitter";
-	default:
-		return "unknown";
-	}
-}
-
 /**
  * tb_port_get_link_width() - Get current link width
  * @port: Port to check (USB4 or CIO)
@@ -2769,7 +2753,7 @@ static void tb_switch_link_init(struct tb_switch *sw)
 		return;
 
 	tb_sw_dbg(sw, "current link speed %u.0 Gb/s\n", sw->link_speed);
-	tb_sw_dbg(sw, "current link width %s\n", width_name(sw->link_width));
+	tb_sw_dbg(sw, "current link width %s\n", tb_width_name(sw->link_width));
 
 	bonded = sw->link_width >= TB_LINK_WIDTH_DUAL;
 
@@ -3029,7 +3013,7 @@ int tb_switch_set_link_width(struct tb_switch *sw, enum tb_link_width width)
 
 	tb_switch_update_link_attributes(sw);
 
-	tb_sw_dbg(sw, "link width set to %s\n", width_name(width));
+	tb_sw_dbg(sw, "link width set to %s\n", tb_width_name(width));
 	return ret;
 }
 
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index e299e53473ae..1760c21e5b12 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -568,6 +568,22 @@ static inline struct tb_port *tb_port_at(u64 route, struct tb_switch *sw)
 	return &sw->ports[port];
 }
 
+static inline const char *tb_width_name(enum tb_link_width width)
+{
+	switch (width) {
+	case TB_LINK_WIDTH_SINGLE:
+		return "symmetric, single lane";
+	case TB_LINK_WIDTH_DUAL:
+		return "symmetric, dual lanes";
+	case TB_LINK_WIDTH_ASYM_TX:
+		return "asymmetric, 3 transmitters, 1 receiver";
+	case TB_LINK_WIDTH_ASYM_RX:
+		return "asymmetric, 3 receivers, 1 transmitter";
+	default:
+		return "unknown";
+	}
+}
+
 /**
  * tb_port_has_remote() - Does the port have switch connected downstream
  * @port: Port to check
-- 
2.42.0


