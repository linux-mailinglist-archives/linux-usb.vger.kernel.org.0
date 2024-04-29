Return-Path: <linux-usb+bounces-9893-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB92A8B5AB0
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 16:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A82171F21580
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 14:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA76074C08;
	Mon, 29 Apr 2024 14:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DexgR53A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E526A8DC
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 14:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714399259; cv=none; b=E5u7Hfnc4hCpFVPeEW0qTR2cWozYmwl5xKikw0Y6Fyfvx2hs+mnWCZDjy8OPWnl9YwTlBRjL7BA+n2hKujoHLFNnG9k2IGEWmM3PIAmUtB/X7EcSsY9ASv/eGFgphswsr0GxzyPjX5Ye/U+W+GteDIRXRhsL7i1Z4aMD/RSP/wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714399259; c=relaxed/simple;
	bh=c3zpLthBylZsXdoJCsL8mJa9Cb6Ag9bZXQkZMP7Lilo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gjMZvRF6Pt7aytr2HtxMWldvA2+SEIIvPcyBRGHpHQv10ScHBJzajRRjcRZ0jiByDgIvQzVVLHQzrCXHw/Xvbca5KSIYRttB6X8HcPr1lLFMJZW9q0chq/RqxcPu+7tYeSxy4X3XVZf5R1hQmfLAplvNiakZhxE86XkU5UJMd/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DexgR53A; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714399258; x=1745935258;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c3zpLthBylZsXdoJCsL8mJa9Cb6Ag9bZXQkZMP7Lilo=;
  b=DexgR53AOW3UBN1LloI9kvG6vhpAJXmEVAQS06ox8oy6ve4OI52LItqF
   9hpeVDjaSNPCjmHC04cOGM8+gDe3yzEbM+RD1qlmyrHplftQCqIk0aae8
   +QGI1M7pKq7VCPL3pkhB02r/ML9pdI2leva/eiAmmzTrHRRQe0ugKjQlu
   W8kdCRCehGsIrwB6jowO9KQzfFI0UGfqF7c+m6+aPeBH3NVKuCj65pUiI
   gEPCyEtmQA6gL6ijCAGJ8nLfYBXACxwiRAIfAOilePdbCTzjCYJdJaQBu
   FVb+jYsIc5HICW8uRs24rp+pe7b4JOSVHkDZvv/uV7/fqvpX53UiYK4BO
   w==;
X-CSE-ConnectionGUID: S2k0nux6QVaY8G50BjLa9w==
X-CSE-MsgGUID: pcOVFZB6SxWqZzBblG2aqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9911373"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9911373"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 07:00:57 -0700
X-CSE-ConnectionGUID: 7uUQ8uHUTUSfKINT/rwR6Q==
X-CSE-MsgGUID: asoHO08kTRWPL6k5t6S+Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26521636"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2024 07:00:55 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 00/18] xhci cleanups and rework for usb-next
Date: Mon, 29 Apr 2024 17:02:27 +0300
Message-Id: <20240429140245.3955523-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

This series for usb-next is mostly xhci cleanups and refactoring.

Thanks
Mathias

Andy Shevchenko (3):
  xhci: pci: Use full names in PCI IDs for Intel platforms
  xhci: pci: Group out Thunderbolt xHCI IDs
  xhci: pci: Use PCI_VENDOR_ID_RENESAS

Mathias Nyman (4):
  xhci: stored cached port capability values in one place
  xhci: remove xhci_check_usb2_port_capability helper
  xhci: improve PORTSC register debugging output
  xhci: remove XHCI_TRUST_TX_LENGTH quirk

Niklas Neronin (11):
  usb: xhci: check if 'requested segments' exceeds ERST capacity
  usb: xhci: improve debug message in xhci_ring_expansion_needed()
  usb: xhci: address off-by-one in xhci_num_trbs_free()
  usb: xhci: remove redundant variable 'erst_size'
  usb: xhci: use array_size() when allocating and freeing memory
  usb: xhci: prevent potential failure in handle_tx_event() for Transfer
    events without TRB
  usb: xhci: remove 'handling_skipped_tds' from handle_tx_event()
  usb: xhci: replace goto with return when possible in handle_tx_event()
  usb: xhci: remove goto 'cleanup' in handle_tx_event()
  usb: xhci: remove duplicate TRB_TO_SLOT_ID() calls
  usb: xhci: compact 'trb_in_td()' arguments

 drivers/usb/host/xhci-dbgcap.c |   2 +-
 drivers/usb/host/xhci-mem.c    |  48 +++++-------
 drivers/usb/host/xhci-pci.c    |  49 +++++-------
 drivers/usb/host/xhci-rcar.c   |   6 +-
 drivers/usb/host/xhci-ring.c   | 138 ++++++++++++++-------------------
 drivers/usb/host/xhci.c        |  38 ++-------
 drivers/usb/host/xhci.h        |  28 ++++---
 7 files changed, 121 insertions(+), 188 deletions(-)

-- 
2.25.1


