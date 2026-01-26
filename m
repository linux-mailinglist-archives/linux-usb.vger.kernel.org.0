Return-Path: <linux-usb+bounces-32701-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ehauJdP+dmnzaAEAu9opvQ
	(envelope-from <linux-usb+bounces-32701-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 06:42:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E938D8431F
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 06:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBBFF300CC28
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 05:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF79D2367BA;
	Mon, 26 Jan 2026 05:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mLPgvQFq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B35225775;
	Mon, 26 Jan 2026 05:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769406156; cv=none; b=l/P19GrN7TXHhYp0viAeUzdx0I9xhAwQFV1uR2qRUUHcX6yTPD5F3skgcc75LYenQFw2xp0KcUoEu8aiYREBEMNhFtNRMKFFAFtBoQeh+bbXTQrIvTNGiSrl5M3c573s5/O9ZKCu09CSKoZdnxqNk3lPfkbNG7GuSUibHZhbo60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769406156; c=relaxed/simple;
	bh=w/y/7LzTdp7De6/fizDihNCiD2Z9EovoStWUvzY96HE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvNuZrY8S7vDHuMT5Htpn/ujI1cv9e1/0iu2HffxZmBgLN1/bg6gYTDUNmYtMULgM4TEiL8Qb/80dcGZN4/RufU7E9JNCP2ZYMZf+WQtgp4fd8V8C/OYuQn19xSSMnvhhu5/IZ7CiIWVsyyC/dK2hhtXziVUdX6liAw8blQMSnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mLPgvQFq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769406155; x=1800942155;
  h=date:from:to:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=w/y/7LzTdp7De6/fizDihNCiD2Z9EovoStWUvzY96HE=;
  b=mLPgvQFqJFS9q/6UzW8Q7DX9noXvrPIIwJ3i25cMTcijDGMWvzmGfy2V
   3lp9lUzV4u6LRqE5h/c0Jqj8G5B9zGiUb0Ny10tvdpppFzbCG43DjxIMy
   Gxu7hwSB7jCw5lIGdZ3TvhpswNkEWkVXxFxsIzBr6SxQWgQ1uNEnZ88mS
   nXUEUcFH/VVxoDYEKN5c/rrZvneuGGC+ZCqfG7in26pg0t+1enNz5+W7B
   U4wkbKGAd51PDSSkP5+dWQXZGRuFgpopgcnThvaMkL5gBY1ruVMq6k40V
   erh4VfsfLfNredmD3Q8WwSQ7I8DGQw7AcSYR01NHKgiVZsvEWkf3EHRk6
   g==;
X-CSE-ConnectionGUID: Wc7Le5WnR0W5cM6FigyjrA==
X-CSE-MsgGUID: aLvzxXGHSDGfNWaKLMxIyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="81691624"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="81691624"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 21:42:35 -0800
X-CSE-ConnectionGUID: FKN/lDYtRuSVdBegmDqJdg==
X-CSE-MsgGUID: gPKOyvQnSp2f04iBuuJJ9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="211691993"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 25 Jan 2026 21:42:33 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 8D8AA95; Mon, 26 Jan 2026 06:42:31 +0100 (CET)
Date: Mon, 26 Jan 2026 06:42:31 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
Message-ID: <20260126054231.GR2275908@black.igk.intel.com>
References: <20260121052744.233517-1-acelan.kao@canonical.com>
 <20260121060142.GJ2275908@black.igk.intel.com>
 <aXLM5vk0gDNjLPyY@acelan-Precision-5480>
 <20260123120112.GQ2275908@black.igk.intel.com>
 <aXbTfLUJ-lEfNzgX@acelan-Precision-5480>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXbTfLUJ-lEfNzgX@acelan-Precision-5480>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32701-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: E938D8431F
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 11:30:47AM +0800, Chia-Lin Kao (AceLan) wrote:
> Hi,
> On Fri, Jan 23, 2026 at 01:01:12PM +0100, Mika Westerberg wrote:
> > Hi,
> >
> > On Fri, Jan 23, 2026 at 10:04:11AM +0800, Chia-Lin Kao (AceLan) wrote:
> > > > Can you comment out call to tb_switch_xhci_connect() and see if that
> > > > changes anything?
> > >
> > > Here is what I modified, and the problem becomes a little bit complicated.
> >
> > Okay I see it did not change anything (well this is kind of what I
> > expected). Thanks for trying.
> >
> > I see in your log that the PCIe tunnel is established just fine. It's just
> > that there is no PCIe hotplug happening or it is happening but the PCIe
> > Downstream Port is not waking up.
> >
> > I figured you have following USB4/TB topology, right?
> >
> >   AMD Host <-> GR Hub <-> TB3 Hub
> >                   ^
> >                   |
> >                 TB3 Hub
> Should be more like this
>   AMD Host <-> Dell TB4 Dock <-> OWC Envoy Express (1-502)
>                              \
>                               <-> OWC Envoy Express (1-702)
> or
>   AMD Host (1-0, domain1)
>       |
>       └─ Port 2 ──→ Dell Thunderbolt 4 Dock (1-2)
>                       ├─ Port 5 ──→ OWC Envoy Express (1-502)
>                       └─ Port 7 ──→ OWC Envoy Express (1-702)

Okay so the same ;-)

> > What if you run 'lspci' after the issue reproduces? Does that bring the
> > missing PCIe devices? I suspect that this is due to older TB3 devices that
> > they may need bit more time to get the PCIe link (going over the tunnel) up
> > and running.
> lspci doesn't bring back the missing tbt storage.

Forgot to mention that let it (the whole topology) enter runtime suspend
before you run lspci.

> It's not about the timing issue, you can't get the tbt storage works
> with multiple re-plug. And after rescan, you can always get the tbt storage
> work after replug.
> 
> And reproduce the issue again by unplugging the 2 tbt storages, and
> then plugging them back in one by one. The second one will not be
> recognized. There is a hotplug event, but it just stops somewhere
> in the middle.

You mean the first one always works?

What if you connect them directly to the host, one by one?

