Return-Path: <linux-usb+bounces-21679-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D360A5D954
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 10:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFD533B5E4C
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 09:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E363323A9AC;
	Wed, 12 Mar 2025 09:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EnRfqItv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC46123A997
	for <linux-usb@vger.kernel.org>; Wed, 12 Mar 2025 09:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741771571; cv=none; b=rAJcgxshvvQZGCSz5s52LK1F6R1SupiAbk9t81YXVnNtbGbphhvioaYgVe15zGUdkeFBltRFELgDCn2z2ZS2wjB9wNSDs63+y4341fnF8qaP06oG4TJHbM7XATiBQLaDRwEdDKzXcUii9tQM7Z/tjHbHZIQDKoPBZ4mwSQDKi0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741771571; c=relaxed/simple;
	bh=ppkejaGeDKjR04GDEFxCCMsKHFJaqDskEoHj3o3d19M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FP77DfFhzxr8PjqnSLvYn9hmMmMn9X85rpVncP49+MDPn8V0tcFw04dmxDLxT5rEOZ9L0GOAqsJXSCg7gh73TO8REIvfNXjmTvWdTthobv3PUwWmLn6QxGgLuhBH9W5bzuy+i0lHlDrQnwvOSQKbDazXcmdXUVCP/giosXstL+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EnRfqItv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741771570; x=1773307570;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ppkejaGeDKjR04GDEFxCCMsKHFJaqDskEoHj3o3d19M=;
  b=EnRfqItv7c34ZfMYrlPYY47r8YkSZWl8yokiOKVDJZbrwHwRMdLbwx7A
   QVMuOnqXKHdK5hKf/z2Fvf+LeDirRAkHFWP93nP989GiBRjf9w7RE6/vo
   7LL/+0TMTL6k8lDt1rSAtsdWweEk26j0pleXAgP39qTLmtnPq1LTWOQdH
   2lFAsjJI9YVfTRb2TcsoiXxanKU8cdxHjD+3Amwjh9rIB9wYg7Q0SJL7p
   1PjNp5NyRAc3el14II5z5ffafwj34vaU3HZBu0QIUoAN6fYd3z6pD2UJY
   zILgB06pU8XurjMChHRQc/JNvpZhNqOcnC7sr49fS4NPonfv3W2BPBZ6o
   g==;
X-CSE-ConnectionGUID: FcF4bhKFTDiLj8HBLZ5jZA==
X-CSE-MsgGUID: RdB055a6T4uUh9m2Vmm6Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="43044506"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="43044506"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 02:26:07 -0700
X-CSE-ConnectionGUID: Kfgbj7VdS7GjFb6kbd08LA==
X-CSE-MsgGUID: +gGQLAmoSxGYcrymYuSrGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="121287816"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 12 Mar 2025 02:26:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 08A40130; Wed, 12 Mar 2025 11:26:03 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: Thomas Lynema <lyz27@yahoo.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/2] thunderbolt: Do not add non-active NVM if NVM upgrade is disabled for retimer
Date: Wed, 12 Mar 2025 11:26:03 +0200
Message-ID: <20250312092603.3666723-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250312092603.3666723-1-mika.westerberg@linux.intel.com>
References: <20250312092603.3666723-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is only used to write a new NVM in order to upgrade the retimer
firmware. It does not make sense to expose it if upgrade is disabled.
This also makes it consistent with the router NVM upgrade.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/retimer.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index 1f25529fe05d..361fece3d818 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -93,9 +93,11 @@ static int tb_retimer_nvm_add(struct tb_retimer *rt)
 	if (ret)
 		goto err_nvm;
 
-	ret = tb_nvm_add_non_active(nvm, nvm_write);
-	if (ret)
-		goto err_nvm;
+	if (!rt->no_nvm_upgrade) {
+		ret = tb_nvm_add_non_active(nvm, nvm_write);
+		if (ret)
+			goto err_nvm;
+	}
 
 	rt->nvm = nvm;
 	dev_dbg(&rt->dev, "NVM version %x.%x\n", nvm->major, nvm->minor);
-- 
2.47.2


