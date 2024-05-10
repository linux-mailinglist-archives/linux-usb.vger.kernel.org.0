Return-Path: <linux-usb+bounces-10186-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFE28C1D8C
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 07:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C112E1C2163B
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 05:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E2111607B2;
	Fri, 10 May 2024 05:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GnABJ73M"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69865161339
	for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 05:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715317539; cv=none; b=IULpCnlFi8StL9K637G477nj23a9H18ZPUX6oxZedGvuu4LwglxLIxxzLMBMwzqm0HvWi8JtpF0d834HCRmJcsIOPX8BBrHL4PunHM+Ur0hanvAqOds2ANPwhL+XunmbqxmqUII1UDDzfpeaB7Y52X/fuuAvGUb/mooKPQQ/hak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715317539; c=relaxed/simple;
	bh=hSguh/K0OYtkRAtNYazMNQd4I56yGzK+gFbfpJGhOHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GWQARwf0uWI4nYS+m3LmHWIbwHwJ2xzyhCrgKuBYbv2CElY/HjDuUrl0pN0aqQ+khFfiue/I1ShnNn1waoT5gcEq8Pcgr35qBPEvJdOE8G0AAfASlGdi9r3jHsfvEuaWrYilJUx0QE0J6pNnuxjLqudVnXM3ZjyxP2HuuD7XQ8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GnABJ73M; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715317528; x=1746853528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hSguh/K0OYtkRAtNYazMNQd4I56yGzK+gFbfpJGhOHw=;
  b=GnABJ73MonfhyxpuJrwcOpl1hKxxOU9eE72q1GJplcs2qYsOYO5GHZlK
   j9beVVs1XzowhRrTra1J1cZVIpLs/yUbKJp2vwkp13CCcug+byAWclW4q
   To0SB1He/FT+vjijYu7MX1emOAELdKyvUxrvDzv1nDidwMwvRoXlwT+2n
   kEDm08uvbiq+Wb2jLyzVOZlqf5FxPuvHyTUaVTSfHUH5VUgjZXoU+BeZQ
   eYBCo3EOXjh8fo87i2CLu96CBJoK3gCSWBfWkxmw+Dv6tjCp91oqrIRxV
   O5iEvU6JRIGjOvWLTa7EMZpfAG3lcTwdJqlkrs4gelFwbslAni9ZoybF7
   g==;
X-CSE-ConnectionGUID: jkmsqP8eR9O8AZoopwmN+Q==
X-CSE-MsgGUID: Hog49/yjRVi6dojDqBDsqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="36659100"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="36659100"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 22:05:27 -0700
X-CSE-ConnectionGUID: xRX9PLc8R/iNEWHepqIKEw==
X-CSE-MsgGUID: HWaLRfUMT/mubciI8KbUbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="66939419"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 09 May 2024 22:05:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 62E2415C; Fri, 10 May 2024 08:05:24 +0300 (EEST)
Date: Fri, 10 May 2024 08:05:24 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt changes for v6.10 merge window
Message-ID: <20240510050524.GB4162345@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit fec50db7033ea478773b159e0e2efb135270e3b7:

  Linux 6.9-rc3 (2024-04-07 13:22:46 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.10-rc1

for you to fetch changes up to a3dc6d82de9bd88871dbc4ac511409e69ecacbfb:

  thunderbolt: Correct trace output of firmware connection manager packets (2024-04-29 07:47:54 +0300)

----------------------------------------------------------------
thunderbolt: Changes for v6.10 merge window

This includes following USB4/Thunderbolt changes for the v6.10 merge
window:

  - Enable NVM firmare upgrade on Intel Maple Ridge Thunderbolt 4
    controller
  - Improve USB3 tunnel bandwidth calculation
  - Improve sideband access
  - Minor cleanups and fixes.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Alex James (1):
      thunderbolt: Enable NVM upgrade support on Intel Maple Ridge

Gil Fine (4):
      thunderbolt: Fix calculation of consumed USB3 bandwidth on a path
      thunderbolt: Allow USB3 bandwidth to be lower than maximum supported
      thunderbolt: Fix uninitialized variable in tb_tunnel_alloc_usb3()
      thunderbolt: Fix kernel-doc for tb_tunnel_alloc_dp()

Mika Westerberg (6):
      thunderbolt: Use correct error code with ERROR_NOT_SUPPORTED
      thunderbolt: Get rid of TB_CFG_PKG_PREPARE_TO_SLEEP
      thunderbolt: Increase sideband access polling delay
      thunderbolt: No need to loop over all retimers if access fails
      thunderbolt: There are only 5 basic router registers in pre-USB4 routers
      thunderbolt: Correct trace output of firmware connection manager packets

 drivers/thunderbolt/debugfs.c |  2 +-
 drivers/thunderbolt/icm.c     |  1 +
 drivers/thunderbolt/retimer.c | 12 ++++++++----
 drivers/thunderbolt/tb.c      |  9 +++++----
 drivers/thunderbolt/tb_msgs.h |  6 ------
 drivers/thunderbolt/trace.h   | 13 +++++++++++--
 drivers/thunderbolt/tunnel.c  | 39 +++++++++++++++++----------------------
 drivers/thunderbolt/usb4.c    | 22 +++++++++++++++-------
 drivers/thunderbolt/xdomain.c |  2 +-
 include/linux/thunderbolt.h   |  1 -
 10 files changed, 59 insertions(+), 48 deletions(-)

