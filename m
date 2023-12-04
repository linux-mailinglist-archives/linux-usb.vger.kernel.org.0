Return-Path: <linux-usb+bounces-3657-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F69D8030CD
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:44:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AE08280FE8
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17A81DFE8;
	Mon,  4 Dec 2023 10:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IXt7lXW/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4E56D5
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701686678; x=1733222678;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GPTTx7orqcFGVd7zSvEhAOlL/SDo4wcGruzoWZZ966Q=;
  b=IXt7lXW/VmVb8JFPOIYvtKuLw7OltDbyOZCZDZf+fUAQePlqnqtCqkVR
   NOy1OzvybSUrN8FvMb7yn2NrSJMTXG/hvDFSfpu2TUvNOAOqn0Xk008T3
   FO8zTtaWMUk8AOPAtPo9somlhDIpAd8kkPQPj7PT3a6U/zhiyf5J9zCbd
   gZfiXXAd+b9xYhmGSjcl8hu5giSZznyf+V3c5u2hqkfB5gSyBjpP7sJwK
   k16+QqHbTaxA90y+Gd/U0pzfOCdzEpv0HF3exONxOgF8Ero7FQ2Wp7gEo
   0nvuhp2lJ/26C4xb7FagLIJIl1H3npq9cbD6gS4UABFZCEYcslEsTuf/N
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="15260644"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="15260644"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:44:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="861338838"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="861338838"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Dec 2023 02:44:21 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 00/18] xhci features for usb-next
Date: Mon,  4 Dec 2023 12:45:16 +0200
Message-Id: <20231204104534.1335903-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

V2 of xhci features and cleanups for usb-next, including xhci dbc
cleanups, MSI rework, and fixing how we reconfigure max packet size
for xhc.

One patch fixes a null pointer deref issue, but this hasn't been seen
in real life. It's a theoretical case triggered by adding a 3 second
delay in the driver.
So I don't think it should go to stable.

v2 drops one small cleanup patch as it turned out to not really clarify or
simplify things. This was [PATCH 08/19] "xhci: dbc: Use sizeof_field()
 where it makes sense" in previous series.
Link: https://lore.kernel.org/linux-usb/20231201150647.1307406-9-mathias.nyman@linux.intel.com

Thanks
Mathias

Andy Shevchenko (9):
  xhci: dbc: Drop duplicate checks for dma_free_coherent()
  xhci: dbc: Convert to use sysfs_streq()
  xhci: dbc: Use sysfs_emit() to instead of scnprintf()
  xhci: dbc: Use ATTRIBUTE_GROUPS()
  xhci: dbc: Check for errors first in xhci_dbc_stop()
  xhci: dbc: Don't shadow error codes in store() functions
  xhci: dbc: Replace custom return value with proper Linux error code
  xhci: dbc: Use sizeof(*pointer) instead of sizeof(type)
  xhci: dbc: Add missing headers

Mathias Nyman (2):
  xhci: Reconfigure endpoint 0 max packet size only during endpoint
    reset
  xhci: fix possible null pointer deref during xhci urb enqueue

Niklas Neronin (7):
  xhci: check if legacy irq is available before using it as fallback
  xhci: add handler for only one interrupt line
  xhci: refactor static MSI-X function
  xhci: refactor static MSI function
  xhci: change 'msix_count' to encompass MSI or MSI-X vectors
  xhci: rework 'xhci_try_enable_msi()' MSI and MSI-X setup code
  xhci: minor coding style cleanup in 'xhci_try_enable_msi()'

 drivers/usb/host/xhci-dbgcap.c | 130 +++++++++++++++---------------
 drivers/usb/host/xhci-dbgcap.h |   1 +
 drivers/usb/host/xhci-pci.c    | 140 +++++++++------------------------
 drivers/usb/host/xhci.c        | 123 +++++++++++++++--------------
 drivers/usb/host/xhci.h        |   4 +-
 5 files changed, 174 insertions(+), 224 deletions(-)

-- 
2.25.1


