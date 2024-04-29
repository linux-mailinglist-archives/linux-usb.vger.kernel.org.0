Return-Path: <linux-usb+bounces-9909-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ECC8B5AC0
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 16:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE7CB1F2266A
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 14:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CB47C0B0;
	Mon, 29 Apr 2024 14:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mMbbiwim"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636E079949
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 14:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714399285; cv=none; b=UVf8sRB1LjpNAmHUWFWkEZAUplO6zEDMJi7OqfK4y8IwRvFxxE8VnQC10KhFx6n/j+VuY6RlOGV5Bi6KNB9Nt1FOX9fLfNZEQ+YZ84Uf4+l6a1jTcAejt7ymygU7G5xITZ/BoUhbuDxGZs6RxSM56NABd5OssynwkfDJQWCwQRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714399285; c=relaxed/simple;
	bh=6hNh8B4aj2DewcL4LFaIg61YW6hHICTKrnO6paEQM3E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l7mGuswqFm7mpB/zIAAp4bMbNu3eTWGZx94BL/60NjsU6FiNuSBrR7t7ZRisSgliaFkyt2XQcviIEc5577zBoEZiyLb4ya2/jFCMcZRJN8P5+dQljprv/nDC/4MwjESe72R2wvHMnQv63S0gJ9XpGdai9hZ/7aXHDmwoAr7sTj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mMbbiwim; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714399284; x=1745935284;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6hNh8B4aj2DewcL4LFaIg61YW6hHICTKrnO6paEQM3E=;
  b=mMbbiwimYb0sOvPjm/w4fWPnCkBfNDtgBlLdcMV5QJtDD4Ra+XU8zwEj
   V5fa8lOMcee8th3PTfuJzuS4V2zjcE5F6wKesVx3qJTJ/sU3gppdv2yJQ
   tVhaCwAkxBq7ja1OKNI/mrrbOHadeMUBBcNo1WB8LiDYfEheBlSeEaUIf
   6QSRkA6vkPof0xsR07I+Ck5bkQdBMPExCcoeZ8YiDgDRGXGxwVgWjdhOv
   vqpNMo6N08Ius9y4AEAJsp4BkDlBntUqcgYNGNvVxB+w02J4TZ/bsrKUm
   P+PBbCbTUg41KbE20Sj3xqfGZYttpZlrf2qu+xwzqMVQUQp52q+4oNONl
   g==;
X-CSE-ConnectionGUID: vXtDuDW0TrytfTEc2g0u6g==
X-CSE-MsgGUID: va14yX3oSHukDdpTbBXGeQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9911533"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9911533"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 07:01:24 -0700
X-CSE-ConnectionGUID: 6++Q/spOQyCATE9thB3Deg==
X-CSE-MsgGUID: L1vdTHKkRVGeiYs/9QPZIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26521932"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2024 07:01:21 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 16/18] xhci: pci: Use PCI_VENDOR_ID_RENESAS
Date: Mon, 29 Apr 2024 17:02:43 +0300
Message-Id: <20240429140245.3955523-17-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240429140245.3955523-1-mathias.nyman@linux.intel.com>
References: <20240429140245.3955523-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Instead of plain hexadecimal, use already defined PCI_VENDOR_ID_RENESAS.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 8e9b720ab330..c040d816e626 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -880,10 +880,10 @@ static const struct xhci_driver_data reneses_data = {
 
 /* PCI driver selection metadata; PCI hotplugging uses this */
 static const struct pci_device_id pci_ids[] = {
-	{ PCI_DEVICE(0x1912, 0x0014),
+	{ PCI_DEVICE(PCI_VENDOR_ID_RENESAS, 0x0014),
 		.driver_data =  (unsigned long)&reneses_data,
 	},
-	{ PCI_DEVICE(0x1912, 0x0015),
+	{ PCI_DEVICE(PCI_VENDOR_ID_RENESAS, 0x0015),
 		.driver_data =  (unsigned long)&reneses_data,
 	},
 	/* handle any USB 3.0 xHCI controller */
-- 
2.25.1


