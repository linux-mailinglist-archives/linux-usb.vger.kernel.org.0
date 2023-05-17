Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89601706323
	for <lists+linux-usb@lfdr.de>; Wed, 17 May 2023 10:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbjEQIlA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 04:41:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjEQIk5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 04:40:57 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01F7D1A5
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 01:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684312855; x=1715848855;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gr7H16zpTaOz1k3jh2HysFVoMq0R89WOzs9tCLlZkLA=;
  b=ZM4c2EhNpX1FJLz3BYd/lrNwD8rdhC975LJg1a2a+hO3Qvh+BkluEfhH
   vWS29YYT6fE1I/lpMjQcoDGO3cGOW3wbjJuci7lXzOTuMcmXXCzJuABzv
   EZlip6alKXjUuNvahZwdp/WID85cG3xu5Q+NFRsnocD10uNiOplwU2XrB
   6LHxFVwOoVmBJ3GMcU5niW6UgTVC9v1CvgyNPeLF+StUBfKcqLaYXvHRb
   ASNkYRWAUnwhUHWTwU+vEbDPHMOAcnOAjtlcNJduRETpA3AjQUdaLolOE
   6635bFURoumPoKCShEBV73e0FWfjt1nyOyRKC1Hf4uQnmRne9yXazgRYP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="354871309"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="354871309"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 01:40:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="1031624541"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="1031624541"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 17 May 2023 01:40:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 2F8876B9; Wed, 17 May 2023 11:41:04 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 4/7] thunderbolt: Allow specifying custom credits for DMA tunnels
Date:   Wed, 17 May 2023 11:41:00 +0300
Message-Id: <20230517084103.45213-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517084103.45213-1-mika.westerberg@linux.intel.com>
References: <20230517084103.45213-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The default ones should be find but this allows the user to tweak the
credits to get more performance out of the P2P connection.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index dd3b5613ad2c..3bf2628a5dcd 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -41,9 +41,14 @@
  * Number of credits we try to allocate for each DMA path if not limited
  * by the host router baMaxHI.
  */
-#define TB_DMA_CREDITS			14U
+#define TB_DMA_CREDITS			14
 /* Minimum number of credits for DMA path */
-#define TB_MIN_DMA_CREDITS		1U
+#define TB_MIN_DMA_CREDITS		1
+
+static unsigned int dma_credits = TB_DMA_CREDITS;
+module_param(dma_credits, uint, 0444);
+MODULE_PARM_DESC(dma_credits, "specify custom credits for DMA tunnels (default: "
+                __MODULE_STRING(TB_DMA_CREDITS) ")");
 
 static bool bw_alloc_mode = true;
 module_param(bw_alloc_mode, bool, 0444);
@@ -95,7 +100,7 @@ static unsigned int tb_available_credits(const struct tb_port *port,
 	pcie = tb_acpi_may_tunnel_pcie() ? sw->max_pcie_credits : 0;
 
 	if (tb_acpi_is_xdomain_allowed()) {
-		spare = min_not_zero(sw->max_dma_credits, TB_DMA_CREDITS);
+		spare = min_not_zero(sw->max_dma_credits, dma_credits);
 		/* Add some credits for potential second DMA tunnel */
 		spare += TB_MIN_DMA_CREDITS;
 	} else {
@@ -1472,7 +1477,7 @@ struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
 	tunnel->dst_port = dst;
 	tunnel->deinit = tb_dma_deinit;
 
-	credits = min_not_zero(TB_DMA_CREDITS, nhi->sw->max_dma_credits);
+	credits = min_not_zero(dma_credits, nhi->sw->max_dma_credits);
 
 	if (receive_ring > 0) {
 		path = tb_path_alloc(tb, dst, receive_path, nhi, receive_ring, 0,
-- 
2.39.2

