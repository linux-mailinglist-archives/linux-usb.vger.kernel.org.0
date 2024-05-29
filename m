Return-Path: <linux-usb+bounces-10671-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A99028D36BF
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2024 14:50:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB6961C227C9
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2024 12:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50BC34C70;
	Wed, 29 May 2024 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZMC2fVr9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56002748D
	for <linux-usb@vger.kernel.org>; Wed, 29 May 2024 12:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716987043; cv=none; b=E9NzOO4GET6TipeRB5/lQ2yb4/I9wFJwFdy5UjK+dNG6lpiVLvgLhITEj/P7t1equDWbsnnAW9Ugj8z7AZ8f02Fxy5SgRM4QR9MiBvA5ihvcnBeE0pFktqC/J1cVrV3jLLjdKAKk0cO8xNOfe/1ivaBtdubpyI988XBmeY4Gsj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716987043; c=relaxed/simple;
	bh=uHUm1ZicLxxk/nvv7PllABVU2ZTpvIz46yuu6B4HjKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dwng4KvwcPN/Zpm50x9RMUp7EgzShFEMiuJsdctM21K/r5mqY6EkngletyWPRDArvlrUTqFji3b4ONH773BBEN9ZKcXNg6D/ZYYBkvKyEKcvaiOOXiJaJcXkKyVNqFY+/Ph/Hx5Ou96FrBLtfaeArqlavywpE9mdr8vCHoLwZBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZMC2fVr9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716987042; x=1748523042;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uHUm1ZicLxxk/nvv7PllABVU2ZTpvIz46yuu6B4HjKI=;
  b=ZMC2fVr96qX3uvApTpIlQ6fLdt3UmjHgjzq9HkCv5RmpDnhaQIuvIPYx
   tbC0//6pIToP9WggGF8M208O+bmN9YWQhTrt3roa3jT+JIex2H/vTe+Iw
   T11vmNIa7i1qaFnRuXs8gjHOSse6nSaf+xzQeovDHDSb98K84wIiFRjsk
   f00bpiALYwjQyFRNL2GADMg97wmIEymewqAPIy9E73caluCOuri9Glj/s
   +YHm2AHfXwUDBA8ggD5Hp9aRnYrMpkOemVbStjbixvxUjzEGB61HF8wY/
   HFC+G2/MosdjzYuzg9adG/bmky7N/9JjXjYaUN3SFaS92oktvZXFM4cLV
   A==;
X-CSE-ConnectionGUID: iV39mgktSm+cMeJ3RuGAOg==
X-CSE-MsgGUID: vUuDVMoTRZ2ot6+nqV+OMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="16335139"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="16335139"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 05:50:41 -0700
X-CSE-ConnectionGUID: Ys1KakLoQtqI9/IrxQcQHQ==
X-CSE-MsgGUID: uGCVfReIS+2FvM2l7wV8+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="35402832"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 29 May 2024 05:50:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 001DA20F; Wed, 29 May 2024 15:50:38 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Mention Thunderbolt/USB4 debugging tools in Kconfig
Date: Wed, 29 May 2024 15:50:38 +0300
Message-ID: <20240529125038.1051641-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows the interested parties to find the Thunderbolt/USB4
debugging tools (aka tbtools) easier in case they need to look at the
information under debugfs entries.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/thunderbolt/Kconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/Kconfig b/drivers/thunderbolt/Kconfig
index 448fd2ec8f6e..3e01f41e9d66 100644
--- a/drivers/thunderbolt/Kconfig
+++ b/drivers/thunderbolt/Kconfig
@@ -22,7 +22,11 @@ config USB4_DEBUGFS_WRITE
 	bool "Enable write by debugfs to configuration spaces (DANGEROUS)"
 	help
 	  Enables writing to device configuration registers through
-	  debugfs interface.
+	  debugfs interface. You can use tools such as Thunderbolt/USB4
+	  debugging tools to access these registers. For more
+	  information see:
+
+	    https://github.com/intel/tbtools
 
 	  Only enable this if you know what you are doing! Never enable
 	  this for production systems or distro kernels.
-- 
2.43.0


