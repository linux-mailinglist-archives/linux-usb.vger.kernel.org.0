Return-Path: <linux-usb+bounces-1019-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FE77B65AF
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 11:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 340C4281A8C
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 09:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568391A722;
	Tue,  3 Oct 2023 09:40:20 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620721548D
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 09:40:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B550B8
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 02:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696326013; x=1727862013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FnIOgaDeaZ+TTr/73d7F72ElLsH6rlhqx/1NvG8jK+s=;
  b=Kv7h1lA1PubUI7l3NnFOfVcLTvR2bUiltPslRENWQ1aZpaHn262dTks/
   4brNgncxNGBo8w4eKCWzmnav4d4Mq9sFsEJ0ucC0SyoZ3LvVEvFIJauWv
   TDPMV4WBy8p3H9g8iQ9UZDUeCBJcp6Qr5XHvC50141SKsOVUSkZ6hRw7O
   E5L/JPOHiygo/Ke4HgQ32nwv5Q2agBP2i6OXNfPLyxjWAWXtS+sztaM0Q
   HpcKpvGN4pl72kdE5rFlz/rTFue1MtFOTAJSQo4pWTTatGc+aj6/PasSK
   C0PI4t4H0nBR5zWvKxj4MmtcaWFK5THBQS40wVZWuXJcMGEzrJyAj2hc8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="362204857"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="362204857"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 02:40:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="727558512"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="727558512"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 03 Oct 2023 02:40:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id A1788198E; Tue,  3 Oct 2023 12:40:05 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 05/13] thunderbolt: Fix debug log when DisplayPort adapter not available for pairing
Date: Tue,  3 Oct 2023 12:39:57 +0300
Message-Id: <20231003094005.2676823-6-mika.westerberg@linux.intel.com>
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

From: Gil Fine <gil.fine@linux.intel.com>

Fix debug log when looking for a DisplayPort adapter pair of DP IN and
DP OUT. In case of no DP adapter available, log the type of the DP
adapter that is not available.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 27bd6ca6f99e..fb14f70ef77d 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1311,13 +1311,12 @@ static void tb_tunnel_dp(struct tb *tb)
 			continue;
 		}
 
-		tb_port_dbg(port, "DP IN available\n");
+		in = port;
+		tb_port_dbg(in, "DP IN available\n");
 
 		out = tb_find_dp_out(tb, port);
-		if (out) {
-			in = port;
+		if (out)
 			break;
-		}
 	}
 
 	if (!in) {
-- 
2.40.1


