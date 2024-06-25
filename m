Return-Path: <linux-usb+bounces-11618-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40606916490
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 11:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB2B81F221BB
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 09:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75CE14A4FF;
	Tue, 25 Jun 2024 09:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bgwqzpV8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6791114A09F
	for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 09:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719309518; cv=none; b=fASuNHrA1ZNNckK+B1LtM3Q0Xi+hPSVJhmsuabEUI0ggNi/tNLFIGVm/8D/pSojlwPWUVs9gagf5wQSbcIQBuQCfWv+lPZFJmHu+EEMZw+BKOKwkcWFnsfjdDLbA5MmNN/pUxm3O6LI5+QPCDwwTJLMvmAQdK+tW1BvuSDmYQhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719309518; c=relaxed/simple;
	bh=RMWJCm6OgHcy1a3SZSqV0ioLenglU6im2vNBQZOJ6dk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OHqeZS1cd6lMUlbozlwvr31npXqrYCD0IaJN66jRMRCVAdAssM/5fj+6O0hvHZUYXG7HyjH6gdusFuZrOxOyPfmMpirwACZYOnPpoKTD4U6fwhLEMHHlLugvz29PUCULyIYaA4p1AQr0BLkbxfP+Fj5OiTXYkfz5kV5vCE/FTHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bgwqzpV8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719309517; x=1750845517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RMWJCm6OgHcy1a3SZSqV0ioLenglU6im2vNBQZOJ6dk=;
  b=bgwqzpV8jycBwUBAd8sMZq2Yrk8/2TFPoH4XeRUIbpQ7FzumI/gT6HAw
   Mtl5bN9ymSriyUm5dSp+VvA1+koT70ql5TcBQx2D7EgnYowgy+4QVXAMV
   429oYHIX+rdQTaljm5K6bq7srjQFgpovCKdc/mP/CWR2lcXqnJYtQHlfg
   jh36ErTr4qHP47YQSU43k+RmXZFMHYxYNijv1k0nhe9l5Px404hoY7xSC
   GdcerP8ea18yXA3WrN71303tv/6usw+mLz4trzqGZ/U5vtwEvEGV/ypRT
   oGnfz2LlX3XpRtbjo3NmOkguNGrq55ZWqQP39M1RjaSbmxmg/iuKRZYLP
   w==;
X-CSE-ConnectionGUID: zh5WV4WKR+q+A0ZiETwvew==
X-CSE-MsgGUID: 4bZN8/wGTjiINYXY41LrWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16448270"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="16448270"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 02:58:36 -0700
X-CSE-ConnectionGUID: MULa9/yzR5qJxbXsTlTlvw==
X-CSE-MsgGUID: GnISs+rlRN21pmsxzv+mmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="43468264"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 25 Jun 2024 02:58:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id C167C144; Tue, 25 Jun 2024 12:58:32 +0300 (EEST)
Date: Tue, 25 Jun 2024 12:58:32 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt changes for v6.11 merge window
Message-ID: <20240625095832.GT1532424@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

I'm sending this early because my vacation starts after this week. I
hope it is fine for you. Thanks!

The following changes since commit 6ba59ff4227927d3a8530fc2973b80e94b54d58f:

  Linux 6.10-rc4 (2024-06-16 13:40:16 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.11-rc1

for you to fetch changes up to 49056c95df448c1fa870c8688f34e5d1abffb154:

  thunderbolt: debugfs: Use FIELD_GET() (2024-06-19 07:30:20 +0300)

----------------------------------------------------------------
thunderbolt: Changes for v6.11 merge window

This includes following USB4/Thunderbolt changes for the v6.11 merge
window:

  - Add receiver lane margining support for retimers
  - Add sideband register access to debugfs
  - Minor cleanups.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Aapo Vienamo (1):
      thunderbolt: debugfs: Use FIELD_GET()

Mika Westerberg (7):
      thunderbolt: Mention Thunderbolt/USB4 debugging tools in Kconfig
      thunderbolt: Move usb4_port_margining_caps() declaration into correct place
      thunderbolt: Make usb4_port_sb_read/write() available outside of usb4.c
      thunderbolt: Add sideband register access to debugfs
      thunderbolt: Split out margining from USB4 port
      thunderbolt: Make margining functions accept target and retimer index
      thunderbolt: Add receiver lane margining support for retimers

 drivers/thunderbolt/Kconfig   |  17 +-
 drivers/thunderbolt/debugfs.c | 648 +++++++++++++++++++++++++++++++-----------
 drivers/thunderbolt/retimer.c |  53 ++--
 drivers/thunderbolt/sb_regs.h |  18 +-
 drivers/thunderbolt/tb.h      |  45 ++-
 drivers/thunderbolt/usb4.c    | 183 ++++++------
 6 files changed, 669 insertions(+), 295 deletions(-)

