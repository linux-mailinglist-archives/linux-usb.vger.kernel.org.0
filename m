Return-Path: <linux-usb+bounces-19327-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C86ADA10444
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 11:34:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4AD33A32CF
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 10:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CAB1ADC63;
	Tue, 14 Jan 2025 10:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zbw2A6zl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1DC229612
	for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 10:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736850872; cv=none; b=CYwqSPJxAkgnhY+oXzxbAj8GsVILf9EVfJHON90gsUKvNw0yBJxT3sCDbYdASFNEWBXycNwQIHnojRs5pPQgyo1sAbwKkIe7pBVvYDKDGXz8QesN0IpXSAwyRRHtEUifNiNOe/uYtNRlFccfHiMsTSKwHKhWCb6HCT31dClM/3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736850872; c=relaxed/simple;
	bh=gvcjmYCpVzqcC8PZWnOJ8Uv00PC/l77vl/UYf5HqIXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gWINYHNVqPUvr4lCDCGVRcDIRszYKJPNGoFnI8X6anFVzvs7kyqIAVfwp/JMRMx3rLnj91nuqAa01PVdyCFxSoJ8pEd0kI2sEBMbFOeG3IDy4XTJ3WZQJZjIkh4iIqsjBpXHnzAlu4gBhXxmW1fQZjKqbRs94bl8aiR/r+LITjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zbw2A6zl; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736850871; x=1768386871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gvcjmYCpVzqcC8PZWnOJ8Uv00PC/l77vl/UYf5HqIXg=;
  b=Zbw2A6zlxQe4CvxPfyf/V2SQK8Dt5zUYoykMpzS1kIMN+QwEEYmx4VPs
   ZBloEGSpW5rTu/AzhwvedZXW0Zm5iTAzSnmB+MOU+wRkJ+G0WnJWNBwSu
   mn0SKPBQEjizTcHKgnVTZmA8sGBZUyyI1ez3BbftQTi/dHgZzs2shh6sj
   bhc0e3dX5mjE/HaC95RDd15xMqG0YgrQOwAvs5EA/0JKQuSB4MrtTNs4R
   LblRaoepQQkUhMtqj6Jk6SYly0ieYFWBq5KnCc86LUO3uFBDERJJHfTM1
   VB9fMgP0h+meom9yDFrUEIIDwBOGJ3DmeRrpTeg8mVu7Qa9DqV07BZH3U
   g==;
X-CSE-ConnectionGUID: cF300tZeRYSbPkfgmffG4A==
X-CSE-MsgGUID: +YCf2zciQJiKYGThY2B3cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="47628991"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="47628991"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 02:34:30 -0800
X-CSE-ConnectionGUID: MU48/PeuSYK/nNOHwByn6Q==
X-CSE-MsgGUID: cHnEsz02QFGMBh5zF/6UVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="104521721"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 14 Jan 2025 02:32:45 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 076D239C; Tue, 14 Jan 2025 12:32:42 +0200 (EET)
Date: Tue, 14 Jan 2025 12:32:42 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt changes for v6.14 merge window
Message-ID: <20250114103242.GM3713119@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit 4bbf9020becbfd8fc2c3da790855b7042fad455b:

  Linux 6.13-rc4 (2024-12-22 13:22:21 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.14-rc1

for you to fetch changes up to 43d84701d2aa147eab39b529919ffaf35f724bbb:

  thunderbolt: Expose router DROM through debugfs (2025-01-05 10:35:03 +0200)

----------------------------------------------------------------
thunderbolt: Changes for v6.14 merge window

This includes following USB4/Thunderbolt changes for the v6.14 merge
window:

  - Add debugfs write capability to path config spaces.
  - Expose router DROM through debugfs.
  - Increase DPRX capabilities read timeout to support runtime
    suspending of graphics driver.
  - Handle DisplayPort tunnel activation asynchronously.
  - Small cleanups.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Gil Fine (1):
      thunderbolt: debugfs: Add write capability to path config space

Mika Westerberg (13):
      thunderbolt: Drop doubled empty line from ctl.h
      thunderbolt: Log config space when invalid config space reply is received
      thunderbolt: Debug log an invalid config space reply just once
      thunderbolt: Increase DPRX capabilities read timeout
      thunderbolt: Make tb_tunnel_one_dp() return void
      thunderbolt: Show path name in debug log when path is deactivated
      thunderbolt: Rework how tunnel->[init|deinit] hooks are called
      thunderbolt: Drop tb_tunnel_restart()
      thunderbolt: Pass reason to tb_dp_resource_unavailable()
      thunderbolt: Move forward declarations in one place
      thunderbolt: Rework tb_tunnel_consumed_bandwidth()
      thunderbolt: Handle DisplayPort tunnel activation asynchronously
      thunderbolt: Expose router DROM through debugfs

 drivers/thunderbolt/ctl.c     |  11 +-
 drivers/thunderbolt/ctl.h     |   1 -
 drivers/thunderbolt/debugfs.c |  67 +++++--
 drivers/thunderbolt/eeprom.c  |  78 ++++----
 drivers/thunderbolt/path.c    |   4 +-
 drivers/thunderbolt/tb.c      | 196 ++++++++++++++------
 drivers/thunderbolt/tb.h      |   5 +
 drivers/thunderbolt/test.c    |  90 +++++-----
 drivers/thunderbolt/tunnel.c  | 406 ++++++++++++++++++++++++++----------------
 drivers/thunderbolt/tunnel.h  |  61 ++++++-
 10 files changed, 600 insertions(+), 319 deletions(-)

