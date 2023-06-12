Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96BB872BB53
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jun 2023 10:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233724AbjFLIxu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jun 2023 04:53:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233788AbjFLIxL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jun 2023 04:53:11 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB92D30CD
        for <linux-usb@vger.kernel.org>; Mon, 12 Jun 2023 01:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686559947; x=1718095947;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pg1BQKuT7Y/1a8RxUOjAcae90AI6hp57BTgaGlKFFB0=;
  b=M4HX7Vuxc66HRbzXiOIzGcCMetvbmp38PocDQnKjmHBUxxoIXaqyVIB/
   HR46A5O/uHjXcjG6DwTgJooC4MRIwfK3u3tsqexWEaZ8KZZ4DUgYdu+cf
   Lvm2kfiKQHx4OmrhTFRPfwUUhLMdGJcz1pj0iiez0xOULQ27tBVpH558g
   IEQ4Ceo//jixjeRWp4YCCnaFzPdyJrI5t+E/WvWSTpJMviIR6U5XVMXwV
   wapyCOuGVoeMWwoTGIa3hRc7ACJy15FXV8kcSjlfGHyN0xNM1z09OXjPs
   3l4zMdp4//Z/ArBDLAMffLy4cwyVMkR1bN4kny3oy9h1pVzKFuYz10/UO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347627313"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="347627313"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 01:21:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="744247779"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="744247779"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 12 Jun 2023 01:21:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id E875199D; Mon, 12 Jun 2023 11:21:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Gil Fine <gil.fine@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 15/20] thunderbolt: Increase NVM_MAX_SIZE to support Intel Barlow Ridge controller
Date:   Mon, 12 Jun 2023 11:21:40 +0300
Message-Id: <20230612082145.62218-16-mika.westerberg@linux.intel.com>
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

From: Gil Fine <gil.fine@linux.intel.com>

Intel Barlow Ridge discrete USB4 controller has larger NOR Flash, hence
increase NVM_MAX_SIZE to support it.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/nvm.c b/drivers/thunderbolt/nvm.c
index b004f29ad2b6..69fb3b0fa34f 100644
--- a/drivers/thunderbolt/nvm.c
+++ b/drivers/thunderbolt/nvm.c
@@ -13,7 +13,7 @@
 #include "tb.h"
 
 #define NVM_MIN_SIZE		SZ_32K
-#define NVM_MAX_SIZE		SZ_512K
+#define NVM_MAX_SIZE		SZ_1M
 #define NVM_DATA_DWORDS		16
 
 /* Intel specific NVM offsets */
-- 
2.39.2

