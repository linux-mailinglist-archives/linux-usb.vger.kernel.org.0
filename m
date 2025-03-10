Return-Path: <linux-usb+bounces-21586-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD85A59229
	for <lists+linux-usb@lfdr.de>; Mon, 10 Mar 2025 12:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90CA37A2615
	for <lists+linux-usb@lfdr.de>; Mon, 10 Mar 2025 11:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A3D3224230;
	Mon, 10 Mar 2025 11:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KzitvD+5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AB122EE4
	for <linux-usb@vger.kernel.org>; Mon, 10 Mar 2025 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741604513; cv=none; b=idza0xQeek4VmftJV8BhbfTeujRV6azFoGYsvywVSRmK3ZuoskPAPAuh8NcZD5dM223HbhKiDuaT+zdr6MGhB+zmPfuRktjlbsMc+DftIsq2rm9hPCUwgu+0sbPxTVCV/+Oi9FTFhaj1NXuonmeR+XivO76L98FluzU18z+cm4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741604513; c=relaxed/simple;
	bh=1b9j3hKSMAJRTK+OFlqaIAKSPQcFCUTmvbd9VOTde5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iyH3UtgISXREqZuRMd+yAmO16LU50ydkHjcPL3g4fphWHPF3+ujXlDzkE2sVotHTiiZ4QjZH76LCn/8ESUm+FAjHaJNQerlmEjwymvBXetmzFOBisVsB8Em1aAdbQs0Y/kIGLM9TLgFG/wbQeIIsE9Oy9WSwxGR3GffYch85MqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KzitvD+5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741604512; x=1773140512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1b9j3hKSMAJRTK+OFlqaIAKSPQcFCUTmvbd9VOTde5Q=;
  b=KzitvD+5i5Et9QdQ9Hv8xePSlfXEw++W3kb09tBLooOKuEkZ4kDq4WwO
   nqgYPsUzhN53il6FoS4J94YKI5yUCQ/BZ2+7llPRgGut9MRcUcGlMkM/g
   SgNhVTmyZ8CviXE6pB0hG5rl4Wc9QrYUyNgKxcNgsJPeCD0IqgXjmloOz
   2qon2zp9IaYWl5cygAu1h3RE6qZd7q4z8eMah5t0fQpR4w9IjG0jhbvmM
   1NAhDSFAOJaT1UP9Euz+2CxVtnV12FOC4RgJdTQRdyHXIrvmlNfllwzSP
   Lqc73Tr6kmeTAYXSHBtpmOR54cxeXUQw8MzWyoMQJoPSQjPCBPFWPlnHZ
   A==;
X-CSE-ConnectionGUID: 1J0NKDUHSjuZUPAvfXLs9g==
X-CSE-MsgGUID: +rpd3Bc/TqeIX8gs7WjqDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="52802712"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="52802712"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 04:01:52 -0700
X-CSE-ConnectionGUID: CxTwmJSWRROD/zANMPr8MA==
X-CSE-MsgGUID: sE7/PiuaQhWNeiR5fIHo6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="120860962"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 10 Mar 2025 04:01:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id E33D41F2; Mon, 10 Mar 2025 13:01:48 +0200 (EET)
Date: Mon, 10 Mar 2025 13:01:48 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt fix for v6.14-rc7
Message-ID: <20250310110148.GZ3713119@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit 7eb172143d5508b4da468ed59ee857c6e5e01da6:

  Linux 6.14-rc5 (2025-03-02 11:48:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.14-rc7

for you to fetch changes up to 502843396ec2a3eb4f58a2e4618a4a85fc5e0f46:

  thunderbolt: Prevent use-after-free in resume from hibernate (2025-03-07 14:00:58 +0200)

----------------------------------------------------------------
thunderbolt: Fix for v6.14-rc7

This includes single USB4/Thunderbolt fix for v6.14-rc7:

  - Fix use-after-free in resume from hibernate.

This has been in linux-next with no reported issues.

----------------------------------------------------------------
Mika Westerberg (1):
      thunderbolt: Prevent use-after-free in resume from hibernate

 drivers/thunderbolt/tunnel.c | 11 ++++++++---
 drivers/thunderbolt/tunnel.h |  2 ++
 2 files changed, 10 insertions(+), 3 deletions(-)

