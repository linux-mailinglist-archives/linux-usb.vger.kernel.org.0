Return-Path: <linux-usb+bounces-14718-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A4896DBCE
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 16:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6245E1C23DE1
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 14:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F91D17736;
	Thu,  5 Sep 2024 14:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AivwY7Na"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5034317C96
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 14:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725546686; cv=none; b=uoG8+mE2P67rhbl/4M5XuS5wbXlh9QIVjhszJ1KpCEh9viA9hMHu+5+bRG/Gy6gbFffCbauhGFNSbK76ROcrdfnR1DzftRdNC4TgN40u6mVVhLI1Y0Zv/azl/DVqGf8OIHCi4fPSBtiTLb3kA2kz+pn/mMI/MEHEFlLmWH5/Vak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725546686; c=relaxed/simple;
	bh=8zjlQXzjTvi2dUvYk8XGVnSOeV+iRlLs414mkRgasCg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XaKN5bRTlodDHm2uYOSSNE4RMnoY3N9xneO8I0TdCG97G+3kHFgpSjGYaXcP1+OF/Gxz9HsrMb/pyC5Rao4rkpa//XLLP+eeGqMK0jSMGjuQLkGHICWrTx38d/mcEq9u6Eaft4a77AcnrOlL737VOS1/Nb7Qss0u5cuSeHS4Mms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AivwY7Na; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725546685; x=1757082685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8zjlQXzjTvi2dUvYk8XGVnSOeV+iRlLs414mkRgasCg=;
  b=AivwY7NaU62o6Dgo/ltVRJ0ijS8nw5bJFOeV+R8u1orjsUl/HKs7Jkd4
   8bLJwby6aEkN7971uCRO/9obgEw3dbAbPgp++TyN+qaHKuFWGSucf2u6j
   FMpE50Sy6S4av5I83pzy/gC1iI4YpnBgqH4NwbHzAFCJu+Tr946CRPQac
   rHqzNjKzmFBTmLzbBvthGvyxJtUa9tB2H4mKywQq4v9SOP+y0oWFHalm8
   4ncV4NbUqp9cpoO4UTPZ1xmldFNxGAgKCohiEWmYGD91YMQii/z0QaYfJ
   3YLiZAw83JD5EX+67bnVrnnluCa2uaSRsTwTo75YTjlBkvTusTlR7PMgL
   w==;
X-CSE-ConnectionGUID: XYktj4HYQDGzfWK8kw2O1g==
X-CSE-MsgGUID: OsjsfbO7T2atcJkRidVxyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="49677524"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="49677524"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 07:31:25 -0700
X-CSE-ConnectionGUID: 9QwAbOn0QxWZxCA48iJoiw==
X-CSE-MsgGUID: Guwu0kG2TLGQbmboMc5CHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="88883222"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa002.fm.intel.com with ESMTP; 05 Sep 2024 07:31:23 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 07/12] usb: xhci: make 'sbrn' a local variable
Date: Thu,  5 Sep 2024 17:32:55 +0300
Message-Id: <20240905143300.1959279-8-mathias.nyman@linux.intel.com>
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

Variable 'sbrn' is used to store the Serial Bus Release Number, which is
then only used for a debug message. Thus, 'sbrn' can be a local variable
and assigned after the primary HCD check. The SBRN debug message is only
printed when a primary HCD is setup.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 6 +++---
 drivers/usb/host/xhci.h     | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index b5705ed01d83..b405cff2d600 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -525,10 +525,9 @@ static int xhci_pci_setup(struct usb_hcd *hcd)
 	struct xhci_hcd		*xhci;
 	struct pci_dev		*pdev = to_pci_dev(hcd->self.controller);
 	int			retval;
+	u8			sbrn;
 
 	xhci = hcd_to_xhci(hcd);
-	if (!xhci->sbrn)
-		pci_read_config_byte(pdev, XHCI_SBRN_OFFSET, &xhci->sbrn);
 
 	/* imod_interval is the interrupt moderation value in nanoseconds. */
 	xhci->imod_interval = 40000;
@@ -543,7 +542,8 @@ static int xhci_pci_setup(struct usb_hcd *hcd)
 	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
 		xhci_pme_acpi_rtd3_enable(pdev);
 
-	xhci_dbg(xhci, "Got SBRN %u\n", (unsigned int) xhci->sbrn);
+	pci_read_config_byte(pdev, XHCI_SBRN_OFFSET, &sbrn);
+	xhci_dbg(xhci, "Got SBRN %u\n", (unsigned int)sbrn);
 
 	/* Find any debug ports */
 	return xhci_pci_reinit(xhci, pdev);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 6f8cecc789d6..d41523c9b15c 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1498,7 +1498,6 @@ struct xhci_hcd {
 	spinlock_t	lock;
 
 	/* packed release number */
-	u8		sbrn;
 	u16		hci_version;
 	u16		max_interrupters;
 	/* imod_interval in ns (I * 250ns) */
-- 
2.25.1


