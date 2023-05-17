Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C454706325
	for <lists+linux-usb@lfdr.de>; Wed, 17 May 2023 10:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbjEQIlF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 04:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbjEQIk6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 04:40:58 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64D65E5D
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 01:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684312857; x=1715848857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GNXhNlwhT5WnAvyzUk7coEPbpNjgVVS8vm/hHSbpZ7U=;
  b=dbY+0poQP2qWB+LN6H7Jr0FPq1nZl/J1PFycW4247UkxLOybGfjB32A1
   tYgbfm5mbrf6Rb2aYjVMj/boh0haqW8Tc7WJWA07ZsIhWDHUSeH4/MZO/
   OF9mhdM0wmocEQjTORkxZXOTT5GUcMESQPjWA5FOIn3kpCdVcE84yH8u8
   heTMTKLNdUg83ayPRSDsThVt0SM4okRksYLQUjR63W5iRsGZZgcBwJ115
   HYWxShFM1s3k4fTZ5VnIv1m85O2qr7Z4u4JFwNvayz4kjDM8ISwRrMt9J
   Lg8OgpqVlBIqbYgb9WwvbtMyfiVdbipO1VfCpaO/lbtCw+bcdeQWFGFCq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="415113342"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="415113342"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 01:40:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="813779609"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="813779609"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 17 May 2023 01:40:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 5344B70C; Wed, 17 May 2023 11:41:04 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 7/7] thunderbolt: Drop retimer vendor check
Date:   Wed, 17 May 2023 11:41:03 +0300
Message-Id: <20230517084103.45213-7-mika.westerberg@linux.intel.com>
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

This is not needed anymore as we already handle unknown vendor in NVM
functions.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/retimer.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index 9cc28197dbc4..ccc2f0e7adba 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -341,12 +341,6 @@ static int tb_retimer_add(struct tb_port *port, u8 index, u32 auth_status)
 		return ret;
 	}
 
-	if (vendor != PCI_VENDOR_ID_INTEL && vendor != 0x8087) {
-		tb_port_info(port, "retimer NVM format of vendor %#x is not supported\n",
-			     vendor);
-		return -EOPNOTSUPP;
-	}
-
 	/*
 	 * Check that it supports NVM operations. If not then don't add
 	 * the device at all.
-- 
2.39.2

