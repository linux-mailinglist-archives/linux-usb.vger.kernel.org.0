Return-Path: <linux-usb+bounces-14719-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 332D796DBD0
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 16:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3B61B260A1
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 14:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1C6168B1;
	Thu,  5 Sep 2024 14:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZccL0P3J"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D333A2110E
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 14:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725546689; cv=none; b=m6JKelZWSPaRSjVBaoqPwVPCzz0rHENfdAnt0UA1dCivJUXx7W/EJvGLG+SZGL0cr2YziKHrjhn83eiVJbvnGfZptISa8I3kGn8I2sUfk360x6XM9y9CtoaYnxbLEBslLAEyTf2IJMVDVqbUPCunRMIRR/0vorbRJknTJ6a3t5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725546689; c=relaxed/simple;
	bh=syxiCHyfpbwv/wA4SM7Uib+ynZqMebMAFHJ7dpZuFn0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UD0geKLuTatbK+Xi7vyDuy7rQDl+d3C9gdcHLURVBen7xiZZZoRtWUlOC0//zdmZBe4zdE9DB/g9fwBneZSHDo3Gzr0so9URVVuQFDfRsus69fudmIFFRVwtYC7XpXHANjiDWwu+dbRBgHisPQItFC2SOVBAnWSAVSoRCYoD4a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZccL0P3J; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725546688; x=1757082688;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=syxiCHyfpbwv/wA4SM7Uib+ynZqMebMAFHJ7dpZuFn0=;
  b=ZccL0P3JRfY57i3vkZf1MXC7JVFOJssSb6fS3bjuRIGy3VGPlTCcVihZ
   hTHHJvwvjC1Q9ooPtqDJToFwaAJXmYX2YdlGL4GCiuRzVL2A5m8mB//VV
   kNfWZpF2Tus0Dv1E0fKqMjV1KlZ8nKRGK/iMj4I7GdQVIj3Q3nHZZAPyB
   rqOxiJnxr650Q2TGQjyjfRGGKDBZfOUjIteYdEQhFYYR2wyi3vlN9buqZ
   A5F5FX86ccaoAW76EK7WVxrFNAzWDMfmeFL3MIUeBeaRrhLi60rnJoUK9
   kUuVesVDrbw3G6gV01XI4VxQrnKVFCKnEYEXwMMf4TokiGxJNZyb9LLs6
   A==;
X-CSE-ConnectionGUID: eS05se//SHGFu+in7YZyxQ==
X-CSE-MsgGUID: 0CIhYwVGR6iEHzEqtl3QdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="49677531"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="49677531"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 07:31:27 -0700
X-CSE-ConnectionGUID: OSdN/coWTsmMOfDjotdA0Q==
X-CSE-MsgGUID: eA3LaZKBT+22hQm9VpsevQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="88883225"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa002.fm.intel.com with ESMTP; 05 Sep 2024 07:31:25 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 08/12] usb: xhci: add comments explaining specific interrupt behaviour
Date: Thu,  5 Sep 2024 17:32:56 +0300
Message-Id: <20240905143300.1959279-9-mathias.nyman@linux.intel.com>
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

HCD does not allocate or request interrupt for the xhci driver, but HCD
does free and sync xhci interrupts in some cases. Add comment detailing
in which cases HCD will free/sync xhci interrupts.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index b405cff2d600..d6196c08ea87 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -93,6 +93,10 @@ static const struct xhci_driver_overrides xhci_pci_overrides __initconst = {
 	.update_hub_device = xhci_pci_update_hub_device,
 };
 
+/*
+ * Primary Legacy and MSI IRQ are synced in suspend_common().
+ * All MSI-X IRQs and secondary MSI IRQs should be synced here.
+ */
 static void xhci_msix_sync_irqs(struct xhci_hcd *xhci)
 {
 	struct usb_hcd *hcd = xhci_to_hcd(xhci);
@@ -105,13 +109,12 @@ static void xhci_msix_sync_irqs(struct xhci_hcd *xhci)
 	}
 }
 
-/* Free any IRQs and disable MSI-X */
+/* Legacy IRQ is freed by usb_remove_hcd() or usb_hcd_pci_shutdown() */
 static void xhci_cleanup_msix(struct xhci_hcd *xhci)
 {
 	struct usb_hcd *hcd = xhci_to_hcd(xhci);
 	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
 
-	/* return if using legacy interrupt */
 	if (hcd->irq > 0)
 		return;
 
-- 
2.25.1


