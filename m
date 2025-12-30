Return-Path: <linux-usb+bounces-31829-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 226E5CE8E57
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 08:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 270283013964
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 07:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5731A270545;
	Tue, 30 Dec 2025 07:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RN6C2mnX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908972110;
	Tue, 30 Dec 2025 07:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767079817; cv=none; b=FgzaI3IgrO8kHIwyuMgnBP/AFGtF4jLJSLGI3EGoLw8k7mpMNUmkbwVRp3qijiOhu5ApLld4BUDlgtS5iGgWxnLVbQ3kTeSvx4rnpHMr5eqBzBylP1A8eJ0QiUZw5upbQ7D6xdvCFF3RKtT45UZd/ZrIgeE74zxWtJJBS1Ah7Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767079817; c=relaxed/simple;
	bh=7ygs96puQUaMEOUky0TFPUSPyjLxDnk8XZcEeoq7OYk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jArr+Zi+KEXPSrDwKQ+Fp9zRDLk1IPwUiT4AuSgc/1WnLfugJotr/U5OGjl5z2OksaitdMVQxwAcakKt6XaUlHch+1/gcUXKQGEFoZQwozooGSUBZ0TH3y7IhoAqYcLVL7Mafq6naJY1euKULj4RFvtiQV92Pgc+v1oIL7JrkY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RN6C2mnX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767079816; x=1798615816;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=7ygs96puQUaMEOUky0TFPUSPyjLxDnk8XZcEeoq7OYk=;
  b=RN6C2mnXp6JYr832h7uFS5ckaB/eOHU9KDycwc7+46QoSO6hpK0XldIV
   ThRnzbb02RFq+FdRt39blZbK3cA/NgK6N/Q3qQHqAoE5Pc6kcgkXpDo7K
   spKmSwvq0J91iQRbg+zFfRwAXsjgeL0iS5RkHMFL/3QOwGwYpPEW4Ypgm
   BPtHPlmm22d4EQhxtTu/xXEqhqkzhp1r7QmC3tgBarpg7qucBim6wmvxY
   3WcIzBHzn5lbwVJmxocEEqCHoYCfPNe1EUP4QNVN2pHxN1l9ZgyMOPIvU
   IGbNhAUObDPezL9ndXRRevb55hBcGkqky7mJvQh+7ROePnE5lqsAD5l+B
   w==;
X-CSE-ConnectionGUID: EoM0vrjoSie9tAas8O6IXg==
X-CSE-MsgGUID: 4CzgPicuSs2XdXlNZgWh/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68744095"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="68744095"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 23:30:15 -0800
X-CSE-ConnectionGUID: TYEiyWJoSRuFldqCWnWqUg==
X-CSE-MsgGUID: 81khnhIqRwimFqTXN/0YxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="205680926"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 29 Dec 2025 23:30:13 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 923CD8E; Tue, 30 Dec 2025 08:30:11 +0100 (CET)
Date: Tue, 30 Dec 2025 08:30:11 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sanath.S@amd.com,
	"Lin, Wayne" <Wayne.Lin@amd.com>
Subject: Re: [PATCH] [RFC] thunderbolt: Add delay for Dell U2725QE link width
Message-ID: <20251230073011.GD2275908@black.igk.intel.com>
References: <20251212123941.GK2275908@black.igk.intel.com>
 <484ff606-ec10-477c-acfe-d4d781e2873d@amd.com>
 <CAFv23Q=bLCif750y8eDEP4J+KwVy8CknZawYOGZWWrBSiE8FNA@mail.gmail.com>
 <20251217125507.GR2275908@black.igk.intel.com>
 <5d7f2661-f02b-4985-b438-196b48c10237@amd.com>
 <CAFv23QknLmZkC9Fc0FTFKCofngRUQipw4hGVG_P2k+TUb=KOeA@mail.gmail.com>
 <20251218072125.GU2275908@black.igk.intel.com>
 <6inne3luvw4ot3wqnsaw3gzhlxtd4756i465oto6so5ox3syxp@kibuv4vhvexx>
 <20251218102021.GV2275908@black.igk.intel.com>
 <wqc6xvaeebqb5skiba3gpekdpmf3yz2zk3maeqprdtdpglvhww@za2efpacwhzo>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <wqc6xvaeebqb5skiba3gpekdpmf3yz2zk3maeqprdtdpglvhww@za2efpacwhzo>

On Mon, Dec 22, 2025 at 09:33:48AM +0800, Chia-Lin Kao (AceLan) wrote:
> On Thu, Dec 18, 2025 at 11:20:21AM +0100, Mika Westerberg wrote:
> > On Thu, Dec 18, 2025 at 03:35:05PM +0800, Chia-Lin Kao (AceLan) wrote:
> > > > Now since USB 2.x has its own wires in Type-C cable this tells me that
> > > > there is some real problem with the connection. Have you tried different
> > > > cables already?
> > > Here is the log I got with another tbt4 cable.
> > > I'm using the kernel with Mario suggests modification.
> > > 
> > > https://people.canonical.com/~acelan/bugs/tbt_call_trace/intel/merged_6.18.0-d358e5254674+.patched2.2_new_cable.out
> > 
> > Here I see (assuming I read it right) that the USB 2.x enumerates only
> > after the first unplug:
> > 
> > [   28.589861] usb 3-2: New USB device found, idVendor=1d5c, idProduct=5801, bcdDevice= 1.01
> > [   28.589864] usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> > [   28.589865] usb 3-2: Product: USB2.0 Hub
> > [   28.589866] usb 3-2: Manufacturer: Fresco Logic, Inc.
> >From the logs, sometimes this hub is enumerated before the call trace
> and then enumerated again after the call trace.
> 
> And I also found there are some suspicious USB disconnections while
> plugging in the tbt monitor.
> 
> I tried to avoid the USB disconnection by the following modification,
> but still no luck.

Okay but I think this is not a SW issue, rather an issue with that
particular monitor/cable/connection/PD. It is not just the USB4 link that
goes down it's the whole type-C connection therefore something is wrong on
the electrical side of things (well at least it seems so).

Dell also typically validate that their stuff works in Linux so I would
expect to got some report from them if that's not the case (unless you are
doing just that ;-))

Have you tried this same monitor with Windows? Do you see the same issue
there? I would expect so.

