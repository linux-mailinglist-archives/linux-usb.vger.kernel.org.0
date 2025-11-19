Return-Path: <linux-usb+bounces-30701-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7484AC6F463
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 856712EEDD
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E102E36826D;
	Wed, 19 Nov 2025 14:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bS+SB3Xj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C9F366DB0
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 14:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562278; cv=none; b=Qxi0puHuhGpbdOdHret9a29OTpUhkyO5x6pS3H7PXBHbgJAAFi0KQ3rPxE7o39lGXhcGG/5dtz5A37+f6lkPQH1hDHWHJ+N+JzknwOSELNpY8Rn1M5mVfSyLQK+74ZRoDgrFbxwFAeW7F0i8fUqFxvRfAM30MqkZ48IU7N756JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562278; c=relaxed/simple;
	bh=ozt2a5hK+D3FYDREIR6DJ7UxSb/LZY/QB7XDpCWyi9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TXxGdFR/PJOHSzMU7W7JUcpqdklqyl/LIx//Y11bojbqCyH9duG10h189WIACkvIqfRHouBP8VuQ6vejex1BLovzvWKOygWlE02ncBW/8oA/AL6LOzKWuaRxeXnRmUkx4crFbzrgrw/7UvgR2cnVpsCsiF+TEMMtAau0rCqkKPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bS+SB3Xj; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763562277; x=1795098277;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ozt2a5hK+D3FYDREIR6DJ7UxSb/LZY/QB7XDpCWyi9s=;
  b=bS+SB3XjOe1oZjsngvE198G5R4XPvQcrKQMFBLwm77Vc1U6MhxSHdGC3
   0WdofzdWLcO3/B0+QePHmyYjM4uWe02+nsX0nQQ/dW4mNERTla54WqpA1
   nYCs3BtsWbEUT5RItQwvNV5h3QhAzttUmr3T5Isa+jakETNAyJEAwMKgf
   AMefdK6awdL74pJZMfwWd9UgI/mnMFe5fAU+aMRVrWsV8ZF9vDM/8mN5N
   bQMI7T6zUPBQJq85quw4JjOeUyQ8c7/Yr1rNGkWIJ0q37wjQsXZG4i2e4
   LkH/WCyLYMNCdVoQ2lhP/l3WsSxz7yn3e3ZKVrEg1KZMesko/3ngH/jns
   A==;
X-CSE-ConnectionGUID: I7/I/F0dReSJ9d3LIzKHNg==
X-CSE-MsgGUID: ahZXcfDFShSKqaHw6cycSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65645486"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65645486"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:36 -0800
X-CSE-ConnectionGUID: a+qI14UPSgi2yV9qYDBYzg==
X-CSE-MsgGUID: /Yc+DC04Ri2uiR79vkrJNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221991960"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:35 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 00/23] xhci features for usb-next
Date: Wed, 19 Nov 2025 16:23:54 +0200
Message-ID: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

xhci patches for usb-next including a new debugfs entry for port link info
registers, graceperiod tuning, and a lot of reworks, cleanups and other
improvements.

Thanks
Mathias

Hongyu Xie (1):
  usb: xhci: limit run_graceperiod for only usb 3.0 devices

Marco Crivellari (1):
  usb: xhci: replace use of system_wq with system_percpu_wq

Mathias Nyman (2):
  xhci: Add helper to find trb from its dma address
  xhci: simplify and rework trb_in_td()

Michal Pecio (2):
  usb: xhci: Assume that endpoints halt as specified
  usb: xhci: Don't unchain link TRBs on quirky HCs

Niklas Neronin (16):
  usb: xhci: rework xhci_decode_portsc()
  usb: xhci: add tracing for PORTSC register writes
  usb: xhci: add helper to read PORTSC register
  usb: xhci: add USB Port Register Set struct
  usb: xhci: implement USB Port Register Set struct
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

Rai, Amardeep (1):
  usb: xhci: Add debugfs support for xHCI Port Link Info (PORTLI)
    register.

 drivers/usb/host/xhci-caps.h    | 167 +++++++++++++---------
 drivers/usb/host/xhci-dbgcap.c  |   8 +-
 drivers/usb/host/xhci-debugfs.c |  57 ++++++--
 drivers/usb/host/xhci-hub.c     | 125 ++++++++---------
 drivers/usb/host/xhci-mem.c     |  41 +++---
 drivers/usb/host/xhci-pci.c     |   6 +-
 drivers/usb/host/xhci-port.h    |   5 +
 drivers/usb/host/xhci-ring.c    | 242 ++++++++++++++------------------
 drivers/usb/host/xhci-tegra.c   |  12 +-
 drivers/usb/host/xhci-trace.h   |  25 ++--
 drivers/usb/host/xhci.c         |  92 ++++++------
 drivers/usb/host/xhci.h         | 116 ++++++++-------
 12 files changed, 468 insertions(+), 428 deletions(-)

-- 
2.43.0


