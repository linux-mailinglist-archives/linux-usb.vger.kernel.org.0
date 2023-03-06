Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCB006ABE4E
	for <lists+linux-usb@lfdr.de>; Mon,  6 Mar 2023 12:37:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbjCFLhB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Mar 2023 06:37:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbjCFLg7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Mar 2023 06:36:59 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07E12E3AC
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 03:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678102615; x=1709638615;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zLEx45xp9fEKzPqD0nkVARfxfT7PGHe2/FDmvtmN0SE=;
  b=ewMv0dcc5euvDF6X1J/I71wT3AF9mncvvrGlkxx97OR+jBrtoe0XurE4
   VNlGv5ynTIUY1tgQQLZJRuSsDEeqqYhL46NPImw8CD/W+E5CbS9aBXDzO
   rZw9IsO5diOJUBrP2zH53qZ3Jcl8SzMUQjUcyYbXw588HgK+dY/aycdxj
   BLoTQOsh98ifLP4HSrnZi2JlL5BFBKL/krD5GxigaEgFD5k0+nHYo87sx
   P10SwgTJ9QDQhbXOxqz46it20C7gwmyIVJPiwHZ3ks8t0O4jr5G5AChCh
   Yg7k6AhILHNk9e6qGIfC6F/KRDFXVXBoTmprm/McBMDz6U6fwLuPrN/ZJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="363147601"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="363147601"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 03:35:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="745024098"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="745024098"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 06 Mar 2023 03:35:22 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 38A8A154; Mon,  6 Mar 2023 13:36:06 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        =?UTF-8?q?Christian=20Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>,
        Gil Fine <gil.fine@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 4/5] thunderbolt: Limit USB3 bandwidth of certain Intel USB4 host routers
Date:   Mon,  6 Mar 2023 13:36:04 +0200
Message-Id: <20230306113605.46137-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230306113605.46137-1-mika.westerberg@linux.intel.com>
References: <20230306113605.46137-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Gil Fine <gil.fine@linux.intel.com>

Current Intel USB4 host routers have hardware limitation that the USB3
bandwidth cannot go higher than 16376 Mb/s. Work this around by adding a
new quirk that limits the bandwidth for the affected host routers.

Cc: stable@vger.kernel.org
Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/quirks.c | 31 +++++++++++++++++++++++++++++++
 drivers/thunderbolt/tb.h     |  3 +++
 drivers/thunderbolt/usb4.c   | 17 +++++++++++++++--
 3 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
index ae28a03fa890..1157b8869bcc 100644
--- a/drivers/thunderbolt/quirks.c
+++ b/drivers/thunderbolt/quirks.c
@@ -26,6 +26,19 @@ static void quirk_clx_disable(struct tb_switch *sw)
 	tb_sw_dbg(sw, "disabling CL states\n");
 }
 
+static void quirk_usb3_maximum_bandwidth(struct tb_switch *sw)
+{
+	struct tb_port *port;
+
+	tb_switch_for_each_port(sw, port) {
+		if (!tb_port_is_usb3_down(port))
+			continue;
+		port->max_bw = 16376;
+		tb_port_dbg(port, "USB3 maximum bandwidth limited to %u Mb/s\n",
+			    port->max_bw);
+	}
+}
+
 struct tb_quirk {
 	u16 hw_vendor_id;
 	u16 hw_device_id;
@@ -43,6 +56,24 @@ static const struct tb_quirk tb_quirks[] = {
 	 * DP buffers.
 	 */
 	{ 0x8087, 0x0b26, 0x0000, 0x0000, quirk_dp_credit_allocation },
+	/*
+	 * Limit the maximum USB3 bandwidth for the following Intel USB4
+	 * host routers due to a hardware issue.
+	 */
+	{ 0x8087, PCI_DEVICE_ID_INTEL_ADL_NHI0, 0x0000, 0x0000,
+		  quirk_usb3_maximum_bandwidth },
+	{ 0x8087, PCI_DEVICE_ID_INTEL_ADL_NHI1, 0x0000, 0x0000,
+		  quirk_usb3_maximum_bandwidth },
+	{ 0x8087, PCI_DEVICE_ID_INTEL_RPL_NHI0, 0x0000, 0x0000,
+		  quirk_usb3_maximum_bandwidth },
+	{ 0x8087, PCI_DEVICE_ID_INTEL_RPL_NHI1, 0x0000, 0x0000,
+		  quirk_usb3_maximum_bandwidth },
+	{ 0x8087, PCI_DEVICE_ID_INTEL_MTL_M_NHI0, 0x0000, 0x0000,
+		  quirk_usb3_maximum_bandwidth },
+	{ 0x8087, PCI_DEVICE_ID_INTEL_MTL_P_NHI0, 0x0000, 0x0000,
+		  quirk_usb3_maximum_bandwidth },
+	{ 0x8087, PCI_DEVICE_ID_INTEL_MTL_P_NHI1, 0x0000, 0x0000,
+		  quirk_usb3_maximum_bandwidth },
 	/*
 	 * CLx is not supported on AMD USB4 Yellow Carp and Pink Sardine platforms.
 	 */
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index b3cd13dc783b..275ff5219a3a 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -272,6 +272,8 @@ struct tb_bandwidth_group {
  * @group: Bandwidth allocation group the adapter is assigned to. Only
  *	   used for DP IN adapters for now.
  * @group_list: The adapter is linked to the group's list of ports through this
+ * @max_bw: Maximum possible bandwidth through this adapter if set to
+ *	    non-zero.
  *
  * In USB4 terminology this structure represents an adapter (protocol or
  * lane adapter).
@@ -299,6 +301,7 @@ struct tb_port {
 	unsigned int dma_credits;
 	struct tb_bandwidth_group *group;
 	struct list_head group_list;
+	unsigned int max_bw;
 };
 
 /**
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 95ff02395822..6e87cf993c68 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -1882,6 +1882,15 @@ int usb4_port_retimer_nvm_read(struct tb_port *port, u8 index,
 				usb4_port_retimer_nvm_read_block, &info);
 }
 
+static inline unsigned int
+usb4_usb3_port_max_bandwidth(const struct tb_port *port, unsigned int bw)
+{
+	/* Take the possible bandwidth limitation into account */
+	if (port->max_bw)
+		return min(bw, port->max_bw);
+	return bw;
+}
+
 /**
  * usb4_usb3_port_max_link_rate() - Maximum support USB3 link rate
  * @port: USB3 adapter port
@@ -1903,7 +1912,9 @@ int usb4_usb3_port_max_link_rate(struct tb_port *port)
 		return ret;
 
 	lr = (val & ADP_USB3_CS_4_MSLR_MASK) >> ADP_USB3_CS_4_MSLR_SHIFT;
-	return lr == ADP_USB3_CS_4_MSLR_20G ? 20000 : 10000;
+	ret = lr == ADP_USB3_CS_4_MSLR_20G ? 20000 : 10000;
+
+	return usb4_usb3_port_max_bandwidth(port, ret);
 }
 
 /**
@@ -1930,7 +1941,9 @@ int usb4_usb3_port_actual_link_rate(struct tb_port *port)
 		return 0;
 
 	lr = val & ADP_USB3_CS_4_ALR_MASK;
-	return lr == ADP_USB3_CS_4_ALR_20G ? 20000 : 10000;
+	ret = lr == ADP_USB3_CS_4_ALR_20G ? 20000 : 10000;
+
+	return usb4_usb3_port_max_bandwidth(port, ret);
 }
 
 static int usb4_usb3_port_cm_request(struct tb_port *port, bool request)
-- 
2.39.1

