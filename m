Return-Path: <linux-usb+bounces-17175-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C969BE3D2
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 522621C23A04
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE531DD0C8;
	Wed,  6 Nov 2024 10:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gbjt+3WJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4D519066B
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730887968; cv=none; b=FPrJEetYrLmh1d+2ExT/lbfz5dwJRNLGjQyFIQO0r9hTmYkrRmGb4uaIaBiGUzDUDi2XxpBHjhSUNk9HbeLxBF3efYrbzJHR+Sj0S96dhGhaK9uxcQrJZr2XbmUQIVdZWYHWwY4IDP3Z8agUvLYyExqbhssSQSxDiOSaL/O2WSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730887968; c=relaxed/simple;
	bh=bjNsfp9eosp/k2bm2Px7aU1VC91xn9CCbxqIiAJhQf0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ksiz88tg4EXK6uamxHK2WG9cARYggLaDgyPceD/0RzwC4BvepkuCFO4ZTUzBxX29iT8Ks74sWtPXUblKrVhF5N6Nv6omY8zcv4coZ6MlWxoXeghePaZwJyrnFfDmy65fgDwbmnIeUR9gEQiwzT+J81YGW+IIWeptwlrw4lTQ62g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gbjt+3WJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730887966; x=1762423966;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bjNsfp9eosp/k2bm2Px7aU1VC91xn9CCbxqIiAJhQf0=;
  b=Gbjt+3WJh2WtnBlb38W1pQTk/NYGmE34BEan0DfZ3wcQy2zfNOI5vnxe
   E+Fe7C6V9JMNMqYrFhrd59i0aNptERbLPj2yqC7e3JsE8M9zEHu5jRQL1
   e+NRn11bnrHUFzh4w/RG+PB7NhS5on52ia8pMzRQcw4LVxtUTivVgbHCu
   +k0itEnbuzmX9uGCmW2j9JGrASU0D2kMS6uOin+Xc6rVncVxKMDfwnGWV
   TfSx6Ix1mZ8E/Igttg+k+OgU4KcURtknyCGap+oc1ct7p6t8J7VyGRwJc
   2D/HFBhMUgGXYbYo64hTO39tcSmpvUKX/8p8YDiauP6CQ3ZWqzO1t1xRS
   w==;
X-CSE-ConnectionGUID: Wkm8O95HSLm8vCURv/l2oQ==
X-CSE-MsgGUID: tCNJLrJqQkOIiowEUvJE0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42059367"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42059367"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:12:46 -0800
X-CSE-ConnectionGUID: BGuCuJDmQrOWLBtgNBFXmA==
X-CSE-MsgGUID: ym6JrZeUQfqPQaqQkCmtEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84812897"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 02:12:45 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 00/33] xhci features and fixes for usb-next
Date: Wed,  6 Nov 2024 12:14:26 +0200
Message-Id: <20241106101459.775897-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg

A larget set of xhci cleanups, fixes, refactoring and features for usb-next.

A bit late in the cycle but I wanted to get the endpoint stop/start race
fix into this series as well.
In addition to that fix there are several xhci cleanups and reworks, new
tracing and debug entries, and some Etron vendor specific fixes.

Thanks
Mathias

Andy Shevchenko (2):
  xhci: pci: Use standard pattern for device IDs
  xhci: pci: Fix indentation in the PCI device ID definitions

Kuangyi Chiang (4):
  xhci: Combine two if statements for Etron xHCI host
  xhci: Don't issue Reset Device command to Etron xHCI host
  xhci: Fix control transfer error on Etron xHCI host
  xhci: Don't perform Soft Retry for Etron xHCI host

Mathias Nyman (6):
  xhci: Add Isochronous TRB fields to TRB tracer
  xhci: Cleanup Candence controller PCI device and vendor ID usage
  xhci: show DMA address of TRB when tracing TRBs
  xhci: Don't trace ring at every enqueue or dequeue increase
  xhci: add stream context tracing
  xhci: trace stream context at Set TR Deq command completion

Michal Pecio (5):
  usb: xhci: Remove unused parameters of next_trb()
  usb: xhci: Fix sum_trb_lengths()
  usb: xhci: Limit Stop Endpoint retries
  usb: xhci: Fix TD invalidation under pending Set TR Dequeue
  usb: xhci: Avoid queuing redundant Stop Endpoint commands

Niklas Neronin (15):
  usb: xhci: introduce macro for ring segment list iteration
  usb: xhci: remove option to change a default ring's TRB cycle bit
  usb: xhci: adjust xhci_alloc_segments_for_ring() arguments
  usb: xhci: rework xhci_free_segments_for_ring()
  usb: xhci: refactor xhci_link_rings() to use source and destination
    rings
  usb: xhci: rework xhci_link_segments()
  usb: xhci: add xhci_initialize_ring_segments()
  usb: xhci: simplify TDs start and end naming scheme in struct
    'xhci_td'
  usb: xhci: move link TRB quirk to xhci_gen_setup()
  usb: xhci: request MSI/-X according to requested amount
  usb: xhci: improve xhci_clear_command_ring()
  usb: xhci: remove unused arguments from td_to_noop()
  usb: xhci: refactor xhci_td_cleanup() to return void
  usb: xhci: add help function xhci_dequeue_td()
  usb: xhci: remove irrelevant comment

WangYuli (1):
  xhci: debugfs: Add virt endpoint state to xhci debugfs

 drivers/usb/host/xhci-dbgcap.c  |  13 +-
 drivers/usb/host/xhci-debugfs.c |  10 +-
 drivers/usb/host/xhci-mem.c     | 235 ++++++++++++-------------
 drivers/usb/host/xhci-pci.c     |  43 ++---
 drivers/usb/host/xhci-ring.c    | 296 +++++++++++++++++++-------------
 drivers/usb/host/xhci-trace.h   |  79 ++++++---
 drivers/usb/host/xhci.c         |  78 ++++++---
 drivers/usb/host/xhci.h         |  49 ++++--
 8 files changed, 460 insertions(+), 343 deletions(-)

-- 
2.25.1


