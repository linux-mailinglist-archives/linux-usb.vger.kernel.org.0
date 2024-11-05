Return-Path: <linux-usb+bounces-17099-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2DC9BC85C
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 09:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E043B1C21ABE
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 08:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8CAA1CEE8A;
	Tue,  5 Nov 2024 08:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+j8JfP+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55421C1738
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730796788; cv=none; b=EyNeRs8/hbXXLm6OUx6ng0dxRHqS/aQv/0M+a9rWJGLTP57HWHuz1kc3vqaoxwri+QYq4OBo2LFI6sl5Y28IkdALjV71+nkAEjr+RoQMaOYDBEY/KfOrbSxi70HhsEs9rELq8dqIM3GEgzlSIot4OYY1YLGDOg5x4DXYI107TnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730796788; c=relaxed/simple;
	bh=4iY4cNam+QDD8MrmiG2rkemevDVmAfTv6jDaG4JgUVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cVUji5Rv65cDgQAWISNtZmzTJ7m4ZtSvazL3lhexNb98TxbG2Kzoj2blDL5MozDOlgqxv+P82NO1LSVv2x4UOnE4SLp3NgEr199HZHjOuZ4A7JHsbEziM/f8IyFFBkFhv5zkoS3zF2sVCO46nxRV23CcBPXS0Wl5h5m0uKmPz8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+j8JfP+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730796787; x=1762332787;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4iY4cNam+QDD8MrmiG2rkemevDVmAfTv6jDaG4JgUVM=;
  b=O+j8JfP+/N9rcp2lPQASY5bgW9l4gWLmYLnElIIsqSac6Mza2weP2urK
   5fZC2xhYoDOZooHviyibfm1WBrrJUIqFKnzCmDgzW4ZENVjvkkmZ77Sp3
   TxSxMCT5uxCSThS0Bq5lS+vATwqpD/hXkJDabkCLWYHA3Qq9aEuu3oxe9
   byp1VHRyfmAJSXH6VOtVb9tG9Y9dEypxnEthVgq2SZADtXoV9IwIaMPU3
   A0AuvYpg7cHzmRhK2uNC+vb0CINcMEyvExTkDbPY84CM0QCQCVS2rZ9kB
   q1r24/tw/zI380OuvFSGgq2Ygay5rvEiPWZKKv8mukLX3C7+LTq0njKwz
   A==;
X-CSE-ConnectionGUID: EVJNMcSGRgWAOHkB0o+A2Q==
X-CSE-MsgGUID: nXhgWdH1Rrig6U+kHIImDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30409907"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="30409907"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 00:53:06 -0800
X-CSE-ConnectionGUID: x0g/uHtKRMy1huIsljlE5w==
X-CSE-MsgGUID: HP4mZ8hSRKKa/f1+SwXYHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="83592092"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 05 Nov 2024 00:53:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 19EC91E0; Tue, 05 Nov 2024 10:53:02 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Rick Lahaye <rick@581238.xyz>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Sanath.S@amd.com,
	christian@heusel.eu,
	fabian@fstab.de,
	gregkh@linuxfoundation.org,
	regressions@lists.linux.dev,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Fix connection issue with Pluggable UD-4VPD dock
Date: Tue,  5 Nov 2024 10:53:01 +0200
Message-ID: <20241105085301.524312-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rick reported that his Pluggable USB4 dock does not work anymore after
6.6.28 kernel.

It looks like commit c6ca1ac9f472 ("thunderbolt: Increase sideband
access polling delay") makes the device router enumeration happen later
than what might be expected by the dock (although there is no such limit
in the USB4 spec) which probably makes it assume there is something
wrong with the high-speed link and reset it. After the link is reset the
same issue happens again and again.

For this reason lower the sideband access delay from 5ms to 1ms. This
seems to work fine according to Rick's testing.

Reported-by: Rick Lahaye <rick@581238.xyz>
Closes: https://lore.kernel.org/linux-usb/000f01db247b$d10e1520$732a3f60$@581238.xyz/
Tested-by: Rick Lahaye <rick@581238.xyz>
Fixes: c6ca1ac9f472 ("thunderbolt: Increase sideband access polling delay")
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/usb4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 0a9b4aeb3fa1..402fdf8b1cde 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -48,7 +48,7 @@ enum usb4_ba_index {
 
 /* Delays in us used with usb4_port_wait_for_bit() */
 #define USB4_PORT_DELAY			50
-#define USB4_PORT_SB_DELAY		5000
+#define USB4_PORT_SB_DELAY		1000
 
 static int usb4_native_switch_op(struct tb_switch *sw, u16 opcode,
 				 u32 *metadata, u8 *status,
-- 
2.45.2


