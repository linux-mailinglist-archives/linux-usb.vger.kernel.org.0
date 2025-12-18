Return-Path: <linux-usb+bounces-31575-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F275CCB666
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 11:34:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61C2C30A4228
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 10:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95ACE346AD2;
	Thu, 18 Dec 2025 10:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Md1ZYcsF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723A2346A08;
	Thu, 18 Dec 2025 10:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766053227; cv=none; b=BDFMDEznS8ENh/v+v5ZCvVNYlV4v6CcBoJrg7PebcfEltRCD9YLx9ChKyWHtPscoQaaUhwoNkoFamztudKqsJ2NT8/h2r9QFAwY8Wa/kRpabACU8khQuWCQFbkbWz1TKrck25JrfbMYf7OGdbxshfhO81M2XZoWw+LkSKjdqEK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766053227; c=relaxed/simple;
	bh=KoK7e/3h6e13eRjLuAuqEv/mD4f7/qd/2dnukRXwsk8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j++3AxY+0z7ws6CyqFOV/E1NqXQaa9vLwalItVPVcwlwNio4QBOgK5tpL7tzC0LTxJ+IE1doGyi9SIHZcl81fFDPrmIoVpQXu0PG7AxijQcDlErk+gvWMttn6bB4+rMcJzZCq4Mgv5dzu6Fb2U1rXwmxe3p64vUFfJhEplylbJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Md1ZYcsF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766053225; x=1797589225;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=KoK7e/3h6e13eRjLuAuqEv/mD4f7/qd/2dnukRXwsk8=;
  b=Md1ZYcsFD+2oAIhkZvKMVYRhjCccXlKarK+Vylt4W8VS0suWRFwp4m2+
   4T175COPhpqjnfMmh0T4KPZZww8AOIwLbkiEyOJF49VwpRbdBI4KDfEqw
   UdeFIL48tK7TagI5HvK661QJXSnd/ePkk32wwZeWgU4bxOgmgG9uxLPuq
   kENka1w+ub3yYHGrs0QVxm73wgRX+cmMq46foJt2YekNh73qVQsi4rb0B
   OvKibEVDgrW5+G3dUZhgVADK/L3TC9maNC9sRVim0fl4nfOY0DFANWfek
   L9/Rc09UXsHHidz/uqBgn5PmUuJafwXie6MrXNCahp4kvZ820iQbXyf0V
   A==;
X-CSE-ConnectionGUID: wGxJU3LhSiWyYvmOoSfH8A==
X-CSE-MsgGUID: 4X9PrKVKQJ6vK6ePJTwlfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="71862861"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="71862861"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 02:20:24 -0800
X-CSE-ConnectionGUID: WNrRx+wGQHOvpFpIW97cYg==
X-CSE-MsgGUID: 7A7Oo+JrRl6lFJLMb15ZpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="199380610"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 18 Dec 2025 02:20:22 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id AA21F8E; Thu, 18 Dec 2025 11:20:21 +0100 (CET)
Date: Thu, 18 Dec 2025 11:20:21 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sanath.S@amd.com,
	"Lin, Wayne" <Wayne.Lin@amd.com>
Subject: Re: [PATCH] [RFC] thunderbolt: Add delay for Dell U2725QE link width
Message-ID: <20251218102021.GV2275908@black.igk.intel.com>
References: <4634177b-8ed1-4d65-9f3c-754d8c1eb828@amd.com>
 <coxrm5gishdztghznuvzafg2pbdk4qk3ttbkbq7t5whsfv2lk5@3gqepcs6h4uc>
 <20251212123941.GK2275908@black.igk.intel.com>
 <484ff606-ec10-477c-acfe-d4d781e2873d@amd.com>
 <CAFv23Q=bLCif750y8eDEP4J+KwVy8CknZawYOGZWWrBSiE8FNA@mail.gmail.com>
 <20251217125507.GR2275908@black.igk.intel.com>
 <5d7f2661-f02b-4985-b438-196b48c10237@amd.com>
 <CAFv23QknLmZkC9Fc0FTFKCofngRUQipw4hGVG_P2k+TUb=KOeA@mail.gmail.com>
 <20251218072125.GU2275908@black.igk.intel.com>
 <6inne3luvw4ot3wqnsaw3gzhlxtd4756i465oto6so5ox3syxp@kibuv4vhvexx>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6inne3luvw4ot3wqnsaw3gzhlxtd4756i465oto6so5ox3syxp@kibuv4vhvexx>

On Thu, Dec 18, 2025 at 03:35:05PM +0800, Chia-Lin Kao (AceLan) wrote:
> > Now since USB 2.x has its own wires in Type-C cable this tells me that
> > there is some real problem with the connection. Have you tried different
> > cables already?
> Here is the log I got with another tbt4 cable.
> I'm using the kernel with Mario suggests modification.
> 
> https://people.canonical.com/~acelan/bugs/tbt_call_trace/intel/merged_6.18.0-d358e5254674+.patched2.2_new_cable.out

Here I see (assuming I read it right) that the USB 2.x enumerates only
after the first unplug:

[   28.589861] usb 3-2: New USB device found, idVendor=1d5c, idProduct=5801, bcdDevice= 1.01
[   28.589864] usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[   28.589865] usb 3-2: Product: USB2.0 Hub
[   28.589866] usb 3-2: Manufacturer: Fresco Logic, Inc.

Since Goshen Ridge is pretty stable in Linux I'm kind of suspecting still a
connection issue rather than SW. Or could be power related too. AFAIK the
USB 2.x should be rock solid but here it seems not. Are you using active or
passive cables and do they have the lightning logo?

You could still try to comment out both tb_retimer_scan() calls and see if
that makes any difference but I doubt since your last log unplug happened
when we were reading DROM of the second device router not when sidband
access was done.

