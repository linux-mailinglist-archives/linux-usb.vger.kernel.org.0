Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 926B763624E
	for <lists+linux-usb@lfdr.de>; Wed, 23 Nov 2022 15:49:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237556AbiKWOtV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Nov 2022 09:49:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237549AbiKWOtP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Nov 2022 09:49:15 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36A0B70188;
        Wed, 23 Nov 2022 06:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669214952; x=1700750952;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yNdh/hk4prTZOSg8R5rGTM68n79WKoKNAojMOq62B0c=;
  b=Kvg0AP4UY358dpDgJDZEWma9ql/q39sFfEyD+KkhQS7PbE0b1+trDHs/
   Yr8a/t9Xibxrzs36qRToPA0W8FLgKv0wmXR3k99r+6fsBQtwlLjw7JFpb
   UR/XUXyZrKH+C/w+/DFbE0viosSOpHinhXQ2vcxVNDjTHRa5rGKUf1htR
   xaNqeJpz+mSBwioyAgqgQ4qO5P3qP4RPfmpsHe5JJeA+jEg5rqNZvJaTV
   1m2ZLThQwdWDDtQP8unRU6OZJlpjK0oLvGmSrzzzM4cGwlDPplJp/3Kaa
   J96sIeJ51qg0laE05HUXpUTJIhV70DZB5HGcSAWAg/C0KH0LTsdye2mY6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="376225206"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="376225206"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 06:48:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="635936971"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="635936971"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 23 Nov 2022 06:48:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A0A95184; Wed, 23 Nov 2022 16:49:03 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jakob Koschel <jakobkoschel@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
        Mathias Nyman <mathias.nyman@intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4 3/4] usb: gadget: udc: bcm63xx: Convert to use list_count()
Date:   Wed, 23 Nov 2022 16:49:00 +0200
Message-Id: <20221123144901.40493-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123144901.40493-1-andriy.shevchenko@linux.intel.com>
References: <20221123144901.40493-1-andriy.shevchenko@linux.intel.com>
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

The list API now provides the list_count() to help with counting
existing nodes in the list. Utilise it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v4: no change
v3: no change
v2: no change
 drivers/usb/gadget/udc/bcm63xx_udc.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/udc/bcm63xx_udc.c b/drivers/usb/gadget/udc/bcm63xx_udc.c
index 2cdb07905bde..0762e49e85f8 100644
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
+			seq_printf(s, "; %zu queued\n", list_count(&iudma->bep->queue));
+		else
 			seq_printf(s, "\n");
-		}
 
 		for (i = 0; i < iudma->n_bds; i++) {
 			struct bcm_enet_desc *d = &iudma->bd_ring[i];
-- 
2.35.1

