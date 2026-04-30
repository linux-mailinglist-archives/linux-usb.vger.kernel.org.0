Return-Path: <linux-usb+bounces-36743-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AObROCcq82mwxgEAu9opvQ
	(envelope-from <linux-usb+bounces-36743-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 12:08:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2A94A0858
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 12:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5FB573051DAF
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 10:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871F13FB06F;
	Thu, 30 Apr 2026 10:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUOcAvtM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFBE3E5594;
	Thu, 30 Apr 2026 10:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777543401; cv=none; b=TNB1oPQKsjprZ7x7SbnEVTh8qBW7is0QcvJGpEx1zu90g9qgWqfI80ddg6jJKclHyTbL5FuNiPpwhjeWGWltafxSFh9KY05BbDFkvRIUVqX0IUSai8EI55Sjb+f/i/4LiPpIrtLhp0PRZmH671z4tKp9JEvskAJELlaMafMmjEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777543401; c=relaxed/simple;
	bh=NuMGZmL1HrtZ0obkoYpT1Ol2MR0ImOMsStyTcCngK6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LzwuDY2TCW79sUVsM9j+HvniKeKWLU1HPEeom4hwhtWWWYbtDVLsuYpklzJurCP3yLOJjJnnHiwbeSDCZFJ1Vl/1iI9n/dwBH9Hfc0MIY5G9gqI9b5I2CmAiFgPC9oTITfC1+mOn7V7dFGKW04lBedY5EOzawzk8xEVSw0OyMn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUOcAvtM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777543399; x=1809079399;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NuMGZmL1HrtZ0obkoYpT1Ol2MR0ImOMsStyTcCngK6I=;
  b=iUOcAvtMCJkWPoSgfcdjhmLy5ca/E7kElxqLnvIzLV5NN9i+rmYXtdKU
   wgM1bNHombJuGwUr14I6wYAxm8gOlqiNQku0ZhTeR9OHhV+7dvg7xte/o
   rZUQxl1EPUwRvKc9C8JlExEZcXlg6NIqLU9woVxrnvMJxMMrzJD/ps93f
   F0r+cMJ/q0l6fqE/47CuU7p6Xbj5HWRrVmeoTUkGYGh8F5ByFqGg3t+6s
   SzDuIjdb4iX8qk36pSy5QzAg2MWkgmnkwB/riSx0/Q8l6sxiWEdW4A96s
   sAwocGe9PxX8Dfy0CsOwLVHwIrG5Mpjyob9rxt7X8og5IeIfCUAYtnX5B
   A==;
X-CSE-ConnectionGUID: 2teW8TaDRT2xcsYUpQFRdg==
X-CSE-MsgGUID: Bm+m3muQTOqugzQNkxM30Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78383042"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="78383042"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 03:03:18 -0700
X-CSE-ConnectionGUID: tto0C9oUQzuXU4PoInkKig==
X-CSE-MsgGUID: aX2eolkgRCe9zMdCNFrtFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="233699491"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 30 Apr 2026 03:03:13 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id B38BB95; Thu, 30 Apr 2026 12:03:11 +0200 (CEST)
Date: Thu, 30 Apr 2026 12:03:11 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] thunderbolt: Fix blank external display after HRR on
 USB4 v2
Message-ID: <20260430100311.GE557136@black.igk.intel.com>
References: <20260430073145.331419-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260430073145.331419-1-acelan.kao@canonical.com>
X-Rspamd-Queue-Id: 5E2A94A0858
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-36743-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim]

Hi,

On Thu, Apr 30, 2026 at 03:31:42PM +0800, Chia-Lin Kao (AceLan) wrote:
> Hi,
> 
> On Dell XPS 14 (Panther Lake) with a WD22TB4 Thunderbolt dock and BenQ
> PD2725U external display, the display goes permanently blank on ~50% of
> boots. The only way to recover is a full reboot — re-plugging the
> monitor or dock does not help.
> 
> The root cause is a race between the USB4 v2 Host Router Reset (HRR)
> and the graphics driver initialization:
> 
>   1. nhi_probe() performs HRR at ~t=1s, destroying BIOS-established
>      DP tunnels.
>   2. The Thunderbolt driver re-discovers the dock via hotplug at ~t=4s
>      and attempts to re-create the DP tunnel.
>   3. DPRX negotiation fails because the graphics driver (xe) is not yet
>      ready — the 12-second timeout expires at ~t=18s.
>   4. tb_dp_tunnel_active() permanently removes the DP IN adapter from
>      available resources on the first failure, so the display never
>      recovers.
> 
> The fix adds a retry mechanism: on DPRX negotiation failure, the driver
> retries up to 3 times with a 5-second delay, giving the graphics driver
> time to come up.
> 
> Tested with 13 boot cycles on the affected machine:
>   - 6 boots hit the HRR + DPRX race: all recovered via retry, display
>     came online after 3 retry attempts (~58s).
>   - 5 clean boots (no HRR): DP tunnel established immediately.
>   - 2 boots with HRR where DPRX succeeded on first try.
>   - 0 teardowns: the retry mechanism was never exhausted.
> 
> Full dmesg log - https://people.canonical.com/~acelan/bugs/dp-retry-on-hrr/

I'm looking at that but the first thing that stands out is this:

[    1.051684] thunderbolt: loading out-of-tree module taints kernel.

Which tells me that this has some potential modifications outside of the
mainline.

Second thing is that it's missing "thunderbolt.dyndbg=+p" that could show
what is going on there. I suggest adding that pretty much always.

Yes, this can happen and the 12 s idea was that it accounts for the
possible time that it takes to boot up (as well as the polling the i915
does if it is runtime suspended). I would say that whatever is delaying the
boot time should be investigated first because that's not really good user
experience.

Aside from that if you add "thunderbolt.dprx_timeout=-1" does it work? If
really needed we can increase that a bit but I'm not too enthustiatic
adding code for retrying this because we do have this timeout that we can
adjust as needed (we can make the default higher).

