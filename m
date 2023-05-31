Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8589717B48
	for <lists+linux-usb@lfdr.de>; Wed, 31 May 2023 11:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235309AbjEaJIA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 May 2023 05:08:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235313AbjEaJHn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 May 2023 05:07:43 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FA6512B
        for <linux-usb@vger.kernel.org>; Wed, 31 May 2023 02:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685524055; x=1717060055;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pg1BQKuT7Y/1a8RxUOjAcae90AI6hp57BTgaGlKFFB0=;
  b=iqC656lfLWsT2FoVJrleazITPfYJB9TNbNiRgpzMfSu0SwO7YNinJeat
   oS1Y5QaP+1YFtOOqtY6l9WSHbkOddCT2a4IaUKlp3acmFY0zGn+MAF93F
   VVXFq6IjjPxbXjoQbSsn6QCQ7sIIIEiI9hrVQI/Ez9Nj6gL5RmW3Nu2k8
   28IDeMEzAil2306Ri9oSpE3Uflzx+wGBxFu1OP1OQJhW8sudmZkcIF2CT
   IEvjjsiXSx1aaGr/96bPK/gKtGDSFthVBNrmNezQhGsDYM9gnRFMyOO/j
   VglJ1oj/wk57jvzJQfeu7u49QVyZds8k/bPN9kG4Xgg/EZpXQLkzlEZbH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="354027703"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="354027703"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 02:06:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="657247273"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="657247273"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 31 May 2023 02:06:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 79CBF1040; Wed, 31 May 2023 12:06:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Christian Kellner <ckellner@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 15/20] thunderbolt: Increase NVM_MAX_SIZE to support Intel Barlow Ridge controller
Date:   Wed, 31 May 2023 12:06:40 +0300
Message-Id: <20230531090645.5573-16-mika.westerberg@linux.intel.com>
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

