Return-Path: <linux-usb+bounces-27549-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 809C4B440CD
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 17:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 498E0586B3D
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 15:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14DE328031C;
	Thu,  4 Sep 2025 15:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AKRnmraj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD748280004
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 15:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757000586; cv=none; b=PTTv5fwYKlRCXGJmRFm++lrdl8tG5btEn+YAD4pDAPmmNuogDgslYTLTl7fz1eOU+2AXd8hZAQfUiyHOlxl2itkClMzD3I5Q3pxHllnyZLOK39vtN6XEYhF24WlW7uJEAxYFwBpkNzXK1lfoQBab1ijMgO1ZSEsMw94gxjQ8Zqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757000586; c=relaxed/simple;
	bh=yprFQ4bnwuoGGBxuxH0SWiJ4NO81CBgL0DRO7J6tr0g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mQoeSrpUs2JsAWhCrnWJKKqLpw3HmgBkHfF182Xu2jLsKwwkdFg55d9mfsCjrVawA/VtofbuDOzHxpZ34g8W0CZJwr7wXHoC2fDnfbCcZL5p8Fsc3dEdvszzYEPTrumdTOzXcziVgiSLRo395jUQQwZjEJfgTLBLH1vmKBvsIqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AKRnmraj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757000585; x=1788536585;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yprFQ4bnwuoGGBxuxH0SWiJ4NO81CBgL0DRO7J6tr0g=;
  b=AKRnmrajekWus2bc+AUheW5N1tks6fOo8JDmis9I7vRBJf474ZGaweZp
   SIf/schQ5orcttXc7/8ySOHr0zmm5NLn/c2GTg8jC2jlzceJ5Z9LGNfO4
   V5CU3HrUfMNA4beDKBDpzD4QDfqyDCIvXtjFTuvCZkeFKSyFKx5nABmkm
   +dtKGE3uNRFxpWy8a8htvNfD6f50sXIpcVewd/kp6ydpOQOxzxQMDXRvy
   qEqejrFmBZJ1NgZB4dHQKGwCG5sDHyPftSjpF1dUoCWRvGSm9PMAwy9gx
   nVoU1i8dAiVrfbAx8tJtLxV97jsUOmF9zy3aAYlJ6zniMJtUdwHOgQ24B
   w==;
X-CSE-ConnectionGUID: DGi5f8BBSO+QgahrbDYrNw==
X-CSE-MsgGUID: 7F6fPe9GTZ+uuh7TDE9P3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="70049486"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="70049486"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 08:43:04 -0700
X-CSE-ConnectionGUID: XJ5H+uJBSgWocn7xfFAyNQ==
X-CSE-MsgGUID: nh0+bF+xSCGjtlmqU2WhCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="171159319"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 04 Sep 2025 08:43:03 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id CCA5994; Thu, 04 Sep 2025 17:43:01 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 0/7] usb: xhci: Port Register Set improvements
Date: Thu,  4 Sep 2025 17:42:13 +0200
Message-ID: <20250904154221.2314596-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The aim of this patch set is to introduce tracing for PORTCS writes and 
implement a Port Register Set struct.

Introduces a new struct for the Host Controller USB Port Register Set.
The current implementation accesses these registers through a single
'__le32' pointer, which, in conjunction with a macro, navigates to the
specific register using (base address + offset).

 Currently, how its accessed	| Register Name
--------------------------------------------------------------------------
 port->addr			| Port Status and Control
 port->addr + PORTPMSC		| Port Power Management Status and Control
 port->addr + PORTLI		| Port Link Info
 port->addr + PORTHLPMC		| Port Hardware LPM Control


 After, how its accessed	| Register Name
--------------------------------------------------------------------------
 port->port_reg->portsc		| Port Status and Control
 port->port_reg->portpmsc	| Port Power Management Status and Control
 port->port_reg->portli		| Port Link Info
 port->port_reg->porthlmpc	| Port Hardware LPM Control

These changes make it easier for future modification and their review.

Note:
I have chosen to split the struct changes across three separate commits
due to the substantial number of modified lines. Personally, I find that
minor typos are more likely to occur when dealing with larger patches.
However, I am open to consolidating these patches into a single commit
after review.

Niklas Neronin (7):
  usb: xhci: correct indentation for PORTCS tracing function
  usb: xhci: align PORTCS trace with one-based port numbering
  usb: xhci: improve xhci_decode_portsc()
  usb: xhci: add tracing for PORTCS register writes
  usb: xhci: add USB Port Register Set struct
  usb: xhci: implement USB Port Register Set struct
  usb: xhci: rename Port Register Set pointer in struct 'xhci_port'

 drivers/usb/host/xhci-debugfs.c |   6 +-
 drivers/usb/host/xhci-hub.c     | 115 ++++++++++++++++----------------
 drivers/usb/host/xhci-mem.c     |   3 +-
 drivers/usb/host/xhci-pci.c     |   4 +-
 drivers/usb/host/xhci-ring.c    |   2 +-
 drivers/usb/host/xhci-tegra.c   |  12 ++--
 drivers/usb/host/xhci-trace.h   |  39 ++++++-----
 drivers/usb/host/xhci.c         |  41 +++++++-----
 drivers/usb/host/xhci.h         |  94 +++++++++++++-------------
 9 files changed, 161 insertions(+), 155 deletions(-)

-- 
2.50.1


