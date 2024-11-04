Return-Path: <linux-usb+bounces-17065-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C96739BB8B4
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 16:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 570FDB24A58
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 15:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7FCE1BC077;
	Mon,  4 Nov 2024 15:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cnb6klM4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4DA2B9A2
	for <linux-usb@vger.kernel.org>; Mon,  4 Nov 2024 15:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730733240; cv=none; b=VUgN6nKM3oMERDztl2JNH70f5PFAJwcACTmcPULjl0ymCbBxVWnFXZFeBJeJL4DawXDn9+rUs+XRcQQAkBZvRO79+4+0I+0GtsFrUMVRtrywukbNH2/zpte8NGnpzW3rSuRlZ+EfoltVqv+4ikrkZJkilNC1jgQr/1e/Pa+KEfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730733240; c=relaxed/simple;
	bh=YOohcStAhIKtymAZhGQpIv+ubyrNubqhX3WSlBnTcfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEE7/95gwBTvX13rE+EfRXgYwJXivrbMq/vJcJ/2m+cSm8iFad0UyxW1YJ82sEQu3OR4Iu74uoTMGfWYogLqXhxvw5nDzrniDBJ0UpI6yzZfZdoZ/dmRE9ngu+7D9oO2MyUCwl7rdiio/l+YRRcUP+tr7snkqVzMh1a25VmSiU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cnb6klM4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730733238; x=1762269238;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YOohcStAhIKtymAZhGQpIv+ubyrNubqhX3WSlBnTcfM=;
  b=cnb6klM4cwW9WsdnNUowFqy3biMVjm87wrbuRIFDbiT6MbJn2UZMpAUg
   zsOwcjNFA9NFRsFLlQhPBXC3yNbsjQ7mX0vSEwP93ICU6tT7r30QyOJVO
   UkRTRH93QNO3AiXhMjqDmEV/XH8OLJh5emz9jwcDBlMSQn+fZ/KW/Clwj
   bWnw4RkdIaDFCHPt390AKP76yy4AyW+CSC5SfAoQb6QS2stN3m8q2V9lR
   /YxSz3yqCtlbzhNvX0c5io2iy5z8lZw84hEABzaVBJYcs9m2grdl83oYa
   N3T1yrn8tkmEUPUzmCoaR2UN6pOCotodvHpHpZX/iGc5on61EoNO8qh6F
   Q==;
X-CSE-ConnectionGUID: KfBZZkiWRCWrajeiVP3uRQ==
X-CSE-MsgGUID: roCg5QLyRU+w+y6rdSZ3lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41808433"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="41808433"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 07:13:57 -0800
X-CSE-ConnectionGUID: GlLoZTQATyKnf/ezMt8gIA==
X-CSE-MsgGUID: a825Es0pTweNSd3vdNWUOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="114479408"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 07:13:56 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A8FDA11FA28;
	Mon,  4 Nov 2024 17:13:53 +0200 (EET)
Date: Mon, 4 Nov 2024 15:13:53 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH 2/3] usb: misc: ljca: set small runtime autosuspend delay
Message-ID: <ZyjksWHwHgheKTSq@kekkonen.localdomain>
References: <20241104085056.652294-1-stanislaw.gruszka@linux.intel.com>
 <20241104085056.652294-2-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104085056.652294-2-stanislaw.gruszka@linux.intel.com>

Hi Stanislaw,

On Mon, Nov 04, 2024 at 09:50:55AM +0100, Stanislaw Gruszka wrote:
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

I'm not very happy about this patch. While it makes the problem go away,
apparently, the result seems to be for a reason that should have nothing to
do with the underlying issue.

I'm still not saying no to the patch as it hides the problem or at least,
but we should properly describe the problem in the driver. It may well be
that after an unrelated update elsewhere in the kernel the problem
reappears again.

> 
> Fixes: acd6199f195d ("usb: Add support for Intel LJCA device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>  drivers/usb/misc/usb-ljca.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
> index dcb3c5d248ac..062b7fb47114 100644
> --- a/drivers/usb/misc/usb-ljca.c
> +++ b/drivers/usb/misc/usb-ljca.c
> @@ -810,6 +810,7 @@ static int ljca_probe(struct usb_interface *interface,
>  	if (ret)
>  		goto err_free;
>  
> +	pm_runtime_set_autosuspend_delay(&usb_dev->dev, 10);
>  	usb_enable_autosuspend(usb_dev);
>  
>  	return 0;

-- 
Kind regards,

Sakari Ailus

