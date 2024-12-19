Return-Path: <linux-usb+bounces-18674-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 642359F78CE
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 10:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52183189352E
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 09:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B41C222577;
	Thu, 19 Dec 2024 09:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XqULy8im"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC572206B3
	for <linux-usb@vger.kernel.org>; Thu, 19 Dec 2024 09:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734601650; cv=none; b=BdbK69b0UV/h2Cqkf3Wg/j/thSuX4pQbIcmnowk7bMheBx6vbY9z9ODvym48nhmDcdDIH7GEj06LsyNC7FMSYN4g7T9gYjhB5Ft1VASWL5K5JkeBjmggmil69URagv7Olowb5GYxCreaJxylcCFEuyDDQQjexgB9o4Gf/iQR6sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734601650; c=relaxed/simple;
	bh=8HkVmJKdCLPJzqz6FygP0i9gJkurnzeSfvzFx87cqEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=itp1qa/N5m97I34KNPo7msAJ1ULwbUWEJfGao5VjGEoGP0cTnQ0kz2hI/jcyd6ZiOGHCJvGyfeFgJ+HbD4JUbMWEQwj1WvU6BPgHitvQWEmO8/Nh1FXnwwTOEL8fEy+dKZsg/ZWslFmZdNmjkHJFX+5qNjl9bJR+3cayX+Fyr1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XqULy8im; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734601649; x=1766137649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8HkVmJKdCLPJzqz6FygP0i9gJkurnzeSfvzFx87cqEk=;
  b=XqULy8imG3Ckx8bjl7QBTr851Prwk1Ge/PQm+MatlKwOPAQKaKMDuhBX
   azcI8JDPJqK23Qi/j9OGauyD0//GQtsQD03yuCxQ/M3Jy0oCxXHT4cKrn
   1AbcNGT85pGowpBd44veEt1OlWLUhueJk7tx/kVxgmuoqUzvx3YUDInx2
   eyeCYxXbZFa0Htg4mDZGxyK16Thoc00Z/1HfqAKvCxBV0QU1VdSN3Ft4u
   RcAXmrlr7p7FHfODR4wA/uClUauT/DtFjpp7OYOLErIlbV+Wv3sde3laf
   k20x3oDMGJIM5nN4HANGEnmG33VC/+kr/Bd/vjMss1CC7iVgNuIcDGchw
   A==;
X-CSE-ConnectionGUID: tERos2VNQxKjLkFAwxo4mg==
X-CSE-MsgGUID: KUmzN2SWRQGd6tEcQyxtqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35233039"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="35233039"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 01:47:27 -0800
X-CSE-ConnectionGUID: k/gCx+3LTn2X+7smb3biRw==
X-CSE-MsgGUID: nW6Vy3FSQOyUT2niFhvJFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="97936686"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 19 Dec 2024 01:47:23 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 680F0165; Thu, 19 Dec 2024 11:47:23 +0200 (EET)
Date: Thu, 19 Dec 2024 11:47:23 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt fixes for v6.13-rc4
Message-ID: <20241219094723.GH3713119@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.13-rc4

for you to fetch changes up to 24740385cb0d6d22ab7fa7adf36546d5b3cdcf73:

  thunderbolt: Improve redrive mode handling (2024-12-16 09:59:38 +0200)

----------------------------------------------------------------
thunderbolt: Fixes for v6.13-rc4

This includes following USB4/Thunderbolt fixes for v6.13-rc4:

  - Add Intel Panther Lake PCI IDs
  - Do not show nvm_version for retimers that are not supported
  - Fix redrive mode handling.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Mario Limonciello (1):
      thunderbolt: Don't display nvm_version unless upgrade supported

Mika Westerberg (2):
      thunderbolt: Add support for Intel Panther Lake-M/P
      thunderbolt: Improve redrive mode handling

 drivers/thunderbolt/nhi.c     |  8 ++++++++
 drivers/thunderbolt/nhi.h     |  4 ++++
 drivers/thunderbolt/retimer.c | 19 +++++++++++++++----
 drivers/thunderbolt/tb.c      | 41 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 68 insertions(+), 4 deletions(-)

