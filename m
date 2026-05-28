Return-Path: <linux-usb+bounces-38133-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGIkNSUcGGq+dQgAu9opvQ
	(envelope-from <linux-usb+bounces-38133-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 12:42:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F111C5F0CC8
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 12:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 62C5330509CF
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 10:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E023BB127;
	Thu, 28 May 2026 10:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DwjDjwr5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B616C35202B;
	Thu, 28 May 2026 10:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964478; cv=none; b=kPPUGyipp7WzxZ8o0spMIIbtKWWoo2Rc+4c25JjpxFja6hfuswJ7gamlx+LvOYdKoRIQ+FK50lhPOjSCI/4Ez1oIKpy5mc5UULWRwnbMiGn7daZDX/Pu/G5MAjfW8qs+LgOxsScvfgZOPxHie9AA4IwfRg4MQm/Bk5Rtb+CIHtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964478; c=relaxed/simple;
	bh=qT0tkH5L72+7WdkKqC1ALdYv9YMS1xd09Oibm3NfuXo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CKsKhZUQ4m2ylwCQM9a6hfKrGxV6PUEa7q8W6eicLrwlFcgZ3jaTNSxjq/P1tTtaTnB6dIRpJPnpjTfjZHNbrRtbIs9T64dq24dZW+ofNrlqlDoUffNmp4lvuDwgjdM9RfJE55Iwf3kQ32LOIYJmvIg4MeJxs6qNIWSX/7oADxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DwjDjwr5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779964477; x=1811500477;
  h=date:from:to:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=qT0tkH5L72+7WdkKqC1ALdYv9YMS1xd09Oibm3NfuXo=;
  b=DwjDjwr595d7XbQ9iGb1bMUBZ8Eh+UYt2hQcN6etAAhxblGnzR8QDPsF
   QOEWzKwzyn41YqYWLK5azN48tRMMdXZdw/UN/uNACNVdDT4c3ZGAIPBOO
   RF0aii2zMGlPQ4dZLGmjT0LxyGERtEey9YBokEy0ymSGkHTi6kfyMM35W
   qxqW9qsWXicfQQk2/4hovfmf0pXp+83k4oHCJ79vnOB3HUmGJd2a6jrrO
   ThPMPzU5LYLisvL9NyWzZ0fQ19c1wSecd/QbEF2oN+vOihVACiPD/jr35
   EYGfIr+Tw8G6Sy/lfvRvAQ9N2dfiBg7IwTNjcGgCiapREAsJ4QxvTgDDy
   A==;
X-CSE-ConnectionGUID: VWY4h/3jQVaqFiJKCdIGvw==
X-CSE-MsgGUID: g3T9Yw5YQByfHq6qiv23Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="79953253"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="79953253"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 03:34:36 -0700
X-CSE-ConnectionGUID: 95u4o/jARm6nVCopv/Ry9w==
X-CSE-MsgGUID: z929F6hrTvWkEmpNtH8gVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="266417217"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 28 May 2026 03:34:34 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 90CA698; Thu, 28 May 2026 12:34:33 +0200 (CEST)
Date: Thu, 28 May 2026 12:34:33 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] thunderbolt: Fix blank external display after HRR on
 USB4 v2
Message-ID: <20260528103433.GI3102@black.igk.intel.com>
References: <20260430073145.331419-1-acelan.kao@canonical.com>
 <20260430100311.GE557136@black.igk.intel.com>
 <ahe3zpDyPVj2QRcL@acelan-Precision-5480>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ahe3zpDyPVj2QRcL@acelan-Precision-5480>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38133-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[canonical.com,kernel.org,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:url,intel.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: F111C5F0CC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Thu, May 28, 2026 at 11:43:47AM +0800, Chia-Lin Kao (AceLan) wrote:
> Hi Mika,
> 
> Sorry for the late reply — I was away for two weeks in early May.
> 
> On Thu, Apr 30, 2026 at 12:03:11PM +0200, Mika Westerberg wrote:
> > Hi,
> >
> > On Thu, Apr 30, 2026 at 03:31:42PM +0800, Chia-Lin Kao (AceLan) wrote:
> > > Hi,
> > >
> > > On Dell XPS 14 (Panther Lake) with a WD22TB4 Thunderbolt dock and BenQ
> > > PD2725U external display, the display goes permanently blank on ~50% of
> > > boots. The only way to recover is a full reboot — re-plugging the
> > > monitor or dock does not help.
> > >
> > > The root cause is a race between the USB4 v2 Host Router Reset (HRR)
> > > and the graphics driver initialization:
> > >
> > >   1. nhi_probe() performs HRR at ~t=1s, destroying BIOS-established
> > >      DP tunnels.
> > >   2. The Thunderbolt driver re-discovers the dock via hotplug at ~t=4s
> > >      and attempts to re-create the DP tunnel.
> > >   3. DPRX negotiation fails because the graphics driver (xe) is not yet
> > >      ready — the 12-second timeout expires at ~t=18s.
> > >   4. tb_dp_tunnel_active() permanently removes the DP IN adapter from
> > >      available resources on the first failure, so the display never
> > >      recovers.
> > >
> > > The fix adds a retry mechanism: on DPRX negotiation failure, the driver
> > > retries up to 3 times with a 5-second delay, giving the graphics driver
> > > time to come up.
> > >
> > > Tested with 13 boot cycles on the affected machine:
> > >   - 6 boots hit the HRR + DPRX race: all recovered via retry, display
> > >     came online after 3 retry attempts (~58s).
> > >   - 5 clean boots (no HRR): DP tunnel established immediately.
> > >   - 2 boots with HRR where DPRX succeeded on first try.
> > >   - 0 teardowns: the retry mechanism was never exhausted.
> > >
> > > Full dmesg log - https://people.canonical.com/~acelan/bugs/dp-retry-on-hrr/
> >
> > I'm looking at that but the first thing that stands out is this:
> >
> > [    1.051684] thunderbolt: loading out-of-tree module taints kernel.
> >
> > Which tells me that this has some potential modifications outside of the
> > mainline.
> >
> > Second thing is that it's missing "thunderbolt.dyndbg=+p" that could show
> > what is going on there. I suggest adding that pretty much always.
> >
> > Yes, this can happen and the 12 s idea was that it accounts for the
> > possible time that it takes to boot up (as well as the polling the i915
> > does if it is runtime suspended). I would say that whatever is delaying the
> > boot time should be investigated first because that's not really good user
> > experience.
> >
> > Aside from that if you add "thunderbolt.dprx_timeout=-1" does it work? If
> > really needed we can increase that a bit but I'm not too enthustiatic
> > adding code for retrying this because we do have this timeout that we can
> > adjust as needed (we can make the default higher).
> Thank you for reviewing and for the helpful suggestions.
> 
> I have an update on this issue: we've since discovered that a BIOS update
> (from 1.2.1/1.3.1 to 1.5.1) on this Dell XPS 14 (Panther Lake) appears to
> have resolved the blank display problem.
> 
> Looking at what changed: with the old BIOS, the firmware pre-established
> PCIe tunnels through the dock during early boot — the dock's xHCI
> (07:00.0) and the OWC NVMe (18:00.0) were already enumerated by BIOS
> before the kernel started. When nhi_probe() performed HRR at ~t=1s, it
> destroyed those BIOS-established tunnels, killing xHCI mid-probe
> ("HC died; cleaning up") and causing the NVMe probe to fail with -EIO.
> The subsequent DP tunnel re-creation then hit the DPRX timeout because
> the graphics driver wasn't ready yet.
> 
> With BIOS 1.5.1, the firmware no longer pre-establishes PCIe tunnels to
> dock devices — the TBT root port (00:07.0) doesn't even have IO port
> space allocated anymore. This means HRR has nothing to destroy, and the
> Thunderbolt driver handles all tunnel setup from scratch. We ran 30 reboot
> cycles with the full device set (WD22TB4 dock, BenQ monitor, OWC Envoy
> Express storage) and saw 0% blank display rate.

Okay thanks for the update.

> So it seems the root cause was the BIOS establishing tunnels that the
> kernel's HRR would then tear down, creating the race condition. The BIOS
> vendor fixed it by leaving tunnel establishment to the kernel entirely.
> 
> Given this, I think the retry patch is no longer needed for this specific
> platform. That said, the underlying race (HRR destroying BIOS tunnels →
> DPRX timeout → permanent DP IN removal) could still affect other USB4 v2
> platforms where the BIOS does pre-establish tunnels. Would it still be
> worth considering either:

It is not just USB4 v2, it includes v1 too (PTL is v1).

>   a) increasing the default dprx_timeout, or
>   b) at minimum, not permanently removing the DP IN adapter on the first
>      DPRX failure?

There is another discussion about this started by your colleaque at
Canonical I believe let's continue there.

