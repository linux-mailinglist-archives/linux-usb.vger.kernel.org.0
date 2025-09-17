Return-Path: <linux-usb+bounces-28214-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F37DB7EDD7
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 15:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EC0554E292A
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 13:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A0032E749;
	Wed, 17 Sep 2025 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fhwgoSBf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8068031A802
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 12:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758113946; cv=none; b=YrKtGoCHVTRNFjD/4GZKk86BQ1gMBEtykM7DViq8gqrVWntCgKCdE5lt31gKn1bFAyS7vgbK4CxQy1lClSwWnyvE9cVAAWBMxVs3rbp5QFUAR04B9R/RGYIB99/A8A38KjrB99SGxXMUixRxEwfjZcQJSLL41S990zIlyMhIQeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758113946; c=relaxed/simple;
	bh=RQ+ZOLQQaZ+f1lIWRHshp1FsRA6OMG6A2uxA8cwXYLY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bTF5DM2z66RsMabQg1sB/NM2q43/lEyjyOflAvJ4LLC/dxn975gVMKdF6FwYpQWhIZF6RnaxSZ2H1ByDH/FtdGP29FIaBndaqZrlcQxoYOtAKGmvvXgpFRxiKCSGb27qG/cT6v0NvOKrkL+61eS7clt0KsPtothsuZoIEr8plY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fhwgoSBf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758113944; x=1789649944;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RQ+ZOLQQaZ+f1lIWRHshp1FsRA6OMG6A2uxA8cwXYLY=;
  b=fhwgoSBfGX3I4e5IdObRh0vyuDS+HxHPJz/TkLLr2+Baz/jCnROZ2Ntb
   jwfGR1KLkXJHWoej3q67WZshuAM69VYhDlGNLafCVWh3IBIOGbo9UvZFW
   j+qf6R2ni/2C4eusla+2ODu6qe+t/XCh4vucYmlfAWW613eQltv3gidQ/
   9BlU6yNp0QPFiBj73RBzTYkyU+6Xerc8bZqm0KcOdWrrvBQOtS6j+1NND
   DboohNLzBATv2zP/58SZTUUi2FsrJaQ28gAuDvjajobkIpJveEVIxEqYE
   NyhK0RreWH3/5p13kNhOBJp/fyONyUmq2UmxL+AWwyBAWWy8ItLjkUgG3
   Q==;
X-CSE-ConnectionGUID: wMsjUEMISZqb/cxWITHddQ==
X-CSE-MsgGUID: NlauAlUvTMe4h4DiNhwrfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60484583"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="60484583"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 05:59:04 -0700
X-CSE-ConnectionGUID: 7crLX5ytRQaD2N+H/uJSYw==
X-CSE-MsgGUID: GxA8jB6XS7SPtAd5s4H2fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="175159040"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 17 Sep 2025 05:59:02 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 7429597; Wed, 17 Sep 2025 14:59:01 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	peter.chen@kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 0/8] usb: xhci: Port Register Set improvements
Date: Wed, 17 Sep 2025 14:58:41 +0200
Message-ID: <20250917125850.3380560-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The aim of this patch set is to introduce tracing for PORTSC writes and 
implement a Port Register Set struct. This is the first part in a larger
series of changes.

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

v2 changes:
 * Fix acronym spelling to PORTSC from PORTCS, in all commit messages.
 * Add patch introducing xhci_get_portsc().

Niklas Neronin (8):
  usb: xhci: correct indentation for PORTSC tracing function
  usb: xhci: align PORTSC trace with one-based port numbering
  usb: xhci: improve xhci_decode_portsc()
  usb: xhci: add tracing for PORTSC register writes
  usb: xhci: add PORTSC read function
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
 drivers/usb/host/xhci.c         |  46 ++++++++-----
 drivers/usb/host/xhci.h         |  95 +++++++++++++-------------
 9 files changed, 167 insertions(+), 155 deletions(-)

-- 
2.50.1


