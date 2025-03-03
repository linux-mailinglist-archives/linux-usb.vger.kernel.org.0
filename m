Return-Path: <linux-usb+bounces-21263-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75739A4BEB6
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 12:33:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7FFA3BC54A
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 11:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25971F0E44;
	Mon,  3 Mar 2025 11:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARNHaKdR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C54A1EE008
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 11:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741000913; cv=none; b=pBhMn8rOclzgYg/ZrSZPnWEGU+4omZiqogBC+siGwgmYHzLG8ayokkVjakFU2aJgIrpd4mvav9wJk/2tvEyByMJmL2ptsJ8VUe8mFS7A6TKR2mEGX/2PG8d3OfIszumg4GPnBwa4SFuBroOYZgxMrwtAOzN/VcUNmQzZXsu/Vfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741000913; c=relaxed/simple;
	bh=YQ9AWIA5csSTtqRC4hSwybQs5m8bYpjGAxqLpyeyHDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCJ0OCnfGv0UZ31YFI5Yl++ZtXM55ilDVRQS4hIkz0/jpa7W+5p/8P+bt0rtdeALUBykhez0eYM1fx0bfeEmomnex82bqzH0q+cwuLDGujhg8CPQ6hfSMSYvfUGQLAJrXb4hsYDXqJv3xNMA0sQ9uwJGfLkTGX329lbB96CFtLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARNHaKdR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741000913; x=1772536913;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YQ9AWIA5csSTtqRC4hSwybQs5m8bYpjGAxqLpyeyHDo=;
  b=ARNHaKdRMkJrk9RqzQQ7MVE2Niw4D4b6eYypZ6ikUoVtO46DbjliL58+
   FFZYRCJY/7ekiyI3FOpcH80Wg5kKJXaHZs7luIFDxwuLPuLZmCmFS3HRh
   85o1hCzH1EaLpu/jHWurrU9decpXD29MJzVXGRJzXnAwuzRfU5OKF4sDg
   dCk+JTkbBDTU2VOD/CtSQCvc7TK3wbrdqLESRTYhHqSOYYkqFZyCb0SUy
   oaWkvgSOn6yXleGQMDV3D6HF7GMyN4TE18GJ2nytbFZiQlj1oRut2CZlF
   SiAFzMlp/feIR+M6HIYTAzTaT5bfKPgdUK4zgdWhTf99mz3U7/E/jqTrk
   A==;
X-CSE-ConnectionGUID: r5/lRhsFSumltTw/6R5aVQ==
X-CSE-MsgGUID: ApPY343FQTex+2DXjs2u2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41783399"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="41783399"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 03:21:52 -0800
X-CSE-ConnectionGUID: 3+m5nx1pR+Os15vEzfR+AQ==
X-CSE-MsgGUID: en5pT4qMSDqsGamMB4qGfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123198406"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 03 Mar 2025 03:21:51 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 86BC9125; Mon, 03 Mar 2025 13:21:49 +0200 (EET)
Date: Mon, 3 Mar 2025 13:21:49 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kenneth Crudup <kenny@panix.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
Message-ID: <20250303112149.GS3713119@black.fi.intel.com>
References: <8e175721-806f-45d6-892a-bd3356af80c9@panix.com>
 <bd731ba2-5509-44e6-a419-814ef5329bbd@panix.com>
 <992dba2a-4919-4f76-ac48-986792d5843c@panix.com>
 <2b55ab09-8389-4916-8acc-abc73f234d21@panix.com>
 <20250303104618.GP3713119@black.fi.intel.com>
 <f31309e4-6ce5-48cf-910e-cd74f818aac8@panix.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f31309e4-6ce5-48cf-910e-cd74f818aac8@panix.com>

On Mon, Mar 03, 2025 at 03:02:30AM -0800, Kenneth Crudup wrote:
> > For the second issue, I'm not sure I know the steps but since you mention
> > reverting d6d458d42e1e ("thunderbolt: Handle DisplayPort tunnel activation
> > asynchronously"), it should trigger pretty much any time you plug in
> > monitor so we can follow different and hopefully simpler steps:
> > 
> > 1. Boot the system up, nothing connected.
> > 2. Connect TBT 4 dock to the system.
> > 3. Connect monitor to the TBT 4 dock.
> > 
> > Expectation: Monitor shows the screen properly.
> > Actual result: Blank screen.
> 
> Actually, what was happening was connecting a monitor at any time worked as
> expected. The issue was approximately most of the time after a resume from
> suspend/hibernate, if I had an external (DP tunneled) monitor connected, I'd
> get OOPSes in the line mentioned in my first E-mail, which appeared from
> tracing to come from trying to write to a TB tunnel(?) which no longer
> existed; my (totally wild) guess was that some race condition between:
> resuming the machine and reenumerating the tunnels, my monitors taking their
> time coming out of sleep, and "something" happening with the async tunnel
> activation means it was hitting an NPE somewhere.

Let's not guess, let's try to figure out the root cause.

> Bottom line is I've done quite a bit of testing with these reverts and have
> yet to get any resume from S/H failures since.

Okay that's good.

Now you say that you don't reproduce the DP tunnel issue if you simply plug
in monitor so let's try to figure out reliable steps to repro so we can
investigate.

In theory it should trigger any time you plug in monitor since the paths
are the same but okay. Then let's try to limit this to single monitor (the
one you see this most reliably and let's stick with suspend since hibernate
is more complex).

So with 9d573d19547b3 only reverted, no other changes to the kernel and
"thunderbolt.dyndbg=+p" in the command line do following steps:

1. Boot the system up, nothing connected.
2. Connect TBT 4 dock to the system.
3. Connect monitor to the TBT 4 dock.
4. Suspend the system by closing lid.
5. Resume the system by openling lid.

Expectation: Monitor over Thunderbolt still shows picture.
Actual result: Screen is blank.

If these are not accurate, can you in the same format write down your steps
how it reproduces (try to keep it minimal). Then since now resume at least
completes you can provide full dmesg to me and I can try to figure out what
is wrong there.

> ... and as with 9d573d19, I'd like to help fix this underlying issue, as
> maybe there's something unique to my laptop's chipset(?) (as I have
> different docks and monitors at home and when on the road but it happens in
> both scenarios).

I don't think this is hardware issue, I see it too in my hardware so the
commit just somehow ends up in a deadlock and of course needs to be
investigated but for the time being we can use the workaround revert and
concentrate on the DP issue at hand.

