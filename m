Return-Path: <linux-usb+bounces-16678-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B33999AF9B6
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 08:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E0FB1F24791
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 06:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820DD192B65;
	Fri, 25 Oct 2024 06:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W4RR8J98"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287175FEE6
	for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2024 06:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729836949; cv=none; b=Cb9hhnZ2x9zIsUyo/42c8wPAJ58IjoKb90rwChicfp9sC7FwWHMXXmGdrkFrKd/r0wOqcDf45gxouJjXCbJ92b9aFijA9pqrjd9bJ8KAqIPbNH1kokSJDY0aVNV1ZW6QqzshEGmXWFDP5+Boj9Oa07olHpP8rfL8h9Bm7/U1/uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729836949; c=relaxed/simple;
	bh=UBoZ4IXiNwkOugi2clKDHY4eaW+yIlWOxRhdsIS3mis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G7suph9pSKw4/RNoR4P3zts9x0Fnh2OVCIirIq2we0F7IhbF1mG0iNuj7+9zvAWh5KzRlkEJx1TlI3H2Nyc82i81aZ/jbPg5FfVrFuW9Uiy6YShdNFt1+X6KsxURECWL2LzPElmqAye/28Iniu6/+Ai/63b+sxlcKbqtLDoLPtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W4RR8J98; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729836947; x=1761372947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UBoZ4IXiNwkOugi2clKDHY4eaW+yIlWOxRhdsIS3mis=;
  b=W4RR8J98rnsWSH2IlzbsXHl7TJrY0lu/CmVfNZfnc0BBOpSzwZ2Yjwub
   umGImIZVQQTSvfe9Oin4os6HPoUQjLe/pE/o1N/7q1QMaLE7FTP4gxCy7
   gXxKeIVnRsoanCMIN8l4aJI0eS2z7b3B7lx2K2rol69jJ76+443tRZjMY
   x/iZGXMUNLdHbAmbd8WyhQ9xDy1KA4zCSDENhPZGJTerV6D9KHJ7mw9Hs
   vd8g5REi/HgCAWJZhXC5FLRgb7C6/27NLSeuBDpfmO3JecGshbQLtDUVd
   38mgJBPqqXakpkUy7x1gHl5gZeHDnvIkcWG9WEAMx6fXn2R0ubTsaSG4I
   w==;
X-CSE-ConnectionGUID: 1v+PXmxXS4aV0jQxpf5QtQ==
X-CSE-MsgGUID: 53JwKkG2SSqHEk1M7cwpMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29621626"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29621626"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 23:15:46 -0700
X-CSE-ConnectionGUID: ZmgEHBwURVmhrKZKI4Q83Q==
X-CSE-MsgGUID: hC6OVzO7SQmm03vNtgu8Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="80738261"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 24 Oct 2024 23:15:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id EF0072D0; Fri, 25 Oct 2024 09:15:42 +0300 (EEST)
Date: Fri, 25 Oct 2024 09:15:42 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt fixes for v6.12-rc5
Message-ID: <20241025061542.GL275077@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b:

  Linux 6.12-rc2 (2024-10-06 15:32:27 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.12-rc5

for you to fetch changes up to 3cea8af2d1a9ae5869b47c3dabe3b20f331f3bbd:

  thunderbolt: Honor TMU requirements in the domain when setting TMU mode (2024-10-21 09:42:42 +0300)

----------------------------------------------------------------
thunderbolt: Fixes for v6.12-rc5

This includes following USB4/Thunderbolt fixes for v6.12-rc5:

  - Fix KASAN reported stack out-of-bounds read
  - Honor Time Management Unit (TMU) requirements in the domain when
    configuring TMU mode of a newly plugged router.

Both have been in linux-next with no reported issues.

----------------------------------------------------------------
Gil Fine (1):
      thunderbolt: Honor TMU requirements in the domain when setting TMU mode

Mika Westerberg (1):
      thunderbolt: Fix KASAN reported stack out-of-bounds read in tb_retimer_scan()

 drivers/thunderbolt/retimer.c |  5 +++--
 drivers/thunderbolt/tb.c      | 48 +++++++++++++++++++++++++++++++++++++------
 2 files changed, 45 insertions(+), 8 deletions(-)

