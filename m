Return-Path: <linux-usb+bounces-30479-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F90C57814
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 13:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B65213532AD
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 12:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683EF2F9DA1;
	Thu, 13 Nov 2025 12:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XdIy2FuW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A7834F479
	for <linux-usb@vger.kernel.org>; Thu, 13 Nov 2025 12:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763038723; cv=none; b=GQM+2shH977KGbY9kZVHSIVpL2QaGu+BHErHAPYhtmMv3QJBMrpJ7Nk0mSF+ifWzaYCM66TTn8xoRqyq9nLyVxYpkB2MNMZbDEDa63vYeB90ied0HtwldqoDkTsM01eqwp3RZClNL0QJ0ua+wNtJmKlf+23ZYFZtewAieWW8DdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763038723; c=relaxed/simple;
	bh=A/nPJhr7QcJkSonQAkuY0JeS05QbXWYCMXRUZ4VUfzk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mk8BbS6F3pRjeWJWcJWCRvBPe5oQLDVhgyOXVoPt3MekeauyzmPCQBBaLst6+zfid6DCinQgIsRXfEDuVhZ7WaYK491ECOzUw0NBbZAzomyAGVvArv9ExNq2ApH9O9OI/8g1Qpjxn4D26WKcMOUzNEYPpKSluQWg8My30u53G8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XdIy2FuW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763038721; x=1794574721;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=A/nPJhr7QcJkSonQAkuY0JeS05QbXWYCMXRUZ4VUfzk=;
  b=XdIy2FuW9xIGmrbuzaFnj8ULfE9XIFyZ6tRYReS/oCerBUl1Z9McIFYc
   Vy3uuyhdgHwfhSct5ao+fhTbh7+kqG7kYaTWGmNnRhBpTrM2dGCg/sWmu
   fg6L8wMe3CJ+D+TBNhxJmjp1YKuiOMAoMeLc76h7XEqB09x2/iXaUHooC
   Az9WM4nMjR1XbkIS1n8qdh5yM1EAUhBjL1jJzX5br2DpxAf963WIaksp6
   qtpn3L5YVDkhp4yJNrkjp6jgz46DaLUNpphqJ2QUiSO3isDbqXDujg8q3
   UCMhyLa710qIa7D1UNALSjCOhZ+f5H6p9fCWVaxLP6zCq1YkCQ3CRCAh3
   w==;
X-CSE-ConnectionGUID: lP0dsIC1RDy4+k9QN6PAvQ==
X-CSE-MsgGUID: a3c1qh2jSKymcCwjTwIaLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65150378"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="65150378"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 04:58:41 -0800
X-CSE-ConnectionGUID: 5E+Y3XuvS9C77xWw5f1Mxw==
X-CSE-MsgGUID: fcVv0C7iRDWoyqZaAltw9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189673755"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 13 Nov 2025 04:58:40 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 8DBFD96; Thu, 13 Nov 2025 13:58:38 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 00/13] usb: xhci: Host Controller Capability Registers rework
Date: Thu, 13 Nov 2025 13:56:27 +0100
Message-ID: <20251113125640.2875608-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series focuses on improving the definitions and organization of
the Host Controller Capability Registers macros in the xhci driver.
It is the first step in a larger effort to clean up and restructure the
xhci header files for better readability and maintainability.

Because the Structural Parameters 1 register (part of the HC Capability
Registers) relies heavily on xhci-caps.h, a few related patches from
another ongoing rework have been included here as well. These address the
handling of Max Ports and Max Interrupters values.
The Max Slots handling will follow the same pattern in a future series.
That change is more involved and will be submitted separately.

v2 changes:
 * Change xhci_ist_in_microseconds() argument to 'xhci'.
 * Rename xhci_ist_in_microseconds() to xhci_ist_microframes().
 * Revert to (1 << x) from BIT() operaion in HCC_MAX_PSA() macro.
 * Added macro changes to DWC3 driver.

Niklas Neronin (13):
  usb: xhci: remove deprecated TODO comment
  usb: xhci: remove unused trace operation and argument
  usb: xhci: use cached HCSPARAMS1 value
  usb: xhci: simplify handling of Structural Parameters 1 values
  usb: xhci: limit number of ports to 127
  usb: xhci: limit number of interrupts to 128
  usb: xhci: improve xhci-caps.h comments
  usb: xhci: simplify Isochronous Scheduling Threshold handling
  usb: xhci: simplify Max Scratchpad buffer macros
  usb: xhci: drop xhci-caps.h dependence on xhci-ext-caps.h
  usb: xhci: standardize single bit-field macros
  usb: xhci: standardize multi bit-field macros
  usb: xhci: use 64-bit Addressing Capability macro

 drivers/usb/dwc3/host.c         |   5 +-
 drivers/usb/host/xhci-caps.h    | 188 ++++++++++++++++++--------------
 drivers/usb/host/xhci-debugfs.c |  20 ++--
 drivers/usb/host/xhci-histb.c   |   2 +-
 drivers/usb/host/xhci-hub.c     |  12 +-
 drivers/usb/host/xhci-mem.c     |  41 +++----
 drivers/usb/host/xhci-mtk.c     |   4 +-
 drivers/usb/host/xhci-pci.c     |   6 +-
 drivers/usb/host/xhci-plat.c    |   2 +-
 drivers/usb/host/xhci-ring.c    |  40 ++++---
 drivers/usb/host/xhci-tegra.c   |   5 +-
 drivers/usb/host/xhci-trace.h   |  20 +---
 drivers/usb/host/xhci.c         |  57 +++++-----
 drivers/usb/host/xhci.h         |  16 ++-
 14 files changed, 215 insertions(+), 203 deletions(-)

-- 
2.50.1


