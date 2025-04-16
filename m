Return-Path: <linux-usb+bounces-23133-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD33A90538
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 16:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 089AD8A2CF4
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 13:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8972206B2;
	Wed, 16 Apr 2025 13:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eTQOyo0B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8DB1FAC59
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 13:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811160; cv=none; b=i90cpoaIz3kQO2wri0CwawQtRz6s+Pwo/eTXyUXKKqzWFBv2wiSza1BZ6dw4W0sC8+R/DwXdtrXx2RSB49xkYtNY3MuVpcZ4wWcdFjsRmdiAixQ9CHFr/cAVFiQWvbg0+SPHqj3bbZbpbZYfbnF3E6HEOC41UG7SykFByF7eNTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811160; c=relaxed/simple;
	bh=CMpwUp002+MaE0jK5vxy8/3XEL4HPB6p2s4r/6vm9NY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IDjJJri0/zcrxTcJnReDOPX8VFZORPOPEuUxNE2HNnpFatzcQqVyWKE0gPzFYtQXTZoXcQ94uqy0g4BokvY4bvmtnZYhMYqW4qAbtJbJSCR3OK6xYrvozRW0bi24JZPm9WCFNfNFdwgTR5tG5mExe7FdJ53K5T7AlGC81bVHYVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eTQOyo0B; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744811159; x=1776347159;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CMpwUp002+MaE0jK5vxy8/3XEL4HPB6p2s4r/6vm9NY=;
  b=eTQOyo0BS47ehsmMk5DSvJVve9CwitVyzoj61Q07T0qee4/2WB/EZ/PD
   OOceG6HhgXY94Tn3zzvtmQeBjWkE0U4alF80idbLJc8TdqPlclwRmyWNu
   yvHt00JUF6YqE0XMGHH1zNPAaLtKqf0xaaBUAoJkUYyLiuqvy7glUHbMl
   H6TJuraHevFVOjPiHpbyzxgUqtEyuRqryUIwrfCGmV4aFTbbcX5YxxvnD
   5loJhL1j3ehK1dYYwdKPsdorM1KzVC/+yy0NK555QUth1ZUGNbq8ZUvNz
   YWX7JfH7YsqFWtg2vpwbSfUrt+0lJcdcQ9hVmIqNbl7sMqQQHdIrl67Ju
   A==;
X-CSE-ConnectionGUID: vVLvnQWsToeSq2m6if3boQ==
X-CSE-MsgGUID: 43nKEoNcRWalH8L8bd1T7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50168075"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="50168075"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 06:45:58 -0700
X-CSE-ConnectionGUID: Y0vgtFGiR8WJTnFVUvb3ag==
X-CSE-MsgGUID: tnD3Hj3DTCO3xg28nYNX2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135290184"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 16 Apr 2025 06:45:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 10D86260; Wed, 16 Apr 2025 16:45:54 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	sergei.shtylyov@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 00/11] usb: xhci: decouple allocation and initialization
Date: Wed, 16 Apr 2025 16:44:59 +0300
Message-ID: <20250416134510.2406543-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, after hibernation (S4 state), the xhci driver frees all its
memory and reallocates it from scratch, which is inefficient. Instead, much
of the memory can be simply re-initialized.

The proposed changes begin the process by decoupling initialization code
from memory allocation code. Specifically, the initialization code is moved
from xhci_mem_init() into separate functions, which are then called from
xhci_init().

By implementing these changes, future patches will be able to call the
initialization functions directly after hibernation, thereby improving
efficiency and enhancing code structure.

v2:
 * Add "Array" to "Set Device Context Base Address pointer" comment.
 * Rebase on top of the recently accepted sideband series to resolve some
   conflicts. The rebase impacts commits 8 and 9.
   There will be duplicate code in xhci_create_secondary_interrupter().
   Since I have another patch set pending that slightly impacts this
   function, I have decided to hold off on reworking or cleaning up the
   function.

Niklas Neronin (11):
  usb: xhci: relocate pre-allocation initialization
  usb: xhci: move device slot enabling register write
  usb: xhci: move command ring pointer write
  usb: xhci: refactor xhci_set_cmd_ring_deq()
  usb: xhci: move DCBAA pointer write
  usb: xhci: move doorbell array pointer assignment
  usb: xhci: move enabling of USB 3 device notifications
  usb: xhci: remove error handling from xhci_add_interrupter()
  usb: xhci: move initialization of the primary interrupter
  usb: xhci: add individual allocation checks in xhci_mem_init()
  usb: xhci: cleanup xhci_mem_init()

 drivers/usb/host/xhci-caps.h |   4 +-
 drivers/usb/host/xhci-mem.c  | 168 ++++++++++-------------------------
 drivers/usb/host/xhci.c      | 126 +++++++++++++++++++++-----
 drivers/usb/host/xhci.h      |  12 +--
 4 files changed, 159 insertions(+), 151 deletions(-)

-- 
2.47.2


