Return-Path: <linux-usb+bounces-16766-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C27EF9B2D7C
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 11:53:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FE56B226D8
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 10:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42DE1DBB37;
	Mon, 28 Oct 2024 10:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="joLvFsR4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4049D1DB55D
	for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2024 10:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730112687; cv=none; b=ZrEVqz3VQ8WcXqIK2Cmpd63AhY2wMkgKiZe8WYnFxS9jkxEM60PG9AS11O78Z9270M+uvTicfV/0pId5LUFiZBI8XXK3/dinI889awRDLsqrhAwKz2RrZFNi/fcpY6MdGfTmPw8xiqIpoKLH6yDVhTkcvBL1Uo214xfAhWy1JFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730112687; c=relaxed/simple;
	bh=gwVAMevbkL0Stc2Xr9IM2fmz4rzb7obvYOlk0ViRWWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WOT/qRwy1zSa1cd0PgeacH92eZXA05vq/OUEgv2uCnBOTaLDQumNlZZWrdha/TKsmUKctplNEVFg/yiME55lGxLRgkAuDw8h07Nyd3c07u7VzVolUtI7JXYG6+CSgAUaJyc27sxDcMe6LAQ4DpGNnQqY2HWAgeQXAKBUi8kA8hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=joLvFsR4; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730112685; x=1761648685;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gwVAMevbkL0Stc2Xr9IM2fmz4rzb7obvYOlk0ViRWWo=;
  b=joLvFsR4gOJEAPBfmFqfQdmEsUlqcUW699daVLBSBWFTRM3X/YAeImwm
   Twed6u5z0WUT40Rxetw3cPzIJohGrZOYMRqGakTKtIoCm5qcYqAQ4Mf/K
   VEao4jTcuc344x0zG43oevhpzHu4J6PZFvxdIeIS85y5rAdK/0WH+C3QF
   /EJhxFrJpmYxylYKFRUKkLcjmz5qVc1aPcbvtkq0Ttr+KhArZ/gWqmWdQ
   35o/Ruufgv9foRMxhJ/hKJWGA0bo80quLiWbj6nYhcXY2qq/1NbTj0tU7
   jJopHXfFufvccBD7yktev4t1nqZOZo7InCA2mnEgGxVaObYr/hrYLvIKS
   w==;
X-CSE-ConnectionGUID: gUKmZq9PSryqIouvd5uL8w==
X-CSE-MsgGUID: TT8LMVhfTZWBGy6GFUv6PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="29164352"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="29164352"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 03:51:24 -0700
X-CSE-ConnectionGUID: iCzlk+6YRq+wq0qUZFUlFQ==
X-CSE-MsgGUID: Q/agizfIRfC54QC0bvv7jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="104899459"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 28 Oct 2024 03:51:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 6957F13E; Mon, 28 Oct 2024 12:51:21 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	AceLan Kao <acelan.kao@canonical.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Add only on-board retimers when !CONFIG_USB4_DEBUGFS_MARGINING
Date: Mon, 28 Oct 2024 12:51:21 +0200
Message-ID: <20241028105121.894978-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Normally there is no need to enumerate retimers on the other side of the
cable. This is only needed in special cases where user wants to run
receiver lane margining against the downstream facing port of a retimer.
Furthermore this might confuse the userspace tools such as fwupd because
it cannot read the information it expects from these retimers.

Fix this by changing the retimer enumeration code to add only on-board
retimers when CONFIG_USB4_DEBUGFS_MARGINING is not enabled.

Reported-by: AceLan Kao <acelan.kao@canonical.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219420
Cc: stable@vger.kernel.org
Fixes: ff6ab055e070 ("thunderbolt: Add receiver lane margining support for retimers")
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
Hi AceLan,

I changed the patch slightly. I wonder if you could try it again?

Thanks!

 drivers/thunderbolt/retimer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index 7db9869a9f3f..89d2919d0193 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -532,6 +532,8 @@ int tb_retimer_scan(struct tb_port *port, bool add)
 	}
 
 	ret = 0;
+	if (!IS_ENABLED(CONFIG_USB4_DEBUGFS_MARGINING))
+		max = min(last_idx, max);
 
 	/* Add retimers if they do not exist already */
 	for (i = 1; i <= max; i++) {
-- 
2.45.2


