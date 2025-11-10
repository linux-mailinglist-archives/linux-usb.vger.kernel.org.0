Return-Path: <linux-usb+bounces-30294-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EE7C47822
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 16:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFB4D3AC398
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 15:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CAA24DD09;
	Mon, 10 Nov 2025 15:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDhwsDJg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953822405E7
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 15:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762787721; cv=none; b=M+ei7qeyu1F7os/0eWpNoWREND8vw5NAV7ZrkiQuZV7dCzZaW12bUb14+bqDza/tCfCow7oK/mDkOJi1Vr0bw1vsf8tVGCQYbjrd5PoMS8zakufSyg1u67WpTA7rhWvua2FnHPI6oS2TYE8ZOVgPHQxuGqhw+9/sVer78Hx35Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762787721; c=relaxed/simple;
	bh=CT1CcfbZB8sXaYH5YLQkKysmaYfBybnenVfgEukJsUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MNect71l3Nj/UFhmz/I+aWeBi6QaKLBtXqcNQ0CZQ3ra7HkuSOOH6zKrIsLpwZoJqd3rEy7XcXesT36MBqg+aRLYn/GqM2DJEIOihkrzAkJ3HMni1Oz+SP75cUktHzbeBXY7qeFRwg+ruCDOVlUNZED2VWhr5/7GUw3JZ+pvcEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDhwsDJg; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762787719; x=1794323719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CT1CcfbZB8sXaYH5YLQkKysmaYfBybnenVfgEukJsUw=;
  b=XDhwsDJgtf3M0TTBDLjdiEmGECHZtvmmOav7jm5zBQvzL9P96JGMvCX4
   0qCzI3XhGWcQ+SfpD+XW1O1VvhBcCFIgbhZk/wnUvTYoqrkp8geDlYcHa
   AapA1xHAPLZXtAE3L2n9tt7H+vR16tMh1PdDwrjhQ5ckJmwSWkfYW1cd9
   NU1vb7mebL+/YuQ2IPeLfLUwN+PLHntgbwn0B7+EwsaQm0EmY0RQaY+0z
   n6SgepXaVcXAbQRzpnKh52kycQxfyjSDzOKCPFCtLnh/0Ofa8Irk8zowB
   pWl1Q4wTkUx6YdejlXlE0l7Bn4sbahaCtjSEAyg+gC7lBK1DrLSc3jFPV
   Q==;
X-CSE-ConnectionGUID: F4Q9xsflQ+S9l0f+mGG/WQ==
X-CSE-MsgGUID: +jjg0ZlwTg2S08dq15zo1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64767787"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64767787"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 07:15:19 -0800
X-CSE-ConnectionGUID: 3MF+u6D+S7S4DQdt11zOJQ==
X-CSE-MsgGUID: jd8CFx7DQKK7oTK9815kTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="219353910"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 10 Nov 2025 07:15:19 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 4E13895; Mon, 10 Nov 2025 16:15:18 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 09/13] usb: xhci: simplify Max Scratchpad buffer macros
Date: Mon, 10 Nov 2025 16:14:46 +0100
Message-ID: <20251110151450.635410-10-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110151450.635410-1-niklas.neronin@linux.intel.com>
References: <20251110151450.635410-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Max Scratchpad Buffers consist of two bit-fields:
bits 25:21 - Max Scratchpad Buffers High, 5 Most significant bits
bits 27:31 - Max Scratchpad Buffers Low, 5 Least significant bits
Combined they create the Max Scratchpad Buffers value.

Add two new macros, 'HCS_MAX_SP_HI' and 'HCS_MAX_SP_LO', to separately
extract the high and low parts of the Max Scratchpad Buffers. These are
then combined using 'HCS_MAX_SCRATCHPAD' macro. This change simplifies
the code and makes it similar to other split value register macros in the
xhci driver.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-caps.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
index e772d5f30d36..af47aebc5ba8 100644
--- a/drivers/usb/host/xhci-caps.h
+++ b/drivers/usb/host/xhci-caps.h
@@ -37,9 +37,11 @@
 #define HCS_ERST_MAX(p)		(((p) >> 4) & 0xf)
 /* bits 20:8 - Rsvd */
 /* bits 25:21 - Max Scratchpad Buffers (Hi), 5 Most significant bits */
+#define HCS_MAX_SP_HI(p)	(((p) >> 21) & 0x1f)
 /* bit 26 - Scratchpad restore, for save/restore HW state */
 /* bits 31:27 - Max Scratchpad Buffers (Lo), 5 Least significant bits */
-#define HCS_MAX_SCRATCHPAD(p)   ((((p) >> 16) & 0x3e0) | (((p) >> 27) & 0x1f))
+#define HCS_MAX_SP_LO(p)	(((p) >> 27) & 0x1f)
+#define HCS_MAX_SCRATCHPAD(p)	(HCS_MAX_SP_HI(p) << 5 | HCS_MAX_SP_LO(p))
 
 /* HCSPARAMS3 - hcs_params3 - bitmasks */
 /* bits 7:0 - U1 Device Exit Latency, Max U1 to U0 latency for the roothub ports */
-- 
2.50.1


