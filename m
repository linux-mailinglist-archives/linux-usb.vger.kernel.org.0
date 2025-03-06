Return-Path: <linux-usb+bounces-21433-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A02A54E25
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 15:49:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA89E16AA0C
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 14:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218AB16DEB3;
	Thu,  6 Mar 2025 14:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ij+/RVjB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193D513AD18
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 14:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272536; cv=none; b=q8hxFPBAEA4//BFXKFy03sHlBxbAWT1kfyynjztXm0Cpgv5S1dioUimNKdZJzDkSenMY2wZF/fu3ABqunWr92KVQ18o1hPfpLHwwYm3hApPW9PZWg6b172pJRfzTo3UHyQBNRC4KkrpeotQcxuZQYfa67ttgiVcf5fcB7+CGARU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272536; c=relaxed/simple;
	bh=IG+o69BEO6Id84IHufc7TGxszfjv+czOCc48I0qeiJc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DD0KreoNVA06cOlMS5AWrZzjX0zKOzBbmj7hmH5/6q7jPE3CQbVwuyTLoFSeZbDm76O8YKrnr9DGjUB/fEdCX8Z4QfKNHKPayW5gIGoaMIVF42coN7Fa1RYwP6y3OdQXOQrBhfTaJyIw1rm9zlne09/dBRPNekYPrv6o3n+E3Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ij+/RVjB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741272535; x=1772808535;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IG+o69BEO6Id84IHufc7TGxszfjv+czOCc48I0qeiJc=;
  b=Ij+/RVjB8T35EvQ4aBHdoPPak+aeE5++yOBucsF95yb2qb/bEgTeI3iw
   9loYk8zVkXbZ1K3AYYXh/YLyI0ePO6dJdj6IHZLQC19nf2eANa5xyNCX/
   GcqPNvRjF+1keILQe70FOuItaxP4OOlngngxjF87lkbYQDVgVHvo1PsFj
   qug6Pi4tszbsH8KrPl9SJSB7JjrBdqLz0Qq1KVhPGwP/KGJsD/qDb7XFa
   eKDC8qrZWiHqdCz2d5RoVKWXX8poXPKNpfTwwQFzubOTOI5dtsMaGu+hL
   DJjtNdNUnibbyTKMfgor3cs1syiou3MSd66HCDF3W5p1Um6JsfdhuNaFh
   w==;
X-CSE-ConnectionGUID: a7GGxqfbQTSv5cblbZ1PNA==
X-CSE-MsgGUID: BGV9GB+IQc+CFRUnvfMZAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="67656959"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="67656959"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 06:48:54 -0800
X-CSE-ConnectionGUID: w1SL4dZUQLOLj2TH0cVMJQ==
X-CSE-MsgGUID: 2E17nMT7STGfUfq+S7+Ivw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119954710"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa008.jf.intel.com with ESMTP; 06 Mar 2025 06:48:53 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 00/15] xhci features for usb-next
Date: Thu,  6 Mar 2025 16:49:39 +0200
Message-ID: <20250306144954.3507700-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

A set of xhci reworks, refactoring and minor improvements for usb-next.
A lot of the work is related to transfer event handling.

Thanks
Mathias

Mathias Nyman (3):
  xhci: show correct U1 and U2 timeout values in debug messages
  xhci: Prevent early endpoint restart when handling STALL errors.
  xhci: Handle spurious events on Etron host isoc enpoints

Michal Pecio (7):
  usb: xhci: Don't skip on Stopped - Length Invalid
  usb: xhci: Complete 'error mid TD' transfers when handling Missed
    Service
  usb: xhci: Fix isochronous Ring Underrun/Overrun event handling
  usb: xhci: Expedite skipping missed isoch TDs on modern HCs
  usb: xhci: Skip only one TD on Ring Underrun/Overrun
  usb: xhci: Apply the link chain quirk on NEC isoc endpoints
  usb: xhci: Unify duplicate inc_enq() code

Niklas Neronin (5):
  usb: xhci: remove redundant update_ring_for_set_deq_completion()
    function
  usb: xhci: correct debug message page size calculation
  usb: xhci: set page size to the xHCI-supported size
  usb: xhci: refactor trb_in_td() to be static
  usb: xhci: move debug capabilities from trb_in_td() to
    handle_tx_event()

 drivers/usb/host/xhci-mem.c  |  34 +--
 drivers/usb/host/xhci-ring.c | 397 +++++++++++++++++------------------
 drivers/usb/host/xhci.c      |  14 +-
 drivers/usb/host/xhci.h      |  28 ++-
 4 files changed, 240 insertions(+), 233 deletions(-)

-- 
2.43.0


