Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2655671252D
	for <lists+linux-usb@lfdr.de>; Fri, 26 May 2023 13:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242942AbjEZLAn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 May 2023 07:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242962AbjEZLAm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 May 2023 07:00:42 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82FA51B0
        for <linux-usb@vger.kernel.org>; Fri, 26 May 2023 04:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685098836; x=1716634836;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Bdmp2fkpu4HnFt0KUavox11eIYajbGiNJQsh4hOW3Kw=;
  b=MJpQpkOqg49K6U/hGQ0OtdDCMud+G/xla9YllAB4BiXvpW0E/rm4shIx
   jqoan3Od5zUejkqxRe+cFMNhf+lCV5mxSSl6wRp8RtXWfq7Vv/gZzLKiF
   Dm49lYlJrovkYbjW3/nB8ze2/hEy1YrJ6gbldbxx9fp7BSEbSw96Z8jtI
   FTLo8qBYW4JTpTUIbxQWAI6z/kGcZtVTk5YST9/FekUfgY2Gex7nB3gJ2
   K47ZYBKmgTxrnSes6ysd7tHn1QfU/CCOwdVV/g+oyFAyliVD6XvDS/1Vy
   LjziGbvSSjm8ZyPgntElRvAuwRjl7LcP3Q2C9bzt5669crMRf6gh7vgmV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="417661951"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="417661951"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 04:00:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="879524750"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="879524750"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 26 May 2023 04:00:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id A524240F; Fri, 26 May 2023 14:00:37 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Log DisplayPort adapter rate and lanes on discovery
Date:   Fri, 26 May 2023 14:00:37 +0300
Message-Id: <20230526110037.20542-1-mika.westerberg@linux.intel.com>
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

This may be helpful when debugging possible issues around DisplayPort
port tunneling.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 43 ++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 3ebd32b897a0..7df5f90e21d4 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -1137,6 +1137,47 @@ static int tb_dp_init_video_path(struct tb_path *path)
 	return 0;
 }
 
+static void tb_dp_dump(struct tb_tunnel *tunnel)
+{
+	struct tb_port *in, *out;
+	u32 dp_cap, rate, lanes;
+
+	in = tunnel->src_port;
+	out = tunnel->dst_port;
+
+	if (tb_port_read(in, &dp_cap, TB_CFG_PORT,
+			 in->cap_adap + DP_LOCAL_CAP, 1))
+		return;
+
+	rate = tb_dp_cap_get_rate(dp_cap);
+	lanes = tb_dp_cap_get_lanes(dp_cap);
+
+	tb_port_dbg(in, "maximum supported bandwidth %u Mb/s x%u = %u Mb/s\n",
+		    rate, lanes, tb_dp_bandwidth(rate, lanes));
+
+	out = tunnel->dst_port;
+
+	if (tb_port_read(out, &dp_cap, TB_CFG_PORT,
+			 out->cap_adap + DP_LOCAL_CAP, 1))
+		return;
+
+	rate = tb_dp_cap_get_rate(dp_cap);
+	lanes = tb_dp_cap_get_lanes(dp_cap);
+
+	tb_port_dbg(out, "maximum supported bandwidth %u Mb/s x%u = %u Mb/s\n",
+		    rate, lanes, tb_dp_bandwidth(rate, lanes));
+
+	if (tb_port_read(in, &dp_cap, TB_CFG_PORT,
+			 in->cap_adap + DP_REMOTE_CAP, 1))
+		return;
+
+	rate = tb_dp_cap_get_rate(dp_cap);
+	lanes = tb_dp_cap_get_lanes(dp_cap);
+
+	tb_port_dbg(in, "reduced bandwidth %u Mb/s x%u = %u Mb/s\n",
+		    rate, lanes, tb_dp_bandwidth(rate, lanes));
+}
+
 /**
  * tb_tunnel_discover_dp() - Discover existing Display Port tunnels
  * @tb: Pointer to the domain structure
@@ -1214,6 +1255,8 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
 		goto err_deactivate;
 	}
 
+	tb_dp_dump(tunnel);
+
 	tb_tunnel_dbg(tunnel, "discovered\n");
 	return tunnel;
 
-- 
2.39.2

