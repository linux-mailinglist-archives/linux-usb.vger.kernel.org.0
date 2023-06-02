Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5640B71FD44
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jun 2023 11:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234882AbjFBJMu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jun 2023 05:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234840AbjFBJMX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jun 2023 05:12:23 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B36AE5C
        for <linux-usb@vger.kernel.org>; Fri,  2 Jun 2023 02:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685697059; x=1717233059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d7BQiQPPt9qOL4dHuwJEiNs75vqof6eRnLvJK1odEy0=;
  b=Z6zcPGPiounJvn9slBmsNNhg/SwGBR1QRoiCzRMaqX5ZFxGw+6/tjyi0
   fI+Ga8DGXrospI+dO8DPvqlt8C99lfZrs+lqmsfGHPey7xiCG/JITN5yp
   4QyTP016kwlluYydcl3hE3JkDzkEn2dXvn70cp7IK2/7Bh1TxTFqd56W/
   Ft1SO/PVRGrZN7Pa0BaBS/8DDjfoZ90P+oIcZidsFhuAVJXrikp8RMgeD
   HIRB375jA0Ra/Uyh7k4wp9DlaFA5w7rJjiIm2FP35xjdwvZiw/cX1pvLv
   5QKWBsZLIS2jDnpk+VU8Bh/PiHJMStKZmthj1W7XBELKTB9ZUNep+l6Lo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="353317763"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="353317763"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 02:10:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="852083459"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="852083459"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2023 02:10:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 43DFF5FD; Fri,  2 Jun 2023 12:10:56 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Utkarsh H Patel <utkarsh.h.patel@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/3] thunderbolt: Enable/disable sideband depending on USB4 port offline mode
Date:   Fri,  2 Jun 2023 12:10:55 +0300
Message-Id: <20230602091055.65049-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230602091055.65049-1-mika.westerberg@linux.intel.com>
References: <20230602091055.65049-1-mika.westerberg@linux.intel.com>
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

When USB4 port is in offline mode (this mean there is no device
attached) we want to keep the sideband up to make it possible to
communicate with the retimers. In the same way there is no need to
enable sideband transactions when the USB4 port is not offline as they
are already up.

For this reason make the enabling/disabling depend on the USB4 port
offline status.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/retimer.c | 19 +++++++++++++++++++
 drivers/thunderbolt/tb.h      |  5 +++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index a273fb02a02c..47becb363ada 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -206,6 +206,15 @@ static void tb_retimer_set_inbound_sbtx(struct tb_port *port)
 {
 	int i;
 
+	/*
+	 * When USB4 port is online sideband communications are
+	 * already up.
+	 */
+	if (!usb4_port_device_is_offline(port->usb4))
+		return;
+
+	tb_port_dbg(port, "enabling sideband transactions\n");
+
 	for (i = 1; i <= TB_MAX_RETIMER_INDEX; i++)
 		usb4_port_retimer_set_inbound_sbtx(port, i);
 }
@@ -214,6 +223,16 @@ static void tb_retimer_unset_inbound_sbtx(struct tb_port *port)
 {
 	int i;
 
+	/*
+	 * When USB4 port is offline we need to keep the sideband
+	 * communications up to make it possible to communicate with
+	 * the connected retimers.
+	 */
+	if (usb4_port_device_is_offline(port->usb4))
+		return;
+
+	tb_port_dbg(port, "disabling sideband transactions\n");
+
 	for (i = TB_MAX_RETIMER_INDEX; i >= 1; i--)
 		usb4_port_retimer_unset_inbound_sbtx(port, i);
 }
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index a89e0eb399b0..71ca6d500032 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1326,6 +1326,11 @@ struct usb4_port *usb4_port_device_add(struct tb_port *port);
 void usb4_port_device_remove(struct usb4_port *usb4);
 int usb4_port_device_resume(struct usb4_port *usb4);
 
+static inline bool usb4_port_device_is_offline(const struct usb4_port *usb4)
+{
+	return usb4->offline;
+}
+
 void tb_check_quirks(struct tb_switch *sw);
 
 #ifdef CONFIG_ACPI
-- 
2.39.2

