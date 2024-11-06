Return-Path: <linux-usb+bounces-17222-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BA19BEF19
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 14:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14A7528615D
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 13:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2E11F9AB9;
	Wed,  6 Nov 2024 13:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxHGhWuq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747FC1F9AB5
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 13:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730900016; cv=none; b=iHrW9NbA+iS+pTjs7FyPN1uutu2QwPTxuuCq44mLtRLL1PYocqMJyefL8QoZFIK8A9+qhmh5C6qvRt5Z+MHz6gQwRhjkryIXCXpt4V3UlkB2jZrHnKhKpdcHucR1hexfEfD7DnMuiKw/Ez4x6nR4mR3DJ6w09cgVFpdXDbPT1gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730900016; c=relaxed/simple;
	bh=CY1kimglc6LYN2qnDFe1QsPstxIza900wyAU/ilJs6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FkY+5BYByb+QVfibxDF2Vz8Pe+qpTpLqwwC5x6BN3rGe7AAAZxkn7xNj1A3JSEghcCkRC3SncTyheyefcyZV13Rj4mscxHDL4K/K1BbXidLEhYgYwJsciLVPiPgLdP64PZrKh8bRMiwcZnepMC89DrWVdu2CKYuHhdF79uC1mxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DxHGhWuq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730900016; x=1762436016;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CY1kimglc6LYN2qnDFe1QsPstxIza900wyAU/ilJs6U=;
  b=DxHGhWuq3SIDEhIP3pXRogEEeUUPpMC0GVVa/ylfv6SpL6kZ2M3DPDah
   Hh+Jq4VApL7PIEKUmXGIuk4bbwKXOVP1lL26pUVdjk/Ja1CYTxP2KH386
   QyPJupBzNb5hN67b3G0xhsA+bv+3e+x5LWnHCSs2rUZRL5uArCh5B8hkC
   QHTyI1RhbR5nLmd4REwTqYzY/G6BGX/xM6M82iWMBzuJxbst1ZdCoK8sV
   QBXzHDCpW4FIkghBuUOkU5ZrKnskf7C9Mbcrj/kxLEr+mrzxp6BN2zKUW
   mQ3OIZEHtbNNBYrLZziPoop7QGiq36T+0zQNBj9Hjmy1EQE5o+cS+bsuh
   g==;
X-CSE-ConnectionGUID: 6S/ZIaJ/Svm9tu8drpaaFw==
X-CSE-MsgGUID: uEYb5s1ZSgyU1TRrX+ZIJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="34476779"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="34476779"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 05:33:35 -0800
X-CSE-ConnectionGUID: +J+l4xdqQ7yIBgL6drI6eQ==
X-CSE-MsgGUID: rXFE/07qRYyxFB/FRBSKWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84179903"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 05:33:34 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 95BA311F9C3;
	Wed,  6 Nov 2024 15:33:31 +0200 (EET)
Date: Wed, 6 Nov 2024 13:33:31 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v2 2/3] usb: misc: ljca: set small runtime autosuspend
 delay
Message-ID: <ZytwKz-1FLWuqIJ6@kekkonen.localdomain>
References: <20241106123438.337117-1-stanislaw.gruszka@linux.intel.com>
 <20241106123438.337117-2-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106123438.337117-2-stanislaw.gruszka@linux.intel.com>

On Wed, Nov 06, 2024 at 01:34:37PM +0100, Stanislaw Gruszka wrote:
> On some Lenovo platforms, the patch workarounds problems with ov2740
> sensor initialization, which manifest themself like below:
> 
> [    4.540476] ov2740 i2c-INT3474:01: error -EIO: failed to find sensor
> [    4.542066] ov2740 i2c-INT3474:01: probe with driver ov2740 failed with error -5
> 
> or
> 
> [    7.742633] ov2740 i2c-INT3474:01: chip id mismatch: 2740 != 0
> [    7.742638] ov2740 i2c-INT3474:01: error -ENXIO: failed to find sensor
> 
> and also by random failures of video stream start.
> 
> Issue can be reproduced by this script:
> 
> n=0
> k=0
> while [ $n -lt 50 ] ; do
> 	sudo modprobe -r ov2740
> 	sleep `expr $RANDOM % 5`
> 	sudo modprobe ov2740
> 	if media-ctl -p  | grep -q ov2740 ; then
> 		let k++
> 	fi
> 	let n++
> done
> echo Success rate $k/$n
> 
> Without the patch, success rate is approximately 15 or 50 tries.
> With the patch it does not fail.
> 
> This problem is some hardware or firmware malfunction, that can not be
> easy debug and fix. While setting small autosuspend delay is not perfect
> workaround as user can configure it to any value, it will prevent
> the failures by default.
> 
> Additionally setting small autosuspend delay should have positive effect
> on power consumption as for most ljca workloads device is used for just
> a few milliseconds flowed by long periods of at least 100ms of inactivity
> (usually more).
> 
> Fixes: acd6199f195d ("usb: Add support for Intel LJCA device")
> Cc: stable@vger.kernel.org
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Tested-by: Hans de Goede <hdegoede@redhat.com> # ThinkPad X1 Yoga Gen 8, ov2740
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

