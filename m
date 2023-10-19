Return-Path: <linux-usb+bounces-1909-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 654757CF547
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 12:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D499282224
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 10:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70CC81EB25;
	Thu, 19 Oct 2023 10:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3PgntIR"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311261DFFE
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 10:28:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB6F6FA
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 03:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697711306; x=1729247306;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MJrTVpG7s9hd2cNZ5TnIlRQ+L7xRPuGhnTixavDf+6A=;
  b=C3PgntIReSBa5OiawMYVZDlIr3LP3juTEEUSViAlSpdM+pWhWeOb3z9f
   0XajrQaiXgkBIQnCMGP/1p7QQ3/SYXUoKjE2nlZNaKohbQy5nh9UJTEq+
   XHho/UEOcUbFw3bhEcIQiQDtrIunen8zbBqXNQeegCrq6PeSMYCSNuHyl
   q+gxtPwdbxFGUpVPup+bGfRAQ9KWg+n0FPTfdmoGNEQEDdQovb1qVjHU0
   vzZC5P5qBDi5yFRBP8jxWp5Dw5y9YdqVfEZ8drcthjmfIKkIyVxXaAYDR
   DKkndVMTtnCfyXrxwMw8TAMll+3u0+uRcNWOKAlqO9rDK5rbazs2Tpaq9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389075921"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="389075921"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 03:28:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930557826"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="930557826"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2023 03:28:24 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 14/19] xhci: Loosen RPM as default policy to cover for AMD xHC 1.1
Date: Thu, 19 Oct 2023 13:29:19 +0300
Message-Id: <20231019102924.2797346-15-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231019102924.2797346-1-mathias.nyman@linux.intel.com>
References: <20231019102924.2797346-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

The AMD USB host controller (1022:43f7) isn't going into PCI D3 by default
without anything connected. This is because the policy that was introduced
by commit a611bf473d1f ("xhci-pci: Set runtime PM as default policy on all
xHC 1.2 or later devices") only covered 1.2 or later.

The 1.1 specification also has the same requirement as the 1.2
specification for D3 support. So expand the runtime PM as default policy
to all AMD 1.1 devices as well.

Fixes: a611bf473d1f ("xhci-pci: Set runtime PM as default policy on all xHC 1.2 or later devices")
Link: https://composter.com.ua/documents/xHCI_Specification_for_USB.pdf
Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index b9ae5c2a2527..bde43cef8846 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -535,6 +535,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	/* xHC spec requires PCI devices to support D3hot and D3cold */
 	if (xhci->hci_version >= 0x120)
 		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
+	else if (pdev->vendor == PCI_VENDOR_ID_AMD && xhci->hci_version >= 0x110)
+		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
 
 	if (xhci->quirks & XHCI_RESET_ON_RESUME)
 		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
-- 
2.25.1


