Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF68972BB44
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jun 2023 10:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233651AbjFLIxb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jun 2023 04:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233345AbjFLIxA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jun 2023 04:53:00 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C34361FDB
        for <linux-usb@vger.kernel.org>; Mon, 12 Jun 2023 01:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686559942; x=1718095942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nvTw/GZuY+NyXCnGB2Z1yYs3/CsVd3QAeUEWzLQSEEQ=;
  b=PqDRgbCUr8DdxoTVDMZasx1oJjg1933AEwmZfahvmZVqBHnDLF92WftZ
   Ni5qpa7uVTWez69E0e6l/2JoC23ntAviE/TC8FYKY03p7Bmgxdxm/SzTW
   UT9tbkrN+Ae5pdHfiH/8k0NI/O/RxDizOtKMsmhlW3PU0DmvWzlB4QT0l
   v6+5fI7h3DHmGshnDfSG8p6IK12CGpDAS2UlN8c6jfYZecgbMYba+3nKk
   ccn1GuLlGL0PGtS1Mo0rXRWUDkezhd67aN8GonQtIVyFtDNpp2n5eDdbW
   xPi9JiBF3q1/JXOoE6epVq94h+rMxHIY8f++jyHcJq46e6ziMY8nte1VX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347627245"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="347627245"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 01:21:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="744247723"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="744247723"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 12 Jun 2023 01:21:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 52FD434C; Mon, 12 Jun 2023 11:21:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Gil Fine <gil.fine@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 01/20] thunderbolt: Ignore data CRC mismatch for USB4 routers
Date:   Mon, 12 Jun 2023 11:21:26 +0300
Message-Id: <20230612082145.62218-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612082145.62218-1-mika.westerberg@linux.intel.com>
References: <20230612082145.62218-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is also something not always updated after the DROM contents itself
so issue warning but continue parsing it as we do for pre-USB4 DROMs
too.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/eeprom.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
index 0f6099c18a94..eb241b270f79 100644
--- a/drivers/thunderbolt/eeprom.c
+++ b/drivers/thunderbolt/eeprom.c
@@ -605,9 +605,8 @@ static int usb4_drom_parse(struct tb_switch *sw)
 	crc = tb_crc32(sw->drom + TB_DROM_DATA_START, header->data_len);
 	if (crc != header->data_crc32) {
 		tb_sw_warn(sw,
-			   "DROM data CRC32 mismatch (expected: %#x, got: %#x), aborting\n",
+			   "DROM data CRC32 mismatch (expected: %#x, got: %#x), continuing\n",
 			   header->data_crc32, crc);
-		return -EINVAL;
 	}
 
 	return tb_drom_parse_entries(sw, USB4_DROM_HEADER_SIZE);
-- 
2.39.2

