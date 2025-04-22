Return-Path: <linux-usb+bounces-23281-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B40AA95D35
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 07:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09AB13A54D0
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 05:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF191D5166;
	Tue, 22 Apr 2025 05:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iY2i1xI2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20BB1B983F
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 05:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745298306; cv=none; b=iyiCOGo4S6nAmk+jaiewU8guZXLPJ9DbEpEJbTZhv/5MHK0vV2MRio7hTm8c6XXAe+qhUMUQOaLTbSykuPh0jDYmC/RSye6abhPk4TefYHSiTIFomiRq+oozE+iC3DI0oTdtEczzlrQawZHI4mb5ruZjvniWdd1/56smpoWCIJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745298306; c=relaxed/simple;
	bh=JXq5mOhrZaSTzX3D4TehoynCFRSoZLIM1q+Upt5MG6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgKKTT+95whAyFOvkvGSiWluJRuetztTOeNcE+dBiT2hhQkoItU4cbrU9VY+Up1DmNjwkB1x0LOKqkUNnK5X5x3ZRgCrrOinz8DqV6L8r1UG+pTdSCzGUvRTs3wzT++JNX7699Dxqzpc+lNcrnL1MdDcqWaq9JNUKEYlfHoCLnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iY2i1xI2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745298305; x=1776834305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JXq5mOhrZaSTzX3D4TehoynCFRSoZLIM1q+Upt5MG6A=;
  b=iY2i1xI2I/8Ss1BTeZ2h4ulpCl85jhd1MzrzTVvv/baIICQ1KHln4uGK
   ANwtSnIgQvuqQdUybZIMPsV4B/Y7/UneBqQoPHCr3g6zpyrdUAO7jFCvu
   ezWi4x08/CVr/qVoj0WhHvckvBDrYTFM75c0sQ1B2smVnXQO7am8DwR4J
   gFSEhQf4dLJvGyaVy/8jHMU1OJgrWMqtIR/E0jAGsFNNVaJaswO9b/Wkq
   0lbSGN5IIHGL1vDgD2gr3l00ZdZds5qpAIrz6ktI2McX8bh0CX8/vTuVx
   83Rd3ikzVqP0xyxSlSHKLAA4H9RiBLXqfF9csPuXHK+hVvlX5pGKH8MMJ
   w==;
X-CSE-ConnectionGUID: NjLxiVPTSFKSwzCwCo2xag==
X-CSE-MsgGUID: iKrRTbpkST+l3q8Fb0mFfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="72236096"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="72236096"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 22:05:04 -0700
X-CSE-ConnectionGUID: Mh/tC7lcSt69gFHhtgzTnA==
X-CSE-MsgGUID: CMi80TBfTpis/0nKrNebXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="131862238"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 21 Apr 2025 22:05:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 18BB61AC; Tue, 22 Apr 2025 08:05:01 +0300 (EEST)
Date: Tue, 22 Apr 2025 08:05:01 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com, westeri@kernel.org,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org
Subject: Re: Thunderbolt display chaining
Message-ID: <20250422050501.GF88033@black.fi.intel.com>
References: <20250421163549.GA40412@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250421163549.GA40412@noisy.programming.kicks-ass.net>

Hi,

On Mon, Apr 21, 2025 at 06:35:49PM +0200, Peter Zijlstra wrote:
> Hi guys,
> 
> I got two Dell U2725QE screens, that can do 4k@120Hz. I'm trying to
> daisy chain them on thunderbolt 4.
> 
> Using a windows laptop (Thinkpad X1) it all 'just' works, and both
> screens are running 4k@60Hz, all good.
> 
> Using a Linux laptop (Thinkpad X13 Gen2i -- tigerlake) it sorta works.
> It drives the first at 4k@120Hz and the second at 4k@30Hz, which is
> kinda terrible. Trying to manually set the first screen to 60Hz works,
> but doesn't appear to enable me to then manually set the second screen
> to 60, it's stuck at 30 :-(
> 
> Using some Tigerlake NUC, I only get a single screen at 4k120Hz and
> nothing at all on the second screen.
> 
> I tried having a quick look at tb.c, and it has this bandwidth
> calculation in tb_available_bandwidth(), but I'm not quite sure where to
> start poking.

If this is Tigerlake then that file is never used - DP tunneling is all
firmware. So what you have is:

  TGL <-> M <-> M

The USB4/TB link is 40G with 10% reserved so you get 36G for DP for the
first link (since both go through that one). 4k @ 120Hz takes 25.82G which
leaves 36 - 28.82 = ~7G for the second monitor that's exactly the 4k at
30Hz you see.

Bandwidth allocation mode can help here but it is not supported until MTL
and I suspect this is what the Windows laptop is using.

You can remedy this by not daisy chaining if you have multiple ports:

  TGL <-> M
   ^
   |
   v
   M

Let me know if you need more information.

