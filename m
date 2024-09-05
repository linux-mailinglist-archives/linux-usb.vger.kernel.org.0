Return-Path: <linux-usb+bounces-14720-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0D796DBD2
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 16:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDEFCB261B0
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 14:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7FA43AD7;
	Thu,  5 Sep 2024 14:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fkZUbeY4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600FA14F90
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 14:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725546690; cv=none; b=eE7hEMpedU9YCRZtmHMlIddODKngfill2824SkNtCkA+pXdbr6dKCNMlTEa6IGc8gHdICLiA1haPyubspvYz3UxIJx3QqVGBhY9TEav1zObZTlLxCiUeWoUFo4aoghCnNaeIps6r96UuZt1/UeDXja+20p0Pnp/qoGTmANMGEco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725546690; c=relaxed/simple;
	bh=6/iv40Bpaax3JxEkaFBdgWmk350HVupew/Nc0hSbZkA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gnVXANaWihtcZfWrGIq4MaGq0dl9aoleF0zX1gJCrDM8nEUlmebpkO5boWK3GLQZKmY+4mSIRtoaf5+IupWubhOHj9ltZWkl9MDMpnuh8C9iZ8Sly3KTtBWWTz4xc1gJwjwG2W1sgDioQK+OIZUvWzJBUHaGsz1AurfjyGc3uQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fkZUbeY4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725546689; x=1757082689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6/iv40Bpaax3JxEkaFBdgWmk350HVupew/Nc0hSbZkA=;
  b=fkZUbeY4FaeomnVEHrDfioU5kG1o3tHFcDdYQ/JyrZl4ZFSwooM8Rc9L
   oU4gsTuOh/rWcAm9uDp3rYLMgjf+MqpID8FC6nlIODEbmBVvzVgW/+LjX
   uiANCjijEHxEjEar2KAWf31w0yYX81uCNgOiRLG4F4kmMH/1+aJLf5fwH
   Csbnz+v9ptB/v7H/9VR0edav0b8GJ3l4dfB0wiHh1Id/XH3aTmKWg/JRo
   Ag4wABdzkkdD985tzXLh/STfQqF2CoOF9O3OzL/8lIOxQAezxmetZge2o
   aF8lUnm85f79wPBdWx2bvL6dCEt+UiJ3P/z5OFV5gLLgtJq1RHBIVTBgf
   A==;
X-CSE-ConnectionGUID: h+JgQalHRSKsIFom9qATYw==
X-CSE-MsgGUID: ypCsz+4TSiuS/21tw0e9mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="49677541"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="49677541"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 07:31:29 -0700
X-CSE-ConnectionGUID: BZli71vUQT6hg1xp5la+ww==
X-CSE-MsgGUID: CfqXgxw4TCeqAx9JBgADug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="88883227"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa002.fm.intel.com with ESMTP; 05 Sep 2024 07:31:27 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 09/12] usb: xhci: remove 'retval' from xhci_pci_resume()
Date: Thu,  5 Sep 2024 17:32:57 +0300
Message-Id: <20240905143300.1959279-10-mathias.nyman@linux.intel.com>
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

Remove unnecessary local 'retval' argument.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index d6196c08ea87..526739af2070 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -786,7 +786,6 @@ static int xhci_pci_resume(struct usb_hcd *hcd, pm_message_t msg)
 {
 	struct xhci_hcd		*xhci = hcd_to_xhci(hcd);
 	struct pci_dev		*pdev = to_pci_dev(hcd->self.controller);
-	int			retval = 0;
 
 	reset_control_reset(xhci->reset);
 
@@ -817,8 +816,7 @@ static int xhci_pci_resume(struct usb_hcd *hcd, pm_message_t msg)
 	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
 		xhci_pme_quirk(hcd);
 
-	retval = xhci_resume(xhci, msg);
-	return retval;
+	return xhci_resume(xhci, msg);
 }
 
 static int xhci_pci_poweroff_late(struct usb_hcd *hcd, bool do_wakeup)
-- 
2.25.1


