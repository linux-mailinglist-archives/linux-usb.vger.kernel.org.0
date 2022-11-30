Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F291263D71E
	for <lists+linux-usb@lfdr.de>; Wed, 30 Nov 2022 14:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbiK3NtM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Nov 2022 08:49:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbiK3NtK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Nov 2022 08:49:10 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA2825C67;
        Wed, 30 Nov 2022 05:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669816149; x=1701352149;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HI3mIdGxpwMNpBOCxwOqAfT9zwwhndChIxh60vJ//mU=;
  b=Ug/JaiJ7dPdDlQVJE+lIompSA1RpmrbkKyKqQnJHrua9qN6ytONMlwJ0
   KVPNX0U0uRiapcP4zVqz48iQIUgRqEkR/Kn+8vU+yGpjpMWtCHajrNqnL
   g3yM2E59EIjqF9P3qPhZ40Xfz+hh+Va/Vgi3mJAUug4WIRU4gzoB/YJoB
   +6qpEXwLTZ6bl3cSvpOW4Z2KR8Wt9/sxCX1r2mTq4pBx8QJxA0pHtxjh/
   BXovfc/A6CqCbOVT/9c9XlAaQFEYZFw70lb9yHd3/z7gnd+xCEwlZv1oI
   VQqJmc5N9DnjPn2G+HI7zo2rnTotqCwSpeCQwLpBZ/5GAHB+BbUc9oE8Y
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="298769771"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="298769771"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 05:48:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="676825895"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="676825895"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 30 Nov 2022 05:48:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id ABBE73B3; Wed, 30 Nov 2022 15:48:39 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kevin Cernekee <cernekee@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>
Subject: [PATCH v5 3/4] usb: gadget: udc: bcm63xx: Convert to use list_count_nodes()
Date:   Wed, 30 Nov 2022 15:48:37 +0200
Message-Id: <20221130134838.23805-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221130134838.23805-1-andriy.shevchenko@linux.intel.com>
References: <20221130134838.23805-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The list API provides the list_count_nodes() to help with counting
existing nodes in the list. Utilise it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v5: used renamed API (LKP)
v4: no change
v3: no change
v2: no change
 drivers/usb/gadget/udc/bcm63xx_udc.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/udc/bcm63xx_udc.c b/drivers/usb/gadget/udc/bcm63xx_udc.c
index 2cdb07905bde..771ba1ffce95 100644
--- a/drivers/usb/gadget/udc/bcm63xx_udc.c
+++ b/drivers/usb/gadget/udc/bcm63xx_udc.c
@@ -2172,7 +2172,6 @@ static int bcm63xx_iudma_dbg_show(struct seq_file *s, void *p)
 
 	for (ch_idx = 0; ch_idx < BCM63XX_NUM_IUDMA; ch_idx++) {
 		struct iudma_ch *iudma = &udc->iudma[ch_idx];
-		struct list_head *pos;
 
 		seq_printf(s, "IUDMA channel %d -- ", ch_idx);
 		switch (iudma_defaults[ch_idx].ep_type) {
@@ -2205,14 +2204,10 @@ static int bcm63xx_iudma_dbg_show(struct seq_file *s, void *p)
 		seq_printf(s, "  desc: %d/%d used", iudma->n_bds_used,
 			   iudma->n_bds);
 
-		if (iudma->bep) {
-			i = 0;
-			list_for_each(pos, &iudma->bep->queue)
-				i++;
-			seq_printf(s, "; %d queued\n", i);
-		} else {
+		if (iudma->bep)
+			seq_printf(s, "; %zu queued\n", list_count_nodes(&iudma->bep->queue));
+		else
 			seq_printf(s, "\n");
-		}
 
 		for (i = 0; i < iudma->n_bds; i++) {
 			struct bcm_enet_desc *d = &iudma->bd_ring[i];
-- 
2.35.1

