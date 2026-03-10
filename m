Return-Path: <linux-usb+bounces-34377-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6D/wAM+ur2mrbgIAu9opvQ
	(envelope-from <linux-usb+bounces-34377-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 06:40:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ABB2457FA
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 06:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AF993062FA3
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 05:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A8129A9FE;
	Tue, 10 Mar 2026 05:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DTRPSB38"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25348266581;
	Tue, 10 Mar 2026 05:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773121223; cv=none; b=Vq/kcnNYrNX8bGHYNsrtJ2jhnDtYu2JK8qjKOBNbOwBgrl5H75jewQ97pq0Uyo1AGRFm2c+j8E5Y7lZJfEl04/eGoT2iL6wl873r3mWbGBtEDPUpYdgpF1Z7cr/A8kJQfk8w9Y2op0bErenRLwXzSDJ0rPI+8YMN6IFOb33rfWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773121223; c=relaxed/simple;
	bh=oCmkFYx6jHsQxR6l72E45Xj6tMXrGMZJWtqupt2O1e0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSM8lPhq7/8zym40A6nfuWL5NkicuCd2Y6bJWoupsBqV4k5cUbl7+rVCKWNmt9IiJd6AR181iZ22r8uQv7ImEqNTlFnROIW2+BEcaU54s769cyiv1CRwgHjShK/B78zGFJmuhkzooGoDp4N60hJjnT7TNWkGgjA8MXSbAvvvwjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DTRPSB38; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773121222; x=1804657222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oCmkFYx6jHsQxR6l72E45Xj6tMXrGMZJWtqupt2O1e0=;
  b=DTRPSB38tjr2GyEGl063IHXRfmaXrG1+f20N/jytdqM/8DTLigj+vByI
   S6TezKHJdVGtqPSL70kOVIjlqj84BidVt48VEGdNyr9ZfN6ADw4Op0gPt
   HRSTQp6eKBWdqRYMv6PnbF+rPMz7AP+Dqtfr49blM7K+cF/kXhcjXGU4K
   f1gnXtmT71WvUIxiMfXZfbjm1m/ALwM3C4Le/8f72GioFNwipVRknKI0S
   ncP08TALXtHtFctGAzE7OZXX751wsj3/QW6pW2WAwjkY9Ow5qiSBYKqkh
   dwnN4WV/LODb9cQuJzC3tO5T5rqQqQt32a94XmelfBGbpRuR6teE8oP3f
   w==;
X-CSE-ConnectionGUID: oCOwh/kITf6MUUPfrFfAtw==
X-CSE-MsgGUID: q7sEeHgJSlyIiu2q0geXLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="77765393"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="77765393"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 22:40:22 -0700
X-CSE-ConnectionGUID: N+JQc7yFRhaza2B4kFRHHQ==
X-CSE-MsgGUID: qHWgLmX6SpSyvY1mHc7egg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="216819981"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 09 Mar 2026 22:40:19 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5CFBB95; Tue, 10 Mar 2026 06:40:18 +0100 (CET)
Date: Tue, 10 Mar 2026 06:40:18 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [RFC/RFT PATCH 0/3] Prepwork for non-PCIe NHI/TBT hosts
Message-ID: <20260310054018.GS2275908@black.igk.intel.com>
References: <20260309-topic-usb4_nonpcie_prepwork-v1-0-d901d85fc794@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309-topic-usb4_nonpcie_prepwork-v1-0-d901d85fc794@oss.qualcomm.com>
X-Rspamd-Queue-Id: 57ABB2457FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34377-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,intel.com:dkim,black.igk.intel.com:mid]
X-Rspamd-Action: no action

Hi,

On Mon, Mar 09, 2026 at 11:32:58AM +0100, Konrad Dybcio wrote:
> Currently, the NHI driver (and other parts of the TBT framework) make
> multiple assumptions about the host router being a PCIe device. This
> series tries to decouple them by moving the 'struct pci_device' out of
> the NHI code and introduce NHI-on-PCIe-specific abstractions where
> necessary (with no functional change).
> 
> The intended usage of the new nhi_probe_common() is pretty similar to
> other bus frameworks (I2C, SPI, USB..), i.e.:
> 
> static int foo_bar_probe() {
> 	// get SoC-specifc resources (clks, regulators..)
> 
> 	// power things on
> 
> 	// set some implementation-specific registers
> 
> 	// register NHI and all the sub-devices
> 	ret = nhi_probe_common(&my_usb4->nhi)

nhi_probe() is the "common".

Then pci.c and platform.c call it once they have their resources sorted
out.

> 
> 	// cleanup boilerplate
> }
> 
> Instead of the previously-suggested aux/fauxbus, the NHI device remains
> the same 'struct dev' as the PCIe/platform/[...] device that provides
> it. This is in line with some other buses and it makes things easier
> from the PM perspective.
> 
> Compile-tested only for the PCIe case. The Qualcomm USB4 driver that
> leverages this patchset is unfortunately still work in progress and
> will be shared at a later time. Nonetheless, we need to get this
> non-PCIe topic sorted.

Wanted to mention that please make sure you test the next version on PCIe
platform properly. I can test smaller changes but more intrusive changes
like this the I don't really have the bandwidth. If Qualcomm is sponsoring
this work I'm sure they can find you a Intel/AMD machine that you can use
(a regular IT laptop typically has USB4 ports).

> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (3):
>       thunderbolt: Move pci_device out of tb_nhi
>       thunderbolt: Separate out common NHI bits
>       thunderbolt: Add some more descriptive probe error messages
> 
>  drivers/thunderbolt/Makefile    |   2 +-
>  drivers/thunderbolt/acpi.c      |  14 +-
>  drivers/thunderbolt/ctl.c       |  14 +-
>  drivers/thunderbolt/domain.c    |   2 +-
>  drivers/thunderbolt/eeprom.c    |   2 +-
>  drivers/thunderbolt/icm.c       |  25 +-
>  drivers/thunderbolt/nhi.c       | 494 ++++++---------------------------------
>  drivers/thunderbolt/nhi.h       |  32 +++
>  drivers/thunderbolt/nhi_ops.c   |  31 ++-
>  drivers/thunderbolt/nhi_pci.c   | 496 ++++++++++++++++++++++++++++++++++++++++
>  drivers/thunderbolt/nhi_pci.h   |  22 ++
>  drivers/thunderbolt/switch.c    |  41 +---
>  drivers/thunderbolt/tb.c        |  76 +-----
>  drivers/thunderbolt/tb.h        |  10 +-
>  drivers/thunderbolt/usb4_port.c |   2 +-
>  include/linux/thunderbolt.h     |   5 +-
>  16 files changed, 699 insertions(+), 569 deletions(-)
> ---
> base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
> change-id: 20260309-topic-usb4_nonpcie_prepwork-86881f769b8f
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

