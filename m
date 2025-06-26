Return-Path: <linux-usb+bounces-25131-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45373AEA311
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 17:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B98DB56459E
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 15:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1652D2EBDCF;
	Thu, 26 Jun 2025 15:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DgogyQ0y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB551DD877
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 15:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750953498; cv=none; b=qZ+KpVxrusXn1JvX+Bht8td6AoaM00Z01R5yrlMNU5go1Vn/zM1/KcKWs8QtNG2aA6rl5+irpkCsTkAaLXFmeH02g89R839+kU/qwC91hn86x1oGvLFJmkjk1O9ywEENkII4pQF+ega1v3aCkBWFAQ2XL1g91th7EBn5VA3TkIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750953498; c=relaxed/simple;
	bh=R1bU5DwOtCr2KVhqpG5vEA9DPzxMVUI8JFtmNnXbVok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OzpVJzTeRZjmSbLoxDveyQ1h22j9BrWQ6H/7ZX6sYIqaCXJ+iheFZSBV3KkPXll8dYU+E+QFUhDGvNJ8OD8Fxfax+rTIyHZl90nCkAHvEoptTgzPczap1JyZyl/ZRA1WSlPH7GglDvLgJB/nRd4EJrh/76Wtmx38VX3sbmQdwy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DgogyQ0y; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750953498; x=1782489498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R1bU5DwOtCr2KVhqpG5vEA9DPzxMVUI8JFtmNnXbVok=;
  b=DgogyQ0yRwoKVozjHgC4h/BTAcFqOdp3s2NurgVcPiqoOz7GPmrOaVJK
   TSChBBLGP3MkVfAMLTE6808ASKOo9EgeDqh5BKzDnkDwEfE//DdHPlHnA
   zuK77ctkhhmvjJUE6nHibIGQjBUv9aZlLHneD4bDqmNbc21+yOFlNsAJV
   cG6VVS9FBr7X8q52MWnL85cLm1liLZH73oVm8Mv2s9PO95vnQE3yHJxAF
   d/R4Cqx6h/0DrJ4XaiP67Ega/PrXSng/GQgJMP7wstrhmQP2JRk0+55GW
   XjANO3Wo3fbtq9Mt5LodI/3xREgdsbRDZThdyTt8BnTOPatRQN++0Cvou
   w==;
X-CSE-ConnectionGUID: T9Pi8jYlT9e1qUMK2Y4t6Q==
X-CSE-MsgGUID: pfas4iyeSNWfTIO4/5tpZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="70686355"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="70686355"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:58:16 -0700
X-CSE-ConnectionGUID: V4t9DakET1KgZ78TGGDpLw==
X-CSE-MsgGUID: sm+dHXpxQU6rN3Y5/ZEeyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="153057257"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 26 Jun 2025 08:58:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 0E6742AD; Thu, 26 Jun 2025 18:58:11 +0300 (EEST)
Date: Thu, 26 Jun 2025 18:58:11 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt changes for v6.17 merge window (early)
Message-ID: <20250626155811.GL2824380@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

I'm sending this one early due to my vacation starting after tomorrow. Just
a single documentation fix. Thanks!

The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:

  Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.17-rc1

for you to fetch changes up to 2d1beba54fdaac0d624b016025d4ec5856713fb1:

  thunderbolt: Fix typos in documentation comments (2025-06-23 12:56:18 +0300)

----------------------------------------------------------------
thunderbolt: Changes for v6.17 merge window

This includes just a single trivial documentation fix. It has been in
linux-next with no reported issues.

----------------------------------------------------------------
Alok Tiwari (1):
      thunderbolt: Fix typos in documentation comments

 drivers/thunderbolt/nvm.c    | 2 +-
 drivers/thunderbolt/switch.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

