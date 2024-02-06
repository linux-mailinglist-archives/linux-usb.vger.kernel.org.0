Return-Path: <linux-usb+bounces-5938-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D2884B64E
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 14:27:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54155B22B7E
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 13:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C572B130E27;
	Tue,  6 Feb 2024 13:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DpfsDROd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6024130AD4
	for <linux-usb@vger.kernel.org>; Tue,  6 Feb 2024 13:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707226036; cv=none; b=Uj9ona4XfZmPuk4apU2eTjI78bjDTeqrJHhdWfGMq7wCi4cX8HXmOK3cWOh9xmIVNGPcZcArfoGRtNiV1szvlle0Fs2boy1QVQ+lz5Kk8aq22mt8SjlreS2edgbiw9nztKYc+asQOrgF6RcfQ40X8gR/kxmbVmtIIIJlJNkqvtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707226036; c=relaxed/simple;
	bh=+HyPD5weE0IB8DIM2RSuasb/g7+Z4AA//wJt0xigSHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YuDzeITgMYDjExJyvdPR6oBE32Z03bkaXH89Ecx9+pEu3cslAZjr2K1zt8gdPvtohh/GOnnkZu3u8Dfz/eGCn3bsT//Gb54Q4jdFR2es21G1PgFaj1PEeaq+2d7qD8Xj8sUAYQyMqSnIZsVIAYtclASEW3JyijndJZqNP9C80q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DpfsDROd; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707226035; x=1738762035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+HyPD5weE0IB8DIM2RSuasb/g7+Z4AA//wJt0xigSHo=;
  b=DpfsDROdmy3VJUdgHO0SkWIL6CdHRD1HB/P4lcsBE5DK+AUl1RdGNFUx
   X0lDolgebjTcVS00YEHwZ6ssBqusYrrFB7q1Upda7dJAHgT0zTyWf4b39
   lWOU3abhN7riz3Mt1X5fbVvxL1NeOI7OFkUQQdLTT/JcyFXjzv9b2W8iQ
   6aiXmwkVXGdGBhTjI6wJvmQokESG61l/x+bIYgjdjBNxYxmgA7uTa4XYS
   qIREzEUuCwGGBciCPQFSQ17ifsG01JXsPCm7qs50VlDYC7Ux+jtMZ9WdL
   XGawkzuEUduQSFp0TOL7RlFXGF997O11/AiC3ToOcYUZ6QDxVcw/tf583
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="4532260"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="4532260"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 05:27:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="933459252"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="933459252"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2024 05:27:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 07A07FF; Tue,  6 Feb 2024 11:50:28 +0200 (EET)
Date: Tue, 6 Feb 2024 11:50:28 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB4/Thunderbolt fix for v6.8-rc4
Message-ID: <20240206095028.GK8454@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit 41bccc98fb7931d63d03f326a746ac4d429c1dd3:

  Linux 6.8-rc2 (2024-01-28 17:01:12 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.8-rc4

for you to fetch changes up to ec4d82f855ce332de26fe080892483de98cc1a19:

  thunderbolt: Fix setting the CNS bit in ROUTER_CS_5 (2024-01-29 09:48:40 +0200)

----------------------------------------------------------------
thunderbolt: Fix for v6.8-rc4

This includes one USB4/Thunderbolt fix for v6.8-rc4:

  - Correct the CNS (CM TBT3 Not Supported) bit setting for USB4
    routers.

This has been in linux-next with no reported issues.

----------------------------------------------------------------
Mohammad Rahimi (1):
      thunderbolt: Fix setting the CNS bit in ROUTER_CS_5

 drivers/thunderbolt/tb_regs.h | 2 +-
 drivers/thunderbolt/usb4.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


