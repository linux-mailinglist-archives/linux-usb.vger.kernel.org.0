Return-Path: <linux-usb+bounces-14715-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FF496DBC9
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 16:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 347B92829DA
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 14:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9E3175BF;
	Thu,  5 Sep 2024 14:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKh5OYXf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6561110A1F
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 14:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725546681; cv=none; b=dJeMgv87i1GDW599NwVi6HWADGs10Mhc4eaOxliuKYgvPCmRPeS1Tt45d+BWKsouFTKUB/AH3kU56a06I1tKvSE2wy7v5vsRuSfoh8QKI9NkfmulCyPO2Vme7gTcTQJGegSP4ZVBFvNfQpM40DoOav0K+EIwSRJLv7z8fTJ4dRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725546681; c=relaxed/simple;
	bh=BbVf7oWdTnzRs3XA1mUNCBp6/6M5uPjXTuF6D+ZFuPY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rhrzNwFbuOweTDGFAMW3AkIJXKSYqODm5htDJLdiTz2WOJrhi0qOAAfiWslTuJcvNgqRZMjE4ulKPcLOkdu24TDTkHjUcGbFNywBsPqRAvOrWv1/VD9TWWMQg6A/EwO/VvilcuNxJ9Pd9JZXvuJoW+05JinCL/4dcRxsLNluGmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKh5OYXf; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725546680; x=1757082680;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BbVf7oWdTnzRs3XA1mUNCBp6/6M5uPjXTuF6D+ZFuPY=;
  b=MKh5OYXfinE5OdnnZTnOtaW3pmaHqcPPZ8v2p/QZdy58kviWMV37lbjO
   YnC/TH1wRqCNTMTY/jUD8olNng8iV7OyezXBHTT/1FCTVF54o76WNfu/a
   1Cyyrf2qBYQHmKtXVbvI3nUpfMyJL+IynHhTtdkgJNMV+HgdnQ1DOoz8Z
   M8ghijmESXUmsFSKXM86INXCPwrqb6g36osdzhQgJAHIEvtE2f58oqSof
   HAXjcGMa/ZDVTyEPsxBWJR/aIfmWoGJ9v78F4Jma9qtnehka61ZhYpRXJ
   YxbjV7EzvgpLc7qRyZn3sxSq3FMwYFHxG3WrzKPLex9hNgUL7yewLyvXp
   Q==;
X-CSE-ConnectionGUID: uhrQnCPoQb+t22KNIA9xlA==
X-CSE-MsgGUID: Du1vl8KgROu+DxYLO7JOsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="49677506"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="49677506"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 07:31:20 -0700
X-CSE-ConnectionGUID: xMcfDAZASQmNwGLqmw/9Yg==
X-CSE-MsgGUID: XBHv+OOVQIOUXXOxWykn3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="88883218"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa002.fm.intel.com with ESMTP; 05 Sep 2024 07:31:18 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 04/12] usb: xhci: remove excessive isoc frame debug message spam
Date: Thu,  5 Sep 2024 17:32:52 +0300
Message-Id: <20240905143300.1959279-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240905143300.1959279-1-mathias.nyman@linux.intel.com>
References: <20240905143300.1959279-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

The removed debug messages trigger each time an isoc frame is handled.
In case of an error, a dedicated debug message exists.

For example, a 60fps USB camera will trigger the debug message every 0.6s.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 4ea2c3e072a9..e1c9838084bf 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3941,10 +3941,6 @@ static int xhci_get_isoc_frame_id(struct xhci_hcd *xhci,
 	start_frame_id = (start_frame_id >> 3) & 0x7ff;
 	end_frame_id = (end_frame_id >> 3) & 0x7ff;
 
-	xhci_dbg(xhci, "%s: index %d, reg 0x%x start_frame_id 0x%x, end_frame_id 0x%x, start_frame 0x%x\n",
-		 __func__, index, readl(&xhci->run_regs->microframe_index),
-		 start_frame_id, end_frame_id, start_frame);
-
 	if (start_frame_id < end_frame_id) {
 		if (start_frame > end_frame_id ||
 				start_frame < start_frame_id)
-- 
2.25.1


