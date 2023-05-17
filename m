Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 283C470631F
	for <lists+linux-usb@lfdr.de>; Wed, 17 May 2023 10:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbjEQIk4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 04:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjEQIkz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 04:40:55 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C63E71A5
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 01:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684312854; x=1715848854;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3fZhNINi1/KayY6QIEiyuNWlwxEN7AiDp6qwDC1Yrnw=;
  b=VQ6gvLyq5aAP5ndghV4xfIWmgIL0+EGJZeqtQ8ol6HD2Fh2vRc/fIXJX
   2iAduRHqM2AYYfSniIFf7w5joOHIWtjaNEdKUrnUUAN9jTIU1IVZ0gXS/
   geoi7GUs3Lv01hujshTqwUqME4GoUIkQlq/iXxJFIuyfPPzIxIJJNmVlY
   RSBMixpZdpQcquQdrZvKtMzDmRDX2Z0zGkACroaXMTcoJEktTByRY+Kbr
   qsviDvaX/FQ+68u0o3el06MZsRMASo6xY4OYX9UeEco2NZpfgrDVWgSOY
   jH89YHYVze5imNp9pC0w8qSBgVpsFOGadMMJf3F7Ib8ehzE2LSfPkqdgC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="415113326"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="415113326"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 01:40:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="813779595"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="813779595"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 17 May 2023 01:40:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 0188A618; Wed, 17 May 2023 11:41:03 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/7] thunderbolt: Check for ring 0 in tb_tunnel_alloc_dma()
Date:   Wed, 17 May 2023 11:40:57 +0300
Message-Id: <20230517084103.45213-1-mika.westerberg@linux.intel.com>
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

Ring 0 cannot be used for anything else than control channel messages.
For this reason add a check to tb_tunnel_alloc_dma() and fail if someone
tries to do that.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 9099ae73e78f..dd3b5613ad2c 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -1452,6 +1452,10 @@ struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
 	struct tb_path *path;
 	int credits;
 
+	/* Ring 0 is reserved for control channel */
+	if (WARN_ON(!receive_ring || !transmit_ring))
+		return NULL;
+
 	if (receive_ring > 0)
 		npaths++;
 	if (transmit_ring > 0)
-- 
2.39.2

