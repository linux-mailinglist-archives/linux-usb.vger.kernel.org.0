Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 997A5595A07
	for <lists+linux-usb@lfdr.de>; Tue, 16 Aug 2022 13:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233181AbiHPL0Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Aug 2022 07:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231877AbiHPLZt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Aug 2022 07:25:49 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D966E696D7
        for <linux-usb@vger.kernel.org>; Tue, 16 Aug 2022 03:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660646448; x=1692182448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Sk18p/HzGVgjYCkN5lbVZwUWPoKixzovFDCLm679drc=;
  b=g0WqKtUgQ9SfcpN0p5BEaxKyhn4fIcxYaR01VVTrSlHg/VyyZKLXqmwD
   DLdSFgdsdXSg/gms4o/MCx2qBJJ9iKgwcAgRPen+08k3nnSU0g6InXkTk
   yWZrSSJR+6Up480rObAC3asY3kF33FBeILKWHta0U5zCQMrwRfreIwAGl
   UGyIyEk+E0s0XHNZfB4zmGc768vctdqtIAsVbR8fgKjvUttjgK71E2eLs
   lPNEtEmen2IZmT+7ta5UAk+I3iRd8Ucs3CBAvVTSs0Yt4/NA8CF+a2xUx
   jsWD+YCI7ASrA3/f3qZZ9AAXLOOkM1MXnsAB8MBOmkip0Mjf1kvrDhRWe
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="272576805"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
   d="scan'208";a="272576805"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2022 03:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
   d="scan'208";a="557648814"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 16 Aug 2022 03:40:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id A9FF92D5; Tue, 16 Aug 2022 13:40:59 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/2] thunderbolt: Check router generation before connecting xHCI
Date:   Tue, 16 Aug 2022 13:40:59 +0300
Message-Id: <20220816104059.71844-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220816104059.71844-1-mika.westerberg@linux.intel.com>
References: <20220816104059.71844-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Only Thunderbolt 3 routers need the xHCI connection flow. This also
ensures the router actually has both lane adapters (1 and 3). While
there move declaration of the boolean variables inside the block where
they are being used.

Fixes: 30a4eca69b76 ("thunderbolt: Add internal xHCI connect flows for Thunderbolt 3 devices")
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 244f8cd38b25..c63c1f4ff9dc 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -3786,14 +3786,18 @@ int tb_switch_pcie_l1_enable(struct tb_switch *sw)
  */
 int tb_switch_xhci_connect(struct tb_switch *sw)
 {
-	bool usb_port1, usb_port3, xhci_port1, xhci_port3;
 	struct tb_port *port1, *port3;
 	int ret;
 
+	if (sw->generation != 3)
+		return 0;
+
 	port1 = &sw->ports[1];
 	port3 = &sw->ports[3];
 
 	if (tb_switch_is_alpine_ridge(sw)) {
+		bool usb_port1, usb_port3, xhci_port1, xhci_port3;
+
 		usb_port1 = tb_lc_is_usb_plugged(port1);
 		usb_port3 = tb_lc_is_usb_plugged(port3);
 		xhci_port1 = tb_lc_is_xhci_connected(port1);
-- 
2.35.1

