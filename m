Return-Path: <linux-usb+bounces-32721-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFPDCpRWd2nMeAEAu9opvQ
	(envelope-from <linux-usb+bounces-32721-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 12:57:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D8387E61
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 12:57:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CF5C3015877
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 11:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B4533064F;
	Mon, 26 Jan 2026 11:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GWKXaA9Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92F6315D22;
	Mon, 26 Jan 2026 11:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769428620; cv=none; b=AJZKEOgSbPNxL4HIZ0nwBZRjyVYbqJ0n9bIysBLjKoOwA1h9C2fVl65Fo51Bgw3gTV15fEdgP4XVTSRGtKgI2g7NDtBcn40WvreVSR8Uy0Ons4z03RkgPG451ug9KsfYTts5SLEcFr44PPz37fEA3cXU8kSL4JagYuW4D2n0hdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769428620; c=relaxed/simple;
	bh=N58oL110R1D9AsiAv8kOHF3tRFW6q+BX+eLuzjHYTko=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQZlqi3z55/L5yn7M1EznXLHLvY9kFp3GBNe8iSvJ0fsf5aGMC3IpP4SJpfr6Nw2Y2RoROsSy7J4RX/DNCuf27COSrs+7bEwusBZgKXh4j5agjKJLZ6079Su4VlNuo0U6Et/QbmAt7N8TN5GL1lUYn5rKYW75ZbuNIh9NVCEo9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GWKXaA9Y; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769428619; x=1800964619;
  h=date:from:to:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=N58oL110R1D9AsiAv8kOHF3tRFW6q+BX+eLuzjHYTko=;
  b=GWKXaA9YlOJyw7Qtl8rOs2N7c/nxd/PVIm6VTwguUn9hMF4wJbrb0qZ0
   smTm/+efwAiL6GXmDgZy/vOZ94wDR4r3RheyI8936rFjgJ/X1SBd0c65x
   XrGNMB9vR4NfJbGP6/qtBPIoqyawjhxyj2gYNdBAS0ScEgL6+FpdxX8cR
   MwZ1lqcHYgQ6t5qYN6E7s8K3J/VitDn866Hk0GZzr8FAw2rL/vRZZ7wxg
   JNfnZmU7ShyAt/6ey5XBrZBYDwxRpRDjZs6VY2bLb8Q93yjCsRwlJQ56O
   Eg1RdE+2Vzw6N4emkxTu6UxKLpLS8y1QE6vkb/1vR67kwBsrmT05cV7IQ
   w==;
X-CSE-ConnectionGUID: yDND2Ib+SjSKC0eq/x9YZQ==
X-CSE-MsgGUID: qecvzjRIRyuLH0aMbqhYqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70319460"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70319460"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 03:56:58 -0800
X-CSE-ConnectionGUID: Sawm8GbARUyopVg0yQcQtw==
X-CSE-MsgGUID: ia6i+vCARq6RaKzk68dtVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="207261638"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 26 Jan 2026 03:56:56 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id BD04695; Mon, 26 Jan 2026 12:56:54 +0100 (CET)
Date: Mon, 26 Jan 2026 12:56:54 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
Message-ID: <20260126115654.GS2275908@black.igk.intel.com>
References: <20260121052744.233517-1-acelan.kao@canonical.com>
 <20260121060142.GJ2275908@black.igk.intel.com>
 <aXLM5vk0gDNjLPyY@acelan-Precision-5480>
 <20260123120112.GQ2275908@black.igk.intel.com>
 <aXbTfLUJ-lEfNzgX@acelan-Precision-5480>
 <20260126054231.GR2275908@black.igk.intel.com>
 <aXcWNw9Qfo5L9WVi@acelan-Precision-5480>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXcWNw9Qfo5L9WVi@acelan-Precision-5480>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32721-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[canonical.com,gmail.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,canonical.com:url]
X-Rspamd-Queue-Id: 82D8387E61
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 03:48:48PM +0800, Chia-Lin Kao (AceLan) wrote:
> On Mon, Jan 26, 2026 at 06:42:31AM +0100, Mika Westerberg wrote:
> > On Mon, Jan 26, 2026 at 11:30:47AM +0800, Chia-Lin Kao (AceLan) wrote:
> > > Hi,
> > > On Fri, Jan 23, 2026 at 01:01:12PM +0100, Mika Westerberg wrote:
> > > > Hi,
> > > >
> > > > On Fri, Jan 23, 2026 at 10:04:11AM +0800, Chia-Lin Kao (AceLan) wrote:
> > > > > > Can you comment out call to tb_switch_xhci_connect() and see if that
> > > > > > changes anything?
> > > > >
> > > > > Here is what I modified, and the problem becomes a little bit complicated.
> > > >
> > > > Okay I see it did not change anything (well this is kind of what I
> > > > expected). Thanks for trying.
> > > >
> > > > I see in your log that the PCIe tunnel is established just fine. It's just
> > > > that there is no PCIe hotplug happening or it is happening but the PCIe
> > > > Downstream Port is not waking up.
> > > >
> > > > I figured you have following USB4/TB topology, right?
> > > >
> > > >   AMD Host <-> GR Hub <-> TB3 Hub
> > > >                   ^
> > > >                   |
> > > >                 TB3 Hub
> > > Should be more like this
> > >   AMD Host <-> Dell TB4 Dock <-> OWC Envoy Express (1-502)
> > >                              \
> > >                               <-> OWC Envoy Express (1-702)
> > > or
> > >   AMD Host (1-0, domain1)
> > >       |
> > >       └─ Port 2 ──→ Dell Thunderbolt 4 Dock (1-2)
> > >                       ├─ Port 5 ──→ OWC Envoy Express (1-502)
> > >                       └─ Port 7 ──→ OWC Envoy Express (1-702)
> >
> > Okay so the same ;-)
> >
> > > > What if you run 'lspci' after the issue reproduces? Does that bring the
> > > > missing PCIe devices? I suspect that this is due to older TB3 devices that
> > > > they may need bit more time to get the PCIe link (going over the tunnel) up
> > > > and running.
> > > lspci doesn't bring back the missing tbt storage.
> >
> > Forgot to mention that let it (the whole topology) enter runtime suspend
> > before you run lspci.
> 
> https://people.canonical.com/~acelan/bugs/tbt_storage/dmesg_lspci.log
> 
> The behavior is strange, the following 3 devices keep entering D3cold and then comes back
> to D0 quickly. So, I'm not sure if the lspci do the actions you want.

Yes. I should have mentioned so the lspci is there exactly to trigger
runtime resume of the topology. I was hoping the PCIe links get
re-established properly then.

Can you do so that you:

1. Plug in the dock.
2. Plug in the other storage to the dock.
3. Block runtime PM from the PCIe Downstream Port that should lead to the
   second storage device PCIe Upstream Port

 # echo on > /sys/bus/pci/devices/DEVICE/power/control

4. Connect the second storage device and enable PCIe tunnel.

Does that make it work each time?

