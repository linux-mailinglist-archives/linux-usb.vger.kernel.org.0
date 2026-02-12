Return-Path: <linux-usb+bounces-33309-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKMrDomCjWkw3gAAu9opvQ
	(envelope-from <linux-usb+bounces-33309-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 08:34:33 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEF512AF6E
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 08:34:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBC8B3080124
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 07:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49012BE7DF;
	Thu, 12 Feb 2026 07:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RoSUxrmo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E394C81;
	Thu, 12 Feb 2026 07:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770881665; cv=none; b=crBVYrbv7qf/uCQlRsJA2RDU9yC5c326+ZLEOH704LpzjTn1wA3MkoeaN3Yyp89YUb93j3QKBC39ddRl68jS7z0GfJiIwZVkFChYv+Ryf8OdS0TlxA61yrKHHx8h7XnZuV/OE5cO108jlJpFXJb0QjRhB8M610cWWg9JDqiq96g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770881665; c=relaxed/simple;
	bh=trjdlB7QIoNDG43MqvYBR5hPXLxWmQO+5CsUv62XGD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sOuLfDTrzNYj+VpQ3kC23o9Ya4TZyBcYWcUzeThUPCoUxgM4wWPscTfRjq55bMDxE6/X5UoBRPDJz9Uk1ZfDZIVuUL4hzpEg53+cLnrThwWIWWdvwK0ym7V/A8D2urQq5BHCzBqBolC3czIxVwgs+XnABfI5jN0qA4Xtbu3wz+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RoSUxrmo; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770881663; x=1802417663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=trjdlB7QIoNDG43MqvYBR5hPXLxWmQO+5CsUv62XGD8=;
  b=RoSUxrmowmoUno5rVDic43l6EOBtt9BZlh1weLSiKxx5f5THelaBZylb
   Eek8vWXrp60WNSAHE4vvQF0Mwig64EtixphNTzL0WfYaCbQ7GH39uL1YV
   3t7zWu+d5kVdtrahCCqUHyj+uaohWurmLfTU4E53hPlaomwPiDLxNv2Um
   WsAXH+McTYWKov3lDIeSZgjMgYZI3OKb3vvmY+0Nuob0IokNTwukTUrj3
   LlQilAFPA5gGVGV0bZWPf2Nq+/TQKzGiFhP9bhvffANTZr1mFE71eU5+L
   Z/vh4eXGJuuVlqfC6kD1Jo6k/pEKujDRN7yqEjrKOWrxPvwx9QslcwJJH
   Q==;
X-CSE-ConnectionGUID: V3Lw4xrvS9qXYlw0SQYhrg==
X-CSE-MsgGUID: nPg2RopESxWKifPYRQI4iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="59619737"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="59619737"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 23:34:23 -0800
X-CSE-ConnectionGUID: LOuCWCLRSxaPfOJZsH49cw==
X-CSE-MsgGUID: 6dHaiFcnT+yvLCe1Pa2HOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="211796286"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 11 Feb 2026 23:34:21 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 7217098; Thu, 12 Feb 2026 08:34:19 +0100 (CET)
Date: Thu, 12 Feb 2026 08:34:19 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Gil Fine <gil.fine@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>, Sanath.S@amd.com
Subject: Re: [PATCH] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
Message-ID: <20260212073419.GG2275908@black.igk.intel.com>
References: <20260126054231.GR2275908@black.igk.intel.com>
 <aXcWNw9Qfo5L9WVi@acelan-Precision-5480>
 <20260126115654.GS2275908@black.igk.intel.com>
 <aXg1eBudRAaCZpmR@acelan-Precision-5480>
 <20260127084513.GC2275908@black.igk.intel.com>
 <20260127101701.GI2275908@black.igk.intel.com>
 <aXrZK-WigVeqxBTT@acelan-Precision-5480>
 <20260129065003.GS2275908@black.igk.intel.com>
 <CAFv23QkN1ypnMq0VwmUbfrxcyqihM1G8Ga3sgiTOWT5rtRnSmA@mail.gmail.com>
 <20260212070754.GF2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260212070754.GF2275908@black.igk.intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,linux.intel.com,amd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33309-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: BFEF512AF6E
X-Rspamd-Action: no action

[+Cc AMD folks]

On Thu, Feb 12, 2026 at 08:07:54AM +0100, Mika Westerberg wrote:
> On Thu, Feb 12, 2026 at 12:16:03PM +0800, AceLan Kao wrote:
> > > > Disable runpm on 62:02.0, then we have 83:00.0 and its downstream port
> > > > 84:01.0 and 85:00.0, and then the tbt storage is recognized.
> > Got troubles with mutt, my reply got rejected :(
> > 
> > Using gmail and copy/paste the content below again.
> 
> Okay.
> 
> > > Okay that means there is nothing wrong with the PCIe tunnel itself it's
> > > just that the PCIe side either does not get the PME or does not see that
> > > the PCIe link becomes active (e.g the PCIe Downstream Port runtime suspends
> > > itself before the link status changes).
> > >
> > > PME work so that there is wake first on Intel it's GPE that wakes up the
> > > root port and then PCIe stack wakes up devices and then the PME message is
> > > sent to the root complex.
> > >
> > > If you do this on Intel host do you see the same?
> > Intel host exhibits another symptom, I think the root cause is different.
> > 
> > Plug in the dock, and then plug in the tbt storage to the dock one by
> > one, both storage can be detected.
> > 
> > Plug both tbt storage to the dock, and then plug in the dock to the
> > machine, only one tbt storage appears. In rare chance, both tbt
> > storages show up, but most of the time, only one tbt storage is detected.
> > In this case, none of disable runpm, rescan, or lspci work. So, it's
> > most likely another issue.
> 
> By "detected" you mean the TB device is not detected on TB bus? Or it is
> detected on TB bus but creating PCIe tunnel does not make the content
> visible on PCIe bus?
> 
> You can check this from dmesg, the driver logs if it sees the plug event.
> Or run tblist (from tbtools) and see if the device is listed.
> 
> I suspect former and in that case it is likely a PD/retimer related issue
> rather than software. I see these once in a while especially with new
> hardware where the PD firmare is not yet stabilized. If there is TB/USB4
> link then all is working from TB/USB4 perspective.
> 
> > > Right at that point the PCIe Downstream Port probably is already back
> > > runtime suspended.
> > >
> > > Here you could try this:
> > >
> > > # echo 250 > /sys/bus/pci/devices/0000:62:02.0/power/autosuspend_delay
> > No luck, I enlarged the number to 1000, but still can't recognize the
> > second tbt storage.
> 
> What about -1?
> 
> That's effectively same as blocking runtime PM completely so should work.
> 
> > I tried to wake up the PCIe ports in the beginning of tb_tunnel_pci() and
> > it works.
> > 
> > +       pdev = pci_get_domain_bus_and_slot(0, 0x62, PCI_DEVFN(0x02, 0));
> > +       if (pdev) {
> > +               if (pdev->dev.power.runtime_status == RPM_SUSPENDED)
> > +                       pm_runtime_get_sync(&pdev->dev);
> > +               pci_dev_put(pdev);
> > +       }
> > 
> > But I can't find a generic way to get the bus and slot number, and
> > would you consider this a feasible approach?
> 
> No I don't want any (more) PCI related hacks in the driver.
> 
> This is not a TB issue, it's a PCIe issue. I suspect it has something to do
> with handling PME/GPE on AMD side. Essentially when runtime PM is blocked
> the PCIe hotplug driver notices the tunnel just fine. When it is runtime
> suspended (e.g D3) it should send PME to the root complex that the brings
> the topology up so that the hotplug driver can detect the presence but this
> does not seem to happen.
> 
> If you enable dynamic debugging of pciehp, do you see anything happening
> when you create the second PCIe tunnel? I suspect not.

