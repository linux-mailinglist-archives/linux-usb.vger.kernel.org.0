Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9C0865CDFD
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 09:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233679AbjADIFf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 03:05:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229773AbjADIFd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 03:05:33 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5846101F6
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 00:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672819532; x=1704355532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c9fcTVrnxjX3gPiqVXJ+kVuS6oWFcwE/0mcgH+ELOG0=;
  b=i8sjdMaKIKvBA6WigW/S5MylRVaZDuYzLTv/wh+uCKFjzELI/NR8AtJY
   32HDyhsdmFdn54UcxoZZQi3JBj5wZYAM0jVYumMyHIAR2s71u/9URXmq0
   Dbh+nIEWpe2oJchKfEzZMJ1WrUG7XvoaFXukn2w1uKENeWZyvgZpwWvoz
   cdlEBKhMfqRpA/8ip8lO5uJ8ntTvtd2SNN+mJzuMDJFZZSPg/e1DfNwWv
   y8WpisS2AiEzFj9D3TgW5cKofCJRItUXKoVR34GcW8BismqONHgVG00rE
   KPAQU9HqwKhoyv5AGmrXhUbgqf5mrMhmaXmlazo6ZaB5PrcoTEmtqPHuz
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="320585145"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; 
   d="scan'208";a="320585145"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2023 00:05:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="687460447"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; 
   d="scan'208";a="687460447"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 04 Jan 2023 00:05:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 0653619E; Wed,  4 Jan 2023 10:06:02 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Utkarsh Patel <utkarsh.h.patel@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/3] thunderbolt: Use correct function to calculate maximum USB3 link rate
Date:   Wed,  4 Jan 2023 10:06:00 +0200
Message-Id: <20230104080601.45562-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230104080601.45562-1-mika.westerberg@linux.intel.com>
References: <20230104080601.45562-1-mika.westerberg@linux.intel.com>
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

We need to take minimum of both sides of the USB3 link into consideration,
not just the downstream port. Fix this by calling tb_usb3_max_link_rate()
instead.

Fixes: 0bd680cd900c ("thunderbolt: Add USB3 bandwidth management")
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 2c3cf7fc3357..1fc3c29b24f8 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -1275,7 +1275,7 @@ static void tb_usb3_reclaim_available_bandwidth(struct tb_tunnel *tunnel,
 		return;
 	} else if (!ret) {
 		/* Use maximum link rate if the link valid is not set */
-		ret = usb4_usb3_port_max_link_rate(tunnel->src_port);
+		ret = tb_usb3_max_link_rate(tunnel->dst_port, tunnel->src_port);
 		if (ret < 0) {
 			tb_tunnel_warn(tunnel, "failed to read maximum link rate\n");
 			return;
-- 
2.35.1

