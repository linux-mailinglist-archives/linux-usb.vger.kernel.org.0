Return-Path: <linux-usb+bounces-16364-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 964C49A22FB
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 15:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BED201C2264A
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 13:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390421DD88F;
	Thu, 17 Oct 2024 13:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/Nxg0bf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770FC1DA112
	for <linux-usb@vger.kernel.org>; Thu, 17 Oct 2024 13:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729170421; cv=none; b=TFTRbN5MJJ/vNFZkEXo/vlODZ3obAR73mlU3A6aWv69/cdWgR5asQcVMIsveugCxGRtbmK27plqA3RC0zCRMlqIw91qBYWEWBBQYy9ELAAsXSH+yb5V3MaY+H4rl3FbT4WMPpKlFaVnBA4qW5nOTa0lpcdHmjqwl9e/QN59MEMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729170421; c=relaxed/simple;
	bh=hkiX9y1UxUZS/mDg9Fke8Wvf4bRY+zYbQiuGgRlth8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VSpzZvM+E0wLf1ylbqR9Ej2LtYSVzcMrJmzrE9AFQhCsAF0gqvqFjxhdsYIxnFCRQgk3RZie948MGf5O8XxLktZUWhvPKNbMcq4ezI9XQkw/E5wN+McbsZGA6G+ovxOplOA8egbf5O15kTusQgqYN2fxj1J4gNTrbEQiI3F+im0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/Nxg0bf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729170420; x=1760706420;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hkiX9y1UxUZS/mDg9Fke8Wvf4bRY+zYbQiuGgRlth8w=;
  b=m/Nxg0bfz134SEwSgtpTIwyL7/IVblYiW3bGMcZOhfuelMpe4Ki0OFkx
   o7yGVdUD66sLWjW88NsCavMB9Yl04XJmbxa5yLFElmYc3YbDqumxXJ5Km
   +9PfwqxLBVrCgmjRVUb8mnkTs9LGFJOb+w+p5PiF/GptiPj/2LOSGpkpc
   u/lQezbs9biuaibAg4Ktseu5jyLa5SeBCyeQISM5GIO7i8ajckgN+TFij
   TYBznQjJxACpyNQ6iDmtcP5hf1fNCxPPoI4kRlGdABtDjXA1qaZuaO37i
   fRh6v7kRkWLn/VWzyzDud8hfm6immgGCOGB/773Zz5Z+Szgd+Fbe+HEiv
   A==;
X-CSE-ConnectionGUID: t8bHNNB+QhGXLhCS3jyRWw==
X-CSE-MsgGUID: agHEh1SFSF6wn51qDnddpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32337627"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32337627"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 06:07:00 -0700
X-CSE-ConnectionGUID: eG8Fty52QVePohlrc/Yh5g==
X-CSE-MsgGUID: 4C2ge3utQV65Yn4G1hOv3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="78151110"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 17 Oct 2024 06:06:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 99504256; Thu, 17 Oct 2024 16:06:43 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 0/8] usb: xhci: various xhci cleanups and improvements
Date: Thu, 17 Oct 2024 16:05:00 +0300
Message-ID: <20241017130508.1293021-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here's a handful cleanups and improvements for the xHCI driver.

Niklas Neronin (8):
  usb: xhci: simplify TDs start and end naming scheme in struct
    'xhci_td'
  usb: xhci: move link TRB quirk to xhci_gen_setup()
  usb: xhci: request MSI/-X according to requested amount
  usb: xhci: improve xhci_clear_command_ring()
  usb: xhci: remove unused arguments from td_to_noop()
  usb: xhci: refactor xhci_td_cleanup() to return void
  usb: xhci: add help function xhci_dequeue_td()
  usb: xhci: remove irrelevant comment

 drivers/usb/host/xhci-mem.c  |   5 --
 drivers/usb/host/xhci-pci.c  |  11 +--
 drivers/usb/host/xhci-ring.c | 153 +++++++++++++++++------------------
 drivers/usb/host/xhci.c      |  20 ++---
 drivers/usb/host/xhci.h      |   6 +-
 5 files changed, 88 insertions(+), 107 deletions(-)

-- 
2.45.2


