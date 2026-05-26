Return-Path: <linux-usb+bounces-38051-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 83QTOJYcFWoVSwcAu9opvQ
	(envelope-from <linux-usb+bounces-38051-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 06:07:50 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B443B5D08E0
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 06:07:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8637300AB19
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 04:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0E93AA1A9;
	Tue, 26 May 2026 04:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9f+M9Iz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1713914F5
	for <linux-usb@vger.kernel.org>; Tue, 26 May 2026 04:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779768461; cv=none; b=rWGZZcdu+5XZlG9Xr3GL7xj7x1htCLikZ+41ZMLhOz45RilAjrduVKg04phu1DbM8n9xV3+BtPSxnE9cV++knaZwI4VL3YptDv4bpiJ2RonJGGlxst8nupl0vK9XPhYDyHQw/KR19XbzpajkXFr6rhloCa6e3d/DQrtZIfI5nfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779768461; c=relaxed/simple;
	bh=U5AgSoSUrPZxHVhyiLcZ1CqPVz+lWUcyo3KrZplS3rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFC4dTm41KdyIXZNmiiw5Z3EfFWLHhmoICWC/Au2nsNSCXZAxHSN1uxN4kEi7I3y4N5YmRuaNotGHg8+tfFZ05L5apHalYA9GDMgmkZQEnuS5ynC2d7wjdbaDHSrnbhfYxUs0BxO3GK+NuRRrus1lhMbvR7jecf20bdA4o2O0KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9f+M9Iz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779768457; x=1811304457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U5AgSoSUrPZxHVhyiLcZ1CqPVz+lWUcyo3KrZplS3rc=;
  b=i9f+M9IzJWMA5lrKLcpRLwW276bM43J08INDCmXRmx+gviZT3rUF2v/N
   NEvNumfvM7tjpz1uiUflh1ZEFl4DkpDOFXurxup1IIs6GelWYYoouXd76
   Md/grNmlWoki4vTOoF0H4cL011iTkn+PXpghvXMLld+LlUc0g6xcYSzFA
   8hiEyFiNZyszj+KuRnLblNOkNBnxMgJT1yrYWJjQyV2YX5QAjMbd087ud
   dgrMv+ZMAwGQYTM+k0T6s93+Wiy/S1fqpJuQgMEBc0jlH5p/pOr3MCSP0
   Zk0BqmbrPj4cN59mnzWJBjQwaP3v9fGCXmC2T4ST24tOLX1a4fTbWDjvV
   Q==;
X-CSE-ConnectionGUID: UJfO5lULTQulhq+jzPz82g==
X-CSE-MsgGUID: ObfmudAQQuCNbw0ADKkQRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80427046"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="80427046"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 21:07:35 -0700
X-CSE-ConnectionGUID: stmTbPpDSIOabK1Og6SRsQ==
X-CSE-MsgGUID: kBEjiG0oS1i7R21xlg9tzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="240940322"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 25 May 2026 21:07:32 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 3C53695; Tue, 26 May 2026 06:07:32 +0200 (CEST)
Date: Tue, 26 May 2026 06:07:32 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: Sebastian Loscher <krang@krang.de>, linux-usb@vger.kernel.org,
	andreas.noever@gmail.com
Subject: Re: [BUG] thunderbolt: USB4 v2 TBGAA tunnel creation crash in TMU
 enhanced uni-directional mode
Message-ID: <20260526040732.GO8580@black.igk.intel.com>
References: <13787e02-75d9-8000-65d5-41434a0e817c@krang.de>
 <20260525044421.GI8580@black.igk.intel.com>
 <8c753210-e399-4ddf-8ca4-d250fd4af369@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8c753210-e399-4ddf-8ca4-d250fd4af369@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[krang.de,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38051-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B443B5D08E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Mon, May 25, 2026 at 05:22:35PM -0500, Mario Limonciello wrote:
> Hi,
> 
> A few nested comments below.
> 
> On 5/24/26 11:44 PM, Mika Westerberg wrote:
> > +Mario
> > 
> > Hi,
> > 
> > On Sat, May 23, 2026 at 06:43:06PM +0200, Sebastian Loscher wrote:
> > > Hi Mika and the Linux USB team,
> > > 
> > > I hope you are well. I am testing a new Thunderbolt 5 setup on a brand-new AMD
> > > Strix Halo system, and I have run into a reproducible hardware panic during the
> > > initial connection handshake.
> > > 
> > > I have gathered full dynamic debug traces and would appreciate your insight on
> > > whether this requires a specific hardware quirk.
> > > 
> > > This is my first report in such format ever, maybe big for me but please bare
> > > with me.
> > > 
> > > Hardware:
> > > 
> > > Host: Minisforum MS-S1 Max (AMD Strix Halo USB4 v2 controller)
> 
> Strix Halo doesn't have a USB4v2 router, but I believe this product has
> added a discrete USB4v2 router to some of the PCIe lanes on the Strix Halo
> APU.
> 
> > > 
> > > Dock: Minisforum eGPU dock (Vendor 0x41f, Device 0xd002, TBGAA controller)
> > > 
> > > Kernel: CachyOS (state your exact kernel version, e.g., 6.12-rcX)
> > > 
> > > The Issue:
> > > When plugging in the Thunderbolt 5 dock, the connection fails during USB3
> > > tunnel creation and drops entirely.
> > > 
> > > Using dyndbg="file drivers/thunderbolt/* +p", the trace shows the AMD host
> > > successfully shifting the dock into TB5 asymmetric routing (TMU: mode set to:
> > > enhanced uni-directional, MedRes). However, immediately after querying the NVM
> > > authentication status of the retimers (reading NVM authentication status of
> > > retimers), the dock suffers a hardware panic and physically drops the link
> > > (acking hot unplug event on 0:1).
> > > 
> > > The subsequent -107 and -71 PCIe/USB errors appear to be the Linux driver
> > > attempting to route through a connection the dock has already severed.
> 
> Can you reproduce your issue on the AMD routers too (these are the regular
> USB4 ones with PCI vendor 1022) or only on the USB4v2 ones?
> 
> You might need to look at the user guide for your device to see which USB-C
> ports these are connected to if it's not obvious from silkscreens.
> 
> I do know we have a bug report on kernel bugzilla about this eGPU dock
> misbehaving in Linux in lots of various ways.
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=221319
> 
> The most severe symptom is that when using an NV dGPU with the GSP loaded it
> causes a sync flood to the APU and the system reboots.
> 
> There are also reports of performance problems though which I was hoping
> were ASPM, but that turns out to not be the only problem.  I did start a
> discussion about that.
> 
> https://lore.kernel.org/linux-pci/20260504225246.480921-1-mario.limonciello@amd.com/
> 
> Maybe Mika and some others on this list have some further ideas.  It seems
> Windows and Linux are setting up something very differently.

We are investigating this NV one as well but so far no updates.

