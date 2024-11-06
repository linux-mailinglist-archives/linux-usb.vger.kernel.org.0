Return-Path: <linux-usb+bounces-17205-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 100009BE3F8
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:14:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAFF91F24D50
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116601DED49;
	Wed,  6 Nov 2024 10:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bnc7czZ6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ED41DED40
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730888014; cv=none; b=Ubgr8h23uZ8HrY45vu7MNLtOabjp65HKJGGHIK58FQerRD04zc0h2J5RaVmOb7/n28Yv8BqBckGdMYsnawl+LVdqvNTTLaXPaKnz9TdZHxrGfjEi4tsC4lDiKcqFC6P6+KMwfPKDnESGArzZQLZ1WYPnCnWaE3RVujjFAMBWdCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730888014; c=relaxed/simple;
	bh=FBBNu4/OWSApVnM5u94pi6qXmTLcxl0YdT16OEpRW+k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R4t9Mo4KxTs0koTIv45hci/soyw24XdaU9Q+v2XuIVKHsEBuy9qcxBZ2xDKy0lAdnP7CgwKVKYYF+xiy5Vly7j9KH7yiTkNRzwOawYbSwwlpTgFU32CfFsJ/rVEyKDOQnO6d3pj4tBIs/VLwbFgF+9PwudL9RjG8C1PmZNBmt9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bnc7czZ6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730888013; x=1762424013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FBBNu4/OWSApVnM5u94pi6qXmTLcxl0YdT16OEpRW+k=;
  b=Bnc7czZ6gFRe0HyPXaQoRqCObe3VSV/rzB74hAUOIgwEf3XCFMnMOAvv
   RSSfkoJbks5qmonLRbS5bOQ1YY6ImKUcvuXOBMgqU09ugpWaITIflh5oP
   sY0diMbeq+PIwIQ4h7Ra/sHLZ156K1f+A4g5Ev1auUobIK8C24lVmSv+t
   MC8KoHxBQTaKCc13S6uNTDWOBa0vN83udL08yr2SMoSFr8VbE5epbRSI4
   B726UfDO974S9Y5DcoQQ+FBMwRHs1a2TpupW4g5KFEgzQIwmtKQnHrKkE
   o4k8uabe6c1yty8qL8jC90fx4usHxXzDhh5eMQEahoAyCyYj6/1LnALnD
   g==;
X-CSE-ConnectionGUID: gv00IHM6T4S89uFiPf25BQ==
X-CSE-MsgGUID: xdEsronBSjmFMNXqKZzdHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42059485"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42059485"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:13:33 -0800
X-CSE-ConnectionGUID: uy5Jk7n+Qe6RamMDZPKYXg==
X-CSE-MsgGUID: 1+lOTPJCQ9q89dgdu3C2oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84813465"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 02:13:32 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 30/33] usb: xhci: remove irrelevant comment
Date: Wed,  6 Nov 2024 12:14:56 +0200
Message-Id: <20241106101459.775897-31-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241106101459.775897-1-mathias.nyman@linux.intel.com>
References: <20241106101459.775897-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

The code which it is referencing does not exist in the same function,
or the file for that matter. Since it was added [1], the Interrupter
Moderation Interval can be changed within xhci addon, e.g. PCI
xhci_pci_setup().

[1], commit 0ebbab374223 ("USB: xhci: Ring allocation and initialization.")

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 4295e9a4de50..15db90c54a45 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2512,11 +2512,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 
 	ir->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
 
-	/*
-	 * XXX: Might need to set the Interrupter Moderation Register to
-	 * something other than the default (~1ms minimum between interrupts).
-	 * See section 5.5.1.2.
-	 */
 	for (i = 0; i < MAX_HC_SLOTS; i++)
 		xhci->devs[i] = NULL;
 
-- 
2.25.1


