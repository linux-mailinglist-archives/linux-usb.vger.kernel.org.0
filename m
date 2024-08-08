Return-Path: <linux-usb+bounces-13225-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB2D94B985
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 11:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD4C2B218DB
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 09:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD0C189BB5;
	Thu,  8 Aug 2024 09:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1tS2IhN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB92E189BAF
	for <linux-usb@vger.kernel.org>; Thu,  8 Aug 2024 09:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723108483; cv=none; b=CMsDamgxDLswPEQs7L5dZoe2U5d0PcUUAaS9mwIusBBsiKN8eRtngeDaFjTfA/HXG98eaAfkdH9ctoeZjkt6CgUA6Jt8U88C1k9umkyRr25rv6GjkDmvTdbc7/LBCCxXN9R3K8HLxP1nyf0GAQD5qNlO6oiJgKG9F4biOXK/7OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723108483; c=relaxed/simple;
	bh=Nk6h2jNbam3RV3+vgE2gBfky11sOkVlH08Y7SmDbO48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D0uOl1TWnruKKQyEsfv0mBH9DYqoAv1jfLRFwY0pxm97xOe5/oLlKqT6q5IzFqwd1qC3ew0fAaUympi2OsicphBcih23rBogm5BDgQDiFdiH6wr1SqIz32F2UjnAW6czPSVpdV2XaCPjorSTNZQjtfX0CCh8AdVoCPaAkX45ktg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1tS2IhN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723108482; x=1754644482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nk6h2jNbam3RV3+vgE2gBfky11sOkVlH08Y7SmDbO48=;
  b=M1tS2IhN0iuuze/j3bs+awY43SocEDs42JbI5cu1l5OPh7hKRxLVDyE9
   5ZAU3FC9bGHoA3f/WoTjzPIm+k3WxdtOURcE76sts87hSwBdD0HmWaenK
   0Kog8i/zotWu3n//41Gr6YMUeba7RZvfhr1DEwjxPT22NYSMJuGi+dSRK
   opinW+RFI8NF2SI0W/tEu0vRrkbIarSFsbpbGX5MwF5ERLUhFavbEojrb
   OSWmlRMHKZ+iWaYltGDUuTM+4yKkVIbf6RBuNkpXGrqEl+oUQhsbGes9p
   pZLZdzVa8fBlxM78wPEqB9BfYz6fCGl5ocBep4jlaJjvKYJPczToSi6wb
   g==;
X-CSE-ConnectionGUID: Zpe3MSIIRZSwnk/khAdNBg==
X-CSE-MsgGUID: P0lcPF5SRP+JoOU0TQZLYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="25093106"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="25093106"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 02:14:29 -0700
X-CSE-ConnectionGUID: LaVRlGcBRn+KovmXtgjukg==
X-CSE-MsgGUID: HLaVTNr0Rr+iuSome8lmsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="88063303"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 08 Aug 2024 02:14:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 59FA0213; Thu, 08 Aug 2024 12:14:26 +0300 (EEST)
Date: Thu, 8 Aug 2024 12:14:26 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt fixes for v6.11-rc3
Message-ID: <20240808091426.GJ1532424@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.11-rc3

for you to fetch changes up to e2006140ad2e01a02ed0aff49cc2ae3ceeb11f8d:

  thunderbolt: Mark XDomain as unplugged when router is removed (2024-08-06 08:01:10 +0300)

----------------------------------------------------------------
thunderbolt: Fixes for v6.11-rc3

This includes following USB4/Thunderbolt fixes for v6.11-rc3:

  - Fix memory leak in debugfs sideband register access
  - Fix hang when host router NVM is upgraded and there is another host
    connected.

Both have been in linux-next with no reported issues.

----------------------------------------------------------------
Aapo Vienamo (1):
      thunderbolt: Fix memory leaks in {port|retimer}_sb_regs_write()

Mika Westerberg (1):
      thunderbolt: Mark XDomain as unplugged when router is removed

 drivers/thunderbolt/debugfs.c | 10 ++++++----
 drivers/thunderbolt/switch.c  |  1 +
 2 files changed, 7 insertions(+), 4 deletions(-)

