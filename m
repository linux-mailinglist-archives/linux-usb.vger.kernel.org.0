Return-Path: <linux-usb+bounces-30561-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E86C63E76
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 12:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D0D4E4EACFA
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 11:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE8232A3D7;
	Mon, 17 Nov 2025 11:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YsnsIy9K"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6144830F947
	for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 11:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379820; cv=none; b=igVXfgc6EZMWyJFUGezTc15jG16mgaqijgxdQrFtIhXmYBluOU2gHxA/xBxWT/O75JZ9cE0P8xZp6Hzbtb3LGyMnJ3zrLgbS4BQd8tAuCsqePJj0ejwvtafEDyz9KIgwfUCXzAk9cLrfEx6Pb2Mx2RUDFuVcBJpMjn7f2AYxWG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379820; c=relaxed/simple;
	bh=tCJHQsz2XZp4fo+/dJIJsL5ZFLpPV+D8I34ik+LD2Tc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M9OzK1NV4PadYHzrRFll+qlHcqRaCxLuG6edserTwx2WuokC+oixZb05QoM4fT0GnxL81mJwT01EfxEchrjbV21kriUMU1R9NMalXrNODOM4r66QrSZsHGIck3eNKY3tolep0+mIGxHRl4v/q9x8XaLXIt3mxIX2q1Gr7igr+wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YsnsIy9K; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763379818; x=1794915818;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tCJHQsz2XZp4fo+/dJIJsL5ZFLpPV+D8I34ik+LD2Tc=;
  b=YsnsIy9KFA78JG1o8y2v4/j/qGdl0P3Xo0Bl69+N53rZLrrHDdRH/JYL
   lrk+KdUpYqQdpndvr7DNdBW9/A/iL2pgCAeCYbIzlYb/V/FZPTHWuTPJ4
   TK4ZmHDG/fre5aq1Qn/eEBJ5EUnYoV0g2tqaidzRoEE5888IDD9hNfJB1
   97s9OmKLPbQnUR6feAttRNAFkZblyAnZXePNNVsVAkgS1dgSAktTR1ASK
   zn4EBQLFKH6G/0+nCCYIIh67TE1LCXUPh6evctPflXtsscbFGDeH03Uu5
   venfdG38QXUW0POmbQtgg3r1XQvY4gFgZ+kYFvHz1KACk2m3UO3siW3ms
   g==;
X-CSE-ConnectionGUID: fhE8V/EQTXOnLhS58FIB7g==
X-CSE-MsgGUID: enncnOwQSRuKGiZXIZhLbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="76726922"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="76726922"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 03:43:38 -0800
X-CSE-ConnectionGUID: Gpc/AFEHT4utTCHFcU/IvA==
X-CSE-MsgGUID: E+kFBwk3QCq145eMk2Pjow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="189729277"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 17 Nov 2025 03:43:37 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id B5A2496; Mon, 17 Nov 2025 12:43:35 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH 2/9] usb: xhci: clarify duplicate CMRT deletion on suspend/resume
Date: Mon, 17 Nov 2025 12:42:34 +0100
Message-ID: <20251117114242.3507856-3-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251117114242.3507856-1-niklas.neronin@linux.intel.com>
References: <20251117114242.3507856-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Compliance Mode Recovery Timer (CMRT) is deleted both during suspend
and again during resume, which may appear redundant. Add a comment to
explain why this is intentional.

At the end of xhci_suspend(), the CMRT is removed from the timer queue.
However, if the host controller lost power (e.g. during hibernation),
the timer state is restored from a saved state when the system resumes.
As a result, xhci_resume() must delete it before initializing a new one.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/usb/host/xhci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 0cb45b95e4f5..2f64268cee5e 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1147,6 +1147,10 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 	}
 
 	if (power_lost) {
+		/*
+		 * Compliance Mode Recovery Timer is removed during xhci_suspend().
+		 * However, hibernate saves CMRT prior to its deletion.
+		 */
 		if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
 				!(xhci_all_ports_seen_u0(xhci))) {
 			timer_delete_sync(&xhci->comp_mode_recovery_timer);
-- 
2.50.1


