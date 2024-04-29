Return-Path: <linux-usb+bounces-9899-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5D28B5AB6
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 16:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A20101F2128E
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 14:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB76075804;
	Mon, 29 Apr 2024 14:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kNz3ljeO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0597D74BF5
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 14:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714399268; cv=none; b=mbF9gF5P5T0x8vO/utGTvwsiANnxzfqXka/SEecJam9KxZNVPSBmuuDnrUC6FGEl6ZlmIhD91xfGpPzO3bLBRoFaGd/nwtvB9YsUSZFX8sCg5J9xL84H53Xulje+yxwI3AH2k0QfTtSsPemZm5mPX0EFKunlNkHRrIqUkjmZFQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714399268; c=relaxed/simple;
	bh=TCl8LJOvGgdj3eFQUyujeJsy9mLdMahSN6r2KXKroBs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VdYDhqQNfGI01RgfmBTWW2cLOY3X1PcOtHsI6pOePdTcHlTklL5c81IB8vzzbRz/+hCfhjP/BBhFh2AgoDQiJqOKMTqRYTAt9aV/ONxJmjf03nrqTryLhJOKapgiNQOm5d9NVYSncIzIuEaU2GCEW6IMfFKhXuGkx2flVUywMIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kNz3ljeO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714399267; x=1745935267;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TCl8LJOvGgdj3eFQUyujeJsy9mLdMahSN6r2KXKroBs=;
  b=kNz3ljeO3Mqpr0BNAcLM8uWr1m+Etv852N6HyT9dlnpK1ds40tqYBpjd
   U4kSMl/x1anvx9EgDFO1Nd0/vLtzN9nuIBmLX63hPWXBMIpx6/qIlkA91
   W3iCq4Sd8I98IJFY9fq2ffTxjUZTzuvvYTbf99gisFy2Ota4eapV4v3Ub
   mO8iJsA0vbg97jrJuQJlAkUjEQumAH0Cs/dRUhh3EcMaUpIRkUaBHbZsS
   e4yT/h49par1I8Ea0OzXeJmoJvsapHDoKXUM+7Fmd2mSow1MZ8/miAwQu
   lj4hgv/8hL3WjnraX6gwkT4V5XwW3B5FlgcbQBrHAhNI9AYI7oznj79kj
   g==;
X-CSE-ConnectionGUID: 7AB2nd6sTnKmghCZBaE9Zw==
X-CSE-MsgGUID: BfGdya5NT+Ka8FFw9AQS+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9911429"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9911429"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 07:01:06 -0700
X-CSE-ConnectionGUID: Du70qNkNQgWq0XP2SIp3mQ==
X-CSE-MsgGUID: F0l09UY0TTK1YNXNZMj9Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26521761"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2024 07:01:04 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 06/18] usb: xhci: remove redundant variable 'erst_size'
Date: Mon, 29 Apr 2024 17:02:33 +0300
Message-Id: <20240429140245.3955523-7-mathias.nyman@linux.intel.com>
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

From: Niklas Neronin <niklas.neronin@linux.intel.com>

'erst_size' represents the maximum capacity of entries that ERST can hold,
while 'num_entries' indicates the actual number of entries currently held
in the ERST. These two values are identical because the xhci driver does
not support ERST expansion. Thus, 'erst_size' is removed.

Suggested-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 2 +-
 drivers/usb/host/xhci.h        | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 8a9869ef0db6..872d9cddbcef 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -516,7 +516,7 @@ static int xhci_dbc_mem_init(struct xhci_dbc *dbc, gfp_t flags)
 		goto string_fail;
 
 	/* Setup ERST register: */
-	writel(dbc->erst.erst_size, &dbc->regs->ersts);
+	writel(dbc->erst.num_entries, &dbc->regs->ersts);
 
 	lo_hi_writeq(dbc->erst.erst_dma_addr, &dbc->regs->erstba);
 	deq = xhci_trb_virt_to_dma(dbc->ring_evt->deq_seg,
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 8a3ae5049d1c..10805196e197 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1376,8 +1376,6 @@ struct xhci_erst {
 	unsigned int		num_entries;
 	/* xhci->event_ring keeps track of segment dma addresses */
 	dma_addr_t		erst_dma_addr;
-	/* Num entries the ERST can contain */
-	unsigned int		erst_size;
 };
 
 struct xhci_scratchpad {
-- 
2.25.1


