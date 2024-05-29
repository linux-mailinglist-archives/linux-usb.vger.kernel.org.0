Return-Path: <linux-usb+bounces-10670-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B356E8D3682
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2024 14:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4F301C223F7
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2024 12:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4828418130B;
	Wed, 29 May 2024 12:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BnMrYSqN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7BA13F45C
	for <linux-usb@vger.kernel.org>; Wed, 29 May 2024 12:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716986212; cv=none; b=tIfCCsKub2CPBI3dyufCuGTqOOSu4g9A5P+ilBth+aIK2iXg2Tdr7XKqBQoWMhdFb/2U/dBATAFShFl7OPPGjfJ0RM1A52qByq7TEBJib2CDHfYGKEXBMMOhPvUVr4cDZ3UzfIYryOo/5g3KXK8hOg5rgtlOA5AuTX/s2SH+tAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716986212; c=relaxed/simple;
	bh=lyVWZhsz9sa1Fvcyj3KNF0JWeBZ2PWBAAdPv2b9+O4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CsE/PvZDoGm96ntwirI3Ua5oabf+7tLI1AobNMd0jdQQf3eXufB9W8L1q6w9V4bOzZimo+HE7Q0HWR8IGsfpwZo8wimpui5SkSFwlGEm4BW+UxaDS5FSRMI6mmz6RRhzoOyQ4BBmvj3ASlSZQ8Vuj0X0xjVxjGKcKj0ZF/FK8sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BnMrYSqN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716986211; x=1748522211;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lyVWZhsz9sa1Fvcyj3KNF0JWeBZ2PWBAAdPv2b9+O4I=;
  b=BnMrYSqNvj7XPAkfg8HDTbKengmb7zguim1rxUuDlJf1OK9Y7dn3YWSR
   7ZCj+hyjz++NYvWpMt+Uq2X4/WBgaYTFwiz2myx8VGvZdTSavY+p5+Ijs
   TGg070kXQfgPuxxmFyczwUBc0FaC9v75H0MgRwFim3L0tiF6TzEeyP82u
   Lnv4xbbezVBVqKBESFgs5BswdUkwoFHA0fBa7Iq+Y2oYlv7wcp3ZyEyUm
   8djdtlxqSdM2uUETih6eZysBhTD8pGxkR474Ic/i+abyy8e/asPLHiElH
   jfVij9QqhObRa+gexWFqw78fVm+KXiVnHARqGK6Mq9hsbAFQ+S+mf4Ih4
   A==;
X-CSE-ConnectionGUID: W43qiOcmS7G7eL/Ul2PtEA==
X-CSE-MsgGUID: FKG43JOTTEmABjCukRiIew==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="16333562"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="16333562"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 05:36:50 -0700
X-CSE-ConnectionGUID: 0c9koC7UQHq4cUgtcDJVQA==
X-CSE-MsgGUID: FRB2a8dxT0Syc5BodNBWDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="35398953"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 29 May 2024 05:36:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 7634620F; Wed, 29 May 2024 15:36:47 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Aapo Vienamo <aapo.vienamo@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: debugfs: Fix margin debugfs node creation condition
Date: Wed, 29 May 2024 15:36:47 +0300
Message-ID: <20240529123647.1051160-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aapo Vienamo <aapo.vienamo@linux.intel.com>

The margin debugfs node controls the "Enable Margin Test" field of the
lane margining operations. This field selects between either low or high
voltage margin values for voltage margin test or left or right timing
margin values for timing margin test.

According to the USB4 specification, whether or not the "Enable Margin
Test" control applies, depends on the values of the "Independent
High/Low Voltage Margin" or "Independent Left/Right Timing Margin"
capability fields for voltage and timing margin tests respectively. The
pre-existing condition enabled the debugfs node also in the case where
both low/high or left/right margins are returned, which is incorrect.
This change only enables the debugfs node in question, if the specific
required capability values are met.

Signed-off-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
Fixes: d0f1e0c2a699 ("thunderbolt: Add support for receiver lane margining")
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 193e9dfc983b..70b52aac3d97 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -943,8 +943,9 @@ static void margining_port_init(struct tb_port *port)
 	debugfs_create_file("run", 0600, dir, port, &margining_run_fops);
 	debugfs_create_file("results", 0600, dir, port, &margining_results_fops);
 	debugfs_create_file("test", 0600, dir, port, &margining_test_fops);
-	if (independent_voltage_margins(usb4) ||
-	    (supports_time(usb4) && independent_time_margins(usb4)))
+	if (independent_voltage_margins(usb4) == USB4_MARGIN_CAP_0_VOLTAGE_HL ||
+	    (supports_time(usb4) &&
+	     independent_time_margins(usb4) == USB4_MARGIN_CAP_1_TIME_LR))
 		debugfs_create_file("margin", 0600, dir, port, &margining_margin_fops);
 }
 
-- 
2.43.0


