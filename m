Return-Path: <linux-usb+bounces-1140-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DE37B9E56
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 16:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id D9D261C208EB
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 14:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C8C286A6;
	Thu,  5 Oct 2023 14:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VGfbdMHJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535DB20B31
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 14:04:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C76266EB9
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 07:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696514673; x=1728050673;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FQZBxslfBfYoCDJIhENWAiJoy/e7fvuDt6wGBkkcmEg=;
  b=VGfbdMHJ9x0Apa0VRqwjMsWBp1UkCMyiHouCihVSTkdRPf7LPhUobEwS
   Rr7zr55GTYx/uba93UQY1Y/IUYGakz3rgMGqQ59+ENFC3UapJqN5oS/Rz
   z8w0TYCnGVX3R0twdLrdyCcQoNsNXI5EEZ+fQzqGYUfR1/jHVDRyROA4F
   R2UP6rpjrbf3yBgGwJAmlDHMF23oqftTDqXHpYaVSfAcxpNXWKEyYBYl9
   eA4v70WVN9Q+rJhhHWXtZIV1Y4ysn78gfUKBs688/3RVatvCsE9/GEzL6
   QCbRj8P3Ma0M1sZajxlioKVVU7qnWBjlrvM2k8yHKKL+1Y90ovpo/lxYI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="380732087"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="380732087"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 02:27:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="817511755"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="817511755"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 05 Oct 2023 02:27:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 3724B5C2; Thu,  5 Oct 2023 12:27:30 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 08/10] thunderbolt: Introduce tb_switch_depth()
Date: Thu,  5 Oct 2023 12:27:27 +0300
Message-Id: <20231005092729.3595447-9-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231005092729.3595447-1-mika.westerberg@linux.intel.com>
References: <20231005092729.3595447-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
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


