Return-Path: <linux-usb+bounces-29258-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C685BD6ACF
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 00:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6235B4E46C2
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 22:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15E22FE047;
	Mon, 13 Oct 2025 22:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQZRk3Mc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852052FBE18
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 22:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760396166; cv=none; b=qSDdqODkY2gZ48RkIYhYGKm3VSg6YluDKPtsfQNmbbfe+e60gZGQNBJaXP1Ujso6xAU5T5DxDILMk5d9UpHzWSXrtejatBSbZ4xVpf3j+ZYEi1QA6rh0NciXQUl64Y8i8LPpc9zCa4WsweTcleTaJPekuSstI1GZFj/6IkDS+4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760396166; c=relaxed/simple;
	bh=dPVDSzmeDAAcUwKYRtJHwIgxNdU2oYzfxxrEeMG638w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fqr5u/MJRkSKrz2fIZq/zf0fEi9/NEaxufE/0SA605iDFSEB0/M0OjGdV6eY1bgSlscK/QXjjG7DVuJ/pEJ4HZ19GNZ2oLA1wzRxQqZ6J0qUnxzT9bNZHfCeT1TRqUsOCjN+3AF5dGh5OE2D4exWmmd/4CbaAVz0bG609Oe+zDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQZRk3Mc; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760396164; x=1791932164;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dPVDSzmeDAAcUwKYRtJHwIgxNdU2oYzfxxrEeMG638w=;
  b=HQZRk3Mc1ByYfJeTlfM7rc9KFejg8nGJwPsgvMQ+Wc88ks8vz/VpYa5m
   8scMBq/Y+kCAAppI0hDZT/+Kw2nFDBX5cOGQ21J/DYTyZlPmgItu0peXJ
   NIcMTF883rG7TV9WRi2GsqF47x78IptrFVHKWA3Xi1eT42ndEfSw7f0r+
   cSSmOA9nNpWVt8KlZ2KMrjoRPWtplxsdiGi3uv6GUWc3hqru/9QdB3W01
   IeXOukloEao5EglQKU0mLMMGJZWct7mpxHQ6rUS6nRnOKzmqEVNJb9ny3
   nzC5bOI/006JAWKvE688XrjAOwxEK0OompJrxWk7+OC8YsB+ZHC3dMtCy
   w==;
X-CSE-ConnectionGUID: Lw5WrCwKRnC0AjDMz3FZTw==
X-CSE-MsgGUID: zMMxXz2BT5C2oH1JcQ+s4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66202519"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="66202519"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 15:56:03 -0700
X-CSE-ConnectionGUID: lyimpZnBQGm0sdj/fM9yvw==
X-CSE-MsgGUID: JXP+hCAZS/CA15SWArCDCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="185742307"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.60])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 15:56:02 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Arisa Snowbell <arisa.snowbell@gmail.com>,
	Michal Kubecek <mkubecek@suse.cz>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 1/3] usb: xhci-pci: Fix USB2-only root hub registration
Date: Tue, 14 Oct 2025 01:55:40 +0300
Message-ID: <20251013225542.504072-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013225542.504072-1-mathias.nyman@linux.intel.com>
References: <20251013225542.504072-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Pecio <michal.pecio@gmail.com>

A recent change to hide USB3 root hubs of USB2-only controllers broke
registration of USB2 root hubs - allow_single_roothub is set too late,
and by this time xhci_run() has already deferred root hub registration
until after the shared HCD is added, which will never happen.

This makes such controllers unusable, but testers didn't notice since
they were only bothered by warnings about empty USB3 root hubs. The bug
causes problems to other people who actually use such HCs and I was
able to confirm it on an ordinary HC by patching to ignore USB3 ports.

Setting allow_single_roothub during early setup fixes things.

Reported-by: Arisa Snowbell <arisa.snowbell@gmail.com>
Closes: https://lore.kernel.org/linux-usb/CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com/
Reported-by: Michal Kubecek <mkubecek@suse.cz>
Closes: https://lore.kernel.org/linux-usb/lnb5bum7dnzkn3fc7gq6hwigslebo7o4ccflcvsc3lvdgnu7el@fvqpobbdoapl/
Fixes: 719de070f764 ("usb: xhci-pci: add support for hosts with zero USB3 ports")
Tested-by: Arisa Snowbell <arisa.snowbell@gmail.com>
Tested-by: Michal Kubecek <mkubecek@suse.cz>
Suggested-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 5c8ab519f497..f67a4d956204 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -582,6 +582,8 @@ static int xhci_pci_setup(struct usb_hcd *hcd)
 	if (!usb_hcd_is_primary_hcd(hcd))
 		return 0;
 
+	xhci->allow_single_roothub = 1;
+
 	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
 		xhci_pme_acpi_rtd3_enable(pdev);
 
@@ -637,7 +639,6 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	xhci = hcd_to_xhci(hcd);
 	xhci->reset = reset;
 
-	xhci->allow_single_roothub = 1;
 	if (!xhci_has_one_roothub(xhci)) {
 		xhci->shared_hcd = usb_create_shared_hcd(&xhci_pci_hc_driver, &dev->dev,
 							 pci_name(dev), hcd);
-- 
2.43.0


