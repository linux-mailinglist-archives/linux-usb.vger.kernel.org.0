Return-Path: <linux-usb+bounces-7064-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DFD866FB9
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 11:02:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AC231C25B81
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 10:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B03195CDEC;
	Mon, 26 Feb 2024 09:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WNhUmcao"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9966D5D486
	for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 09:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708940313; cv=none; b=c+l6VGBMS6gPhCIo56kQXVmyXTEOPptKaqwuxyKKOkL22WeKtlyX5MoV6uuJK0JMtR40EaLhGdFHMnkaDwHwwVipqWleNLD2+6BwiI7VU+lZqhzHX6OB3Q5C1ZPjqFXacZsntTCe2BzRxOaGPQufLIE9A8k7QhhD2WaYQTvTkLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708940313; c=relaxed/simple;
	bh=9qM72geflY9xjeM1MzHRhvGk6BcNiqTJ/bzpFNr+BQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fPkkQP+THRMRr9FAZRPzspw2jGzd/Lwa3vovSJ0s2SgoRQHi1BiZQIY70b9g+TOGUa2MekvE9DjNfBBe5M3SSQQM28O9+pIrVK77S+eOyLxGzL32w0jH3fgjnTNfnlHk+UiGKU++KH+NlML9tjG/mLuAXqqXBuj58aOLdg5Kayk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WNhUmcao; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708940311; x=1740476311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9qM72geflY9xjeM1MzHRhvGk6BcNiqTJ/bzpFNr+BQo=;
  b=WNhUmcaonVZw6XbF1nPSaSWQSb9zmnrLYERSc1xa09dg/eSo1faASvsm
   YghSz6kwUFOjOrNfURfOvhNMXmoFHPiJONFNmVByeseKWrxrl1olIELcf
   66P49u3NoFfQVHO9GSQEpW/JvwF9/BN4+zBCswh/sG2fktY/J0Fpnv7qI
   pvGkpqaL/OdlmyiLDSx8js9xo7QaqbrAf8gOO2ufXNtD+EY0oCziMiRkH
   b5MACI2/Vn3RwhBGO/+nqTyhUymBWhaBmFAp5hrNBMHmJJ6T6o7hsZwYo
   STzUIrVe0NWVwqCpFZX0EYuIkWBiu8kehQrkbftAkWvEPpuCoUygzUD3R
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="13765555"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="13765555"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 01:38:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="937029639"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="937029639"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 26 Feb 2024 01:38:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 0EFEF4FD; Mon, 26 Feb 2024 11:38:26 +0200 (EET)
Date: Mon, 26 Feb 2024 11:38:26 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt fix for v6.8-rc7
Message-ID: <20240226093826.GB8454@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit 841c35169323cd833294798e58b9bf63fa4fa1de:

  Linux 6.8-rc4 (2024-02-11 12:18:13 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.8-rc7

for you to fetch changes up to d3d17e23d1a0d1f959b4fa55b35f1802d9c584fa:

  thunderbolt: Fix NULL pointer dereference in tb_port_update_credits() (2024-02-16 10:36:51 +0200)

----------------------------------------------------------------
thunderbolt: Fix for v6.8-rc7

This includes one USB4/Thunderbolt fix for v6.8-rc7:

  - Fix NULL pointer dereference in tb_port_update_credits() on
    Apple Thunderbolt 1 hardware.

This has been in linux-next with no reported issues.

----------------------------------------------------------------
Mika Westerberg (1):
      thunderbolt: Fix NULL pointer dereference in tb_port_update_credits()

 drivers/thunderbolt/switch.c | 3 +++
 1 file changed, 3 insertions(+)

