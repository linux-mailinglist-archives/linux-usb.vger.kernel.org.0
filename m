Return-Path: <linux-usb+bounces-30715-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BC6C6F5F6
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A0EFE4F9605
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6058A276049;
	Wed, 19 Nov 2025 14:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V8fHlUeE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672C936996C
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 14:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562298; cv=none; b=Kz1JbDIIvA6hLe/wrFkl3GCFP8M2rsZsdKqgkSAzqhdWUhPcsRQHKzNt1IK9vFA8U3yFUesE2cTR9p834yJUN9wlXXv118PWrJ8IiQ3jd8p84tvyZxpG1gfYvvhbVakqcIBjJ+Rl3KMrU6tDukN7CKbGDJ9qpN0v8PwdvJTa0fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562298; c=relaxed/simple;
	bh=DtVlZvPLnbCyfzrfi92SkhoB3jB4F43LSI8pxQitF+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c1gUFNX4WO6PzOblT+tRTAsPqHKX0czjZ3p4s1C41e2CHSZW3HNIJgKzb+GWrTHOCs2JIMqfdFCUej89AIL8h236KMfJF6kOzhINudC6/hVpJfN2CaNogvvDixWjdKcLnfLqLjoP4NJXE6qpwQgQFmx0FZ/8qWvlnftzHs9bwFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V8fHlUeE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763562298; x=1795098298;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DtVlZvPLnbCyfzrfi92SkhoB3jB4F43LSI8pxQitF+E=;
  b=V8fHlUeEZJSacEUYhvT04il36S/EAP3tBQ590RZAD8wEAfkXBVhzJq1B
   dCZYOSiXxPbsYSRSARKHNLRLpGOKfuZKSJb3NXACOnLvbYohkDzsafYpQ
   Jh987qchahGLFmuz8FsQwh+o5XHTfOzWPYWielKe7OmxxgaCXLTAwpZkg
   JRSx/RLhS37PUXDlvqXSnZUSbgsge6vTysQQXs+TvglViuweqRkqJkNeN
   sG6CjVUEAj//ATlL/BeQuFRmKBtJRVlE6g7aWWJxlEMvwI5qKSAgUkIJx
   ZzFdTt4k6BVa0zkVqUH5hoRc0lG+C/+CigPxA0aJPu/JOCdeDMXiELnAc
   Q==;
X-CSE-ConnectionGUID: GuihShfGRJWVW17wbVu7aQ==
X-CSE-MsgGUID: VE7IiOtDQBap3TbFtMGMuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65645558"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65645558"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:57 -0800
X-CSE-ConnectionGUID: qcNrLklaQpyO0CDjL9A+hA==
X-CSE-MsgGUID: hyaNuRnbSN+SDJxSuvqebw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221992101"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:56 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 14/23] usb: xhci: use cached HCSPARAMS1 value
Date: Wed, 19 Nov 2025 16:24:08 +0200
Message-ID: <20251119142417.2820519-15-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
References: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

The Structural Parameters 1 (HCSPARAMS1) register is read and cached in
'xhci->hcs_params1' during host controller initialization. Since this
register is read-only and its value remains constant for the lifetime of
the controller, re-reading it later is unnecessary.

Replace subsequent register reads with the cached 'xhci->hcs_params1'
value to avoid redundant MMIO access.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 7ac8198d0d7b..dbe64ea47936 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4235,8 +4235,7 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
 		xhci_err(xhci, "Error while assigning device slot ID: %s\n",
 			 xhci_trb_comp_code_string(command->status));
 		xhci_err(xhci, "Max number of devices this xHCI host supports is %u.\n",
-				HCS_MAX_SLOTS(
-					readl(&xhci->cap_regs->hcs_params1)));
+			 HCS_MAX_SLOTS(xhci->hcs_params1));
 		xhci_free_command(xhci, command);
 		return 0;
 	}
-- 
2.43.0


