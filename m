Return-Path: <linux-usb+bounces-14883-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACC9972DA0
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 11:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57964B25E17
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 09:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2C8188CB1;
	Tue, 10 Sep 2024 09:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBmzyBAD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFAB1862B8
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 09:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725960495; cv=none; b=L0owsDgVIpTqLIlI0X58shdLyVWMC4mjfCE9isL1DURHPivB1KZEzdAYyQqGgiHj8QiaBuXNVNNl+qEQ6+bypt5oWBx+SmLC2kVDnMQq9Iz7mei6y4Bbdj4jzqZWbpcHPgAuBzK5ws7FFqJdXD9zv8drDFirQHmWgAB783TuMcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725960495; c=relaxed/simple;
	bh=5POnL+1FVOTCRLRnaC+PkRICYa/GiEvbpLbsEtBGx+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UDzR9lpb8HYHSu4Bh4e3SWfAVPSxZi58KSkA/HUm0aGpOAacCMu6JKVXWaFd3Db6vZu4p+fwRfZUddz7NIIwxzYt6v51NO0hVnS80mRThZ1mKyecNWlqplzkcJE/qMsDyGNBafcjAWzrvLFKkoxs3VdRcGoRNBQEBGpB7YSRAiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BBmzyBAD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725960494; x=1757496494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5POnL+1FVOTCRLRnaC+PkRICYa/GiEvbpLbsEtBGx+g=;
  b=BBmzyBAD2LDPlxOrN9obYy9LT8TrpjVvSEln8Ehby7W5k/J5G2GJkH47
   jKaSVY3CtwjAEET4ZhIivqaD9RpZG1gy1A8wnV6FULvXdAj3wZANy4OJl
   uDhXmtvWcjVZxF7InoAe+x4O3H1TzkGt9Akdn/ozvpHjlknE7ESKkvrmi
   PrvfJLp+VTdd2hKq6yCLmNcb0wdqaVeCxGX6GZMO41dd38k/kBHSYVjzN
   rOlr2G3XYsEScd68EgVcQXAYcdGgzclCwPTn4HMQorQsjd+0EyNmGftqA
   iyhuZTOkHHaXjCGPx/FaMP64zrAaqrBjp52m59vYrMxplpISyHLC6jgxd
   w==;
X-CSE-ConnectionGUID: rdOvkt2jT+uA+W1MiVXqQA==
X-CSE-MsgGUID: LViXadRWTUG1nDQuD/iGEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="36075829"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="36075829"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 02:28:13 -0700
X-CSE-ConnectionGUID: +hYOH+7cQk6vV2A+emQ1uA==
X-CSE-MsgGUID: 3M5GajzaR7W/GnlgC8nNew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="67216077"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 10 Sep 2024 02:28:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 632B820B; Tue, 10 Sep 2024 12:28:10 +0300 (EEST)
Date: Tue, 10 Sep 2024 12:28:10 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt changes for v6.12 merge window
Message-ID: <20240910092810.GJ275077@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit 47ac09b91befbb6a235ab620c32af719f8208399:

  Linux 6.11-rc4 (2024-08-18 13:17:27 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.12-rc1

for you to fetch changes up to 10904df3f20cf36e418e78ab73c2fbcecda512b8:

  thunderbolt: Improve software receiver lane margining (2024-08-22 07:32:06 +0300)

----------------------------------------------------------------
thunderbolt: Changes for v6.12 merge window

This includes following USB4/Thunderbolt changes for the v6.12 merge
window:

  - Improvements for software receiver lane margining
  - Enable support for optional voltage offset range for receiver lane
    margining.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Aapo Vienamo (1):
      thunderbolt: Add missing usb4_port_sb_read() to usb4_port_sw_margin()

R Kannappan (1):
      thunderbolt: Improve software receiver lane margining

Rene Sapiens (2):
      thunderbolt: Consolidate margining parameters into a structure
      thunderbolt: Add optional voltage offset range for receiver lane margining

 drivers/thunderbolt/debugfs.c | 382 ++++++++++++++++++++++++++++++++++++++++--
 drivers/thunderbolt/sb_regs.h |  18 +-
 drivers/thunderbolt/tb.h      |  42 ++++-
 drivers/thunderbolt/usb4.c    |  62 ++++---
 4 files changed, 452 insertions(+), 52 deletions(-)

