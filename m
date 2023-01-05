Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1EE65EA06
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jan 2023 12:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233092AbjAELft (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Jan 2023 06:35:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232512AbjAELfc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Jan 2023 06:35:32 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5436F58D04
        for <linux-usb@vger.kernel.org>; Thu,  5 Jan 2023 03:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672918531; x=1704454531;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=errNd+yP+vLWqTfIFtWODXcodbLM8UOHZM0AVeRVYY8=;
  b=HVUgtIusvq9L0wgq020DKsjbiOJ2hcKChY0gXslQ2CylI6a6WwbnZv3R
   1A0ws+Cq6PTuF2CcRy1wSsPZYXVS/3NugO1F73pJlv+TigV0tQRuzSi32
   r4zalvVOwhhSRpnnu4XkOa0QRxAqqY6G44M3FUNDRKmhl5N+fDwpU9Kwk
   WFqjAa2Q1Id2g3zXPYLaPby3T+Su7CWftEQfzBHYlphI11hat7EwLXgCD
   9VseDXT4r0YkBN6GMBc+0epRh5QyfF/i3rC5LBeqtJRNBiQo09BQCmluK
   ktuXxKprgt4TGpVpDB72Deg25FnsdkLx76DYGmYB+B09sAprAAYBZCsTq
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="319888870"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="319888870"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 03:35:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="829527660"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="829527660"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 05 Jan 2023 03:35:26 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id A3B831CA; Thu,  5 Jan 2023 13:35:59 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/8] thunderbolt: Improve debug logging in tb_available_bandwidth()
Date:   Thu,  5 Jan 2023 13:35:54 +0200
Message-Id: <20230105113559.68531-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230105113559.68531-1-mika.westerberg@linux.intel.com>
References: <20230105113559.68531-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This makes it easier to see what is going on when bandwidth is being
allocated for tunneling.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index db9dade7b4b0..cebbb3660c68 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -350,7 +350,9 @@ static int tb_available_bandwidth(struct tb *tb, struct tb_port *src_port,
 	struct tb_tunnel *tunnel;
 	struct tb_port *port;
 
-	tb_port_dbg(dst_port, "calculating available bandwidth\n");
+	tb_dbg(tb, "calculating available bandwidth between %llx:%u <-> %llx:%u\n",
+	       tb_route(src_port->sw), src_port->port, tb_route(dst_port->sw),
+	       dst_port->port);
 
 	tunnel = tb_find_first_usb3_tunnel(tb, src_port, dst_port);
 	if (tunnel) {
@@ -387,7 +389,8 @@ static int tb_available_bandwidth(struct tb *tb, struct tb_port *src_port,
 		up_bw -= up_bw / 10;
 		down_bw = up_bw;
 
-		tb_port_dbg(port, "link total bandwidth %d Mb/s\n", up_bw);
+		tb_port_dbg(port, "link total bandwidth %d/%d Mb/s\n", up_bw,
+			    down_bw);
 
 		/*
 		 * Find all DP tunnels that cross the port and reduce
-- 
2.35.1

