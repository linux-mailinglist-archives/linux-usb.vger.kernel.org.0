Return-Path: <linux-usb+bounces-1582-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 899457C8552
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 14:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD39A282D18
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 12:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BEF314A97;
	Fri, 13 Oct 2023 12:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7DzTUc7"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763CD1426E
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 12:06:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A2E7C0
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 05:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697198806; x=1728734806;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Wa6t2DTFXJa4tkylw9tYrxfqlqGaswEZ8RJPzfie9Sw=;
  b=c7DzTUc7rPv5oT/mOqQhkaBBukdTplDL+UdwlUYyVYNJgaV5XAkc+8+P
   qCXBLM1pyB4TTHDawAIGySO0IZdge7h8HP7M9WZGqp4H+caRiQop71W/E
   QDNnM0ggxzleRJvQBGUQQsWU1UJnwrtRvs7Kqo7MbkgMbFBznQihBisrU
   WAmKSm2/VaQDbygsduNd6Ckh5cpZxmwcE/L6d1FqQZTf1JS5j7GHq8H6W
   erLwQdlqxg/meMsCh6UPhuQ8G4a5yZskbwMhDiwVLhpnsOymZ9R62Z2N0
   ctC/DGTjoFflU0xoyMY92LMVzU4b3b2mkTiSrqoRkWAClrhfmXoCDHyj/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="389033476"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="389033476"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 05:06:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="820602043"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="820602043"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 13 Oct 2023 05:06:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id CDEBD666; Fri, 13 Oct 2023 15:06:40 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 01/10] thunderbolt: Use constants for path weight and priority
Date: Fri, 13 Oct 2023 15:06:31 +0300
Message-Id: <20231013120640.709255-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231013120640.709255-1-mika.westerberg@linux.intel.com>
References: <20231013120640.709255-1-mika.westerberg@linux.intel.com>
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

Makes it easier to follow and update. No functional changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 39 +++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 9775332dee0e..c53df06dd5df 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -21,12 +21,18 @@
 #define TB_PCI_PATH_DOWN		0
 #define TB_PCI_PATH_UP			1
 
+#define TB_PCI_PRIORITY			3
+#define TB_PCI_WEIGHT			1
+
 /* USB3 adapters use always HopID of 8 for both directions */
 #define TB_USB3_HOPID			8
 
 #define TB_USB3_PATH_DOWN		0
 #define TB_USB3_PATH_UP			1
 
+#define TB_USB3_PRIORITY		3
+#define TB_USB3_WEIGHT			3
+
 /* DP adapters use HopID 8 for AUX and 9 for Video */
 #define TB_DP_AUX_TX_HOPID		8
 #define TB_DP_AUX_RX_HOPID		8
@@ -36,6 +42,12 @@
 #define TB_DP_AUX_PATH_OUT		1
 #define TB_DP_AUX_PATH_IN		2
 
+#define TB_DP_VIDEO_PRIORITY		1
+#define TB_DP_VIDEO_WEIGHT		1
+
+#define TB_DP_AUX_PRIORITY		2
+#define TB_DP_AUX_WEIGHT		1
+
 /* Minimum number of credits needed for PCIe path */
 #define TB_MIN_PCIE_CREDITS		6U
 /*
@@ -46,6 +58,9 @@
 /* Minimum number of credits for DMA path */
 #define TB_MIN_DMA_CREDITS		1
 
+#define TB_DMA_PRIORITY			5
+#define TB_DMA_WEIGHT			1
+
 static unsigned int dma_credits = TB_DMA_CREDITS;
 module_param(dma_credits, uint, 0444);
 MODULE_PARM_DESC(dma_credits, "specify custom credits for DMA tunnels (default: "
@@ -213,8 +228,8 @@ static int tb_pci_init_path(struct tb_path *path)
 	path->egress_shared_buffer = TB_PATH_NONE;
 	path->ingress_fc_enable = TB_PATH_ALL;
 	path->ingress_shared_buffer = TB_PATH_NONE;
-	path->priority = 3;
-	path->weight = 1;
+	path->priority = TB_PCI_PRIORITY;
+	path->weight = TB_PCI_WEIGHT;
 	path->drop_packages = 0;
 
 	tb_path_for_each_hop(path, hop) {
@@ -1152,8 +1167,8 @@ static void tb_dp_init_aux_path(struct tb_path *path)
 	path->egress_shared_buffer = TB_PATH_NONE;
 	path->ingress_fc_enable = TB_PATH_ALL;
 	path->ingress_shared_buffer = TB_PATH_NONE;
-	path->priority = 2;
-	path->weight = 1;
+	path->priority = TB_DP_AUX_PRIORITY;
+	path->weight = TB_DP_AUX_WEIGHT;
 
 	tb_path_for_each_hop(path, hop)
 		tb_dp_init_aux_credits(hop);
@@ -1196,8 +1211,8 @@ static int tb_dp_init_video_path(struct tb_path *path)
 	path->egress_shared_buffer = TB_PATH_NONE;
 	path->ingress_fc_enable = TB_PATH_NONE;
 	path->ingress_shared_buffer = TB_PATH_NONE;
-	path->priority = 1;
-	path->weight = 1;
+	path->priority = TB_DP_VIDEO_PRIORITY;
+	path->weight = TB_DP_VIDEO_WEIGHT;
 
 	tb_path_for_each_hop(path, hop) {
 		int ret;
@@ -1471,8 +1486,8 @@ static int tb_dma_init_rx_path(struct tb_path *path, unsigned int credits)
 	path->ingress_fc_enable = TB_PATH_ALL;
 	path->egress_shared_buffer = TB_PATH_NONE;
 	path->ingress_shared_buffer = TB_PATH_NONE;
-	path->priority = 5;
-	path->weight = 1;
+	path->priority = TB_DMA_PRIORITY;
+	path->weight = TB_DMA_WEIGHT;
 	path->clear_fc = true;
 
 	/*
@@ -1505,8 +1520,8 @@ static int tb_dma_init_tx_path(struct tb_path *path, unsigned int credits)
 	path->ingress_fc_enable = TB_PATH_ALL;
 	path->egress_shared_buffer = TB_PATH_NONE;
 	path->ingress_shared_buffer = TB_PATH_NONE;
-	path->priority = 5;
-	path->weight = 1;
+	path->priority = TB_DMA_PRIORITY;
+	path->weight = TB_DMA_WEIGHT;
 	path->clear_fc = true;
 
 	tb_path_for_each_hop(path, hop) {
@@ -1838,8 +1853,8 @@ static void tb_usb3_init_path(struct tb_path *path)
 	path->egress_shared_buffer = TB_PATH_NONE;
 	path->ingress_fc_enable = TB_PATH_ALL;
 	path->ingress_shared_buffer = TB_PATH_NONE;
-	path->priority = 3;
-	path->weight = 3;
+	path->priority = TB_USB3_PRIORITY;
+	path->weight = TB_USB3_WEIGHT;
 	path->drop_packages = 0;
 
 	tb_path_for_each_hop(path, hop)
-- 
2.40.1


