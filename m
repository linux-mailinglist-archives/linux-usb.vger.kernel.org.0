Return-Path: <linux-usb+bounces-30722-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE4EC6F5B1
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:41:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0BA29352998
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA9B36996C;
	Wed, 19 Nov 2025 14:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="npJASM/6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4805A36C0C8
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 14:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562310; cv=none; b=LMpqUbwKqjRDtNdfAtWRMPPGqsSJmMYz1PDCQTYkKrBvAAvWTSizROrllVKJRWMzid7vJwYtHtQggEEbTaZw7YXfUVSOCtNdMuCu6K1XO7Mo5vUbP9lrxWWEx9X94nyVZNE5IYNi3/0g5c6IEInDsF6oTXksOcBgpnVPrlCv/wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562310; c=relaxed/simple;
	bh=8gKhob3/aumjvOaFZBvdWwoFMYYzn0UuDrzQXCxtoK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOXamNa5N0tVKpSNYTkD6YmhNmhMWoh6jLsYGv22FKswrUaWlgihxbw4ldbPJJhhXGICCF8662bZgx6Eximdjdj8ZjkYLUxb1KnPFCKJ3ZSpxpvvAsor5Z4IpQ6+GfepNMaPD+q123u5ZKeVubqc5w4K7+zk+IfkT3CdlyP9raU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=npJASM/6; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763562309; x=1795098309;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8gKhob3/aumjvOaFZBvdWwoFMYYzn0UuDrzQXCxtoK8=;
  b=npJASM/6FMpaBZVN8Ha81jWY56deNzYVyha7gqBSKQU+LsyNrBouyB2g
   bH+mtDIUXeTrIcR/HYBCspUCl/xUgSHVa2VyiWOEU1OOcduvRqrc8UMFD
   FdztphnRS3jaUl6XDy1I7mHrUWKoJJ8Sil1wncbYRhrCLiEjMJecQ5sS9
   gsYmwUViBuTtKnM6LETCl5HXPqxDpvKO0ilX+uwibnCCDA8wUutWD9qn+
   Cd3vnxatc7Xj8vuMFw3jcDI3/JhSRC09V0+IZhofnFndlISvMus+eWrDp
   Rt0k2m3kJF/uU0btpgAjnXVfxS5b1XMuO7Sme11/opZ+jGB+j4A43vOww
   Q==;
X-CSE-ConnectionGUID: eVkMP5B6QZOnsnWOr20s7Q==
X-CSE-MsgGUID: Kv75YdE2Qp6xlWAgjw2YDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65645597"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65645597"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:25:08 -0800
X-CSE-ConnectionGUID: BlFXR1/jTkuhRoQvf5Mnnw==
X-CSE-MsgGUID: Om1OeMEUQS+jPD5dG2pgRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221992205"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:25:06 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 21/23] usb: xhci: drop xhci-caps.h dependence on xhci-ext-caps.h
Date: Wed, 19 Nov 2025 16:24:15 +0200
Message-ID: <20251119142417.2820519-22-mathias.nyman@linux.intel.com>
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

Drop the dependency of xhci-caps.h on xhci-ext-caps.h by eliminating 2
instances where macros in xhci-caps.h were redefined from xhci-ext-caps.h.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-caps.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
index af47aebc5ba8..99557df89f88 100644
--- a/drivers/usb/host/xhci-caps.h
+++ b/drivers/usb/host/xhci-caps.h
@@ -6,7 +6,7 @@
 
 /* hc_capbase - bitmasks */
 /* bits 7:0 - Capability Registers Length */
-#define HC_LENGTH(p)		XHCI_HC_LENGTH(p)
+#define HC_LENGTH(p)		((p) & 0xff)
 /* bits 15:8 - Rsvd */
 /* bits 31:16 - Host Controller Interface Version Number */
 #define HC_VERSION(p)		(((p) >> 16) & 0xffff)
@@ -77,7 +77,7 @@
 /* bits 15:12 - Max size for Primary Stream Arrays, 2^(n+1) */
 #define HCC_MAX_PSA(p)		(1 << ((((p) >> 12) & 0xf) + 1))
 /* bits 31:16 - xHCI Extended Capabilities Pointer, from PCI base: 2^(n) */
-#define HCC_EXT_CAPS(p)		XHCI_HCC_EXT_CAPS(p)
+#define HCC_EXT_CAPS(p)		(((p) >> 16) & 0xffff)
 
 /* DBOFF - db_off - bitmasks */
 /* bits 1:0 - Rsvd */
-- 
2.43.0


