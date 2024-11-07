Return-Path: <linux-usb+bounces-17303-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE309C01A4
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 10:58:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42620B22E47
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 09:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 675AE1E5714;
	Thu,  7 Nov 2024 09:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EkXaDjba"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74358194A70
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 09:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730973472; cv=none; b=o5ekH5jDogdRgvq0iAun4QybkUJh6Cq7oAzxLrhLzDS4nnX8vM5bu+TgZIFLrD939B6hBpU24PtFG/uZXPzxAizhGW7gGN/EwHnLGW1tmK+TjF1Qy7xyBuM7l5lRouNZQQmILjMPjc9zdQrKcFePPA7Sc5vQyBEbkYcaO8YSYZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730973472; c=relaxed/simple;
	bh=z7yt29sv0GtG+F9QtQSTPuxjTP1MHAu+PTxVQyBco/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uPMZ2ChQCYc2DsBmVCwQ6jReY8HbaB02IvfTWm7srgsNufrlO02I2nTDaYK+8R79ZHBQpmcA855svZ5V5UTDJov6ZDSR8WTru6P3K6cTVS9Nv8E6RK18Jn0wy7Samiska4o6wUO/r8HeHyV+DS63GdecQkGrYoIS28zBkziidQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EkXaDjba; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730973471; x=1762509471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z7yt29sv0GtG+F9QtQSTPuxjTP1MHAu+PTxVQyBco/c=;
  b=EkXaDjbaAvY9c7ShSap845UYIrUZTfhvB/q7dRpNyTUlecdaQHA973Ew
   z8I2QDm2zp4/24uD+1cPx+2YinbcqA8dRv8sDaVZBXnN6mJ3RUKKmt8Ib
   Q3zP5OAkksPc12QxubZwEthqmeguSs2Iw34W9F/2DFVrb9oK6IEf6fxEA
   XKhENBtwYbXyjMtCBC4eEPCc86jZY6N/zKU0lIzekG1xP+KLo/5zfzxMU
   sQlxDPBfNm/zeZUaKq+Mf6ZXpyfqFxLyVDtEyqTPzEn/1m1dk3MGxFH3g
   sbAWqRuCbY6ckyqXCtUD0yGSwRX7PuxbPRZtBhuMCOkjtLVBCNBaPEC6/
   A==;
X-CSE-ConnectionGUID: A8dcgIkPQyqsRwWVCZzOdw==
X-CSE-MsgGUID: TC6QsnqfQ1qyeANj4Mrkkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30212798"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="30212798"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 01:57:51 -0800
X-CSE-ConnectionGUID: lH59p385TrOIryma1lXodw==
X-CSE-MsgGUID: QRtYiao1RQaPUk8fWB3/nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="89647656"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 07 Nov 2024 01:57:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id E056A60D; Thu, 07 Nov 2024 11:57:47 +0200 (EET)
Date: Thu, 7 Nov 2024 11:57:47 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt fixes for v6.12-rc7
Message-ID: <20241107095747.GM275077@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit 81983758430957d9a5cb3333fe324fd70cf63e7e:

  Linux 6.12-rc5 (2024-10-27 12:52:02 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.12-rc7

for you to fetch changes up to bd646c768a934d28e574ee940d6759c7954a024d:

  thunderbolt: Fix connection issue with Pluggable UD-4VPD dock (2024-11-05 16:29:47 +0200)

----------------------------------------------------------------
thunderbolt: Fixes for v6.12-rc7

This includes following USB4/Thunderbolt fixes for v6.12-rc7:

  - Fix for retimer enumeration.
  - Fix connection issue with Pluggable UD-4VPD USB4 dock.

Both have been in linux-next with no reported issues.

----------------------------------------------------------------
Mika Westerberg (2):
      thunderbolt: Add only on-board retimers when !CONFIG_USB4_DEBUGFS_MARGINING
      thunderbolt: Fix connection issue with Pluggable UD-4VPD dock

 drivers/thunderbolt/retimer.c | 2 ++
 drivers/thunderbolt/usb4.c    | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

