Return-Path: <linux-usb+bounces-25130-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F53AEA2D8
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 17:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2DC75A5CD6
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 15:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C4E2EB5B9;
	Thu, 26 Jun 2025 15:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IitIlOvq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9D32E718D
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 15:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750952415; cv=none; b=iEBuNf/6Jc5aAxFMkbUR8co+6GyC47b7IEL5DR9k3xR8Gc2yPj3AfjX7m07F73YCUBUH/to8aMVV+xRM55X82x8vih/d5kIQTs961M14j9u1nyXi1Np3FXP6G8ZVfqk3KR+mssWFjbfFZemWZ3mwgoRkiJ2EHIQnhfWs20KoSJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750952415; c=relaxed/simple;
	bh=Bo6U8BqFruCROefewD9JKZIrVjWnCb3XYptqVqNOIeI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QkolnxTS1DU7bkYQBfUUbCweHMI2PsVFiWjBpHOI7q4y9KV0q9yAR3inR4tKJb/WTq21iumGWutHdzyRmF3d4Y4m0AX/NmBe4msu3nOD3J+C741k3A+zZ0HBPZWZRyxsw1AMKwbfpf/AedLajAiDyMrFT5cvH0UM03w3vWiks5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IitIlOvq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750952414; x=1782488414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bo6U8BqFruCROefewD9JKZIrVjWnCb3XYptqVqNOIeI=;
  b=IitIlOvqP3Zuqme2XLWrktWbggnccHfZwHb+qp8nSQrG5csT0a7P0Zod
   LlsjuiqREVc4C5aavjm6AubVCmwgVQVLITiVgrXqPK7X6OqJiu7BBrUa2
   yNpjIFepcN6iJAp1tRmTqA6+aX7pu6NHnWCmlLL1Y+NL00zrdnvNJdcZk
   IlPZtZF00ErB8Mr15HHKyG7gFwiKBCheH0MSYdij1BsJuql33Q7+HrV94
   J/3eJYvxKtWPS0TRaa7SUBljpHox6vB74kWUgLdMPmaLi1FXAcPJX/Ryz
   zi26X065PoU3e7sE8k/oMULCFkezLovYgSs8x6qTedAkMeLrQnn1Qwz4a
   g==;
X-CSE-ConnectionGUID: iFA+zyuERWmYxwmZDBN8hA==
X-CSE-MsgGUID: NsdRJuvSQVOqfZ+TD8a3Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53329243"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53329243"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:40:13 -0700
X-CSE-ConnectionGUID: ea9ZbHFRR+C476HniHCXoA==
X-CSE-MsgGUID: MROVAHE8T0eB0KAq+6+95w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153288809"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 26 Jun 2025 08:40:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id B2D102AD; Thu, 26 Jun 2025 18:40:09 +0300 (EEST)
Date: Thu, 26 Jun 2025 18:40:09 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt fixes for v6.16-rc4
Message-ID: <20250626154009.GK2824380@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:

  Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.16-rc4

for you to fetch changes up to 2cdde91c14ec358087f43287513946d493aef940:

  thunderbolt: Fix bit masking in tb_dp_port_set_hops() (2025-06-23 12:52:08 +0300)

----------------------------------------------------------------
thunderbolt: Fixes for v6.16-rc4

This includes following USB4/Thunderbolt fixes for v6.16-rc4:

  - Fix wake on connect during runtime suspend
  - Fix bit masking in tb_dp_port_set_hops().

Both have been in linux-next with no reported issues.

----------------------------------------------------------------
Alok Tiwari (1):
      thunderbolt: Fix bit masking in tb_dp_port_set_hops()

Mario Limonciello (1):
      thunderbolt: Fix wake on connect at runtime

 drivers/thunderbolt/switch.c | 10 +++++-----
 drivers/thunderbolt/tb.h     |  2 +-
 drivers/thunderbolt/usb4.c   | 12 +++++-------
 3 files changed, 11 insertions(+), 13 deletions(-)

