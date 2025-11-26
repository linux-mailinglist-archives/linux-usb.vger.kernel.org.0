Return-Path: <linux-usb+bounces-30947-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E1EC88E1D
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 10:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C7EEB353B0F
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 09:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155DD315D27;
	Wed, 26 Nov 2025 09:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLg5vihX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7413A25F7A4
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 09:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764148367; cv=none; b=FlLTxLp4bKqVV2HQh68IRI1jl2YCMo1c9EvJ5zc/pXpNRv+QUB9F/PN4oo2s9ggVKpHtmjdS2hZ7O0NFMIQPptJ6TeD/BAvbmWmg8yKQliAW5ly0kXuA8hLmZNFqU53+nT83C90nggA9LYtioKcROpkap/H7scdVxG3k1hQLH48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764148367; c=relaxed/simple;
	bh=PyFHiUSC/KWg3ChUOSLvRb6s6IF2FRf3wQIvjprVB1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=frmAZHSX4KCYGD6e/BsAYuQiC0umSPZsp+WZ3vRG98Sq72hbugLw/H1LK9OWoCjrIVcTn4ARqMx3DdQCCRMOnBv28f8J7FgPJXSLi/JCUL0G825rcWgv2+KsxJ0V1GGpKg2u0+E44ovn1HA+TrLWhXxKO10IEqtyJfKaF6AJe4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fLg5vihX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764148366; x=1795684366;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PyFHiUSC/KWg3ChUOSLvRb6s6IF2FRf3wQIvjprVB1I=;
  b=fLg5vihXjpwLo0GJbGRNWLRSTXzSsqLpGGLDVSr0oe1RU7ZXAETGpSWi
   sZlwkPqA/jWGyJlR4eCQe+Bt1ZC2jbC6ojk3IGaVvSTJAuv0XDFkAjTOA
   CwCc/uUmQJN54ux05GpxwhkCN7K7dyX7eHN3GAP/NHdAz1g21mYecdUEf
   MqIvkTN2ez/Jm8Bb8a4FpWYAzLGAtzHcm86MBbafkxHp//g7wrdzrURJC
   FJe5jTRVLm40YrEhJ8vEcBa/ioADNpqbUKDPcfPx3C38h67+tC6xmSV5/
   5q9jmsVB8n/IbGR/uUY0UwPCHt/phlKTw2BbnhLefu0MNyA5vtWF3jOnr
   g==;
X-CSE-ConnectionGUID: TqT/TYInQoy4T481QUyOKA==
X-CSE-MsgGUID: 4rkk2r6oT5OAz2OwgXSs3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66128208"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="66128208"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 01:12:45 -0800
X-CSE-ConnectionGUID: Oy2P4JAmSi2zQ8aHrqM7mQ==
X-CSE-MsgGUID: qQNKihr6SkmPrzpTYS3pQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="198000515"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 26 Nov 2025 01:12:44 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5738AA0; Wed, 26 Nov 2025 10:12:42 +0100 (CET)
Date: Wed, 26 Nov 2025 10:12:42 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt changes for v6.19 merge window
Message-ID: <20251126091242.GD323117@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Greg,

The following changes since commit 211ddde0823f1442e4ad052a2f30f050145ccada:

  Linux 6.18-rc2 (2025-10-19 15:19:16 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.19-rc1

for you to fetch changes up to 479d186fc946b16c440f57995d5cb2151bfe61c0:

  thunderbolt: Fix typos in xdomain.c (2025-11-17 08:24:24 +0100)

----------------------------------------------------------------
thunderbolt: Changes for v6.19 merge window

This includes following USB4/Thunderbolt changes for the v6.19 merge
window:

  - Documentation fixes
  - Fixes for various typos found in the driver
  - Replace use of system_wq with system_percpu_wq.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Alan Borzeszkowski (17):
      thunderbolt: Update NVM firmware upgrade documentation
      thunderbolt: Update deprecated firmware update site in icm.c
      thunderbolt: Fix typos in ctl.c
      thunderbolt: Fix typos in debugfs.c
      thunderbolt: Fix typos in domain.c
      thunderbolt: Fix typos in icm.c
      thunderbolt: Fix typos in lc.c
      thunderbolt: Fix typos in nhi.c
      thunderbolt: Fix typos in retimer.c
      thunderbolt: Fix typos in switch.c
      thunderbolt: Fix typos in tb.c
      thunderbolt: Fix typos in tb.h
      thunderbolt: Fix typos in tb_regs.h
      thunderbolt: Fix typos in tmu.c
      thunderbolt: Fix typos in tunnel.c
      thunderbolt: Fix typos in usb4.c
      thunderbolt: Fix typos in xdomain.c

Dominik Karol Piątkowski (1):
      thunderbolt: Fix typo in tb_eeprom_ctl_read documentation

Marco Crivellari (1):
      thunderbolt: Replace use of system_wq with system_percpu_wq

 Documentation/admin-guide/thunderbolt.rst | 50 +++++++++++++++++++++----------
 drivers/thunderbolt/ctl.c                 |  2 +-
 drivers/thunderbolt/debugfs.c             |  4 +--
 drivers/thunderbolt/domain.c              |  2 +-
 drivers/thunderbolt/eeprom.c              |  2 +-
 drivers/thunderbolt/icm.c                 |  8 ++---
 drivers/thunderbolt/lc.c                  |  2 +-
 drivers/thunderbolt/nhi.c                 |  2 +-
 drivers/thunderbolt/retimer.c             |  2 +-
 drivers/thunderbolt/switch.c              |  6 ++--
 drivers/thunderbolt/tb.c                  | 16 +++++-----
 drivers/thunderbolt/tb.h                  | 14 ++++-----
 drivers/thunderbolt/tb_regs.h             |  6 ++--
 drivers/thunderbolt/tmu.c                 |  4 +--
 drivers/thunderbolt/tunnel.c              | 14 ++++-----
 drivers/thunderbolt/usb4.c                | 26 ++++++++--------
 drivers/thunderbolt/xdomain.c             |  4 +--
 17 files changed, 92 insertions(+), 72 deletions(-)

