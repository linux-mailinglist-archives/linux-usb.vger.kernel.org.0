Return-Path: <linux-usb+bounces-27918-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB18B52A48
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 09:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 07F884E2727
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 07:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78CFE2773FC;
	Thu, 11 Sep 2025 07:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NW3mTcLo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3E5277C9A
	for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 07:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757576517; cv=none; b=PsaafYLzkQxkDu+ru1tgPk4qNQdF7byA2cJMzxGEw6b/peGdatSVR86Y44fS9N7Nu4Is/by48yR8zgSW1UzfTkkKbgLbDyGf7zlD8dwCA2isFn5hQHl93aiwJZ9/7eOVUA97h05SX1InQy75FJms8WveFjL/DQnr1+0AzjXnkrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757576517; c=relaxed/simple;
	bh=1j6Pg/CEMA3AfJZdituR/PA9zmVAVNIKCldPz7vp9sI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pY+lNJ6Z/V6kmBE68REJhyTbhUyuKwgSNlm08fGbnfp8B2/dImLoZRu0sBYFgCYlGI+bhIoE7a9Ol5aYhNkv3GkjXo2oQe+aoiXVvi6g4OsLxjpyOh8KqPkR4Pyx07mlvDGsz1b+0O4YDVTpj2l72e6eiaoUYeXlwfZwANy4e3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NW3mTcLo; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757576515; x=1789112515;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1j6Pg/CEMA3AfJZdituR/PA9zmVAVNIKCldPz7vp9sI=;
  b=NW3mTcLoaeYklRcqSU9Dz0CGf6rIhF6i65b7/bf6BRR8W9Ew2Sd761WY
   xRZkj0TZEwDvOcncGWVGdmH4BJC/yRam0EtNIGw13Sqy5ts7mxM8HHCCT
   WBtqEa2HnlqsAIxuNSjzJZ5Tzam3T4w2F10t4uIsU9Fg35/NpA9My0OuF
   jeZ/ABizmjKoe2mN74PI5db9tPWqjoYr8mbsiQBcCxnHgayBDEbnFubc1
   pkd5mOvVYEWDIIVEtBYH8+h55c85Eu/97GEokXVs2nORKdf5puvzXaB1D
   5hZtExtYzFf2iznwDS3KWYTjst2WlEb8c2FF6ydPxLFfzIiEDliDGpW/s
   Q==;
X-CSE-ConnectionGUID: Ru23iMJfR5Ob2B/cihrJeA==
X-CSE-MsgGUID: Mkau10xsSZ6yItzXVW6nkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59837424"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="59837424"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 00:41:54 -0700
X-CSE-ConnectionGUID: P8DbYGsaS++LW4cNJhyuFQ==
X-CSE-MsgGUID: 587E9xrTRHCh1jouMN6w8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="173684512"
Received: from smile.fi.intel.com ([10.237.72.51])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 00:41:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uwbwE-000000022JA-0CcE;
	Thu, 11 Sep 2025 10:41:50 +0300
Date: Thu, 11 Sep 2025 10:41:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
	mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/7] usb: xhci: use '%pad' specifier for DMA address
 printing
Message-ID: <aMJ9PbOxn3CCuaYJ@smile.fi.intel.com>
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
 <20250903170127.2190730-3-niklas.neronin@linux.intel.com>
 <20250909115949.610922a3.michal.pecio@gmail.com>
 <aMAPkH5-4rLdmx_9@smile.fi.intel.com>
 <20250909224416.691e47c9.michal.pecio@gmail.com>
 <20250910075630.0389536f.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910075630.0389536f.michal.pecio@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 10, 2025 at 07:56:30AM +0200, Michal Pecio wrote:
> On Tue, 9 Sep 2025 22:44:16 +0200, Michal Pecio wrote:
> > On Tue, 9 Sep 2025 14:29:20 +0300, Andy Shevchenko wrote:
> > > Not really. It prints unnecessary long values on 32-bit machines
> > > making an impression that something works somewhere in 64-bit
> > > address space.  
> > 
> > The %016llx format you are alluding to is used in two error messages
> > actually seen by users, that's an issue. My crazy personal preference
> > would be %08llx, but I concede it's unprofessional, so %pad it seems.
> 
> Actually, I take this back.
> 
> I think that leading zeros are evil and I agree this message is bad.
> But I don't understand why 64 bit users should put up with this:
> 
> [  140.106751] xhci_hcd 0000:07:00.0: Event dma 0x00000000ffeec7f0 for ep 2 status 13 not part of TD at 00000000ffeec800 - 00000000ffeec800
> [  140.476573] xhci_hcd 0000:07:00.0: Event dma 0x00000000ffeec1a0 for ep 2 status 13 not part of TD at 00000000ffeec1b0 - 00000000ffeec1b0
> [  140.502855] xhci_hcd 0000:07:00.0: Event dma 0x00000000ffeecd60 for ep 2 status 13 not part of TD at 00000000ffeecd70 - 00000000ffeecd70
> [  141.225300] xhci_hcd 0000:07:00.0: Event dma 0x00000000ffeeb970 for ep 2 status 13 not part of TD at 00000000ffeeb980 - 00000000ffeeb980
> 
> when we can have this:
> 
> [  419.967755] xhci_hcd 0000:07:00.0: Event dma 0xffc34760 for ep 2 status 13 not part of TD at 0xffc34770 - 0xffc34770
> [  420.100611] xhci_hcd 0000:07:00.0: Event dma 0xffc34bc0 for ep 2 status 13 not part of TD at 0xffc34bd0 - 0xffc34bd0
> [  420.360917] xhci_hcd 0000:07:00.0: Event dma 0xffc34e70 for ep 2 status 13 not part of TD at 0xffc34e80 - 0xffc34e80
> [  421.719530] xhci_hcd 0000:07:00.0: Event dma 0xffc35770 for ep 2 status 13 not part of TD at 0xffc35780 - 0xffc35780
> 
> with a simple change (anything wrong with u64 cast here?):
> 
> -       xhci_err(xhci, "Event dma %pad for ep %d status %d not part of TD at %016llx - %016llx\n",
> -                &ep_trb_dma, ep_index, trb_comp_code,
> +       xhci_err(xhci, "Event dma %#08llx for ep %d status %d not part of TD at %#08llx - %#08llx\n",

How is 0 will be printed with %#08x?

> +                (u64) ep_trb_dma, ep_index, trb_comp_code,
> 
> These zeros only add noise, and in many cases make difference between
> line wrapping or not because this is longer than 99% of kernel messages
> and some people want their terminal window not to take the whole screen.

I disagree on this. The 64-bit platforms are 64-bit. If the address in use is
_capable_ of 64-bit, it should be printed as 64-bit. Otherwise make it u32 in
the code and then I will agree with you.

> The main thing we care about here are the last 3-4 digits and we could
> have made it little more than (ep_trb_dma & 0xffff) long ago, but then
> Niklas asked "what about correlation with tracing/debugfs/dyndbg?", so
> it was left the way it is.

-- 
With Best Regards,
Andy Shevchenko



