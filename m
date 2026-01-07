Return-Path: <linux-usb+bounces-31980-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8DDCFCDFF
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 10:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DC17F30028B0
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 09:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E002F7475;
	Wed,  7 Jan 2026 09:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RhfNwhml"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67E1220F49;
	Wed,  7 Jan 2026 09:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767778438; cv=none; b=t2hP1JuQALmUMhtFj/bNV3dubtrYx6hGZ7thWHSY/xmw2pmY8Bd6IDMYlhJD5GeWetRduzMWOC0kYwxtro9Aj8F8NoHnYC767eJPDaUweXdRNCUBfdmBiYxQzATdC8llpbXfQzX95QGrbO2ajOXSuqulYz9JPxpoBjFmaU6unQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767778438; c=relaxed/simple;
	bh=bnHmxdh1FeNx/GO2QTX1Itdvc+HNVyrzFaSiVi6IJzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cl7KFyDrjtbK0EDhj3rORCG8/KW7eVQx3+GfqwF2ji+ndwdPziq34Aff5iGdNqdbl33aOO5KvhVIsnhtLUXtyzOQPjp62FjZgX942z7f5OHowScl9zD8D07T6z2sIre8i4prlXKGC0sNaoMnY0zYYyQrFZOqixRTRuK5yFz989I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RhfNwhml; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767778436; x=1799314436;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bnHmxdh1FeNx/GO2QTX1Itdvc+HNVyrzFaSiVi6IJzE=;
  b=RhfNwhmlRg6vJu5WpEwyP5jB1CBAR1fdqnHjDeCCVbKFfeRMdcV4zQuR
   BN0zhhHMqKtFIBgIPtj666/M2JIpMnxJmTwKgDfpiMN6tzMq8gsyv4sbX
   kkSJY+kZyVHQEFLtFFTzlNpk9on4DBwnB1Ijh7UanLV4UprN+kEAw7O2s
   aZCmCIpc6dU/qitrtexp9MXIiVpVEyTdxIrFyQbWlSWSeexDF/R4u32D3
   s4GtvH0Nr9VBX99ey/YdojG7zuiYpSPQr9DXPjlRf0qynZ1V/jLG7jRE1
   iKMoKUp8gR3fAq5ntiOzpL1G97jT/B1cSPLt3UsV0Din4Y3W4CH6izQuv
   A==;
X-CSE-ConnectionGUID: 3t3AjH5zROSkaBjxOiyygg==
X-CSE-MsgGUID: Ya9G7mGGR6iuZjqCALqkIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="72776883"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="72776883"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 01:33:56 -0800
X-CSE-ConnectionGUID: lDdQhBghTEGcFnvYWPHZUA==
X-CSE-MsgGUID: /Wc6r8BLQEqqHsX+yeBjEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="207027959"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 07 Jan 2026 01:33:54 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id AD54E98; Wed, 07 Jan 2026 10:33:53 +0100 (CET)
Date: Wed, 7 Jan 2026 10:33:53 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
	linux-kernel@vger.kernel.org,
	Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Subject: Re: [PATCH v2 0/2] thunderbolt: Fix S4 resume incongruities
Message-ID: <20260107093353.GO2275908@black.igk.intel.com>
References: <20260106053749.61440-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260106053749.61440-1-superm1@kernel.org>

Hi,

On Mon, Jan 05, 2026 at 11:37:47PM -0600, Mario Limonciello (AMD) wrote:
> When a machine is restored from S4 if the firmware CM has created
> tunnels there can be an incongruity of expectation from the kernel
> when compared to booting from S5.  This series addresses those.

I suspect there is no Firmware CM in AMD platforms so this actually means
the BIOS CM, correct?

However, on S4 we actually do reset host router when the "boot kernel" is
started before loading and jumping to the hibernation image. It might be
that this boot kernel tunnel configuration is causing the issues you are
seeing (can you elaborate on those?) but given that it is (typically the
same kernel binary) it should be creating the tunnels the same way.

> 
> v1:
> Link: https://lore.kernel.org/linux-usb/20251023050354.115015-1-superm1@kernel.org/
> 
> Mario Limonciello (AMD) (2):
>   thunderbolt: Move nhi_reset before pmops declaration
>   thunderbolt: Reset NHI during S4 restore_noirq() callback
> 
>  drivers/thunderbolt/nhi.c | 77 ++++++++++++++++++++++-----------------
>  drivers/thunderbolt/tb.c  | 29 ++++++++-------
>  drivers/thunderbolt/tb.h  |  1 +
>  3 files changed, 61 insertions(+), 46 deletions(-)
> 
> -- 
> 2.43.0

