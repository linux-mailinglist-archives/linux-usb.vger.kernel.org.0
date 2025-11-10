Return-Path: <linux-usb+bounces-30265-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16875C4698E
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 13:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D10D01883A83
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 12:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC2730DD35;
	Mon, 10 Nov 2025 12:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Le2C7bRt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F52308F3A
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 12:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762777855; cv=none; b=Jj/gJfks6gI5nTQ4cxSAJBklraEtuaZB1uEGZrNOMm3Yk+8mxLwah3gRakHWSpVZLQKf6kLrGjinGEHq91VM/9yT9jlcCXf1jFrVytzUfaOrhH/B6KLFRf5f0TAc8sDvxOOD2YMKsiLI2GsGn120Yo38Ty6jz3eKS+n74MYJHu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762777855; c=relaxed/simple;
	bh=ForqPyEx/2HenZsU4ygK6pTDsM161D2VSBmU9eR8ZSo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kCAEr/Q9+OkvQ4dMusA50+2Y2VPFxu4tqxo9hZUNjyVkZAdn0zORkPnkrgU2yiAtmG0Og9Z/RNcbBtWVDF13SPPR30J3fS3dWdo4ul3wYOnrmPCBDTNpFNJ5PoC4c8UYJbNaiPTxF05pAszWq8fPwvR7Y00d6LmFlpjQdgBY5sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Le2C7bRt; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762777854; x=1794313854;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ForqPyEx/2HenZsU4ygK6pTDsM161D2VSBmU9eR8ZSo=;
  b=Le2C7bRtYOsxIMf32/Q5fvL4wz1Iz0muC+JS5SUSnXy9e0H5EzZ1aGsH
   Cgw90NX0n2s2RkxpTd4FshzqeveN4A9cpXHpvOLkKxCB8uo8wQ3kJUbMp
   6Y0evIPxFDds8O3eiwn6Oo6mu2NmCxMw8xwn9v/zEO5W4gJDTnMQEuz/O
   GtKifBJCeEultJqqJTRbWFBZPFEMLMqTB5xRgqKfFqeBRIjDUMUNaHI9/
   zQ7zk1hgnfjCrjMcrC3m8P42RdRpN5fy8WdsBjpkD1KCdlXZChjPtuVi4
   3pK6u+GablpVL5OnXTIjmYHwZE+oV/L6SJdU9Mme/bJaExRhOmtDohg//
   w==;
X-CSE-ConnectionGUID: 8gssEX52RMueqTC1vcVyLA==
X-CSE-MsgGUID: 6Ai3BPclT6Ok1/FCo3KLqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64866247"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="64866247"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 04:30:53 -0800
X-CSE-ConnectionGUID: l+7bZafkQk2jpJY+PU+Ucw==
X-CSE-MsgGUID: muBL1Ua5S8uFJgfHLdVQOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="192922117"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 10 Nov 2025 04:30:50 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 7BA9695; Mon, 10 Nov 2025 13:30:50 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 00/16] thunderbolt: Fix typos in the driver
Date: Mon, 10 Nov 2025 13:30:34 +0100
Message-ID: <20251110123050.3959188-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series from Alan and Rene fixes typos found all around in the driver.
No functional changes intended.

Alan Borzeszkowski (15):
  thunderbolt: Fix typos in ctl.c
  thunderbolt: Fix typos in debugfs.c
  thunderbolt: Fix typos in domain.c
  thunderbolt: Fix typos in icm.c
  thunderbolt: Fix typos in lc.c
  thunderbolt: Fix typos in nhi.c
  thunderbolt: Fix typos in retimer.c
  thunderbolt: Fix typos in switch.c
  thunderbolt: Fix typos in tb.c
  thunderbolt: Fix typos in tb.h
  thunderbolt: Fix typos in tb_regs.h
  thunderbolt: Fix typos in tmu.c
  thunderbolt: Fix typos in tunnel.c
  thunderbolt: Fix typos in usb4.c
  thunderbolt: Fix typos in xdomain.c

Rene Sapiens (1):
  thunderbolt: Fix typos in eeprom.c

 drivers/thunderbolt/ctl.c     |  2 +-
 drivers/thunderbolt/debugfs.c |  4 ++--
 drivers/thunderbolt/domain.c  |  2 +-
 drivers/thunderbolt/eeprom.c  |  2 +-
 drivers/thunderbolt/icm.c     |  6 +++---
 drivers/thunderbolt/lc.c      |  2 +-
 drivers/thunderbolt/nhi.c     |  2 +-
 drivers/thunderbolt/retimer.c |  2 +-
 drivers/thunderbolt/switch.c  |  6 +++---
 drivers/thunderbolt/tb.c      | 14 +++++++-------
 drivers/thunderbolt/tb.h      | 14 +++++++-------
 drivers/thunderbolt/tb_regs.h |  6 +++---
 drivers/thunderbolt/tmu.c     |  4 ++--
 drivers/thunderbolt/tunnel.c  | 14 +++++++-------
 drivers/thunderbolt/usb4.c    | 26 +++++++++++++-------------
 drivers/thunderbolt/xdomain.c |  4 ++--
 16 files changed, 55 insertions(+), 55 deletions(-)

-- 
2.50.1


