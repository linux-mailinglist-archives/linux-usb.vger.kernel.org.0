Return-Path: <linux-usb+bounces-1585-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAE27C8555
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 14:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCE3B1C21270
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 12:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E018615E85;
	Fri, 13 Oct 2023 12:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQRO3IOc"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8193F13FED
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 12:06:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B59CD8
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 05:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697198807; x=1728734807;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FQZBxslfBfYoCDJIhENWAiJoy/e7fvuDt6wGBkkcmEg=;
  b=mQRO3IOccrLjIOkE8kuyjLS2klrE2xDeABaT1yhBEYpdwl2xLOZr6buN
   caR6lPbrn+ZVnR9/q8X153t0C1oj+PFu06pCWsNcaAgNfdrEw3hM6R/zo
   jeuUVO7eIYPUp7cli56+O9WaXSI/eeG+S05vU6Dv93z1FUCHS1AMPvs2s
   Z7kIkGL8IS9ebOHPQ5PwHR4hN6l5Cl+4QGQiFDEpZzWpPcqO7eiFocdhk
   MhIkjLZeo5TLk3dNnGvQHn0O99F/zkacpOJlAQUltpA6ElWJGinVakmeG
   VcMk4smOPGRC8Fnv9qxMngIiAV3Fk1lUYjBFd3LKPQMky+/fAROrMGsHA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375515464"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="375515464"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 05:06:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="754683574"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="754683574"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 13 Oct 2023 05:06:45 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 2C17D7A4; Fri, 13 Oct 2023 15:06:41 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 08/10] thunderbolt: Introduce tb_switch_depth()
Date: Fri, 13 Oct 2023 15:06:38 +0300
Message-Id: <20231013120640.709255-9-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231013120640.709255-1-mika.westerberg@linux.intel.com>
References: <20231013120640.709255-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This is useful helper to find out the depth of a connected router.
Convert the existing users to call this helper instead of open-coding.

No functional changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 4 ++--
 drivers/thunderbolt/tb.h | 9 +++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index e1e2792d14a7..9efe0b1435e8 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -255,13 +255,13 @@ static int tb_enable_clx(struct tb_switch *sw)
 	 * this in the future to cover the whole topology if it turns
 	 * out to be beneficial.
 	 */
-	while (sw && sw->config.depth > 1)
+	while (sw && tb_switch_depth(sw) > 1)
 		sw = tb_switch_parent(sw);
 
 	if (!sw)
 		return 0;
 
-	if (sw->config.depth != 1)
+	if (tb_switch_depth(sw) != 1)
 		return 0;
 
 	/*
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 869ac360e1b5..80e28124f583 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -866,6 +866,15 @@ static inline struct tb_port *tb_switch_downstream_port(struct tb_switch *sw)
 	return tb_port_at(tb_route(sw), tb_switch_parent(sw));
 }
 
+/**
+ * tb_switch_depth() - Returns depth of the connected router
+ * @sw: Router
+ */
+static inline int tb_switch_depth(const struct tb_switch *sw)
+{
+	return sw->config.depth;
+}
+
 static inline bool tb_switch_is_light_ridge(const struct tb_switch *sw)
 {
 	return sw->config.vendor_id == PCI_VENDOR_ID_INTEL &&
-- 
2.40.1


