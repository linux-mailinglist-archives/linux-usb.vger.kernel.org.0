Return-Path: <linux-usb+bounces-32794-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JxGObSQeGmarAEAu9opvQ
	(envelope-from <linux-usb+bounces-32794-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 11:17:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8AB929B3
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 11:17:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 283C7300380A
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 10:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A8D2FD69B;
	Tue, 27 Jan 2026 10:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T5bthBv5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF2F2FD68D;
	Tue, 27 Jan 2026 10:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769509038; cv=none; b=WJzPWPlaG2XsSuZRxkQKUU1RChNz2v2VcQHmT795CSCC5nB8Q0sagAE4y6jDkmwINo2Y3voTpeWlsh2JnGFpArJnGfbpdvEdsldu9U+dBtonoyXjQMUxAMcj7sFrb3F8A0loG93TOEvKJP3hTA3B1Ornn8Qh7rryGKA4j6Y213c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769509038; c=relaxed/simple;
	bh=PrR8vMRbyp+E9yXQ2WimHpfLjRywIuvrQ8sYfKLa5/c=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0YBSzv1Q8KyH2VoXJrsENDhsypr1iCnjrNvvajiXSYg+txbJSXiX0Ubf/9hHT2garnuUSiTU9zFUexwLFlyrhuzRzrvcNlaQ4kBvLC2U8ykXqNPiOOTliyte1OWTC0wfALRHPTA6UJl6b98IW2F3VnCa+Fup5MSkDFnnoWEw24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T5bthBv5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769509037; x=1801045037;
  h=date:from:to:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=PrR8vMRbyp+E9yXQ2WimHpfLjRywIuvrQ8sYfKLa5/c=;
  b=T5bthBv5vAxgL1mj0e8AatPQUZtz7N5rxZZRShnWq2VBZkEmbWclry1S
   qlLna32MblMy+gzkiI35IVPDcWR9uWp2HN+FvCvJ/8W21g+Cx/KR2aYED
   nb5f5ZOeaSme1aPXRe0PcnnlmwV09bp4ayIkGFaUbut/XHLowxDKfhDU1
   x/j+12+wz7ANGLmM1RaqdlQkED/qfUiQ6BAi7PQXEpQXwxBDdBBt6Tjvs
   DoXqqGWw8XathGWtLG05CDKVHkVtU/BqvQ3IV3AaHu1syjtC1nMKLkypp
   Pq79sFYCc89r7nlgm7F/4zbgdcGRHvmcJRuceFJgJ+0RK4nUk4wnA0uuX
   g==;
X-CSE-ConnectionGUID: U9lWTSefRpCw9Sa5jmaayA==
X-CSE-MsgGUID: VgSFSItQR2i1ZIefg+JejA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="74545072"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="74545072"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 02:17:05 -0800
X-CSE-ConnectionGUID: /jpESvQeSQiVVTTUpzSRuQ==
X-CSE-MsgGUID: uyHAH1DoRey7g4hjKGvmXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207562022"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 27 Jan 2026 02:17:03 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id CF9DE98; Tue, 27 Jan 2026 11:17:01 +0100 (CET)
Date: Tue, 27 Jan 2026 11:17:01 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Gil Fine <gil.fine@linux.intel.com>
Subject: Re: [PATCH] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
Message-ID: <20260127101701.GI2275908@black.igk.intel.com>
References: <20260121052744.233517-1-acelan.kao@canonical.com>
 <20260121060142.GJ2275908@black.igk.intel.com>
 <aXLM5vk0gDNjLPyY@acelan-Precision-5480>
 <20260123120112.GQ2275908@black.igk.intel.com>
 <aXbTfLUJ-lEfNzgX@acelan-Precision-5480>
 <20260126054231.GR2275908@black.igk.intel.com>
 <aXcWNw9Qfo5L9WVi@acelan-Precision-5480>
 <20260126115654.GS2275908@black.igk.intel.com>
 <aXg1eBudRAaCZpmR@acelan-Precision-5480>
 <20260127084513.GC2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260127084513.GC2275908@black.igk.intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32794-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[canonical.com,gmail.com,kernel.org,vger.kernel.org,linux.intel.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[black.igk.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 8C8AB929B3
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 09:45:13AM +0100, Mika Westerberg wrote:
> On Tue, Jan 27, 2026 at 01:04:20PM +0800, Chia-Lin Kao (AceLan) wrote:
> > On Mon, Jan 26, 2026 at 12:56:54PM +0100, Mika Westerberg wrote:
> > > On Mon, Jan 26, 2026 at 03:48:48PM +0800, Chia-Lin Kao (AceLan) wrote:
> > > > On Mon, Jan 26, 2026 at 06:42:31AM +0100, Mika Westerberg wrote:
> > > > > On Mon, Jan 26, 2026 at 11:30:47AM +0800, Chia-Lin Kao (AceLan) wrote:
> > > > > > Hi,
> > > > > > On Fri, Jan 23, 2026 at 01:01:12PM +0100, Mika Westerberg wrote:
> > > > > > > Hi,
> > > > > > >
> > > > > > > On Fri, Jan 23, 2026 at 10:04:11AM +0800, Chia-Lin Kao (AceLan) wrote:
> > > > > > > > > Can you comment out call to tb_switch_xhci_connect() and see if that
> > > > > > > > > changes anything?
> > > > > > > >
> > > > > > > > Here is what I modified, and the problem becomes a little bit complicated.
> > > > > > >
> > > > > > > Okay I see it did not change anything (well this is kind of what I
> > > > > > > expected). Thanks for trying.
> > > > > > >
> > > > > > > I see in your log that the PCIe tunnel is established just fine. It's just
> > > > > > > that there is no PCIe hotplug happening or it is happening but the PCIe
> > > > > > > Downstream Port is not waking up.
> > > > > > >
> > > > > > > I figured you have following USB4/TB topology, right?
> > > > > > >
> > > > > > >   AMD Host <-> GR Hub <-> TB3 Hub
> > > > > > >                   ^
> > > > > > >                   |
> > > > > > >                 TB3 Hub
> > > > > > Should be more like this
> > > > > >   AMD Host <-> Dell TB4 Dock <-> OWC Envoy Express (1-502)
> > > > > >                              \
> > > > > >                               <-> OWC Envoy Express (1-702)
> > > > > > or
> > > > > >   AMD Host (1-0, domain1)
> > > > > >       |
> > > > > >       └─ Port 2 ──→ Dell Thunderbolt 4 Dock (1-2)
> > > > > >                       ├─ Port 5 ──→ OWC Envoy Express (1-502)
> > > > > >                       └─ Port 7 ──→ OWC Envoy Express (1-702)
> > > > >
> > > > > Okay so the same ;-)
> > > > >
> > > > > > > What if you run 'lspci' after the issue reproduces? Does that bring the
> > > > > > > missing PCIe devices? I suspect that this is due to older TB3 devices that
> > > > > > > they may need bit more time to get the PCIe link (going over the tunnel) up
> > > > > > > and running.
> > > > > > lspci doesn't bring back the missing tbt storage.
> > > > >
> > > > > Forgot to mention that let it (the whole topology) enter runtime suspend
> > > > > before you run lspci.
> > > >
> > > > https://people.canonical.com/~acelan/bugs/tbt_storage/dmesg_lspci.log
> > > >
> > > > The behavior is strange, the following 3 devices keep entering D3cold and then comes back
> > > > to D0 quickly. So, I'm not sure if the lspci do the actions you want.
> > >
> > > Yes. I should have mentioned so the lspci is there exactly to trigger
> > > runtime resume of the topology. I was hoping the PCIe links get
> > > re-established properly then.
> > >
> > > Can you do so that you:
> > >
> > > 1. Plug in the dock.
> > > 2. Plug in the other storage to the dock.
> > > 3. Block runtime PM from the PCIe Downstream Port that should lead to the
> > >    second storage device PCIe Upstream Port
> > >
> > >  # echo on > /sys/bus/pci/devices/DEVICE/power/control
> > >
> > > 4. Connect the second storage device and enable PCIe tunnel.
> > >
> > > Does that make it work each time?
> > Yes, follow the steps makes it work.
> > 
> >    echo on | sudo tee /sys/bus/pci/devices/*/*/power/control
> > 
> > Re-plug the dock, need to disable the runpm again.
> 
> But can you just block it from the PCIe Downstream Port that leads to the
> "non-working" storage before you enable PCIe tunnel? Not for all the
> devices.
> 
> (let me know if you want help locating the correct device).
> 
> Does it still work?

(+Gil)

There is also one patch that fixes the driver to follow more closely the CM
guide and that's related to the PCIe tunneling and may actually explain the
issue you see:

  https://lore.kernel.org/linux-usb/20260127094953.GF2275908@black.igk.intel.com/

Note it only does that for USB4 routers so you may need to tune that so
that it skips that check but there is complication because IIRC LTTSM bits
do not match the USB4 ones. One thing to try is to just check the USB4 PCIe
adapter side that it is in detect.

Second thing to try is to disable PCIe ASPM L1. We can do that from CM side
like we do already in tb_switch_pcie_l1_enable(). If possible you can try
so that you disable it from the BIOS (but don't use the pcie_aspm=  command
lne parameter).

