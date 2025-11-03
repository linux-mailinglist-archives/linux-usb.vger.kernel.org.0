Return-Path: <linux-usb+bounces-30000-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B5CC2B0A2
	for <lists+linux-usb@lfdr.de>; Mon, 03 Nov 2025 11:27:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 779FC4EE2B9
	for <lists+linux-usb@lfdr.de>; Mon,  3 Nov 2025 10:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05092FCC10;
	Mon,  3 Nov 2025 10:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eGwKj5nz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BDA28E5
	for <linux-usb@vger.kernel.org>; Mon,  3 Nov 2025 10:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762165604; cv=none; b=g2CugfZDL0tQDEJILO3+4ObeiueDCmg/Sc9ZifmXxFnkVOGtDbjwC8obcpyklcsTU5SkuJBbd7BKyWotxs++6WoycJZI22F4mhuLK1s0WCLNslwkGHkbXb4EkxpgAxrKEiH8oUBiKaaCIMxc4xaQyuNHzokyXMoE/Vux7DfVs5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762165604; c=relaxed/simple;
	bh=CM1AB5cnJ8kFOHVLpsLs1O6oOL85tKdGx933Ifs71L4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XfLMsZ8M9jxBZAZOkmf2CQeM/V2EJCprVpsb159KZ2CSjjxDh3QdgOuE8EX+NPZ91xeio4o3LsHiQyYdKruxAT+vug+6g809FulD8oPkwljk7F04OtMCpJ7uMtbmy+pb29O9H1J0WkWXXzPcTUwMKpomOU3ScnbUXync0rV/ZXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eGwKj5nz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762165603; x=1793701603;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=CM1AB5cnJ8kFOHVLpsLs1O6oOL85tKdGx933Ifs71L4=;
  b=eGwKj5nzHvOVfW7yq785Oj1HOTLatK3YLfkG9atZSYf/4ORz9gbFtw/r
   mfB+oWbj+p5FGW4/MOnsxgKgJRikPw9OLhbZYhxnrNdJ8Oshcl7ITfNzR
   nSOkCTGcOaed7RMjkjSiEJ0AwCQkbNc0qFomFfVDXBsL+Hski5MzauwO1
   17E9SspnLeL83u6au+w9HV5HV7Z+BG237YB3Mog82ZxcTCntlkYhzeDvj
   OH3OlsC9qm6vb1vjYjpViyEn2KbrsAlRDGr9Ujx40BuFPfmjfue4GGwRi
   BeFpM27TfRkHbmg7FjwPHcp+mpiD1NaYk8bEJ+7iIsZAN2LsK16+qjwwE
   w==;
X-CSE-ConnectionGUID: UL1SewHrSgO/y2JMy0MkkQ==
X-CSE-MsgGUID: NDSTeipjTq+N2zIeTgF3Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="64387975"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="64387975"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 02:26:42 -0800
X-CSE-ConnectionGUID: i058NeS7QISLwauEQcnyWg==
X-CSE-MsgGUID: FkoE0GMEQCOR7rr81krCgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="186510790"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 03 Nov 2025 02:26:41 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id E1E2995; Mon, 03 Nov 2025 11:26:39 +0100 (CET)
Date: Mon, 3 Nov 2025 11:26:39 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org, Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Imre Deak <imre.deak@intel.com>
Subject: Re: TB 5 Dock DP-Out non-functional
Message-ID: <20251103102639.GE2912318@black.igk.intel.com>
References: <q7k73t5utfjrpuf45ynig72eojpixepjqccvsfaqt6rg4wptst@se6ekc2eg3sv>
 <20251103055659.GD2912318@black.igk.intel.com>
 <rnp5dzfud5feidxi2qx63cxezukyszuzpj7v5f5gyoqtys3uff@e72nlrudjzxb>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <rnp5dzfud5feidxi2qx63cxezukyszuzpj7v5f5gyoqtys3uff@e72nlrudjzxb>

Hi,

On Mon, Nov 03, 2025 at 09:54:50AM +0100, Frederik Schwan wrote:
> Hi Mika,
> 
> On Mon, Nov 03, 2025 at 06:56:59AM +0100, Mika Westerberg wrote:
> > On Sun, Nov 02, 2025 at 04:39:07PM +0100, Frederik Schwan wrote:
> >> Setup:
> >> TB 5 Host (Lenovo P1 Gen8)
> >>   -> TB 4 Dock (0108:2031 reports as "ThinkPad Thunderbolt 4 Dock")
> >>     -> USB Devices, two 3840x2160, LAN attached
> >>   -> TB 5 Dock (0108:234d reports as "ThinkPad Thunderbolt 5 Smart Dock 7500 - 40BA")
> >>     -> nothing but power supply
> > 
> > You are saying that you have two docks connected like this:
> > 
> >   Host -> TB 4 -> 2 Monitors
> >     |
> >     v
> >    TB5 (nothing but power)
> >     
> > And with this the TB4 dock monitors don't work? But without the TB5 dock
> > they work fine?
> > 
> > It would be good to have simplest possible case where this reproduces then
> > provide exact steps of that, like
> 
> Sorry for the bad report. As a Arch Linux bugwrangler I should've known how to report this in
> a non-confusing way :/
> 
> I added the TB4 Dock just to make sure that the only variable is the Dock (to rule out DP cable, monitor etc.).
> So here comes a minimal setup:
> 
> To repro:
> 1. Boot (Kernel 6.17.7-arch1-1)
> 2. Connect TB5 Dock with power and 1 DP screen attached

Okay this is much more clear :)

> Expected behavior: DP screen comes up and shows output
> Actual outcome: DP screen blinks for 2-3 tries and goes off again
> 
> dmesg.log attached as well as the bandwidth script output.

Thanks! Unfortunately the log is still truncated probably due to added
debug. Can you add log_buf_len=2M or something like that to the kernel
command line too so we can get the whole log.

Regarding the script, that's odd too but it could be that you have more
than one host router there (it is not clear from the truncated log). You
need to build the tbtools binaries though.

