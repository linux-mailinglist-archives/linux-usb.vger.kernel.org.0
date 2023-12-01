Return-Path: <linux-usb+bounces-3547-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16020800DE6
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 16:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C22CB2122E
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 15:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11AE4174A;
	Fri,  1 Dec 2023 15:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fI+jLXSX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7C8E93
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 07:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701443141; x=1732979141;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jrONfSyxD6aUbp1qb0g7y0X1vL/YnmQNWQyKlyuyX+U=;
  b=fI+jLXSXd7bfmDHkrQRhIrmmqDf0kdeeDeKwQPkJhRpPLxEv2FFjoFTY
   45bPjIHfSiI/EtD5e5SNPCFOE4vLqeXJLSUni+x+ctY9JbVc5CbBnIEbT
   vNJLPn98rA8wveykOgCd+tGT1ao//Yy7hu8e2o+qbmBoZ9bUwdSL6Qwc1
   Jm0tw6e+/kzWe8+bxav1zBtLAXWRE5ZuxiRZU6GBBKB/vubCxTQxDc02N
   RWCXFbzqAvxQEq1bHVvdZXJD9FwOj8D5cUomKrhuPL/wGFCZyzNXjjAOG
   X2b0F+CI+vWOEUu1PmZ/k3wAiM8ppMdWENO2KCR0H/2seGJdK8qeYBhfF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="396309674"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="396309674"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 07:05:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="943112496"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="943112496"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 01 Dec 2023 07:05:39 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 00/19] xhci features for usb-next
Date: Fri,  1 Dec 2023 17:06:28 +0200
Message-Id: <20231201150647.1307406-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

A set of xhci features and cleanups for usb-next, including xhci dbc
cleanups, MSI rework, and fixing how we reconfigure max packet size
for xhc.

One patch fixes a null pointer deref issue, but this hasn't been seen
in real life. It's a theoretical case triggered by adding a 3 second
delay in the driver.
So I don't think it should go to stable.

Thanks
Mathias

Andy Shevchenko (10):
  xhci: dbc: Drop duplicate checks for dma_free_coherent()
  xhci: dbc: Convert to use sysfs_streq()
  xhci: dbc: Use sysfs_emit() to instead of scnprintf()
  xhci: dbc: Use ATTRIBUTE_GROUPS()
  xhci: dbc: Check for errors first in xhci_dbc_stop()
  xhci: dbc: Don't shadow error codes in store() functions
  xhci: dbc: Replace custom return value with proper Linux error code
  xhci: dbc: Use sizeof_field() where it makes sense
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

 drivers/usb/host/xhci-dbgcap.c | 132 ++++++++++++++++---------------
 drivers/usb/host/xhci-dbgcap.h |   1 +
 drivers/usb/host/xhci-pci.c    | 140 +++++++++------------------------
 drivers/usb/host/xhci.c        | 123 +++++++++++++++--------------
 drivers/usb/host/xhci.h        |   4 +-
 5 files changed, 175 insertions(+), 225 deletions(-)

-- 
2.25.1


