Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3AE17062DE
	for <lists+linux-usb@lfdr.de>; Wed, 17 May 2023 10:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbjEQIaE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 04:30:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbjEQI3b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 04:29:31 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F84B5B9A
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 01:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684312150; x=1715848150;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LrgdL0oZEWbx2OeT9CNsrRv3H1WH9rEPVb6y3GOG4cM=;
  b=gS1UGzXhgF7C3xpoXcFwgHGfgpKifGgvySPYx0Iup4lpDjgg3zJD406c
   9xptYPcwSKSoqIFluI4Rmo7LBWyXnPvrMatK6hrFIOZuhqn37uab+14wG
   J5OoEAKS81HPigj+1LpMMz1WbLoSgrJ9L8goAs6JitWLIYi7Kujzi43gl
   rIeL8Y4tQbJ0scz2TXZ20TJYc0gNN12OufgxNjr8Yeer3MyJYBgosVS71
   pVToD2zPBKWSw8FDPeeYP5FfmrP9AW5TeRNNsOilBiG+n2/TZhICMOujZ
   73IQoVW8pOw3OaPjjDkdf/poANUzl9fUIRzSGjDuM5cJDK+XqucYtd6cO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="438044255"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="438044255"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 01:29:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="734604862"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="734604862"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 17 May 2023 01:29:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 8484D618; Wed, 17 May 2023 11:29:19 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Pengfei Xu <pengfei.xu@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: dma_test: Use correct value for absent rings when creating paths
Date:   Wed, 17 May 2023 11:29:19 +0300
Message-Id: <20230517082919.34821-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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

Both tb_xdomain_enable_paths() and tb_xdomain_disable_paths() expect -1,
not 0, if the corresponding ring is not needed. For this reason change
the driver to use correct value for the rings that are not needed.

Fixes: 180b0689425c ("thunderbolt: Allow multiple DMA tunnels over a single XDomain connection")
Cc: stable@vger.kernel.org
Reported-by: Pengfei Xu <pengfei.xu@intel.com>
Tested-by: Pengfei Xu <pengfei.xu@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/dma_test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/dma_test.c b/drivers/thunderbolt/dma_test.c
index 3bedecb236e0..14bb6dec6c4b 100644
--- a/drivers/thunderbolt/dma_test.c
+++ b/drivers/thunderbolt/dma_test.c
@@ -192,9 +192,9 @@ static int dma_test_start_rings(struct dma_test *dt)
 	}
 
 	ret = tb_xdomain_enable_paths(dt->xd, dt->tx_hopid,
-				      dt->tx_ring ? dt->tx_ring->hop : 0,
+				      dt->tx_ring ? dt->tx_ring->hop : -1,
 				      dt->rx_hopid,
-				      dt->rx_ring ? dt->rx_ring->hop : 0);
+				      dt->rx_ring ? dt->rx_ring->hop : -1);
 	if (ret) {
 		dma_test_free_rings(dt);
 		return ret;
@@ -218,9 +218,9 @@ static void dma_test_stop_rings(struct dma_test *dt)
 		tb_ring_stop(dt->tx_ring);
 
 	ret = tb_xdomain_disable_paths(dt->xd, dt->tx_hopid,
-				       dt->tx_ring ? dt->tx_ring->hop : 0,
+				       dt->tx_ring ? dt->tx_ring->hop : -1,
 				       dt->rx_hopid,
-				       dt->rx_ring ? dt->rx_ring->hop : 0);
+				       dt->rx_ring ? dt->rx_ring->hop : -1);
 	if (ret)
 		dev_warn(&dt->svc->dev, "failed to disable DMA paths\n");
 
-- 
2.39.2

