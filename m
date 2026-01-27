Return-Path: <linux-usb+bounces-32782-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJKdOS97eGnBqAEAu9opvQ
	(envelope-from <linux-usb+bounces-32782-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 09:45:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6188891381
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 09:45:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DB0A3040016
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 08:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87472D1911;
	Tue, 27 Jan 2026 08:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DVKPzqhG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2222D5C83;
	Tue, 27 Jan 2026 08:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769503520; cv=none; b=PDt/iOwr7o61hxLZvAEx+8QOyd/K40r3ellJsrfnYYcgkCqa+BT5nPkxx522JB0P0Gc4PVdG83dCixQHc4xYeyhBhGiEi0hdGiGRE4dF2Kd7girJp+k+oeMTFuIPbQM4zopBLAkjZg0ZWSBbaOkS/HLlqqS4DhAE2X6yBwJMjXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769503520; c=relaxed/simple;
	bh=60J634UhmY24dez+WmmzPFx21iDa/73f6c3mbPY7XpY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUyAsxgQzgV1egNxzIghausdHuHXD+xsOw88x70OlW4k07nKvvAsD89He7NyrYPKLfUH25pzlNE2mITQ7KG7ngpRoMoXwO51yj+EJyg2xIuJ1JsSJvMz8PGrHUkU+3u5rirt1xOyLGRdrNzm6/Ay26P78UvSSGzlA6+snkVjaPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DVKPzqhG; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769503519; x=1801039519;
  h=date:from:to:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=60J634UhmY24dez+WmmzPFx21iDa/73f6c3mbPY7XpY=;
  b=DVKPzqhGm15oPv77M0WSXoaCX/RerDq0/MDTxCtYjdzcxt6PI1A9qa4W
   ReHNOVm7TN9hoLX1VnIhHXclGNxhvutxzY8ATSRCJzvjqR2LlYbFMA3/U
   0KeUIORGfVbazUfUqBbfLNK//KIkXh4QgDRV0/rODxPQxY3n+ouvOh2TK
   0zhcugBGWTFc0DoWjWtCa0vul7bGi9S4fwc3j8BXLyjyU0Fk8oxPWmI/l
   BMooLHcUoBu+sd+ivOA5gn5tzL5ztEmrS4ZJrx5J50GL9yQ3y/GXm1uY3
   b6IOVzPCe0MtlhFXbZ7IN6PeYxjOYPOgjebd11CvVP94/Xv+MAJitETqh
   w==;
X-CSE-ConnectionGUID: 8+PVzwkVTU2gk60qIMdVFg==
X-CSE-MsgGUID: 3ICzch5XRg2yW7gKGItzaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70751359"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70751359"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 00:45:16 -0800
X-CSE-ConnectionGUID: Bj6NYPmHQ+CvzViOzyBt3Q==
X-CSE-MsgGUID: BG2BPSHASW69E/CGpSFTLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207720031"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 27 Jan 2026 00:45:14 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1042B98; Tue, 27 Jan 2026 09:45:13 +0100 (CET)
Date: Tue, 27 Jan 2026 09:45:13 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
Message-ID: <20260127084513.GC2275908@black.igk.intel.com>
References: <20260121052744.233517-1-acelan.kao@canonical.com>
 <20260121060142.GJ2275908@black.igk.intel.com>
 <aXLM5vk0gDNjLPyY@acelan-Precision-5480>
 <20260123120112.GQ2275908@black.igk.intel.com>
 <aXbTfLUJ-lEfNzgX@acelan-Precision-5480>
 <20260126054231.GR2275908@black.igk.intel.com>
 <aXcWNw9Qfo5L9WVi@acelan-Precision-5480>
 <20260126115654.GS2275908@black.igk.intel.com>
 <aXg1eBudRAaCZpmR@acelan-Precision-5480>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXg1eBudRAaCZpmR@acelan-Precision-5480>
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
	TAGGED_FROM(0.00)[bounces-32782-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[canonical.com,gmail.com,kernel.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,canonical.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: 6188891381
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 01:04:20PM +0800, Chia-Lin Kao (AceLan) wrote:
> On Mon, Jan 26, 2026 at 12:56:54PM +0100, Mika Westerberg wrote:
> > On Mon, Jan 26, 2026 at 03:48:48PM +0800, Chia-Lin Kao (AceLan) wrote:
> > > On Mon, Jan 26, 2026 at 06:42:31AM +0100, Mika Westerberg wrote:
> > > > On Mon, Jan 26, 2026 at 11:30:47AM +0800, Chia-Lin Kao (AceLan) wrote:
> > > > > Hi,
> > > > > On Fri, Jan 23, 2026 at 01:01:12PM +0100, Mika Westerberg wrote:
> > > > > > Hi,
> > > > > >
> > > > > > On Fri, Jan 23, 2026 at 10:04:11AM +0800, Chia-Lin Kao (AceLan) wrote:
> > > > > > > > Can you comment out call to tb_switch_xhci_connect() and see if that
> > > > > > > > changes anything?
> > > > > > >
> > > > > > > Here is what I modified, and the problem becomes a little bit complicated.
> > > > > >
> > > > > > Okay I see it did not change anything (well this is kind of what I
> > > > > > expected). Thanks for trying.
> > > > > >
> > > > > > I see in your log that the PCIe tunnel is established just fine. It's just
> > > > > > that there is no PCIe hotplug happening or it is happening but the PCIe
> > > > > > Downstream Port is not waking up.
> > > > > >
> > > > > > I figured you have following USB4/TB topology, right?
> > > > > >
> > > > > >   AMD Host <-> GR Hub <-> TB3 Hub
> > > > > >                   ^
> > > > > >                   |
> > > > > >                 TB3 Hub
> > > > > Should be more like this
> > > > >   AMD Host <-> Dell TB4 Dock <-> OWC Envoy Express (1-502)
> > > > >                              \
> > > > >                               <-> OWC Envoy Express (1-702)
> > > > > or
> > > > >   AMD Host (1-0, domain1)
> > > > >       |
> > > > >       └─ Port 2 ──→ Dell Thunderbolt 4 Dock (1-2)
> > > > >                       ├─ Port 5 ──→ OWC Envoy Express (1-502)
> > > > >                       └─ Port 7 ──→ OWC Envoy Express (1-702)
> > > >
> > > > Okay so the same ;-)
> > > >
> > > > > > What if you run 'lspci' after the issue reproduces? Does that bring the
> > > > > > missing PCIe devices? I suspect that this is due to older TB3 devices that
> > > > > > they may need bit more time to get the PCIe link (going over the tunnel) up
> > > > > > and running.
> > > > > lspci doesn't bring back the missing tbt storage.
> > > >
> > > > Forgot to mention that let it (the whole topology) enter runtime suspend
> > > > before you run lspci.
> > >
> > > https://people.canonical.com/~acelan/bugs/tbt_storage/dmesg_lspci.log
> > >
> > > The behavior is strange, the following 3 devices keep entering D3cold and then comes back
> > > to D0 quickly. So, I'm not sure if the lspci do the actions you want.
> >
> > Yes. I should have mentioned so the lspci is there exactly to trigger
> > runtime resume of the topology. I was hoping the PCIe links get
> > re-established properly then.
> >
> > Can you do so that you:
> >
> > 1. Plug in the dock.
> > 2. Plug in the other storage to the dock.
> > 3. Block runtime PM from the PCIe Downstream Port that should lead to the
> >    second storage device PCIe Upstream Port
> >
> >  # echo on > /sys/bus/pci/devices/DEVICE/power/control
> >
> > 4. Connect the second storage device and enable PCIe tunnel.
> >
> > Does that make it work each time?
> Yes, follow the steps makes it work.
> 
>    echo on | sudo tee /sys/bus/pci/devices/*/*/power/control
> 
> Re-plug the dock, need to disable the runpm again.

But can you just block it from the PCIe Downstream Port that leads to the
"non-working" storage before you enable PCIe tunnel? Not for all the
devices.

(let me know if you want help locating the correct device).

Does it still work?

