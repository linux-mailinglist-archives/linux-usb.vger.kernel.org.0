Return-Path: <linux-usb+bounces-7319-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F6186C678
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 11:11:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38C3AB295C3
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 10:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A850263502;
	Thu, 29 Feb 2024 10:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UpL6FC5D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B5762808
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 10:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709201475; cv=none; b=cbb/+bXOH45t94UaWqWAIzlSQQSK9xujGQ13Un6P0zyMUhnxHMYC8MXRN4Ar0CH7C49I5ndDAPRLcKhZZefyClyZEb4uttQiH3X3yBkNoQyjldyywGkl93we5S/bG0ExhDgo1SgVBNC/lLEg42ChwK7ODjax7n3SPIQ60dyQt+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709201475; c=relaxed/simple;
	bh=Y7y+SnjBaQbQ0uSFdsPklKW0GFIdSZlEr9wRl/1mTiI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h7/VhMdp30hh/zyEoSgc28vnkeCjdLLG+HiGHHYk5CYin+SIPbv+8mFwhyCmWOX7Eq4w+a3AY/VhbTx4W4fh3mlOK5wpsvTToYWnyxPXeE9/fUUCmHqr+iVHksnbxIfUtlVvsXkJlPijdzEwxNJyKtSK5/eoyr121n4jqFgc5vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UpL6FC5D; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709201473; x=1740737473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y7y+SnjBaQbQ0uSFdsPklKW0GFIdSZlEr9wRl/1mTiI=;
  b=UpL6FC5D9LICBRsVRhUgfqS4VRJkZALpQV6/doAYjWyZCuXsLuEH0DAX
   qsZ53TNf0I0gYPRQfShj8OenYrUB7J3Qy6sJyWxmrvQ/OoUEQA5avg+Yw
   uXe6lKQ8RLCI58k2Qiu84x4ggHAjiL5pvYonlKKTBZbmADGKCTyXHzYMe
   RHHiy6zsgC4C6L6W0BZvtVCGMW4ilb//nLvRmnTIO+MFt2H6RINCeN8e0
   8tHiLgIG/p96FVCCHfYA5WUkUvK9xOtEhCyJpojZ4BkbdD7TApPCSlwM+
   e7EgD50YJx+lN5mBMUzS/77LtZJyb91PDrcKwBQazpMPKgeL9tV7q9YMj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="21203789"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="21203789"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 02:11:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="937035571"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="937035571"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 29 Feb 2024 02:11:10 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 257A023A; Thu, 29 Feb 2024 12:11:09 +0200 (EET)
Date: Thu, 29 Feb 2024 12:11:09 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt changes for v6.9 merge window
Message-ID: <20240229101109.GG8454@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

[Sending this one early as I will be out-of-office next week.]

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.9-rc1

for you to fetch changes up to b8a730836c6b1788ca2fbd6bcc2ac99e97ef7de9:

  thunderbolt: Constify the struct device_type usage (2024-02-26 09:15:49 +0200)

----------------------------------------------------------------
thunderbolt: Changes for v6.9 merge window

This includes following USB4/Thunderbolt changes for the v6.9 merge
window:

  - Reset the topology also for USB4 v1 routers on driver load
  - DisplayPort tunneling and bandwidth allocation mode improvements
  - Tracepoint support for the control channel
  - Couple of minor fixes and cleanups.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Christophe JAILLET (1):
      thunderbolt: Remove usage of the deprecated ida_simple_xx() API

Gil Fine (3):
      thunderbolt: Calculate DisplayPort tunnel bandwidth after DPRX capabilities read
      thunderbolt: Improve DisplayPort tunnel setup process to be more robust
      thunderbolt: Add trace events support for the control channel

Mika Westerberg (12):
      thunderbolt: Reset only non-USB4 host routers in resume
      thunderbolt: Skip discovery also in USB4 v2 host
      thunderbolt: Correct typo in host_reset parameter
      thunderbolt: Use DP_LOCAL_CAP for maximum bandwidth calculation
      thunderbolt: Re-calculate estimated bandwidth when allocation mode is enabled
      thunderbolt: Handle bandwidth allocation mode disable request
      thunderbolt: Log an error if DPTX request is not cleared
      thunderbolt: Fail the failed bandwidth request properly
      thunderbolt: Re-order bandwidth group functions
      thunderbolt: Introduce tb_tunnel_direction_downstream()
      thunderbolt: Reserve released DisplayPort bandwidth for a group for 10 seconds
      thunderbolt: Keep the domain powered when USB4 port is in redrive mode

Mohammad Rahimi (2):
      thunderbolt: Fix XDomain rx_lanes_show and tx_lanes_show
      thunderbolt: Fix rollback in tb_port_lane_bonding_enable() for lane 1

Ricardo B. Marliere (1):
      thunderbolt: Constify the struct device_type usage

Sanath S (4):
      thunderbolt: Introduce tb_port_reset()
      thunderbolt: Introduce tb_path_deactivate_hop()
      thunderbolt: Make tb_switch_reset() support Thunderbolt 2, 3 and USB4 routers
      thunderbolt: Reset topology created by the boot firmware

 drivers/thunderbolt/Makefile    |   1 +
 drivers/thunderbolt/ctl.c       |  19 +-
 drivers/thunderbolt/ctl.h       |   4 +-
 drivers/thunderbolt/domain.c    |  19 +-
 drivers/thunderbolt/icm.c       |   2 +-
 drivers/thunderbolt/lc.c        |  45 ++
 drivers/thunderbolt/nhi.c       |  11 +-
 drivers/thunderbolt/nvm.c       |   4 +-
 drivers/thunderbolt/path.c      |  13 +
 drivers/thunderbolt/quirks.c    |  14 +
 drivers/thunderbolt/retimer.c   |   2 +-
 drivers/thunderbolt/switch.c    | 140 +++++-
 drivers/thunderbolt/tb.c        | 986 +++++++++++++++++++++++++---------------
 drivers/thunderbolt/tb.h        |  29 +-
 drivers/thunderbolt/tb_regs.h   |   6 +
 drivers/thunderbolt/trace.h     | 188 ++++++++
 drivers/thunderbolt/tunnel.c    |  96 ++--
 drivers/thunderbolt/tunnel.h    |   6 +
 drivers/thunderbolt/usb4.c      |  43 +-
 drivers/thunderbolt/usb4_port.c |   2 +-
 drivers/thunderbolt/xdomain.c   |  16 +-
 include/linux/thunderbolt.h     |   4 +-
 22 files changed, 1161 insertions(+), 489 deletions(-)
 create mode 100644 drivers/thunderbolt/trace.h

