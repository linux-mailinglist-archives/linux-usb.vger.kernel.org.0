Return-Path: <linux-usb+bounces-1010-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 262187B65A5
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 11:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 8E7AF281C3F
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 09:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8014915EBF;
	Tue,  3 Oct 2023 09:40:16 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12B4FC1F
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 09:40:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4398B7
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 02:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696326013; x=1727862013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xK2kF0FfhyYil8LC5wQg6mLunD2zv8hmNuZ/dkfrDtc=;
  b=EozjzziEFM9N+4JE3K4zo3AfdegRRieAOsFC85L2E8TR8NGy/H/dB18Q
   ZQuABP88rUZ9eUpLQCSSnd8doevRo5IdP+42f3ZMPjqIqiPN3jnB9QFvq
   AKZDIbLlirKBdb1OZz4VjfIdlmPcgK5AEaRPI6MgKOm/AzB8pMpR2Yh8N
   n5CDYlcT43EMt5/8BiAZvYywx93xuF02q/5Hzg981E0pd5XNpF+/SvoYN
   U5jJu9UeNdKd2ynHPD7UvVKZjNu3zZd0nlR2g6suDuWN4+Qpc8WGDaad6
   z4u8KaryiaVNTmL3rDJVgl16887iCc8HymLAFTMmwln/z2/W4ZONQ2J18
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1424884"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="1424884"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 02:40:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="997945442"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="997945442"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 03 Oct 2023 02:40:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 8554D18B4; Tue,  3 Oct 2023 12:40:05 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 01/13] thunderbolt: dma_test: Use enum tb_link_width
Date: Tue,  3 Oct 2023 12:39:53 +0300
Message-Id: <20231003094005.2676823-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231003094005.2676823-1-mika.westerberg@linux.intel.com>
References: <20231003094005.2676823-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Since we have it, use it in the DMA test driver as well.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/dma_test.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/thunderbolt/dma_test.c b/drivers/thunderbolt/dma_test.c
index 39476fc48801..9e47a63f28e7 100644
--- a/drivers/thunderbolt/dma_test.c
+++ b/drivers/thunderbolt/dma_test.c
@@ -101,7 +101,7 @@ struct dma_test {
 	unsigned int packets_sent;
 	unsigned int packets_received;
 	unsigned int link_speed;
-	unsigned int link_width;
+	enum tb_link_width link_width;
 	unsigned int crc_errors;
 	unsigned int buffer_overflow_errors;
 	enum dma_test_result result;
@@ -465,9 +465,9 @@ DMA_TEST_DEBUGFS_ATTR(packets_to_send, packets_to_send_get,
 static int dma_test_set_bonding(struct dma_test *dt)
 {
 	switch (dt->link_width) {
-	case 2:
+	case TB_LINK_WIDTH_DUAL:
 		return tb_xdomain_lane_bonding_enable(dt->xd);
-	case 1:
+	case TB_LINK_WIDTH_SINGLE:
 		tb_xdomain_lane_bonding_disable(dt->xd);
 		fallthrough;
 	default:
@@ -490,12 +490,8 @@ static void dma_test_check_errors(struct dma_test *dt, int ret)
 	if (!dt->error_code) {
 		if (dt->link_speed && dt->xd->link_speed != dt->link_speed) {
 			dt->error_code = DMA_TEST_SPEED_ERROR;
-		} else if (dt->link_width) {
-			const struct tb_xdomain *xd = dt->xd;
-
-			if ((dt->link_width == 1 && xd->link_width != TB_LINK_WIDTH_SINGLE) ||
-			    (dt->link_width == 2 && xd->link_width < TB_LINK_WIDTH_DUAL))
-				dt->error_code = DMA_TEST_WIDTH_ERROR;
+		} else if (dt->link_width && dt->link_width != dt->xd->link_width) {
+			dt->error_code = DMA_TEST_WIDTH_ERROR;
 		} else if (dt->packets_to_send != dt->packets_sent ||
 			 dt->packets_to_receive != dt->packets_received ||
 			 dt->crc_errors || dt->buffer_overflow_errors) {
-- 
2.40.1


