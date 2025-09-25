Return-Path: <linux-usb+bounces-28671-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8F1B9E7E5
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 11:49:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60EE21885382
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 09:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C95D1805E;
	Thu, 25 Sep 2025 09:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FE/Om/Ry"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C720921A92F
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 09:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758793756; cv=none; b=suLzJoNbLjocOmoZ1suNLTqiqop5DzlIY5uYrhgk+5rho9UJ5aYMkEqOo7PpfQSvXg4SAK23r4kf5MdQTUi+yHlyFsid/gXKkdM6O75IIorSR5HGiHrukWA0IvNALvid8FFDnhSOqLnpTXenAmbqW3J3YPJ0yKEP3iTW1tDVExU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758793756; c=relaxed/simple;
	bh=F4Jg2DWTIACopqd8kCyx3jRIgc00Ie90IQdMYe6cMT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=efo7ZlXyJCT6/oOqJnV9RUvfjSj5A7svndvoYLQ65Jly0s0r/ew7gcN+vxE27o+FrnqTqbHAYYgjq1xX8c+dvlJa4YNapN0svYrSjerrC3aX+JhafAGyKuUq/L2o+fRSIf40GtVf+tLhnY6KZMWD3ec2/mdKZBVTdgL1MbK31w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FE/Om/Ry; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758793755; x=1790329755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F4Jg2DWTIACopqd8kCyx3jRIgc00Ie90IQdMYe6cMT0=;
  b=FE/Om/RyCylqGEZGpNGukMj4X2q8pB6cFWgxEQqkY63WGt45ulskXQxj
   Gx2K71wFdLdUD5PeYPFnejqso+PIo0fIUwH/rC4XDOwQzM8GaeIMTGihX
   m7ItObxR7yB/kLTCZZvtzaFzHbqBQQSV+1bPYjfSn4aKsG5otKAGiI83V
   hVvZLdv7UdNrUzHc+vR5PHdLApnttLNiBvYOU+FLut/NAyOPRkzMHER/I
   +71zPmnBjhDkCHdNVikgzgxdS5ZziyhkhFayWeYN94wfZUnVFtrDWQF2/
   vKCrykoAzCAEHTfbqvnr3R/PZK9gETkGoh4nlREgIozOlHbSFlsewIXdt
   w==;
X-CSE-ConnectionGUID: NHM4AnkxR/6cK/dZPGsgGA==
X-CSE-MsgGUID: DAuzk00BSW+hVfK4v66FKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="61214803"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="61214803"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 02:49:14 -0700
X-CSE-ConnectionGUID: T9equMY6RTSl1mEeqijusg==
X-CSE-MsgGUID: Auf+229iQ3+asr0+91J2oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="177126935"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 25 Sep 2025 02:49:12 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id BF8FA95; Thu, 25 Sep 2025 11:49:10 +0200 (CEST)
Date: Thu, 25 Sep 2025 11:49:10 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt changes for v6.18 merge window
Message-ID: <20250925094910.GG2912318@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.18-rc1

for you to fetch changes up to 67600ccfc4f38ebd331b9332ac94717bfbc87ea7:

  thunderbolt: Fix use-after-free in tb_dp_dprx_work (2025-09-23 17:16:38 +0200)

----------------------------------------------------------------
thunderbolt: Changes for v6.18 merge window

This includes following USB4/Thunderbolt changes for the v6.18 merge
window:

  - HMAC hashing improvements
  - Switch to use Linux Foundation IDs for XDomain discovery
  - Use is_pciehp instead of is_hotplug_bridge
  - Fixes for various kernel-doc issues
  - Fix use-after-free in DP tunneling error path.

I'm sending the UAF fix with this pull request because it came quite
late and I would like to give it some exposure before it lands the
mainline.

All these except the UAF fix have been in linux-next with no reported
issues.

----------------------------------------------------------------
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

Chelsy Ratnawat (1):
      thunderbolt: Use string choices helpers

Duoming Zhou (1):
      thunderbolt: Fix use-after-free in tb_dp_dprx_work

Eric Biggers (2):
      thunderbolt: Compare HMAC values in constant time
      thunderbolt: Use HMAC-SHA256 library instead of crypto_shash

Lukas Wunner (1):
      thunderbolt: Use is_pciehp instead of is_hotplug_bridge

Mika Westerberg (2):
      thunderbolt: Use Linux Foundation IDs for XDomain discovery
      MAINTAINERS: Update Michael Jamet's maintainer entries

 CREDITS                         |   5 +
 MAINTAINERS                     |   2 -
 drivers/pci/quirks.c            |   2 +-
 drivers/thunderbolt/Kconfig     |   4 +-
 drivers/thunderbolt/acpi.c      |  28 ++--
 drivers/thunderbolt/cap.c       |  49 +++---
 drivers/thunderbolt/clx.c       |  12 +-
 drivers/thunderbolt/ctl.c       |  33 +++-
 drivers/thunderbolt/ctl.h       |   1 +
 drivers/thunderbolt/debugfs.c   |   3 +-
 drivers/thunderbolt/dma_port.c  |  21 ++-
 drivers/thunderbolt/domain.c    |  73 +++------
 drivers/thunderbolt/eeprom.c    |   4 +-
 drivers/thunderbolt/lc.c        |  58 +++++--
 drivers/thunderbolt/nhi.c       |  20 ++-
 drivers/thunderbolt/nhi_regs.h  |   6 +
 drivers/thunderbolt/nvm.c       |  42 +++--
 drivers/thunderbolt/path.c      |  14 +-
 drivers/thunderbolt/property.c  |  38 +++--
 drivers/thunderbolt/retimer.c   |   7 +-
 drivers/thunderbolt/switch.c    | 140 +++++++++++-----
 drivers/thunderbolt/tb.c        |  32 ++--
 drivers/thunderbolt/tb.h        |  45 ++++--
 drivers/thunderbolt/tmu.c       |  16 +-
 drivers/thunderbolt/tunnel.c    |  90 +++++++----
 drivers/thunderbolt/tunnel.h    |   9 +-
 drivers/thunderbolt/usb4.c      | 346 +++++++++++++++++++++++++++-------------
 drivers/thunderbolt/usb4_port.c |   7 +-
 drivers/thunderbolt/xdomain.c   |  53 ++++--
 include/linux/thunderbolt.h     |  25 +--
 30 files changed, 782 insertions(+), 403 deletions(-)

