Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00E056793AA
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jan 2023 10:09:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233072AbjAXJJI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Jan 2023 04:09:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjAXJJG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Jan 2023 04:09:06 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6F593A58C
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 01:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674551345; x=1706087345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sR/UIsgyhorIod1gaBRPoonyQRpHm9pr3tdaMep3yjs=;
  b=PZbQeCN55cu1tWjeVQXxLQWFDZDTzMKT3X/NjDmo3eC7pMnHGCgJDta7
   s+4mS8LMTP1zYowRmIX3ggVYNuEKiq15sQjcbr2WObrRXuDBIqdZpkEbu
   o8j4rGSA1SHVnRaNcoRVsWsSwYf6cyvIhLplHtA7v2wR9pjzrAGKsfnzY
   fj/4xxreSeXYSHJYClphKlW65y6oehWCXCLNg0G3+yBs0vLInXJouuRdU
   bSACnBN3CJzQPJKENtNwn9GfVzhHyOaLe1yXkyYmNTe7zvLG52/0M5IlG
   3EjwKhslRuWK/D01Aa5ynsxwVLILYxyiQgsicU0NRVsV6nhZTVcp2c3An
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="306608118"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="306608118"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 01:09:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="692521277"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="692521277"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 24 Jan 2023 01:09:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 4E6A5144; Tue, 24 Jan 2023 11:09:39 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/2] thunderbolt: Add missing kernel-doc comment to tb_tunnel_maximum_bandwidth()
Date:   Tue, 24 Jan 2023 11:09:38 +0200
Message-Id: <20230124090938.58825-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124090938.58825-1-mika.westerberg@linux.intel.com>
References: <20230124090938.58825-1-mika.westerberg@linux.intel.com>
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

These were missing from the original commit so add them now. No
functional changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 10 ++++++++++
 drivers/thunderbolt/tunnel.h |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index c406675a8966..8af9397f272e 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -2081,6 +2081,16 @@ static bool tb_tunnel_is_active(const struct tb_tunnel *tunnel)
 	return true;
 }
 
+/**
+ * tb_tunnel_maximum_bandwidth() - Return maximum possible bandwidth
+ * @tunnel: Tunnel to check
+ * @max_up: Maximum upstream bandwidth in Mb/s
+ * @max_down: Maximum upstream bandwidth in Mb/s
+ *
+ * Returns maximum possible bandwidth this tunnel can go if not limited
+ * by other bandwidth clients. If the tunnel does not support this
+ * returns %-EOPNOTSUPP.
+ */
 int tb_tunnel_maximum_bandwidth(struct tb_tunnel *tunnel, int *max_up,
 				int *max_down)
 {
diff --git a/drivers/thunderbolt/tunnel.h b/drivers/thunderbolt/tunnel.h
index d7bbdf8c8186..bf690f7beeee 100644
--- a/drivers/thunderbolt/tunnel.h
+++ b/drivers/thunderbolt/tunnel.h
@@ -29,7 +29,7 @@ enum tb_tunnel_type {
  * @init: Optional tunnel specific initialization
  * @deinit: Optional tunnel specific de-initialization
  * @activate: Optional tunnel specific activation/deactivation
- * @maximum_bandwidth:
+ * @maximum_bandwidth: Returns maximum possible bandwidth for this tunnel
  * @allocated_bandwidth: Return how much bandwidth is allocated for the tunnel
  * @alloc_bandwidth: Change tunnel bandwidth allocation
  * @consumed_bandwidth: Return how much bandwidth the tunnel consumes
-- 
2.39.0

