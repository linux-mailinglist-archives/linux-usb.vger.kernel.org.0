Return-Path: <linux-usb+bounces-17125-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0A19BCF9B
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 15:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B0352832A4
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 14:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEEB31D9593;
	Tue,  5 Nov 2024 14:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+qT54Zu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED6933080
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 14:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730817737; cv=none; b=BzJId7J055uGto+2BCAb2+O3GZlzSooc8cnr2D1Yhpl9OXXP6wWs0xf6QY7tJxU1lPzLOQ3Aemz9GivJXNBkBQyOQsJll7wpb5KAXwuljqebZXuM30OC5X/96UnRrKwhS4dAUeqDFsGMDoJifz8+HGeyy/0kHmsz27RaMg1Vmpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730817737; c=relaxed/simple;
	bh=DeuS9awll4RzZDkqIiyapdLmbgkqaAiQ76u8nydZIcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6OetyaFcncDAkuuS0qV7G25q1T7VO/F12tzLjuJtEmcZLvkLB4NiDkCcoA9QrrZFWY3z6Yqc0bwPaSKCEh/ZBHMPdjXVkRr/m4TBQ7I4FGwaGhTkJTczEamhAfxMZ54sv2A0XpqqycNJq0KKT6OIK2osovO1wdAz+kLq3mNeUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M+qT54Zu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730817736; x=1762353736;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DeuS9awll4RzZDkqIiyapdLmbgkqaAiQ76u8nydZIcg=;
  b=M+qT54ZuE1Ra/dnymI24LhJfcPK6kOFtq/oN1OgOPDHVRlfiHyv28rQ6
   FfD4ZVSD4Obmfxv8j0HwhFfefinvE+7qFoRACKzy6sZBzJ6ajCf3p51Yr
   hhzyKp1btYIDW32tc9VJ7+YjhzC3o1mvHhpnTdPM/nWd+BcZslKtms9hO
   VqyhWwhlI8KEMqR2irhGZaNl+Vj49AbyT4KQ8vDC96ygHb9KbIG98losJ
   BF2I2gUrHNkscHnr2MqC0zDaILqJ1E4SA2ugneAhMyw+V+Qumy5RqZJW3
   43axjHcV6svz4nsYHvryP84izqXWqWCNQ+28YcKhCS9cAV+oUnfsDItbW
   A==;
X-CSE-ConnectionGUID: SToE3fmMRpChx0kme4lgMA==
X-CSE-MsgGUID: TiNYX5saSKGGDuLOxBg2jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30341725"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30341725"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 06:42:15 -0800
X-CSE-ConnectionGUID: x6YqM3hPSRKtDsmOnwIFAQ==
X-CSE-MsgGUID: HsN0tEdMRzmgA6Kc6CDVHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="83704776"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.246.8.237])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 06:42:14 -0800
Date: Tue, 5 Nov 2024 15:42:11 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: linux-usb@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 2/3] usb: misc: ljca: set small runtime autosuspend delay
Message-ID: <Zyouw7LTmIB1hB5B@linux.intel.com>
References: <20241104085056.652294-1-stanislaw.gruszka@linux.intel.com>
 <20241104085056.652294-2-stanislaw.gruszka@linux.intel.com>
 <c669e2fd-5c6e-4f8d-bee3-1af4abb8b61a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c669e2fd-5c6e-4f8d-bee3-1af4abb8b61a@redhat.com>

On Mon, Nov 04, 2024 at 02:50:31PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 4-Nov-24 9:50 AM, Stanislaw Gruszka wrote:
> > On some Lenovo platforms, the patch workarounds problems with ov2740
> > sensor initialization, which manifest themself like below:
> > 
> > [    4.540476] ov2740 i2c-INT3474:01: error -EIO: failed to find sensor
> > [    4.542066] ov2740 i2c-INT3474:01: probe with driver ov2740 failed with error -5
> > 
> > or
> > 
> > [    7.742633] ov2740 i2c-INT3474:01: chip id mismatch: 2740 != 0
> > [    7.742638] ov2740 i2c-INT3474:01: error -ENXIO: failed to find sensor
> > 
> > and also by random failures of video stream start.
> > 
> > Issue can be reproduced by this script:
> > 
> > n=0
> > k=0
> > while [ $n -lt 50 ] ; do
> > 	sudo modprobe -r ov2740
> > 	sleep `expr $RANDOM % 5`
> > 	sudo modprobe ov2740
> > 	if media-ctl -p  | grep -q ov2740 ; then
> > 		let k++
> > 	fi
> > 	let n++
> > done
> > echo Success rate $k/$n
> > 
> > Without the patch, success rate is approximately 15 or 50 tries.
> > With the patch it does not fail.
> > 
> > This problem is some hardware or firmware malfunction, that can not be
> > easy debug and fix. While setting small autosuspend delay is not perfect
> > workaround as user can configure it to any value, it will prevent
> > the failures by default.
> > 
> > Additionally setting small autosuspend delay should have positive effect
> > on power consumption as for most ljca workloads device is used for just
> > a few milliseconds flowed by long periods of at least 100ms of inactivity
> > (usually more).
> > 
> > Fixes: acd6199f195d ("usb: Add support for Intel LJCA device")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> 
> Thank you so much for looking into this and fixing it!
> 
> Patch looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> I have also given this a test run on a "ThinkPad X1 Yoga Gen 8" and
> everything there works at least as well as before:
> 
> Tested-by: Hans de Goede <hdegoede@redhat.com> # ThinkPad X1 Yoga Gen 8, ov2740
> 
> Regards,
> 
> Hans
> 
> p.s.
> 
> I take it from the commit message that you have no clear idea what exactly is
> happening in the failure case ?

Yes, that's correct. We have only some suspicions, but none of them
was confirmed.

Regards
Stanislaw

