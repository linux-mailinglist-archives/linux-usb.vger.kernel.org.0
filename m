Return-Path: <linux-usb+bounces-16594-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 478DF9AC78A
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 12:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C120F1F23505
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 10:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318C61A3A95;
	Wed, 23 Oct 2024 10:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4/I2BGt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DB11A3BA1
	for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2024 10:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729678281; cv=none; b=TZ1RlpNpNvf9Fr1ITfPx4pRgxsYu15clxC+MrUr0fCg5E0ldmmWc+GKkLISvrL6cJYvs9QMERato5TOEvXxjZl/GUqYrHzrJVtlYzGMNIL/Gg5bvUybJmF+XBhcFULfIJpEad4/BMzdrBVIyoAh4eyNK7kJLn7twV+gwsWEv+Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729678281; c=relaxed/simple;
	bh=n378+DJm8s5oZJQ6X44LLO6UKYdj720LUK5JhDZITOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hEsMnKurq/7wfJ04zjgOLvwJHSsQ/fQOORfBd2PWALN+DSoolJdOew15FsbnCiOohZOtTkwcKZ0SMDd38x6W3d1FvfSbTnhkFyPZs8J/TavDDbcD411BrTIv7kzWDhz5rFDl2m2wL57CUSnTNmxN+2jeH+vg/YvBprt2NYo4abQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U4/I2BGt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729678280; x=1761214280;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n378+DJm8s5oZJQ6X44LLO6UKYdj720LUK5JhDZITOc=;
  b=U4/I2BGtFICB+8iENW0JzJHS/BsIyYKoERPyfsgG12+JJa/5CV50XCpz
   2TrCOnKebF1XZ0WeJ6gGQ3NNSigVyNrP5IxdUmAM52e7OVlyTnBRZYNCp
   X8jXgyFOTUJTRVfJ7HfXWQRNWzjuOqkNPCcwbkp3Nf8aHUw5rqxrlLDKM
   R9EcX3x09Rt3yw2HAlVtrvmsdmi4+/06YGVlhyRAIhABroE7wlN6KLe+H
   pIdIrbVJwGz7zVtD5iEaeZfEdWrwQ38geEUoG8Me33zfgtJgmGfBgLq2i
   GMxhBNdv01xw+frgKeC9B1K0A0qfrhrBdCvJmJmT564srsmnA10060u/X
   Q==;
X-CSE-ConnectionGUID: Iv99sRNZSi+Dr2/0Q1V8ag==
X-CSE-MsgGUID: fxA3GjLLQ2O8fQvKxcrM2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="32116773"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="32116773"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 03:11:18 -0700
X-CSE-ConnectionGUID: KeBFnSe7QJyI3U3wMmj9gg==
X-CSE-MsgGUID: zOpS7CYjS8Wbj5iApwx0Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="80084202"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 23 Oct 2024 03:11:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 6287D8C4; Wed, 23 Oct 2024 13:11:12 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Aapo Vienamo <aapo.vienamo@iki.fi>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 7/8] thunderbolt: debugfs: Don't hardcode margining results size
Date: Wed, 23 Oct 2024 13:11:10 +0300
Message-ID: <20241023101111.3418311-8-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241023101111.3418311-1-mika.westerberg@linux.intel.com>
References: <20241023101111.3418311-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aapo Vienamo <aapo.vienamo@iki.fi>

Use ARRAY_SIZE() when available or pass in the array size derived from
it. This is in preparation for adding another result data word for
supporting Gen 4 asymmetric links with an additional lane.

Signed-off-by: Aapo Vienamo <aapo.vienamo@iki.fi>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 8 ++++----
 drivers/thunderbolt/tb.h      | 2 +-
 drivers/thunderbolt/usb4.c    | 7 ++++---
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 2f9756c201b6..9899d88b7371 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -1191,7 +1191,7 @@ static int margining_run_write(void *data, u64 val)
 			    margining->lanes);
 
 		ret = usb4_port_hw_margin(port, margining->target, margining->index, &params,
-					  margining->results);
+					  margining->results, ARRAY_SIZE(margining->results));
 	}
 
 	if (down_sw)
@@ -1219,8 +1219,7 @@ static ssize_t margining_results_write(struct file *file,
 		return -ERESTARTSYS;
 
 	/* Just clear the results */
-	margining->results[0] = 0;
-	margining->results[1] = 0;
+	memset(margining->results, 0, sizeof(margining->results));
 
 	if (margining->software) {
 		/* Clear the error counters */
@@ -1312,7 +1311,8 @@ static int margining_results_show(struct seq_file *s, void *not_used)
 	seq_printf(s, "0x%08x\n", margining->results[0]);
 	/* Only the hardware margining has two result dwords */
 	if (!margining->software) {
-		seq_printf(s, "0x%08x\n", margining->results[1]);
+		for (int i = 1; i < ARRAY_SIZE(margining->results); i++)
+			seq_printf(s, "0x%08x\n", margining->results[i]);
 
 		if (margining->lanes == USB4_MARGINING_LANE_ALL) {
 			margining_hw_result_format(s, margining,
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index fb2e1f089169..0954b8bafada 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1398,7 +1398,7 @@ int usb4_port_margining_caps(struct tb_port *port, enum usb4_sb_target target,
 			     u8 index, u32 *caps, size_t ncaps);
 int usb4_port_hw_margin(struct tb_port *port, enum usb4_sb_target target,
 			u8 index, const struct usb4_port_margining_params *params,
-			u32 *results);
+			u32 *results, size_t nresults);
 int usb4_port_sw_margin(struct tb_port *port, enum usb4_sb_target target,
 			u8 index, const struct usb4_port_margining_params *params,
 			u32 *results);
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 985f24b044b3..05985b18834e 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -1655,14 +1655,15 @@ int usb4_port_margining_caps(struct tb_port *port, enum usb4_sb_target target,
  * @target: Sideband target
  * @index: Retimer index if taget is %USB4_SB_TARGET_RETIMER
  * @params: Parameters for USB4 hardware margining
- * @results: Array with at least two elements to hold the results
+ * @results: Array to hold the results
+ * @nresults: Number of elements in the results array
  *
  * Runs hardware lane margining on USB4 port and returns the result in
  * @results.
  */
 int usb4_port_hw_margin(struct tb_port *port, enum usb4_sb_target target,
 			u8 index, const struct usb4_port_margining_params *params,
-			u32 *results)
+			u32 *results, size_t nresults)
 {
 	u32 val;
 	int ret;
@@ -1691,7 +1692,7 @@ int usb4_port_hw_margin(struct tb_port *port, enum usb4_sb_target target,
 		return ret;
 
 	return usb4_port_sb_read(port, target, index, USB4_SB_DATA, results,
-				 sizeof(*results) * 2);
+				 sizeof(*results) * nresults);
 }
 
 /**
-- 
2.45.2


