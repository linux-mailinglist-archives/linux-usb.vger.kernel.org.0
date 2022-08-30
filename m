Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BAE35A64AF
	for <lists+linux-usb@lfdr.de>; Tue, 30 Aug 2022 15:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbiH3N2L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Aug 2022 09:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbiH3N1p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Aug 2022 09:27:45 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3654DAC244
        for <linux-usb@vger.kernel.org>; Tue, 30 Aug 2022 06:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661866060; x=1693402060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XFp/2CjMgiyAxx3ImjX3yhfY9GON3ifAOSKb8kFByYE=;
  b=DF1pH9wHaCwTV9rWdxbnKGlbNHGYg9DAQA5cVwU4WAc2im82xqf8mJHV
   k7UGSwam6QPpG7DPiX09JP1+NFWmgL/dAYvMdB594c+dt4iw/cXrrpl22
   Pb/cpkuro0GIB7KjHu6cXgmcuuz3HS7Z5Uwk+cMxbXLOLCFPKB3BhlsER
   MK3fYm08EpIX2SRS/y+aTWkROfcMtgX/WPSmQ3QKgB/D0fY4Br+evfP7L
   wfpGsTFtT/10fYoz6HlBbXMM3Q5LVnNyHOm4TzU3J5rESYXJU01txQTZv
   zNU4xjptbzhQ/5s6K/ETRQzVD701/+Yx74bOr+W5FEYb+X+omVCUCfCw3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="321301066"
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="321301066"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 06:27:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="562643200"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 30 Aug 2022 06:27:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 1145D41; Tue, 30 Aug 2022 16:27:52 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 1/5] thunderbolt: Move tb_xdomain_parent() to tb.h
Date:   Tue, 30 Aug 2022 16:27:47 +0300
Message-Id: <20220830132751.42518-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830132751.42518-1-mika.westerberg@linux.intel.com>
References: <20220830132751.42518-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We are going to need this for lane margining support so make it
available outside of xdomain.c.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.h      | 5 +++++
 drivers/thunderbolt/xdomain.c | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 5db76de40cc1..8291cabd2e92 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1132,6 +1132,11 @@ void tb_xdomain_remove(struct tb_xdomain *xd);
 struct tb_xdomain *tb_xdomain_find_by_link_depth(struct tb *tb, u8 link,
 						 u8 depth);
 
+static inline struct tb_switch *tb_xdomain_parent(struct tb_xdomain *xd)
+{
+	return tb_to_switch(xd->dev.parent);
+}
+
 int tb_retimer_scan(struct tb_port *port, bool add);
 void tb_retimer_remove_all(struct tb_port *port);
 
diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index c31c0d94d8b3..e4bbc4cb5f97 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -1131,11 +1131,6 @@ static int populate_properties(struct tb_xdomain *xd,
 	return 0;
 }
 
-static inline struct tb_switch *tb_xdomain_parent(struct tb_xdomain *xd)
-{
-	return tb_to_switch(xd->dev.parent);
-}
-
 static int tb_xdomain_update_link_attributes(struct tb_xdomain *xd)
 {
 	bool change = false;
-- 
2.35.1

