Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96355717B3F
	for <lists+linux-usb@lfdr.de>; Wed, 31 May 2023 11:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235403AbjEaJHs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 May 2023 05:07:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235404AbjEaJHa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 May 2023 05:07:30 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE3B1E5F
        for <linux-usb@vger.kernel.org>; Wed, 31 May 2023 02:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685524043; x=1717060043;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pkgD4LRkd2/zDwOPGpc94eNLUX1+9W2u1GBpQ+li/q0=;
  b=KbFbkZtKOBkNRgBQgF167rmyzJQPKfXN2/dSaIW3RYXbXIwQ4hMNY4/h
   dS+LtKPaZfu1OY2d6miqBWeHIf6YdX8Yl+P9T30JzPHixiOeUR+vM4P0z
   0eKvUm2ClvJelVsEkspMaW5Z4T6GjJPPByQKEgftVc5QJaKkcb2CCd2oa
   2p9cyBzFfg6i7AH4vz2wdnClRX8K5b+/Eh4FgIo6TwOImGbtuVoVBKth6
   klE4MaXTQnKjBdMZhNzCCLKGz/KB6o7PZZStDQOETjuY4YBmcCAdqs8pk
   OGBy3sds69FGBE23YRZQrEbBLSbXALHr5G8N3ZmYlUlSJxFK/wsuZLgIj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="354027653"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="354027653"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 02:06:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="657247241"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="657247241"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 31 May 2023 02:06:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 2E407911; Wed, 31 May 2023 12:06:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Christian Kellner <ckellner@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 07/20] thunderbolt: Announce USB4 v2 connection manager support
Date:   Wed, 31 May 2023 12:06:32 +0300
Message-Id: <20230531090645.5573-8-mika.westerberg@linux.intel.com>
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

From: Gil Fine <gil.fine@intel.com>

Program the CMUV (Connection Manager USB4 Version) field for USB4 v2 and
v1 routers according to the spec.

Signed-off-by: Gil Fine <gil.fine@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c  | 8 ++++++--
 drivers/thunderbolt/tb_regs.h | 3 +++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index a0451218af2a..ebe9559c8c79 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2430,9 +2430,13 @@ int tb_switch_configure(struct tb_switch *sw)
 		/*
 		 * For USB4 devices, we need to program the CM version
 		 * accordingly so that it knows to expose all the
-		 * additional capabilities.
+		 * additional capabilities. Program it according to USB4
+		 * version to avoid changing existing (v1) routers behaviour.
 		 */
-		sw->config.cmuv = USB4_VERSION_1_0;
+		if (usb4_switch_version(sw) < 2)
+			sw->config.cmuv = ROUTER_CS_4_CMUV_V1;
+		else
+			sw->config.cmuv = ROUTER_CS_4_CMUV_V2;
 		sw->config.plug_events_delay = 0xa;
 
 		/* Enumerate the switch */
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 69455eaf6351..c8e40ef09903 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -195,6 +195,9 @@ struct tb_regs_switch_header {
 
 #define ROUTER_CS_1				0x01
 #define ROUTER_CS_4				0x04
+/* Used with the router cmuv field */
+#define ROUTER_CS_4_CMUV_V1			0x10
+#define ROUTER_CS_4_CMUV_V2			0x20
 #define ROUTER_CS_5				0x05
 #define ROUTER_CS_5_SLP				BIT(0)
 #define ROUTER_CS_5_WOP				BIT(1)
-- 
2.39.2

