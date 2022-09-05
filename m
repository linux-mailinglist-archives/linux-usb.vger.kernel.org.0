Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0C75AD201
	for <lists+linux-usb@lfdr.de>; Mon,  5 Sep 2022 14:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236892AbiIEMCO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Sep 2022 08:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236772AbiIEMB7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Sep 2022 08:01:59 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF865AC42
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 05:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662379317; x=1693915317;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4VpzIqWWEFflDNLNjLJzyC0Fap0RM4D+tmuyBWzQWvM=;
  b=iuEbxXsatkfux6FaAQ+4rQAhApWVG6ebb26wUA/g0PNCWw2TG8dxhguQ
   K++8Exl3feecwoXMjbUktGtGRnizSH/4y5trRrDq7GuAx8s1cBTo+Vpqj
   SgJEVAttfoW/5WTWn4itOVxvwic45Le3YGOh82w1T7G35fDLpzYfNwBOs
   BVal/vMw2Vmbq9x09A2KEisF0jHH+zzsIB8ju8SQmR6MqDZVqIrpJKk4d
   3co+FTvobY+fHB7eq2Zqr4rYtyPEhEVdOB4VSFOe1YE5NFhVkVhJ42tH6
   D3Me6fCLjgPZ4MCkqy89j78RUDKr9DNNWzwp9YeUeA51SjpPJHDy6U7n9
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="295113123"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="295113123"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 05:01:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="613760091"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 05 Sep 2022 05:01:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 2C13FF7; Mon,  5 Sep 2022 15:02:06 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Szuying Chen <Chloe_Chen@asmedia.com.tw>
Cc:     gregkh@linuxfoundation.org, mario.limonciello@amd.com,
        andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Yd_Tseng@asmedia.com.tw,
        Richard_Hsu@asmedia.com.tw, Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v9 1/6] thunderbolt: Allow NVM upgrade of USB4 host routers
Date:   Mon,  5 Sep 2022 15:02:00 +0300
Message-Id: <20220905120205.23025-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220905120205.23025-1-mika.westerberg@linux.intel.com>
References: <20220905120205.23025-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Szuying Chen <Chloe_Chen@asmedia.com.tw>

Intel pre-USB4 host routers required the firmware connection manager to
be active in order to perform NVM firmware upgrade and for this reason
it was disabled when software connection manager is active. However,
this is not necessary for USB4 host routers as this functionality is
part of router operations that the router implements if it wants to
support this.

Signed-off-by: Szuying Chen <Chloe_Chen@asmedia.com.tw>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 4a659cea26f7..462845804427 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1442,8 +1442,11 @@ static int tb_start(struct tb *tb)
 	 * ICM firmware upgrade needs running firmware and in native
 	 * mode that is not available so disable firmware upgrade of the
 	 * root switch.
+	 *
+	 * However, USB4 routers support NVM firmware upgrade if they
+	 * implement the necessary router operations.
 	 */
-	tb->root_switch->no_nvm_upgrade = true;
+	tb->root_switch->no_nvm_upgrade = !tb_switch_is_usb4(tb->root_switch);
 	/* All USB4 routers support runtime PM */
 	tb->root_switch->rpm = tb_switch_is_usb4(tb->root_switch);
 
-- 
2.35.1

