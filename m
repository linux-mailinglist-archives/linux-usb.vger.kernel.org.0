Return-Path: <linux-usb+bounces-27722-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D781B4958C
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D1711C208EA
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99FFA30F925;
	Mon,  8 Sep 2025 16:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vv3JA4+z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F27630F93C
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349156; cv=none; b=SjDWYfg/PFLYHzX5ZyT0zHs87vuHcsH6NZ8CowWqce1IguGcBGIzY+X9FfHn497NtY+Mfv7padmtifWedqBmAlnncVsoWAQkDtIgrNAXyPIOJWMwU6CmEK4K4SU9/nh2YiOB8NyyQd5LA5AB4OkUqJX19PZuuQJTl9nHXPf0rkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349156; c=relaxed/simple;
	bh=9Q96o+R44rT7rSMYfGJdXOPELN7ODPO2soevOqQZtW0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pJ1I6XDLeBbjp1tPYnsooFy5MC+HX8wnVzHdemBjRHtB51XZgQQJzp0J2fvWQwVHWheI+IF6LdCZuaukqqfNLUyGQBL09NwNb7+4epBSF+geBA+dJKWOcuRvZTG/CO4COarykZb75X/hKhzPOVOeP/8eKiL4nBkCHLtBxrFg9/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vv3JA4+z; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349153; x=1788885153;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9Q96o+R44rT7rSMYfGJdXOPELN7ODPO2soevOqQZtW0=;
  b=Vv3JA4+zotVFKpkM3BYAIciHBgthQz7/VN1ms+DjLNVZbrLzclViZ2MW
   NkbI9pk9HRmkLDGPU71L0oCHqa8zYh5Pvnmk3wE4J6w6glkacwoIpUZax
   GataYmvVmc65n5IOJTbrlZeyBP0O4szzaiTLDJdAL2nadSQ2tC6u7glEr
   NgSdCkqOq8OdXNkyDA5C0z6YfrpY6uysBDgtDFrBiU/NfHXHVphDWx99x
   2K2unBpEvHcAfN8H/0XVGVLe0FT31ZhuCpB5rR0V5hjAfcHorkE5EUl3r
   MtD4FhVdLkRh5+GGVtDYsm7KwSN0HF0KhCiIXfGckVVii6iLnbl5PaOmy
   A==;
X-CSE-ConnectionGUID: Rh+vw/6JREqETY99+jtu/g==
X-CSE-MsgGUID: SToVF6sKRzilyToukk0YtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63443037"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63443037"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:32 -0700
X-CSE-ConnectionGUID: 3WX5PrboSNOX1jN0Fbhp4A==
X-CSE-MsgGUID: 4lZk2viaSJW9iv6+mfjRPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="173291147"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2025 09:32:31 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id C555894; Mon, 08 Sep 2025 18:32:30 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 00/26] thunderbolt: kernel-doc fixes
Date: Mon,  8 Sep 2025 18:32:04 +0200
Message-ID: <20250908163230.2614397-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,                                                                                             
                                                                                                    
This series fixes kernel-docs in the Thunderbolt/USB4 subsystem to adhere
the current standards.

All errors/warnings in documentation were found by kernel-doc script and
were subsequently fixed. Main recurring complaint was incorrect or missing
"Return: " section in kernel-doc comments. Besides that, few missing
parameters and structure field descriptions.                                                        

No functional changes.

This series was suggested by Andy Shevchenko.

Alan Borzeszkowski (26):
  thunderbolt: Update acpi.c function documentation
  thunderbolt: Update cap.c function documentation
  thunderbolt: Update clx.c function documentation
  thunderbolt: Update ctl.c function documentation
  thunderbolt: Add missing documentation in ctl.h tb_cfg_request struct
  thunderbolt: Update dma_port.c function documentation
  thunderbolt: Update domain.c function documentation
  thunderbolt: Update eeprom.c function documentation
  thunderbolt: Update lc.c function documentation
  thunderbolt: Update nhi.c function documentation
  thunderbolt: Add missing documentation in nhi_regs.h ring_desc structure
  thunderbolt: Update nvm.c function documentation
  thunderbolt: Update path.c function documentation
  thunderbolt: Update property.c function documentation
  thunderbolt: Update retimer.c function documentation
  thunderbolt: Update switch.c function documentation
  thunderbolt: Update tb.c function documentation
  thunderbolt: Update tb.h function documentation
  thunderbolt: Add missing documentation in tb.h
  thunderbolt: Update tmu.c function documentation
  thunderbolt: Update tunnel.c function documentation
  thunderbolt: Update tunnel.h function documentation
  thunderbolt: Update usb4.c function documentation
  thunderbolt: Update usb4_port.c function documentation
  thunderbolt: Update xdomain.c function documentation
  thunderbolt: Update thunderbolt.h header file

 drivers/thunderbolt/acpi.c      |  28 +--
 drivers/thunderbolt/cap.c       |  49 +++--
 drivers/thunderbolt/clx.c       |  12 +-
 drivers/thunderbolt/ctl.c       |  33 +++-
 drivers/thunderbolt/ctl.h       |   1 +
 drivers/thunderbolt/dma_port.c  |  21 +-
 drivers/thunderbolt/domain.c    |  28 ++-
 drivers/thunderbolt/eeprom.c    |   4 +-
 drivers/thunderbolt/lc.c        |  58 ++++--
 drivers/thunderbolt/nhi.c       |  17 +-
 drivers/thunderbolt/nhi_regs.h  |   6 +
 drivers/thunderbolt/nvm.c       |  42 ++--
 drivers/thunderbolt/path.c      |  14 +-
 drivers/thunderbolt/property.c  |  38 +++-
 drivers/thunderbolt/retimer.c   |   7 +-
 drivers/thunderbolt/switch.c    | 140 ++++++++++----
 drivers/thunderbolt/tb.c        |  30 +--
 drivers/thunderbolt/tb.h        |  45 +++--
 drivers/thunderbolt/tmu.c       |  16 +-
 drivers/thunderbolt/tunnel.c    |  85 +++++---
 drivers/thunderbolt/tunnel.h    |   9 +-
 drivers/thunderbolt/usb4.c      | 333 ++++++++++++++++++++++----------
 drivers/thunderbolt/usb4_port.c |   7 +-
 drivers/thunderbolt/xdomain.c   |  46 +++--
 include/linux/thunderbolt.h     |  25 +--
 25 files changed, 749 insertions(+), 345 deletions(-)

-- 
2.50.1


