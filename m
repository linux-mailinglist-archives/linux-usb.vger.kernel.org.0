Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09D865234C6
	for <lists+linux-usb@lfdr.de>; Wed, 11 May 2022 15:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244222AbiEKN4k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 09:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244371AbiEKN4W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 09:56:22 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CC201EEDA
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 06:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652277380; x=1683813380;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=g34ni762V7ZNpKT1kr6emy3LlL/db6fdQrXnmpTZEYw=;
  b=JSwFVtEjGrLb/B+N7HFPubnf0x41ypcsNTdq3UifuLHKBJQE49+5jWDu
   reN/9M6qaivV9UQblWts/6ZIcBEQ5XTwt8DnTMplYR2a1w3JT3pxxPaM6
   D7PZKxD1/LGRUSzYDN3NLXsbV50y1+PNPnVTcBDeNQOzsyu6T/hkd4JdH
   Oshs+DWCuvVkjn6bDOzM07Qhm5ev4Z+2uF/TD4KOzQ+91GjUTlOLfXLb6
   MWuh9naLtW6vg13V9/4GYZefZrTxLECC3WcjUskSIYQ7TtjOY0KIIIeU9
   TVwbnK38glGQDuXe09rMivwIBUe7jImkFTEvdY5gX1vJDfMWvbWnCuZug
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="249599711"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; 
   d="scan'208";a="249599711"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 06:56:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; 
   d="scan'208";a="553332023"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by orsmga002.jf.intel.com with ESMTP; 11 May 2022 06:56:18 -0700
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH v3 3/6] thunderbolt: Fix typos in CLx enabling
Date:   Wed, 11 May 2022 17:05:46 +0300
Message-Id: <20220511140549.10571-4-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220511140549.10571-1-gil.fine@intel.com>
References: <20220511140549.10571-1-gil.fine@intel.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix few typos in CLx enabling.

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/switch.c | 2 +-
 drivers/thunderbolt/tmu.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 549523c9a543..42b7daaf9c4d 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -3485,7 +3485,7 @@ static int tb_switch_enable_cl0s(struct tb_switch *sw)
  * to improve performance. CLx is enabled only if both sides of the link
  * support CLx, and if both sides of the link are not configured as two
  * single lane links and only if the link is not inter-domain link. The
- * complete set of conditions is descibed in CM Guide 1.0 section 8.1.
+ * complete set of conditions is described in CM Guide 1.0 section 8.1.
  *
  * Return: Returns 0 on success or an error code on failure.
  */
diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index e4a07a26f693..b656659d02fb 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -606,7 +606,7 @@ int tb_switch_tmu_enable(struct tb_switch *sw)
 /**
  * tb_switch_tmu_configure() - Configure the TMU rate and directionality
  * @sw: Router whose mode to change
- * @rate: Rate to configure Off/LowRes/HiFi
+ * @rate: Rate to configure Off/Normal/HiFi
  * @unidirectional: If uni-directional (bi-directional otherwise)
  *
  * Selects the rate of the TMU and directionality (uni-directional or
-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

