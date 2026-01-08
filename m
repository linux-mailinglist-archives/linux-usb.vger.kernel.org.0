Return-Path: <linux-usb+bounces-32065-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 44824D02C75
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 13:57:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7043E3015AE4
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 12:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F093921F8;
	Thu,  8 Jan 2026 11:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/68Jo+g"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFEF47423C;
	Thu,  8 Jan 2026 11:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767872533; cv=none; b=gfvSZvzBhg6RlS9TcYeFfgrn142EfiVbPvlj4MBN+o6UST70POUkDvStzi7xoOj8vTiXJPsb3NzNnfDsMxqPvCBs2mVckepzSvwFy9LQonkH1hOH0tE6lZctJemFvRh9Ow5ryIvLVldDC8nxIybLDIuYAyhNAXdmWjd+iJl2E7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767872533; c=relaxed/simple;
	bh=VrrQ9OyAZHO8A4QSt7d+MDC2uDnPQjZfi0XTYitJt/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNfLrMWCNtdu/q41OkEsLZssAkPmV23SqqGSYKWOEcSMFLhDQjjS407lIoTDmSaPcMwM5zyE8ubBTTXQlBv2YHKAre20wsKxanTLoIBG9SdRuyE3yXtU+46M49AyfOI5h04cbMJkArZWxeg/FMeblFH8ceoT1nY+wPOrDpknDz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/68Jo+g; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767872530; x=1799408530;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VrrQ9OyAZHO8A4QSt7d+MDC2uDnPQjZfi0XTYitJt/Q=;
  b=G/68Jo+gj8ds/wfWeK84iPJvhxZMnTuclde7AS2evymXxwHnNuH7pzld
   IGe+Xv0RrytROboKRFdH+MlU0QzG254zRz8laVPUffyyBef8D8va8l21p
   0q6DrYidrtrX0Y5XJtHw5XwsPp7LIxeCcxC0D4noZUQuUpht6QE9QGVIO
   aoTpipKJs7iLF/o7uTyyJ1s4+gWEjHgvU58mLL0AGKjWBUL7LA0zaKPb9
   HdHjAYySul6ctj0T+//f4mETCr6sM13pipQiEpdJxk+Wnc5KLtCODeTsc
   9qR0YkvfGjTxPvmftM4n0JeZhh6I2h8FsbmuAMx7cw/+PyXedMcYshSQX
   w==;
X-CSE-ConnectionGUID: h19bAXfMR3626sbeGFGtfg==
X-CSE-MsgGUID: QM/7SlC/TVS/+Kk7ihsMOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="79548369"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="79548369"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 03:42:08 -0800
X-CSE-ConnectionGUID: MW3PkXmDQPup4yM7yOR0KA==
X-CSE-MsgGUID: tCUC+UaoQMelsXjy5gKGZQ==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 08 Jan 2026 03:42:07 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0148798; Thu, 08 Jan 2026 12:42:05 +0100 (CET)
Date: Thu, 8 Jan 2026 12:42:05 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
	linux-kernel@vger.kernel.org,
	Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Subject: Re: [PATCH v2 0/2] thunderbolt: Fix S4 resume incongruities
Message-ID: <20260108114205.GS2275908@black.igk.intel.com>
References: <20260106053749.61440-1-superm1@kernel.org>
 <20260107093353.GO2275908@black.igk.intel.com>
 <158442b3-28c2-4f8c-ba42-0b9c6661c650@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <158442b3-28c2-4f8c-ba42-0b9c6661c650@kernel.org>

On Wed, Jan 07, 2026 at 02:50:54PM -0600, Mario Limonciello wrote:
> On 1/7/26 3:33 AM, Mika Westerberg wrote:
> > Hi,
> > 
> > On Mon, Jan 05, 2026 at 11:37:47PM -0600, Mario Limonciello (AMD) wrote:
> > > When a machine is restored from S4 if the firmware CM has created
> > > tunnels there can be an incongruity of expectation from the kernel
> > > when compared to booting from S5.  This series addresses those.
> > 
> > I suspect there is no Firmware CM in AMD platforms so this actually means
> > the BIOS CM, correct?
> 
> That's correct.
> 
> > 
> > However, on S4 we actually do reset host router when the "boot kernel" is
> > started before loading and jumping to the hibernation image.
> 
> That's only if thunderbolt.ko is built into the kernel or is included in the
> initramfs before it does the pivot to the hibernation image.

Ah good point.

> At least in the tests we were doing it's not part of the boot kernel.
> 
> > It might be
> > that this boot kernel tunnel configuration is causing the issues you are
> > seeing (can you elaborate on those?)
> 
> The issues manifest "downstream" in the GPU driver.  There are a bunch of
> aux failures and a non functional display.  Tracing it back the GPU driver
> isn't alive at the time that the tunnels are attempted to be reconstructed
> at the moment and so CM tears DP tunnel down and then when GPU driver does
> come up it is not functional.
> 
> DP tunnel constructed at:
> 
> [  486.007194] thunderbolt 0000:c6:00.6: AUX RX path activation complete
> 
> First DPRx timeout at:
> 
> [  486.135483] thunderbolt 0000:c6:00.6: 0:6 <-> 2:13 (DP): DPRX read
> timeout
> 
> DP tunnel deactivating at:
> 
>  [  486.331856] thunderbolt 0000:c6:00.6: 0:6 <-> 2:13 (DP): deactivating

Hmm, we have dprx_timeout by default 12 seconds. How come it tears down the
tunnel already?

> 
> First DPRx DPCD reading starts at:
> 
> [  486.351765] amdgpu 0000:c4:00.0: amdgpu: [drm] DPIA AUX failed on
> 0xf0000(10), error 7

This would have maked it within the 12s if I read the timestamps right.

