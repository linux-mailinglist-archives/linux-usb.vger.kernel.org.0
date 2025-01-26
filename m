Return-Path: <linux-usb+bounces-19759-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7083A1C663
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jan 2025 06:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6144D3A815E
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jan 2025 05:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354E078F2B;
	Sun, 26 Jan 2025 05:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j4OT4kSY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35D8A59;
	Sun, 26 Jan 2025 05:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737870833; cv=none; b=D9hb2SavN+e/Hy1LXE3HBNeaf04qAKQyJ8uKZmR4NJYg9eqXs5sYSNsKm5G8vwevgHAcDnea9fP/l0kZ3zmetM+vZVmk/vWtRzOTYen8gEak0ssxzecNGS/tobpvlA9NKHetzo3tsdMh/V/hkjBVXecK85cWLh5CnGO6EE2N8LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737870833; c=relaxed/simple;
	bh=c0gle6Np2LGX326YNlcSAYLiFeCi6xfGb2gFn5HqYEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tBtH1wCFyjZt7P1A8tA/MmMkfPesJ8P/XgEOlW/fcn7qrt3cWvFpOq0lsUL2egXvjlfXMdALc8BQP1v7UbD9g42PtORF8I1wVPAQ3kKR533esW169GCcZTtsiv29EX96g88xptAzmjDLrV5ga6Kba+z8aIBM68pR54ECIOg7VzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j4OT4kSY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737870832; x=1769406832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c0gle6Np2LGX326YNlcSAYLiFeCi6xfGb2gFn5HqYEc=;
  b=j4OT4kSYhnPJaCOd0+qoLhMFdArYyOX8ebskLlRr5EUMi0R87tEGUuzm
   xEJGvj/7eb8HrQ2E0+OIBLURuqNLKsJkr/1rjYy9LIT7xA/RNgoTItVRQ
   rVUGOVnqESz+85Cj0iffv1TK4Af1wUyxQ9P1H58zd7ujZ0S2v6AGmJ0yR
   ca3TIhR4KSsAhqF5sxIJk65/JGFosqwbzSzBhDwF58sbDTBPq9f1DVpFu
   4asZ7Zd2IgbYxPGCNLCcScxg5Bh1+6SsEpaLFz/Bi+H7xPE9xmXDIJVEX
   gc4NeEnNqkPmBsVLDhQDEdMrfD/ooQDoZuGswlaP/YfDyOLlEeIN7L3v1
   g==;
X-CSE-ConnectionGUID: LMJgdcMhRUCnAJ6laApZSw==
X-CSE-MsgGUID: WGSvax64SNSgv1ryjABhww==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="25959607"
X-IronPort-AV: E=Sophos;i="6.13,235,1732608000"; 
   d="scan'208";a="25959607"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 21:53:51 -0800
X-CSE-ConnectionGUID: TdIZu+ZFQqerR6JkEAomEQ==
X-CSE-MsgGUID: WmeZgdgBTCSalRfFOJWsyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,235,1732608000"; 
   d="scan'208";a="138993591"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 25 Jan 2025 21:53:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 7648A164; Sun, 26 Jan 2025 07:53:47 +0200 (EET)
Date: Sun, 26 Jan 2025 07:53:47 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Aaron Rainbolt <arainbolt@kfocus.org>
Cc: YehezkelShB@gmail.com, michael.jamet@intel.com,
	andreas.noever@gmail.com, linux-usb@vger.kernel.org,
	mmikowski@kfocus.org, linux-kernel@vger.kernel.org,
	Gil Fine <gil.fine@linux.intel.com>
Subject: Re: USB-C DisplayPort display failing to stay active with Intel
 Barlow Ridge USB4 controller, power-management related issue?
Message-ID: <20250126055347.GL3713119@black.fi.intel.com>
References: <20241105141627.5e5199b3@kf-ir16>
 <20241106060635.GJ275077@black.fi.intel.com>
 <20241106110134.1871a7f6@kf-ir16>
 <20241107094543.GL275077@black.fi.intel.com>
 <20241111082223.GP275077@black.fi.intel.com>
 <20241112164447.4d81dc3a@kfocus.org>
 <20241114115136.GB3187799@black.fi.intel.com>
 <20241114104125.00a02eb1@kf-ir16>
 <20241115132022.GC3187799@black.fi.intel.com>
 <20250124170540.1572d5db@kf-ir16>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250124170540.1572d5db@kf-ir16>

On Fri, Jan 24, 2025 at 05:05:40PM -0600, Aaron Rainbolt wrote:
> On Fri, 15 Nov 2024 15:20:22 +0200
> Mika Westerberg <mika.westerberg@linux.intel.com> wrote:
> 
> > Hi,
> > 
> > On Thu, Nov 14, 2024 at 10:41:25AM -0600, Aaron Rainbolt wrote:
> > > This is production hardware (specifically Clevo's X370SNW1-G and
> > > X370SNV1-G laptops), available for purchase from Sager, XOTICPC,
> > > Schenker, likely many other resellers, and our own website
> > > at https://kfocus.org/spec/spec-m2.html (with a tool that allows users
> > > to work around the bug). The firmware is baked into the hardware
> > > provided to us by our ODM, and for the sake of stability we do not
> > > modify any firmware on the machines with the exception of applying
> > > BIOS updates provided to us directly by the ODM. They appear to get
> > > their firmware directly from Clevo.  
> > 
> > Okay thanks.
> > 
> > > We have requested an updated BIOS from the ODM. If one is
> > > available, we will upgrade and run the tests again.  
> > 
> > Yes, I hope you can get the firmwares. The one you have now is not
> > "production quality" firmare so you should not really have that there
> > in the first place and Clevo should definitely provide you an
> > upgrade. Note this is separate from the BIOS. But your BIOS has issue
> > too regarding the USB4 power contract that is required by Microsoft
> > so I would expect that you should get that one upgraded too.
> > 
> > The patch I shared earlier should deal with all the other cases except
> > that weird one where we do not seem to get unplugs (and the resource
> > is available) which is not how the firmware is expected to work. I was
> > planning to submit it upstream after some more validation on our end,
> > probably afer v6.13-rc1 is released. I'll CC you.
> > 
> > If/when you get the new firmare I would definitely appreciate if your
> > folks could give it a try.
> 
> Hi Mika, sorry for the very late follow-up, been busy with other work
> stuff.

No worries.

> We contacted the ODM to get newer firmware. They contacted Clevo, who
> told them that the Barlow Ridge chip in these machines is the B0
> revision. According to them, the latest firmware available for the B0
> revision is 14.6; they also state that the 56.x firmware is for the B1
> revision and is incompatible.
> 
> Is it possible that the problem is that the driver is written
> specifically for the B1 revision and only partially works with the B0
> revision?

The driver support is written for USB4 v2 not specifically for certain
Barlow Ridge silicon stepping. B0 has issues that B1 fixes but I'm not sure
if they are related to this one. My reference host controller is actually
B0 and it is running the 56.x firmware IIRC so not incompatible.

@Gil, can you verify this?

