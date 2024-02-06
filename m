Return-Path: <linux-usb+bounces-5934-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E03A84B5E9
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 14:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 394011F26BB5
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 13:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F35212F382;
	Tue,  6 Feb 2024 13:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jcm57zI+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA98C130AD5
	for <linux-usb@vger.kernel.org>; Tue,  6 Feb 2024 13:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707224643; cv=none; b=PB3R3EwEqlqxTsE+pCdpjJxMGSG3wviMHEePCF7jUvqkqBRLJVYFP8j0Waia4CHY9oAx9/w9kzCoxVtMHRWm4W3AcocVtwQoCSw3rMDiupYy03JxoWQBNQiBNp6A1CrLTRi5JDpuSzd3a/Ae5OcEV3/wxLAHZuCK6W8sfdtNm3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707224643; c=relaxed/simple;
	bh=BMpyZSB+/DXjAyPNqf20LCTgX2m6iZ4bG6DG0g0gck0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XhJK0T+1clKehOLMz70E9Hrq1phpdwIEnnNkM9Tqfa28Xtp6Cv8HV7PbR+oQtxVxYFFsLWWiufB0/jQokyRJbXHjRaedeCHIBh/GKnY6NFqySaMRBC6Yn6V7JbBxx4TlNUfYlT/9OmOAKwP8/3APKXTdLQClH6fNbsZQWwAif40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jcm57zI+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707224641; x=1738760641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BMpyZSB+/DXjAyPNqf20LCTgX2m6iZ4bG6DG0g0gck0=;
  b=jcm57zI+ljGQY4H05SzvmkhF00ZZBfrvuEeDu1I6ccVXlzL4TPsTPqAD
   NVVCX2XNyj1mC+y6IlhBiKFu8FIzVV3C1P/nKW/1zVb70F67ZChPXcgfr
   Ene8qLMXI/QLKImVhksWIL0+R4C0LzooI0eBg4BjNPwaxNamwZjhdUNVw
   9L/2l1m7S42C7v1RMsNQd9le62QCbytrWNR39TE4bvxPzPD+u4MCfnV/B
   B4eh93y+Rht9lWjbqHjt+C6t8lR2dHviQVRLNMlF155ZljWKKi1O+NGfl
   t/5ZSLazBvGrSevA+NhWErMJwq/wGhveln2QuTeMGVgi9L1nYAPSPcZWb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="26185054"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="26185054"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 05:03:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="909631994"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="909631994"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 06 Feb 2024 05:03:56 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 04A7EB84; Tue,  6 Feb 2024 15:03:54 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Sanath S <Sanath.S@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/3] thunderbolt: Reset only non-USB4 host routers in resume
Date: Tue,  6 Feb 2024 15:03:52 +0200
Message-ID: <20240206130354.1208816-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206130354.1208816-1-mika.westerberg@linux.intel.com>
References: <20240206130354.1208816-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to reset the USB4 host routers on resume because they
are reset already and this may cause problems if the link does not come
up soon enough. For this reason limit this to happen in non-USB4 host
routers only (that's Apple systems with Intel Thunderbolt controllers).

Fixes: 59a54c5f3dbd ("thunderbolt: Reset topology created by the boot firmware")
Cc: Sanath S <Sanath.S@amd.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 9a261560d0f4..f127088b6ebd 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2710,8 +2710,12 @@ static int tb_resume_noirq(struct tb *tb)
 
 	tb_dbg(tb, "resuming...\n");
 
-	/* remove any pci devices the firmware might have setup */
-	tb_switch_reset(tb->root_switch);
+	/*
+	 * For non-USB4 hosts (Apple systems) remove any PCIe devices
+	 * the firmware might have setup.
+	 */
+	if (!tb_switch_is_usb4(tb->root_switch))
+		tb_switch_reset(tb->root_switch);
 
 	tb_switch_resume(tb->root_switch);
 	tb_free_invalid_tunnels(tb);
-- 
2.43.0


