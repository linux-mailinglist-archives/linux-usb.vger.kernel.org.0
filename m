Return-Path: <linux-usb+bounces-37335-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNVdMaMxA2oA1gEAu9opvQ
	(envelope-from <linux-usb+bounces-37335-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 15:56:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB38521C75
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 15:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7E778304A392
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 13:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E230C39D3C8;
	Tue, 12 May 2026 13:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G5awtIgz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2850E399D0E;
	Tue, 12 May 2026 13:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778594078; cv=none; b=Mr6dN5dPe4IUohv1Gj1/odvJzW563AKcEjoMgb1MAyx7W7cKODlpcjPVsJ1zN7f1ZRwjqJCmtrEdW1ok9fMRZv1pa3HyA6iDY+0z6LT8/6OWZV6JzriuxM8SEWizXz7/xBhb5HHKCBVogzW/baamwUZW6NK0OVOHzqovqB+b3zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778594078; c=relaxed/simple;
	bh=yHB4xESxAF1I5NczY8+WKqvB03T1wydjzNcP3U+IzDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHJ+enuP68CLRYfkixpmuYNhcAZiGSZieSCEYynZxN6f3fZ4Uv3efeLhI3RbLHIE5a7E7cwM/jWFV+lNPXX91PXDAA5QD4uaMw0DyfKC59sP4ANn0VSZbmVwZ7VKeaECtVUPjSvVNVvwTzWwtJmT6pWWOiLIKAb1WHKEPJpQFPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G5awtIgz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778594077; x=1810130077;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yHB4xESxAF1I5NczY8+WKqvB03T1wydjzNcP3U+IzDA=;
  b=G5awtIgz3HuBXWtFMkTsTOwaPVAkSY6M3LD4fx4oLAR//dNhxA8ab7qI
   XVxoQPFDyynIWGDQenNG7kKgHLy2VcgoeyvMXwJkc5lbZHVOQutpcBwCk
   9yFNkutfFmLK9sXpbF2ewFmltg3/M0M/r8xVMN4d7wbmVV2xM9I/gsxga
   fT4ShmLztP+s95+m94X2053ORwr5gG1nP9Fyv/NVcExl3783FOHYcwbdV
   bdDF8NBGuYqaC55e5J4C4MvnIYDNDnyhhgkOie3ynHyEkLL29wCt+5nev
   6qeUVvr/zk71jAFFin6fc8WQdYkSFmzGBOKN+QZH8DO+aAKrUjrcbNxzs
   Q==;
X-CSE-ConnectionGUID: gblT6YKfSRCmaHAhu3oxYw==
X-CSE-MsgGUID: 5zrbtjGIQ3OsH0cvLRgrpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="82068926"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="82068926"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 06:54:37 -0700
X-CSE-ConnectionGUID: TFyK7M7iStC/y5QMxthNDA==
X-CSE-MsgGUID: pRT1B+5sQi+oeVLsMPbOtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="237862605"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 12 May 2026 06:54:34 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1008F98; Tue, 12 May 2026 15:54:33 +0200 (CEST)
Date: Tue, 12 May 2026 15:54:33 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>
Subject: Re: [PATCH v2 2/4] thunderbolt: Separate out common NHI bits
Message-ID: <20260512135433.GD84797@black.igk.intel.com>
References: <20260428-topic-usb4_nonpcie_prepwork-v2-0-452fb9d63f77@oss.qualcomm.com>
 <20260428-topic-usb4_nonpcie_prepwork-v2-2-452fb9d63f77@oss.qualcomm.com>
 <20260504065402.GB6785@black.igk.intel.com>
 <7aab3f25-7609-499a-b701-8301719b9a82@oss.qualcomm.com>
 <20260512132008.GC84797@black.igk.intel.com>
 <80e0bd64-c99d-4dee-9417-3036f72658f2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <80e0bd64-c99d-4dee-9417-3036f72658f2@oss.qualcomm.com>
X-Rspamd-Queue-Id: 6CB38521C75
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37335-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,black.igk.intel.com:mid]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 03:43:12PM +0200, Konrad Dybcio wrote:
> On 5/12/26 3:20 PM, Mika Westerberg wrote:
> > On Tue, May 12, 2026 at 03:06:58PM +0200, Konrad Dybcio wrote:
> >> On 5/4/26 8:54 AM, Mika Westerberg wrote:
> >>> Hi,
> 
> [...]
> 
> >>>> +/*
> >>>> + * During suspend the Thunderbolt controller is reset and all PCIe
> >>>> + * tunnels are lost. The NHI driver will try to reestablish all tunnels
> >>>> + * during resume. This adds device links between the tunneled PCIe
> >>>> + * downstream ports and the NHI so that the device core will make sure
> >>>> + * NHI is resumed first before the rest.
> >>>> + */
> >>>> +bool tb_apple_add_links(struct tb_nhi *nhi)
> >>>
> >>> Okay you moved it here good. I think we can call it in nhi_pci_probe()
> >>> directly so no need to expose outside.
> >>
> >> Yeah that seems like a good idea. It's already there, behind N calls
> >> in the software CM case.
> >>
> >> Do we have to check the CM type though, or do you think it'd be fine
> >> to just call it unconditionally? (either because there are presumably
> >> no Apple machines with ICM or because these devlinks would be harmless?)
> > 
> > I think you can call it unconditionally. It only does something for TB1-2
> > Apple systems.
> > 
> > For Apple TB3 we used to start ICM firmware but this was changed as the
> > driver learned SW CM. However, we never setup any device links so this
> > would not change anything.
> 
> OK. I'm keeping tb_acpi_add_link() as-is, since that's both bus- and
> arch-independent.
> 
> However, doing just something like:
> 
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index cb5d028de3bc..f5ddc8ddb8bb 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -3327,7 +3327,7 @@ struct tb *tb_probe(struct tb_nhi *nhi)
>          * before the PCIe/USB stack is resumed so complain here if we
>          * found them missing.
>          */
> -       if (!tb_apple_add_links(nhi) && !tb_acpi_add_links(nhi))
> +       if (!tb_acpi_add_links(nhi))
>                 tb_warn(tb, "device links to tunneled native ports are missing!\n");
> 
> 
> diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
> index ca50e3584cac..e0abd1d503c5 100644
> --- a/drivers/thunderbolt/pci.c
> +++ b/drivers/thunderbolt/pci.c
> @@ -294,6 +294,8 @@ static int nhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  
>         pci_set_master(pdev);
>  
> +       tb_apple_add_links(nhi)
> +
>         return nhi_probe(&nhi_pci->nhi);
>  }
> 
> 
> Will cause the warning to show up. And adding something like
> `nhi->device_links_done` is a little ugly.. Ideas?

Ah in Qualcomm case? We are going to add tb_of_add_links() as well, right (or
something along thoese lines)? Then tb.c does:

       if (!tb_acpi_add_links(nhi) && !tb_of_add_links(nhi))
                 tb_warn(tb, "device links to tunneled native ports are missing!\n");

In the meantime it is okay to have that warn because we really do want to
have those links in place :)

