Return-Path: <linux-usb+bounces-34107-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCabKpGZqWm7AgEAu9opvQ
	(envelope-from <linux-usb+bounces-34107-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 15:56:17 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B41213F00
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 15:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8FF8F30A3A49
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 14:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35D13A875B;
	Thu,  5 Mar 2026 14:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FDHXXlfc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80063A9D96
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 14:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772722141; cv=none; b=OlGGQW6Nop09AyNz0JdTU/rQzUeTTdl9OiJ6+e9fvZzfuLVpRsKQFLITueziqNZTvD1dZWO5QCbEOnmN52WG7h8PSOGscXcpuOnUT86ETEuonf2iDFADrpYL2giHwPDWatrmIB76nCkgcNRHTUf8f6E5ciEAIg4sgwLZd8NS550=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772722141; c=relaxed/simple;
	bh=cgrOYpmMMUip4tmoI3M/9U98Y6dw6LSBoJxt5fBtxxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dtXbKGR4mqAQdH+359DtEPL6X3hD100warCYYe3Ygx4G4TcY3KWQwrrN3j/j9q9xhRs+PeIVEKUcoqoRWotrodIiXe8DobHuVJuplTcFKT4So1GX+MZts5nlvo4IUefNvyU1xaV0PulOW6RP+KTMPtvHRBLmTkFpXcAb5lC1wPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FDHXXlfc; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772722140; x=1804258140;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cgrOYpmMMUip4tmoI3M/9U98Y6dw6LSBoJxt5fBtxxg=;
  b=FDHXXlfcYZfBGT71g0UeBT9cN2FOa0jtWhPNX3UKhImKaRiWDLFRK8aa
   Yt9a9RMiwfGN8urjR4ZaWNA9S/UE0yqjgCEcK4F3zb914VO6+Pb0Bj80i
   0VVddVzLe4KylJ5pwslQjxPsKYpa2SchdVZA2WrwMu1WWMRD5eQezS/iA
   zf4T0vSkJssejPd3816DqjcDgPBYf7+0365royHWlhALhcxJ5+UmrZIIz
   p+0nssA1pNMAMBPjuDIcO3/6i3mdlrdu9m8iUFbZLbHr+WfAq+b0QDTbb
   edXQi+0Y6Owfi7ViCu45bVd/XO7jqHgxJA1Ib3PlJ3Vh3LZ3hVWYskgIw
   g==;
X-CSE-ConnectionGUID: Qz5Fd1AqT3iK2LFlrwXnqw==
X-CSE-MsgGUID: 2xXpFWrCSPOAxajqVm5wFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73857703"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73857703"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 06:48:59 -0800
X-CSE-ConnectionGUID: wz32f3HVSFOBKoOlAaczjg==
X-CSE-MsgGUID: Tkq1xlOoSwmSMp27Ap7XbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="249163769"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 05 Mar 2026 06:48:57 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 6882B99; Thu, 05 Mar 2026 15:48:57 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	Thinh.Nguyen@synopsys.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [RFC PATCH 10/12] usb: xhci: add interrupter type
Date: Thu,  5 Mar 2026 15:48:22 +0100
Message-ID: <20260305144824.3264408-11-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260305144824.3264408-1-niklas.neronin@linux.intel.com>
References: <20260305144824.3264408-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 56B41213F00
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34107-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linux.intel.com:mid]
X-Rspamd-Action: no action

xhci-sideband creates a secondary interrupter without an associated IRQ.
Such interrupters are non-operational and cannot enabled or disabled.

Add a type field to struct 'xhci_interrupter' to distinguish
non-operational interrupters. When the type is set to 'INTR_NOOP',
the interrupter enable/disable helpers become no-ops.

This allows callers to iterate over all allocated interrupters without
special-casing, while ensuring that actions are applied only to operational
interrupters. It also provides a simple extension point for adding
additional interrupter types in the future.

Operational interrupters remain the default; no-op interrupters are the
exception.

No functional changes are introduced; behavior remains the same.

This change is necessary to prepare the driver for multiple interrupters.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-sideband.c | 1 +
 drivers/usb/host/xhci.c          | 6 ++++++
 drivers/usb/host/xhci.h          | 8 ++++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index 2bd77255032b..21ee4e96bc70 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -352,6 +352,7 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 	ret = usb_offload_get(udev);
 
 	sb->ir->ip_autoclear = ip_autoclear;
+	sb->ir->type = INTR_NOOP;
 
 	return ret;
 }
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index e03f717d2314..329fe9ff19f8 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -317,6 +317,9 @@ int xhci_enable_interrupter(struct xhci_interrupter *ir)
 	if (!ir || !ir->ir_set)
 		return -EINVAL;
 
+	if (ir->type == INTR_NOOP)
+		return 0;
+
 	iman = readl(&ir->ir_set->iman);
 	iman &= ~IMAN_IP;
 	iman |= IMAN_IE;
@@ -334,6 +337,9 @@ int xhci_disable_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 	if (!ir || !ir->ir_set)
 		return -EINVAL;
 
+	if (ir->type == INTR_NOOP)
+		return 0;
+
 	iman = readl(&ir->ir_set->iman);
 	iman &= ~IMAN_IP;
 	iman &= ~IMAN_IE;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index e6a51f1318c2..1e9ea6507813 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1443,6 +1443,13 @@ struct xhci_bus_state {
 	unsigned long		resuming_ports;
 };
 
+enum interrupter_type {
+	/* Normal interrupter, e.g. Primary */
+	INTR_DEFAULT,
+	/* Non-operational, e.g. xhci-sideband */
+	INTR_NOOP,
+};
+
 struct xhci_interrupter {
 	struct xhci_ring	*event_ring;
 	struct xhci_erst	erst;
@@ -1450,6 +1457,7 @@ struct xhci_interrupter {
 	unsigned int		intr_num;
 	bool			ip_autoclear;
 	u32			isoc_bei_interval;
+	enum interrupter_type	type;
 	/* For interrupter registers save and restore over suspend/resume */
 	u32	s3_iman;
 	u32	s3_imod;
-- 
2.50.1


