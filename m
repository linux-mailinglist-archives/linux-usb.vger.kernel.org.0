Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFDA706324
	for <lists+linux-usb@lfdr.de>; Wed, 17 May 2023 10:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbjEQIlC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 04:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbjEQIk6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 04:40:58 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129A1B1
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 01:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684312857; x=1715848857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AwyT8fLYe2hfumgg25Y3UbHwoCjVg26Ufs241WC86qQ=;
  b=mHANHNTnmu+DUwnJNxs4tmMqqqAF5OdcWitzsP/6QQK+m0JIRG7KMmQq
   Zwgx8yZ5shQOmPV1D5J70AOBtU8e7aBk24BIfycnuBSFY45Wu+CCsV+Bu
   UblT5Wols087wUbJI4aKeL52cLEaCaEaVbuLiMPIul9cIA15uVH8V3TmB
   bRinRBMZXB9LpnZ8tD7TKDNkwqhWUGj1NiKq7AGOlqUwzThJNVjwHOwBm
   XgLpkndPApQXhsfmK7G/Qb7xl2r6IMZXZdao3N1+ciuFx6WvssLDd7HX9
   9e8qfIGpzlBoFu2l7lF9SnrksQ2TZ39qpNkKZYsWbyAIHpbbZzTESbD8M
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="415113338"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="415113338"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 01:40:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="813779611"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="813779611"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 17 May 2023 01:40:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 49978791; Wed, 17 May 2023 11:41:04 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 6/7] thunderbolt: dma_test: Update MODULE_DESCRIPTION
Date:   Wed, 17 May 2023 11:41:02 +0300
Message-Id: <20230517084103.45213-6-mika.westerberg@linux.intel.com>
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

Make the description match the core driver and the networking with
Thunderbolt/USB4 prefix. No functional changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/dma_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/dma_test.c b/drivers/thunderbolt/dma_test.c
index 14bb6dec6c4b..58496f889d03 100644
--- a/drivers/thunderbolt/dma_test.c
+++ b/drivers/thunderbolt/dma_test.c
@@ -756,5 +756,5 @@ module_exit(dma_test_exit);
 
 MODULE_AUTHOR("Isaac Hazan <isaac.hazan@intel.com>");
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
-MODULE_DESCRIPTION("DMA traffic test driver");
+MODULE_DESCRIPTION("Thunderbolt/USB4 DMA traffic test driver");
 MODULE_LICENSE("GPL v2");
-- 
2.39.2

