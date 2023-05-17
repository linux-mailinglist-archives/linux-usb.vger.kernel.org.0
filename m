Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16667706322
	for <lists+linux-usb@lfdr.de>; Wed, 17 May 2023 10:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbjEQIlA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 04:41:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbjEQIk4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 04:40:56 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C75EBE5D
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 01:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684312855; x=1715848855;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fPpkw/B0lnk7DXQvjT/wwoqrELBsrddb/HZVg4grdm0=;
  b=RVQoV35P9iqL5PEG3BRvllOq3x37lOO7ocsn5ksV7ckIJhbQfJKtVjc5
   45vW9rhrVtqaMWdQuvb2b6Qz+a4QxkJtoKXovQcgxNgBOeAZL0FCWJW/k
   xUCYr13gzsq5LkL/svZFXfn3QDWgmusU6yKC2P7yd7+7LtE7PUYHGdEfT
   frczWb2tsFnmjhDpUhTYufDVyq6Vp+SiZnqiZSEbY7nilCfxeKjx1RBg5
   yZbZXIH/85ScMYJ6m4hrTAyvUxY42S9W+9eLqW1iNJp04L9fDw2R6fD9x
   TnEXNev9kfKoVzQITsKXkGbv+az39KuA5NuxspDSj33Ppqsl+SUAiwTYr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="354871305"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="354871305"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 01:40:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="1031624539"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="1031624539"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 17 May 2023 01:40:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 1D31564C; Wed, 17 May 2023 11:41:04 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/7] thunderbolt: Add debug log for link controller power quirk
Date:   Wed, 17 May 2023 11:40:59 +0300
Message-Id: <20230517084103.45213-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517084103.45213-1-mika.westerberg@linux.intel.com>
References: <20230517084103.45213-1-mika.westerberg@linux.intel.com>
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

Add a debug log to this quirk as well so we can see what quirks have
been applied when debugging.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
index 928689b66126..854d84148850 100644
--- a/drivers/thunderbolt/quirks.c
+++ b/drivers/thunderbolt/quirks.c
@@ -10,6 +10,7 @@
 static void quirk_force_power_link(struct tb_switch *sw)
 {
 	sw->quirks |= QUIRK_FORCE_POWER_LINK_CONTROLLER;
+	tb_sw_dbg(sw, "forcing power to link controller\n");
 }
 
 static void quirk_dp_credit_allocation(struct tb_switch *sw)
-- 
2.39.2

