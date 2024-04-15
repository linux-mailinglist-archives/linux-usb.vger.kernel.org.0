Return-Path: <linux-usb+bounces-9329-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9908A47EC
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 08:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E44EA1C21B23
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 06:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B457CEEB3;
	Mon, 15 Apr 2024 06:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8ThamAn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1782AC138
	for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2024 06:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713161874; cv=none; b=Wdkehl/7TnumlsEe4UsbAXP7CZer6+mMQI218TlOMkHtn5UVQI52HEdAjNl6r0jnBrP/znmGb/LZb9jsT2HhXF/i3/R3pTO3JQ0RAAoEGecfXjM5SS4VHRHAox88AFkHgzqfLCl1VqaYggOderCALxouf3m7ayc4Ig+ead0P0A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713161874; c=relaxed/simple;
	bh=/h9hgYdLiHi/diEPMNO/UWsGyoSk4z7v9A/W4/BHOr0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c/t8MukNA24Rof94Kv4YF6DbZVv14vnbP+agRkM0GeRiOk2hgAz/g8q+AXJfd2dKi82UQ/j1TSg9xlvXWI6ce5ddnM25nfBZopH4c+EzvpidJtTjfh7Tdil80zQ1BDvyamOUCnxhQWIZGPVjW9eaJye7DoDxdOw91phe9MfsZfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8ThamAn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713161874; x=1744697874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/h9hgYdLiHi/diEPMNO/UWsGyoSk4z7v9A/W4/BHOr0=;
  b=X8ThamAnDfpabcWLz/GaONEW+oQMsh50xUQnWzEgc/jfwjUh2mfzDwMd
   Mc1/JbIbAcAinMtlpczkZQMKC+npG9Si8sYRjZNwfenBclWwEtqYK+WFP
   sITC+jYACSeE1+g8Ith39xeg3MspnXdWHPZLAfyhd8fsiiCloRH+Og6lU
   kuMeI21CVNtcbFwb8m7BdoyyApDBLmpLsqb8RmhBVP0CaWAG0yuK/KP6h
   AHJg8cYxv1feE0rF9JOQMc1RJoBVrL0/drj3wIJthBlZ5hR5NCMjsRf2Y
   kF+x0RHZI7y9eOBLGbJe8LH8JeUXjbRSdYbBR+5p1qW26ZAsX7EtR6Nly
   g==;
X-CSE-ConnectionGUID: +C6B90W3TJKgEbs6imchYg==
X-CSE-MsgGUID: aIv6HRPgS+eVzdXwuaUNdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8400340"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="8400340"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 23:17:53 -0700
X-CSE-ConnectionGUID: Ui/san02R2u38xdfrjS1bg==
X-CSE-MsgGUID: iBfqZRL+RXeiGMqGVM8ldA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="21799093"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 14 Apr 2024 23:17:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 33F1D3A6; Mon, 15 Apr 2024 09:17:49 +0300 (EEST)
Date: Mon, 15 Apr 2024 09:17:49 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt fixes for v6.9-rc5
Message-ID: <20240415061749.GF112498@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit 39cd87c4eb2b893354f3b850f916353f2658ae6f:

  Linux 6.9-rc2 (2024-03-31 14:32:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.9-rc5

for you to fetch changes up to dcd12acaf384c30437fa5a9a1f71df06fc9835fd:

  thunderbolt: Avoid notify PM core about runtime PM resume (2024-04-10 10:49:58 +0300)

----------------------------------------------------------------
thunderbolt: Fixes for v6.9-rc5

This includes following USB4/Thunderbolt fixes for v6.9-rc5:

  - Avoid creating DisplayPort tunnels for the adapters on the same router
  - Correct wake configurations after device router unplug
  - Fix immediate wake when "wakeup_count" is used to enter system sleep.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Gil Fine (2):
      thunderbolt: Fix wake configurations after device unplug
      thunderbolt: Avoid notify PM core about runtime PM resume

Mika Westerberg (1):
      thunderbolt: Do not create DisplayPort tunnels on adapters of the same router

 drivers/thunderbolt/switch.c | 48 +++++++++++++++++++++++++++++++++++---------
 drivers/thunderbolt/tb.c     | 10 +++++++--
 drivers/thunderbolt/tb.h     |  3 ++-
 drivers/thunderbolt/usb4.c   | 13 ++++++------
 4 files changed, 56 insertions(+), 18 deletions(-)

