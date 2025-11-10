Return-Path: <linux-usb+bounces-30285-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 515FBC4780A
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 16:24:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C6B83BDC09
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 15:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C150C31960F;
	Mon, 10 Nov 2025 15:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IWZB8pOJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387C5314B85
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 15:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762787699; cv=none; b=Tzli9dgXR1mnsZ6DUFyOcI1Mel6aBI2ytxr6IdeknkqBBCUzjQ80FmEesfdWfOHhpQ0pG0JD5gQe+yrTIJ/nA/i0+MvHqnuyVwKYNkrmD1m9RreyMBh8RRkq5iOHUAeruSZG0SQ4YmKLbzAhbg9yrufukbKlC6YocPcscQfgjEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762787699; c=relaxed/simple;
	bh=ftWM0KeBk+9knWeBLfcoC7qFDRWjV8uno76/UOA6DqY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qyx0hy5qAIiuBhQTupBtZ4RjYJ/+3GXWya0qJmGFUUpqr3OkLpaWaypcz1edjLPmPcNlK+oKtcEgAoplGvpNHdX5rj+Tm8Q3pcVXqNfoM8SKiCSJMOdjz5ERr4ktD704usA2I/qJcw/nyQGGq6R4hTPocDH/uCaEBKI2fKWfGgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IWZB8pOJ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762787697; x=1794323697;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ftWM0KeBk+9knWeBLfcoC7qFDRWjV8uno76/UOA6DqY=;
  b=IWZB8pOJ/5SA/3O2BWToOkWE0zwSDpHlc7GJVAw9LFrJwsyuxi3GAJ0A
   PcjYjpyl8D0OqL5yr+DCoHCGV7LzAFKlRTvqh94Jo7UPnbREduszCuzoB
   cCuel5cOoTyilGpcIpDhTzHuVZ/duMgAc8Gd6BlTPhw7n87jNjjnI7Olb
   tFvTUrd0vweRoZtvSrFhpgnF6BvU4QXVRkxfxA8rTGkK/QdkL7vBIlw68
   jXqAXrrDrOB4vSZRnwQDOjgLuVWxmtnrbwGasxb4VnMDpxvjpSHZHeLlZ
   clgCf31WqEAPom/R9mAQcjEPmEuEdKCzAql48M0O70pLzjjN6H7+MLN5t
   w==;
X-CSE-ConnectionGUID: 4ILX1bEXQsq2I/cz33KBUw==
X-CSE-MsgGUID: B2roreyWTMqdB/e7UsNt4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75448125"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="75448125"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 07:14:57 -0800
X-CSE-ConnectionGUID: M+rr8cnfTeepsMcePLgIjg==
X-CSE-MsgGUID: PPGSbsAxT/yjxXobrGYVTQ==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 10 Nov 2025 07:14:55 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 04A8295; Mon, 10 Nov 2025 16:14:55 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 00/13] usb: xhci: Host Controller Capability Registers rework
Date: Mon, 10 Nov 2025 16:14:37 +0100
Message-ID: <20251110151450.635410-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series focuses on improving the definitions and organization of
the Host Controller Capability Registers macros in the xhci driver.
It is the first step in a larger effort to clean up and restructure the
xhci header files for better readability and maintainability.

Because the Structural Parameters 1 register (part of the HC Capability
Registers) relies heavily on xhci-caps.h, a few related patches from
another ongoing rework have been included here as well. These address the
handling of Max Ports and Max Interrupters values.
The Max Slots handling will follow the same pattern in a future series.
That change is more involved and will be submitted separately.

Niklas Neronin (13):
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
  usb: xhci: standardize multi bit-field macros
  usb: xhci: use 64-bit Addressing Capability macro

 drivers/usb/host/xhci-caps.h    | 188 ++++++++++++++++++--------------
 drivers/usb/host/xhci-debugfs.c |  20 ++--
 drivers/usb/host/xhci-histb.c   |   2 +-
 drivers/usb/host/xhci-hub.c     |  12 +-
 drivers/usb/host/xhci-mem.c     |  41 +++----
 drivers/usb/host/xhci-mtk.c     |   4 +-
 drivers/usb/host/xhci-pci.c     |   6 +-
 drivers/usb/host/xhci-plat.c    |   2 +-
 drivers/usb/host/xhci-ring.c    |  40 ++++---
 drivers/usb/host/xhci-tegra.c   |   5 +-
 drivers/usb/host/xhci-trace.h   |  20 +---
 drivers/usb/host/xhci.c         |  57 +++++-----
 drivers/usb/host/xhci.h         |  16 ++-
 13 files changed, 212 insertions(+), 201 deletions(-)

-- 
2.50.1


