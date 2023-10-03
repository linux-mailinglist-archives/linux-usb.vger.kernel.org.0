Return-Path: <linux-usb+bounces-1011-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 066C57B65A6
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 11:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 68C3728201B
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 09:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33391FC1F;
	Tue,  3 Oct 2023 09:40:17 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0D2FC1D
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 09:40:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75B31B4
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 02:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696326012; x=1727862012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cmq/mr13mMHUkFuWtToqpkP/RBwBB7TnJoZUgdcKvSQ=;
  b=PrwgPjczPh//DNusQlOLfTe1gUS2P0G/oe01uPRiuOfybdQ9+B7w8N1j
   SBaE3QRglzqADLT9k86S6AEAfUrHGgf+emNKgqOkOvGyTHB5UvnnotGhn
   PnQVrzQwnvHsiQm7mYIYq+hQbmO/7llUXahdrhxJmhr5Jqj+JfyjGnv4b
   06Lhpv0d2ogx+9dA8LwqMAeR4bS6fRN64lbXegvO4Njo3uQFsCVKxSylD
   pxujQspAfg2816CoY+OY7Kwh1pl4xxzbrpPxFtHf3YUeLBgnGRAOxsEf6
   TkfM6jc3E4HNfco0600u6xf4zkBxcAgZRHPj2vEnXb79YRsuTqOKSEnYW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1424880"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="1424880"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 02:40:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="997945439"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="997945439"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 03 Oct 2023 02:40:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 802DA1261; Tue,  3 Oct 2023 12:40:05 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 02/13] thunderbolt: Get rid of usb4_usb3_port_actual_link_rate()
Date: Tue,  3 Oct 2023 12:39:54 +0300
Message-Id: <20231003094005.2676823-3-mika.westerberg@linux.intel.com>
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

It turns out there is no need to use the actual link rate when
reclaiming bandwidth for USB 3.x. The reason is that we use consumed
bandwidth which is coming from xHCI when releasing bandwidth (for
example for DisplayPort tunneling) and this can be anything between
1000 Mb/s to maximum, so when reclaiming we can just bump it up back to
maximum instead of actual link rate (which is always <= maximum).

This allows us to get rid of couple of unnecessary lines of code.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.h      |  1 -
 drivers/thunderbolt/tb_regs.h |  3 ---
 drivers/thunderbolt/tunnel.c  | 11 ++---------
 drivers/thunderbolt/usb4.c    | 29 -----------------------------
 4 files changed, 2 insertions(+), 42 deletions(-)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index d2a55ad2fd3e..06046f8ce50c 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1283,7 +1283,6 @@ int usb4_port_retimer_nvm_read(struct tb_port *port, u8 index,
 			       unsigned int address, void *buf, size_t size);
 
 int usb4_usb3_port_max_link_rate(struct tb_port *port);
-int usb4_usb3_port_actual_link_rate(struct tb_port *port);
 int usb4_usb3_port_allocated_bandwidth(struct tb_port *port, int *upstream_bw,
 				       int *downstream_bw);
 int usb4_usb3_port_allocate_bandwidth(struct tb_port *port, int *upstream_bw,
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index cf9f2370878a..b6893a5093a5 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -484,9 +484,6 @@ struct tb_regs_port_header {
 #define ADP_USB3_CS_3				0x03
 #define ADP_USB3_CS_3_SCALE_MASK		GENMASK(5, 0)
 #define ADP_USB3_CS_4				0x04
-#define ADP_USB3_CS_4_ALR_MASK			GENMASK(6, 0)
-#define ADP_USB3_CS_4_ALR_20G			0x1
-#define ADP_USB3_CS_4_ULV			BIT(7)
 #define ADP_USB3_CS_4_MSLR_MASK			GENMASK(18, 12)
 #define ADP_USB3_CS_4_MSLR_SHIFT		12
 #define ADP_USB3_CS_4_MSLR_20G			0x1
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index a6810fb36860..bc82872c84a8 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -1790,17 +1790,10 @@ static void tb_usb3_reclaim_available_bandwidth(struct tb_tunnel *tunnel,
 {
 	int ret, max_rate, allocate_up, allocate_down;
 
-	ret = usb4_usb3_port_actual_link_rate(tunnel->src_port);
+	ret = tb_usb3_max_link_rate(tunnel->dst_port, tunnel->src_port);
 	if (ret < 0) {
-		tb_tunnel_warn(tunnel, "failed to read actual link rate\n");
+		tb_tunnel_warn(tunnel, "failed to read maximum link rate\n");
 		return;
-	} else if (!ret) {
-		/* Use maximum link rate if the link valid is not set */
-		ret = tb_usb3_max_link_rate(tunnel->dst_port, tunnel->src_port);
-		if (ret < 0) {
-			tb_tunnel_warn(tunnel, "failed to read maximum link rate\n");
-			return;
-		}
 	}
 
 	/*
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 05ddb224c464..86d6b7b5471b 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -1946,35 +1946,6 @@ int usb4_usb3_port_max_link_rate(struct tb_port *port)
 	return usb4_usb3_port_max_bandwidth(port, ret);
 }
 
-/**
- * usb4_usb3_port_actual_link_rate() - Established USB3 link rate
- * @port: USB3 adapter port
- *
- * Return actual established link rate of a USB3 adapter in Mb/s. If the
- * link is not up returns %0 and negative errno in case of failure.
- */
-int usb4_usb3_port_actual_link_rate(struct tb_port *port)
-{
-	int ret, lr;
-	u32 val;
-
-	if (!tb_port_is_usb3_down(port) && !tb_port_is_usb3_up(port))
-		return -EINVAL;
-
-	ret = tb_port_read(port, &val, TB_CFG_PORT,
-			   port->cap_adap + ADP_USB3_CS_4, 1);
-	if (ret)
-		return ret;
-
-	if (!(val & ADP_USB3_CS_4_ULV))
-		return 0;
-
-	lr = val & ADP_USB3_CS_4_ALR_MASK;
-	ret = lr == ADP_USB3_CS_4_ALR_20G ? 20000 : 10000;
-
-	return usb4_usb3_port_max_bandwidth(port, ret);
-}
-
 static int usb4_usb3_port_cm_request(struct tb_port *port, bool request)
 {
 	int ret;
-- 
2.40.1


