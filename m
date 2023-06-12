Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A27472BB4E
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jun 2023 10:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234211AbjFLIxk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jun 2023 04:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233935AbjFLIxH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jun 2023 04:53:07 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BCB8268A
        for <linux-usb@vger.kernel.org>; Mon, 12 Jun 2023 01:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686559945; x=1718095945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pkgD4LRkd2/zDwOPGpc94eNLUX1+9W2u1GBpQ+li/q0=;
  b=Gh3l9gzTg924M9I1XM53R21xTMIi08TsKMRXDX3z06Y+0R8LGJeGgOwY
   axKE0BNJFeOV3efGhsLxTjC3UCuGTNvMFhi6GNU9GdzvJOcx285g7Dvmy
   +GKL0u4AAMd4/1e7OjN2TthkVvtbi4wOmmAZYppVwXNgPvF52BK3WFkjm
   oHaOSo1aT3Bvybqrgu6R3Zb2ny36CZ9Zua9uwjyaKrpfR4MKIad3OeytE
   Ti+tBm6js8bhQc+3tbB8r8j6Ayp8huu9u9J9qcJLWUi/TLY/eOcAa+QpT
   gXlaAkaMrxUHmwq4MDBoZnv2gOnWXL+xJ+fX9jBGimoS7rRK8RWF9B7cG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347627281"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="347627281"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 01:21:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="744247754"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="744247754"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 12 Jun 2023 01:21:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 968BA6AE; Mon, 12 Jun 2023 11:21:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Gil Fine <gil.fine@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 07/20] thunderbolt: Announce USB4 v2 connection manager support
Date:   Mon, 12 Jun 2023 11:21:32 +0300
Message-Id: <20230612082145.62218-8-mika.westerberg@linux.intel.com>
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

