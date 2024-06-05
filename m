Return-Path: <linux-usb+bounces-10857-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C718FC327
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 07:52:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 690DA1F24704
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 05:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D871721C17D;
	Wed,  5 Jun 2024 05:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cy1qu6J5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91DE946C
	for <linux-usb@vger.kernel.org>; Wed,  5 Jun 2024 05:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717566756; cv=none; b=jjv8PuvQYDbcnAKH+EeBT5vQJD2mBexRCZb8TGQ8oQfMg+7909SHsi9w0Kfagl/AQSOGQMMl9HWp5+4L7GOUcLP2zorFV7gasVVvHcGCzn60xvxm2UH+MPgI63c1idZgV25dn3dr241O3V2d7cePfww53fxV1t6mk0iUA1SBPnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717566756; c=relaxed/simple;
	bh=VATo4jVZRIDeN0EvzYp4FYsU/oT+MFnl06o4Cczrl9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uZLUE15iZewRi3p4GLRBq2dBKoccq7BH2nLz3me/vO7KRhVS0YwuxPqfUIHd/IzUDZLOxyDX7iMiWWZySsDU5KAyAnHAbfBtUDi2JPWGmf6oLkaCh/x1TL9TFOatdFzA3C/ffRiNyNMjJkxtt+l4GEnttRwRX2JClnAh6yb8YBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cy1qu6J5; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717566755; x=1749102755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VATo4jVZRIDeN0EvzYp4FYsU/oT+MFnl06o4Cczrl9I=;
  b=cy1qu6J56zvkkXfYmK0cOohvWZ4vRhvOmqc6iP6s7IYU2dmEODmxQWH9
   ftx8Jmdq25mWTJGBdzvSGvh4357BMYtAER2V1aaUua3o/xi6Z4zbZWTDP
   Xud42rEphAiRxwoLHeROT+7Hq0drHKl+3seyfbBW7cSi1DQu20wjwrVJu
   9vK2KzwBopiTFJr+4uS6dA8qzTd9TqfTzh3WY4iJcxH+6r4pGA3zhw66O
   +miVBzxMIhWXgidvhYztL+bF2N87G9eVhxFDF9KxKsFEeLqHE88TTAzZ8
   KJBL+8Xj+Qs+Y7AdgEGGu/JmFpFIumDjPNn/innC9hI6FaVoRaEP4qFaP
   A==;
X-CSE-ConnectionGUID: 8ii6MGo5T6q0oyD+p2OiXw==
X-CSE-MsgGUID: cALqFDLtRWOBXSJed2K7Zg==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="31690251"
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; 
   d="scan'208";a="31690251"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 22:52:33 -0700
X-CSE-ConnectionGUID: zrbIA96+TXq6hPV2MvFKig==
X-CSE-MsgGUID: abfsqzXWSuiI9PSj4EVytA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; 
   d="scan'208";a="37476124"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 04 Jun 2024 22:52:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id EBAEC1B6; Wed, 05 Jun 2024 08:52:29 +0300 (EEST)
Date: Wed, 5 Jun 2024 08:52:29 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt fix for v6.10-rc3
Message-ID: <20240605055229.GH1421138@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.10-rc3

for you to fetch changes up to 985cfe501b74f214905ab4817acee0df24627268:

  thunderbolt: debugfs: Fix margin debugfs node creation condition (2024-05-31 13:13:39 +0300)

----------------------------------------------------------------
thunderbolt: Fix for v6.10-rc3

This includes one USB4/Thunderbolt fix for v6.10-rc3:

  - Fix lane margining debugfs node creation condition.

This has been in linux-next with no reported issues.

----------------------------------------------------------------
Aapo Vienamo (1):
      thunderbolt: debugfs: Fix margin debugfs node creation condition

 drivers/thunderbolt/debugfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

