Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC0565EA00
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jan 2023 12:35:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232030AbjAELfq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Jan 2023 06:35:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232456AbjAELfb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Jan 2023 06:35:31 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45B0D58D00
        for <linux-usb@vger.kernel.org>; Thu,  5 Jan 2023 03:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672918530; x=1704454530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UzGI9AFlM7zYUnoeuqU8ItZuNsi8sRJsrCrIKiao/SY=;
  b=ZE1HYTL+nLKMjHkRrTp/WDUHuRmPjAAaYmToa9rdHC7CBfR3iqEosXVd
   x+T+FkFU/LDduMenoyAGpe7GnKDr2vuZF4Cli64x8my5HeDVW6mAciL5F
   chrCbgF2RpMHnln0AfhcfTx7u6KwctD942aJSWFEb0sOcpWD1G0LFEh6x
   lFR8gGayAIxsXVKpV42qRasDsAlnsKsXw2Ctq+RTwxVw9OCvp2IEBoKNp
   ZO2GGDo/G9e9bn6NsgEpYD0jGLT6dpsni/eCivXMCP4KypSxGOwTGUrge
   X/+8Xz58l79O2nRS9XBJG7PhMKjp/eduUwr566SUpigpUZWNLFtZL1J68
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="319888863"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="319888863"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 03:35:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="829527655"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="829527655"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 05 Jan 2023 03:35:26 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 95CC3F4; Thu,  5 Jan 2023 13:35:59 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/8] thunderbolt: Use decimal port number in control and tunnel logs too
Date:   Thu,  5 Jan 2023 13:35:52 +0200
Message-Id: <20230105113559.68531-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230105113559.68531-1-mika.westerberg@linux.intel.com>
References: <20230105113559.68531-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use decimal number instead of hex in port numbers as we have been doing
with other logging functions too. This makes the output more consistent.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/ctl.c    | 2 +-
 drivers/thunderbolt/tunnel.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index 0c661a706160..25f7868257de 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -754,7 +754,7 @@ int tb_cfg_ack_plug(struct tb_ctl *ctl, u64 route, u32 port, bool unplug)
 		.pg = unplug ? TB_CFG_ERROR_PG_HOT_UNPLUG
 			     : TB_CFG_ERROR_PG_HOT_PLUG,
 	};
-	tb_ctl_dbg(ctl, "acking hot %splug event on %llx:%x\n",
+	tb_ctl_dbg(ctl, "acking hot %splug event on %llx:%u\n",
 		   unplug ? "un" : "", route, port);
 	return tb_ctl_tx(ctl, &pkg, sizeof(pkg), TB_CFG_PKG_ERROR);
 }
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 1fc3c29b24f8..de584d7e3991 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -49,7 +49,7 @@ static const char * const tb_tunnel_names[] = { "PCI", "DP", "DMA", "USB3" };
 #define __TB_TUNNEL_PRINT(level, tunnel, fmt, arg...)                   \
 	do {                                                            \
 		struct tb_tunnel *__tunnel = (tunnel);                  \
-		level(__tunnel->tb, "%llx:%x <-> %llx:%x (%s): " fmt,   \
+		level(__tunnel->tb, "%llx:%u <-> %llx:%u (%s): " fmt,   \
 		      tb_route(__tunnel->src_port->sw),                 \
 		      __tunnel->src_port->port,                         \
 		      tb_route(__tunnel->dst_port->sw),                 \
-- 
2.35.1

