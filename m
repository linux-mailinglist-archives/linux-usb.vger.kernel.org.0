Return-Path: <linux-usb+bounces-31567-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D62BCCA9F7
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 08:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A88B3050355
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 07:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1118330B3B;
	Thu, 18 Dec 2025 07:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hcZMTk0P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833D3330B38;
	Thu, 18 Dec 2025 07:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766042491; cv=none; b=AQZVFy7xSc5BJKpDiBckjQFWVdv6QF7t47eW7v/JCBOBnaGDJqG+DnEsWMXifeLt0qPta2ldJZehnV7Dm0TnzRVi3RfbXLtE3rlyBYmopdmyatO22ju3qqeTWu2tcQzJFK2xszDzmIrFnqC70aHwv2e1DC9yrxv72SeiyKSorOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766042491; c=relaxed/simple;
	bh=NkEl97TzRICZPXVyX+EixiT/Gu6lVI7uY4VaNbEjNlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JqZJ9BIl1n+Qj2OjoVQdmTgWfQKmHEPoS7bZXnKJQqekRk5/eji2nsYEMaU14+Gla/9YNbFwzmeJRNpD3KX9mImnXI7dmjDMesi374quh3QlcLHj6iPDUL/tGq5r3iBWbUdeKeL7UNDd7HEJVNTy9Vy7gqxFgnmCItVlpXx85qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hcZMTk0P; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766042490; x=1797578490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NkEl97TzRICZPXVyX+EixiT/Gu6lVI7uY4VaNbEjNlw=;
  b=hcZMTk0PsW+yKlf5lhso1fbzO8M9JpoMGUNKnjZF+XMD5WaR6lvRVy+D
   bpVW/bYpzMBDIo3Zquo7+6UA0cOS9ga6pW4tGVsh2eqC8nU7+ypYjlbK6
   WV0W1O+pzUeoEdg8Ptt0wIvalOM6MgOTWSW5d32/YwjuC3Qdb740QbOJ6
   U9T5w02QF+hq59XHaT5fRmn+28QaKihtLPgEHNdqmK2GRu8/RB46IXypM
   +Qt9UtSvAuSR1wQkFqek7824EW47tXon42a5XFWkC33YmGawqUfMwErf0
   AbrQANYCbBwKNlO51kSI58KQxyhyDAp2P3Gd9K/Q3ONLHUa8tntwl8Clh
   w==;
X-CSE-ConnectionGUID: pPBC7Pp6T9qFNggXk4luPg==
X-CSE-MsgGUID: edLLxdSSQeyX7N6ivCjk0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="68144928"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="68144928"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 23:21:29 -0800
X-CSE-ConnectionGUID: RW5GlOssTgyxpkiJlNfUwQ==
X-CSE-MsgGUID: Zyk00UfJQhimmoxHGoJqew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="229208076"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 17 Dec 2025 23:21:27 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id C796D8E; Thu, 18 Dec 2025 08:21:25 +0100 (CET)
Date: Thu, 18 Dec 2025 08:21:25 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sanath.S@amd.com,
	"Lin, Wayne" <Wayne.Lin@amd.com>
Subject: Re: [PATCH] [RFC] thunderbolt: Add delay for Dell U2725QE link width
Message-ID: <20251218072125.GU2275908@black.igk.intel.com>
References: <pjn5d7oz433z4jph6whdalhowf652xknnk2fh5q7elffgb5ogo@7dtpvywxc6nw>
 <20251210074133.GE2275908@black.igk.intel.com>
 <4634177b-8ed1-4d65-9f3c-754d8c1eb828@amd.com>
 <coxrm5gishdztghznuvzafg2pbdk4qk3ttbkbq7t5whsfv2lk5@3gqepcs6h4uc>
 <20251212123941.GK2275908@black.igk.intel.com>
 <484ff606-ec10-477c-acfe-d4d781e2873d@amd.com>
 <CAFv23Q=bLCif750y8eDEP4J+KwVy8CknZawYOGZWWrBSiE8FNA@mail.gmail.com>
 <20251217125507.GR2275908@black.igk.intel.com>
 <5d7f2661-f02b-4985-b438-196b48c10237@amd.com>
 <CAFv23QknLmZkC9Fc0FTFKCofngRUQipw4hGVG_P2k+TUb=KOeA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFv23QknLmZkC9Fc0FTFKCofngRUQipw4hGVG_P2k+TUb=KOeA@mail.gmail.com>

Hi,

On Thu, Dec 18, 2025 at 09:38:13AM +0800, AceLan Kao wrote:
> > > +     /*
> > > +      * Scan for downstream retimers. We only scan them after the
> > > +      * router has been enumerated to avoid issues with certain
> > > +      * Pluggable devices that expect the host to enumerate them
> > > +      * within certain timeout.
> > > +      */
> > > +     tb_retimer_scan(port, true);
> Hi Mika,
> 
> This doesn't work.
> https://people.canonical.com/~acelan/bugs/tbt_call_trace/intel/merged_6.18.0-d358e5254674+.patched1.out

Okay thanks for trying. I noticed that there is also USB 2.x disconnect:

[    4.470610] usb 3-2: New USB device found, idVendor=1d5c, idProduct=5801, bcdDevice= 1.01
[    4.470618] usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    4.470620] usb 3-2: Product: USB2.0 Hub
[    4.470622] usb 3-2: Manufacturer: Fresco Logic, Inc.
...
[  104.699872] tb_tx Read Request Domain 0 Route 303 Adapter 0
               0x00/---- 0x00000000 0b00000000 00000000 00000000 00000000 .... Route String High
               0x01/---- 0x00000303 0b00000000 00000000 00000011 00000011 .... Route String Low
               0x02/---- 0x0400202c 0b00000100 00000000 00100000 00101100 ...,
                 [00:12]       0x2c Address
                 [13:18]        0x1 Read Size
                 [19:24]        0x0 Adapter Num
                 [25:26]        0x2 Configuration Space (CS) → Router Configuration Space
                 [27:28]        0x0 Sequence Number (SN)
[  104.700850] tb_event Hot Plug Event Packet Domain 0 Route 0 Adapter 3 / Lane
               0x00/---- 0x80000000 0b10000000 00000000 00000000 00000000 .... Route String High
               0x01/---- 0x00000000 0b00000000 00000000 00000000 00000000 .... Route String Low
               0x02/---- 0x80000003 0b10000000 00000000 00000000 00000011 ....
                 [00:05]        0x3 Adapter Num
                 [31:31]        0x1 UPG
[  104.700852] [763] thunderbolt 0000:00:0d.2: acking hot unplug event on 0:3

// Here we got the unplug to 0:3. After a while

[  106.844134] usb 3-2: USB disconnect, device number 14

Now since USB 2.x has its own wires in Type-C cable this tells me that
there is some real problem with the connection. Have you tried different
cables already?

