Return-Path: <linux-usb+bounces-22618-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96007A7D3AE
	for <lists+linux-usb@lfdr.de>; Mon,  7 Apr 2025 07:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29B003AD285
	for <lists+linux-usb@lfdr.de>; Mon,  7 Apr 2025 05:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417A6224892;
	Mon,  7 Apr 2025 05:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AloOtAi8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4111224235
	for <linux-usb@vger.kernel.org>; Mon,  7 Apr 2025 05:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744005325; cv=none; b=pvoVBwL43EHIVxXpY7gI2dI15cO082ooLRQ3aSPpeZbTAug2XwKZwNNp1Ywzd0siVRjGq05V+gqEnsqFJQIg4wd1hepOa6ZNdWnJkCmyo8qsI5qOAIpw28S7hQ8ytGpJryK3mkRXn3HVZRz1y3D+IDKAPUjZw6fcd2sz653FqZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744005325; c=relaxed/simple;
	bh=tCJr38lWP9ledOXaM57GB7VWrYoHSmyMq20cHWqbEEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLooKXqPezuY5Nom+67477O6ygZiR0OYwJAvsG+vMPcMo9iWLg3ShejHGFtRghJzdndtzCLwEzL6R0Ec2nEqUAhAnTsQm/D3a1UObopNDLcB1WLaiUEfeYnMsafyQz8L4HcsftH7MatsYC/OcHmRcySNfrsjIacVHi7GB5yfrXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AloOtAi8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744005324; x=1775541324;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tCJr38lWP9ledOXaM57GB7VWrYoHSmyMq20cHWqbEEg=;
  b=AloOtAi8gWEfgAUfu/Ew8dZy1xcEE1L+nE03ufBmPBdPg8AvsPOUy6x7
   ZwfQNjososp8y3LXgrKZvfh8X7P+2trgrbb8Hv5IJq/RCtX/vPBHGRjHX
   PAtRj1dN975P7j3g3PIo6NGMJozjK1vXYRu/++vBB63GFxcM4MSkKaFXy
   tJSKaCTHfJf/7cWLtqWRNRRDdtzztGWsZUpb/xxsk1jNNvjij2MQG56rV
   6gVFmQCrrnd2mr5jHKmQnH+fUpN5t7I0YkGrBkcL/ZqubelWwFFXdH5AO
   kY0J5CtPHWYk+K+Zdm0GUyQNFHwznDlbi1QMsdl0hinW/XFeDNCsXRaLs
   w==;
X-CSE-ConnectionGUID: UY/RH0I+QhCPg2uS0Pp6EQ==
X-CSE-MsgGUID: vOQuNSZ8RD63a60YRubskg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="45391567"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="45391567"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 22:55:23 -0700
X-CSE-ConnectionGUID: cdfnfPOZSHKrgG2BpaPCTw==
X-CSE-MsgGUID: 5sbFIkExQ3+JXgTxTcqX2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="128373732"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 06 Apr 2025 22:55:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 3FE63338; Mon, 07 Apr 2025 08:55:20 +0300 (EEST)
Date: Mon, 7 Apr 2025 08:55:20 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Raul Rangel <rrangel@chromium.org>
Cc: Mario Limonciello <superm1@kernel.org>,
	Opal Voravootivat <puthik@google.com>,
	"open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
	"Gong, Richard" <Richard.Gong@amd.com>,
	Utkarsh Patel <utkarsh.h.patel@intel.com>
Subject: Re: Wake on connect / wake on disconnect
Message-ID: <20250407055520.GP3152277@black.fi.intel.com>
References: <ce2048af-1044-4424-bca2-3799baefb9c2@amd.com>
 <20250404060203.GM3152277@black.fi.intel.com>
 <3b283147-cd32-410e-a163-9e603fd40bc1@gmail.com>
 <20250404115346.GN3152277@black.fi.intel.com>
 <98539971-3b43-4d64-a105-6790198c46d1@amd.com>
 <20250404161008.GO3152277@black.fi.intel.com>
 <f9806a24-875f-4c44-9694-96b62a6aefd9@gmail.com>
 <5f9004aa-9b51-474d-9cb0-c8c4e23b19f4@kernel.org>
 <CAHQZ30C=7d1DkHYTixrgmArCwKHzhxBn602P=YY5rP6OcAXuVw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHQZ30C=7d1DkHYTixrgmArCwKHzhxBn602P=YY5rP6OcAXuVw@mail.gmail.com>

On Fri, Apr 04, 2025 at 10:55:35AM -0600, Raul Rangel wrote:
> On Fri, Apr 4, 2025 at 10:20 AM Mario Limonciello <superm1@kernel.org> wrote:
> >
> >
> >
> > On 4/4/25 11:16, Mario Limonciello wrote:
> > >
> > >
> > > On 4/4/25 11:10, Mika Westerberg wrote:
> > >> On Fri, Apr 04, 2025 at 10:03:18AM -0500, Mario Limonciello wrote:
> > >>> On 4/4/2025 6:53 AM, Mika Westerberg wrote:
> > >>>> On Fri, Apr 04, 2025 at 06:47:31AM -0500, Mario Limonciello wrote:
> > >>>>> On 4/4/25 01:02, Mika Westerberg wrote:
> > >>>>>> Hi Mario,
> > >>>>>>
> > >>>>>> On Thu, Apr 03, 2025 at 01:12:07PM -0500, Mario Limonciello wrote:
> > >>>>>>> Mika,
> > >>>>>>>
> > >>>>>>> Recently there are some conversations about wake-up from connect/
> > >>>>>>> disconnect
> > >>>>>>> happening and I wanted to get some background from you about the
> > >>>>>>> current
> > >>>>>>> policy set in tb_switch_suspend().
> > >>>>>>>
> > >>>>>>> Wake on connect and disconnect are only used for runtime, not for
> > >>>>>>> system
> > >>>>>>> suspend.  Would you be open to adding wake on connect as well for
> > >>>>>>> system
> > >>>>>>> suspend?  This should help enable use cases like plugging in a
> > >>>>>>> closed laptop
> > >>>>>>> to a dock (which works on Windows).
> > >>>>>>
> > >>>>>> Don't we already have a similar for all usb4_portX devices? That
> > >>>>>> does not
> > >>>>>> work for you?
> > >>>>>>
> > >>>>>
> > >>>>> I think that will functionally work - but I'll double check.
> > >>>>>
> > >>>>> However usb_portX power/wakeup defaults are 'disabled' so this
> > >>>>> would need a
> > >>>>> udev rule.  Could we set the kernel default for those to 'enabled'
> > >>>>> instead?
> > >>>>
> > >>>> No because that would trigger wakeup each time you unplug/plug and
> > >>>> this is
> > >>>> certainly not good if you close the lid, unplug from dock and throw the
> > >>>> laptop to your backpack. Chrome uses this with "dark resume" so if
> > >>>> this is
> > >>>> supported by the userspace then it can also enable these.
> > >>>
> > >>> Ahhh.  I was thinking specifically with wake on connect that's not a
> > >>> problem, but the sysfs knob for the port changes both wake on connect
> > >>> and
> > >>> wake on disconnect.
> > >>>
> > >>> Is there actually a use case for chrome with wake on disconnect?  IE
> > >>> if we
> > >>> didn't turn on wake on disconnect but defaulted to wake on connect would
> > >>> things be OK?  Or made the sysfs knob control only wake on disconnect?
> > >>
> > >> Good guestion - I don't know ;-) The Chrome folks wanted this so I
> > >> suppose
> > >> their usecase is specifically that dark resume and I think that's when
> > >> you
> > >> unplug a device so disconnect. Not so sure about wake on connect.
> > >
> > > I found the original patch from Rajat [1].
> > >
> > > Rajat, any comments?  Could you loop in the right people from the Chrome
> > > side to ask?    I think my "preference" would be that we make "wake on
> > > connect" always enabled and then let the sysfs knob control "wake on
> > > disconnect".
> > >
> > > [1] https://lore.kernel.org/linux-usb/20221101115042.248187-1-
> > > rajat.khandelwal@intel.com/
> >
> > Oh Rajat's email bounced.  The only person I know that I've worked on
> > wakeup related stuff is Raul.  I'll add him.
> >
> > Mika, Raul,
> >
> > Could you pull in current Chrome people from Intel and Google that could
> > comment here?
> 
> + Opal who should be able to answer the question regarding wake on
> connect/disconnect.

Added Utkarsh from Intel side.

