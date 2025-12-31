Return-Path: <linux-usb+bounces-31855-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F50CEB52B
	for <lists+linux-usb@lfdr.de>; Wed, 31 Dec 2025 07:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE4ED300C3C6
	for <lists+linux-usb@lfdr.de>; Wed, 31 Dec 2025 06:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814783101C5;
	Wed, 31 Dec 2025 06:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DfcsVcG7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD5617B418;
	Wed, 31 Dec 2025 06:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767161020; cv=none; b=BOqpJrqye2NpI1ipUaef5tiQ1nxaGDTJViKa0rKmC5UXtgGNF16B4HcQZs9FjC0T5bWJ1SGHAycedFOwJsjZcDoRaZwDr4jEJ8fh6fYR0S/hG5fd80319ucOKu4wVLRqKc/awEITEkjviz+dnGKqGG/WMpWJ1blkoxwCp30lxC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767161020; c=relaxed/simple;
	bh=JxKBMVA0V5En0PF99ldHeVfhN5tl7ryf6LylUk3YPH0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PbjiOTlUoxq/FXJ6gGY8hx631zX2xJoMD8hT0CZtX+LweuUiKb22jyd5w+9v/gNoCKNXDrAXh31AW0xim+mdsBEE+d8Tkx9WP7DictErDKwVsl5VwrdhvKy7n/avnbQg8fRSyHyoXmuMJJrPizjd9FOOKE3CGjidRejAEgetwec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DfcsVcG7; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767161018; x=1798697018;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=JxKBMVA0V5En0PF99ldHeVfhN5tl7ryf6LylUk3YPH0=;
  b=DfcsVcG7K19ZSQzMXtxfXDzan+TFShSWz6DqFnxi/CbSTVNb7CGDCLwM
   8qXcTEn+yro0ZLaddmGxuHzSZP7ZG39sKDMbTGaiNT0clQzRsEz24uyU9
   QK8/w7P0tYDloCKMK2FZww2K9O0AUV7B215QuRjUcrr8YCvkMfH8dp7bx
   x2Pc85XdXSfqu3uXv12AyZqtnNDbmhqSy68e0TRdfg/Q7uhTrViHxjg5f
   e1BO/ybHp6R+VOPFgTNK4fSeopVRqQoP6fmdJ8j+cNX7k2Zvsx14r5IPJ
   NlWtBQ0wEl8lbHyYnuw+iqcx7v9p2yM5I9F1CibDTIlZIp41xnn1TfMBW
   w==;
X-CSE-ConnectionGUID: Pk17Q9ItT9y+mEYAqe+/QQ==
X-CSE-MsgGUID: pVX1gueQQiK0W3HmhCVXJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="67931763"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="67931763"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 22:03:37 -0800
X-CSE-ConnectionGUID: aEnB+OVxTeqg19rv12ubhQ==
X-CSE-MsgGUID: qd1vSFf4RvWNYKmn2rAxyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="206254320"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 30 Dec 2025 22:03:35 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id AB9DC8E; Wed, 31 Dec 2025 07:03:33 +0100 (CET)
Date: Wed, 31 Dec 2025 07:03:33 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sanath.S@amd.com,
	"Lin, Wayne" <Wayne.Lin@amd.com>
Subject: Re: [PATCH] [RFC] thunderbolt: Add delay for Dell U2725QE link width
Message-ID: <20251231060333.GK2275908@black.igk.intel.com>
References: <CAFv23Q=bLCif750y8eDEP4J+KwVy8CknZawYOGZWWrBSiE8FNA@mail.gmail.com>
 <20251217125507.GR2275908@black.igk.intel.com>
 <5d7f2661-f02b-4985-b438-196b48c10237@amd.com>
 <CAFv23QknLmZkC9Fc0FTFKCofngRUQipw4hGVG_P2k+TUb=KOeA@mail.gmail.com>
 <20251218072125.GU2275908@black.igk.intel.com>
 <6inne3luvw4ot3wqnsaw3gzhlxtd4756i465oto6so5ox3syxp@kibuv4vhvexx>
 <20251218102021.GV2275908@black.igk.intel.com>
 <wqc6xvaeebqb5skiba3gpekdpmf3yz2zk3maeqprdtdpglvhww@za2efpacwhzo>
 <20251230073011.GD2275908@black.igk.intel.com>
 <7u6z5gp5ma2jg5zzxniupu4zuipjgxgnjydltx5cntikjtf3ww@qb62nuy7jsfk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7u6z5gp5ma2jg5zzxniupu4zuipjgxgnjydltx5cntikjtf3ww@qb62nuy7jsfk>

On Wed, Dec 31, 2025 at 09:33:15AM +0800, Chia-Lin Kao (AceLan) wrote:
> On Tue, Dec 30, 2025 at 08:30:11AM +0100, Mika Westerberg wrote:
> > On Mon, Dec 22, 2025 at 09:33:48AM +0800, Chia-Lin Kao (AceLan) wrote:
> > > On Thu, Dec 18, 2025 at 11:20:21AM +0100, Mika Westerberg wrote:
> > > > On Thu, Dec 18, 2025 at 03:35:05PM +0800, Chia-Lin Kao (AceLan) wrote:
> > > > > > Now since USB 2.x has its own wires in Type-C cable this tells me that
> > > > > > there is some real problem with the connection. Have you tried different
> > > > > > cables already?
> > > > > Here is the log I got with another tbt4 cable.
> > > > > I'm using the kernel with Mario suggests modification.
> > > > >
> > > > > https://people.canonical.com/~acelan/bugs/tbt_call_trace/intel/merged_6.18.0-d358e5254674+.patched2.2_new_cable.out
> > > >
> > > > Here I see (assuming I read it right) that the USB 2.x enumerates only
> > > > after the first unplug:
> > > >
> > > > [   28.589861] usb 3-2: New USB device found, idVendor=1d5c, idProduct=5801, bcdDevice= 1.01
> > > > [   28.589864] usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> > > > [   28.589865] usb 3-2: Product: USB2.0 Hub
> > > > [   28.589866] usb 3-2: Manufacturer: Fresco Logic, Inc.
> > > >From the logs, sometimes this hub is enumerated before the call trace
> > > and then enumerated again after the call trace.
> > >
> > > And I also found there are some suspicious USB disconnections while
> > > plugging in the tbt monitor.
> > >
> > > I tried to avoid the USB disconnection by the following modification,
> > > but still no luck.
> >
> > Okay but I think this is not a SW issue, rather an issue with that
> > particular monitor/cable/connection/PD. It is not just the USB4 link that
> > goes down it's the whole type-C connection therefore something is wrong on
> > the electrical side of things (well at least it seems so).
> If that's the case, would you agree to suppress the scary call trace
> like this?
> 
> diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
> index f9b11dadfbdd..ae7127eca542 100644
> --- a/drivers/thunderbolt/path.c
> +++ b/drivers/thunderbolt/path.c
> @@ -586,7 +586,18 @@ int tb_path_activate(struct tb_path *path)
>         tb_dbg(path->tb, "%s path activation complete\n", path->name);
>         return 0;
>  err:
> -       tb_WARN(path->tb, "%s path activation failed\n", path->name);
> +       /*
> +        * -ENOTCONN can occur during transient hardware states like lane
> +        * bonding or when the Type-C connection has electrical issues. The
> +        * hardware may automatically retry by reconnecting. Use a regular
> +        * warning instead of tb_WARN to avoid generating call traces for
> +        * these expected transient conditions.
> +        */
> +       if (res == -ENOTCONN)
> +               tb_warn(path->tb, "%s path activation failed (port not connected)\n",
> +                       path->name);
> +       else
> +               tb_WARN(path->tb, "%s path activation failed\n", path->name);
>         return res;
>  }

Yes please but make it unconditionally do tb_warn() instead of that
tb_WARN().

> > Dell also typically validate that their stuff works in Linux so I would
> > expect to got some report from them if that's not the case (unless you are
> > doing just that ;-))
> Currently, the issue could be reproduced on the AMD platform every
> time when plugging in the tbt monitor. We don't report the issue on
> Intel platform yet, because of it's low failrate.
> And the issue is not critical, as it can be recovered after
> re-enumerating the monitor.
> So maybe they won't bother you about this issue.

You only have one of those monitors? It would be good to check with another
if it has the same issue. I have GR reference device here which is what
this monitor is based on but I don't see any unplugs or link issues. I will
ask around if we have somewhere this monitor.

