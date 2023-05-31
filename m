Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD55A717B39
	for <lists+linux-usb@lfdr.de>; Wed, 31 May 2023 11:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235375AbjEaJHc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 May 2023 05:07:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235368AbjEaJHL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 May 2023 05:07:11 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8275E126
        for <linux-usb@vger.kernel.org>; Wed, 31 May 2023 02:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685524011; x=1717060011;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nvTw/GZuY+NyXCnGB2Z1yYs3/CsVd3QAeUEWzLQSEEQ=;
  b=TW7kSxiqWWYhhaHEbj8EsGQVP2sE4JfCc9xcmWOr7Mw5c0ZzJNi3NbwA
   QG+JxTtk7+BFYddC8tqhmS28roAMRhKNnu3sDYk3BAnyGyKznJ35W6WgS
   NBMu4jJJFE8Hpq76gwohme1lFHDp8QnjAm+USPjq34fd1LOgxHHAXMsi1
   9IafVy9pyQKxnjbv+XZdgp2IU/6hFKhkEB11Om8DdBhZ/nurWTY8TXHWi
   MVXsgjDM2Z/V+fvDWE7nf/WZ6LfhebYfjY1WrGXg2pmy2yuiTJrQmDr0X
   KYq3gDd5kfC/gHgA07gQ4B9p5l0fUIWbghCMGwLAsTIgekMbhPHz4s2w1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="354027624"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="354027624"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 02:06:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="657247210"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="657247210"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 31 May 2023 02:06:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 01C13B9; Wed, 31 May 2023 12:06:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Christian Kellner <ckellner@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 01/20] thunderbolt: Ignore data CRC mismatch for USB4 routers
Date:   Wed, 31 May 2023 12:06:26 +0300
Message-Id: <20230531090645.5573-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531090645.5573-1-mika.westerberg@linux.intel.com>
References: <20230531090645.5573-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
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

