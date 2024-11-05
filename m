Return-Path: <linux-usb+bounces-17093-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB039BC5C4
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 07:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63F38281B91
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 06:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D291DB54C;
	Tue,  5 Nov 2024 06:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRlW51Yg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1D61F754A
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 06:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730788890; cv=none; b=YLVTm4DdRSNHhNYQdNg/btC+H1B8fcFdcOFPeRcteRSYB9PqLeE2i7AhVGRO98OImDykzPCGIwH6WO1hFaZLinqGz2yUc196689OdwgQ6c6+cEMe+vKAw7NudwNw13C4al0u9Hl/SDSVDU/dxNRg5RQsQTjtvmKGmkW7ctb5TOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730788890; c=relaxed/simple;
	bh=U4VSQzbqttxk4ngKd2qAhg6L5Jen/sgihFVP3bQMbFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qCGT7eQvHL4RI7H306jm1/nrTuyll572Sa8L9kpZ7cHpfBcnJgtJTc5wcvyQwm9NEnpVvi9fY79zrusgoP6P3BoVQ1JbTcAmDDF0Dpl7jJuU0OBPcgquGcne8BcbaEoNFi1px61G9BcerQtTTSOon1wH5CRdEiVt1bHVQm5Zj3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MRlW51Yg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730788889; x=1762324889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U4VSQzbqttxk4ngKd2qAhg6L5Jen/sgihFVP3bQMbFI=;
  b=MRlW51YgA1mhIUVuWeDAIoHMQlR9Es1yknkynij2fBUJtrbVV43HoqAv
   g+GNACPVdkGPGBvNlWiuBOVX/LNFcPRvdlVMlrAu3Ipg7pIWYA1jypJtd
   rt+4qTgeHgnXecVQOMF7H+Xe2b5XFKSiuoprtzgn/RPYT5RH8xfUw/3uK
   dp+gbBkpkLJ96KZsHBwI6lgwoa2PyQ0T5NyZJaOTqC3wgzmqhApukQI6a
   OOfLM7UpdhpXglaldAqQxNd0T2BlNRAQAwp5PzHg4mDwWaTN6VbbtGzvg
   NRrEUWlAlgQFaPE0tBQjPUhenGuWQAw9Pqr4nZZKuBBhGxO7FqRq3R1mY
   A==;
X-CSE-ConnectionGUID: Q/8vXSuQRLOmnGe1KTw1Xw==
X-CSE-MsgGUID: hERGkS2tSjeRmmiGa9TDBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="29941207"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="29941207"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 22:41:28 -0800
X-CSE-ConnectionGUID: Z3cVNFEeT3SV1/lMU+BWLw==
X-CSE-MsgGUID: CuYOGtwTRBuYqZyae87cdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="84002438"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.118.67])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 22:41:27 -0800
Date: Tue, 5 Nov 2024 07:41:25 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH 2/3] usb: misc: ljca: set small runtime autosuspend delay
Message-ID: <Zym+FZSsToOcCt/5@linux.intel.com>
References: <20241104085056.652294-1-stanislaw.gruszka@linux.intel.com>
 <20241104085056.652294-2-stanislaw.gruszka@linux.intel.com>
 <ZyjksWHwHgheKTSq@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyjksWHwHgheKTSq@kekkonen.localdomain>

Hello Sakari,

On Mon, Nov 04, 2024 at 03:13:53PM +0000, Sakari Ailus wrote:
> Hi Stanislaw,
> 
> On Mon, Nov 04, 2024 at 09:50:55AM +0100, Stanislaw Gruszka wrote:
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
> 
> I'm not very happy about this patch. While it makes the problem go away,
I'm not very happy having unreliable camera on my laptop ;-)

> apparently, the result seems to be for a reason that should have nothing to
> do with the underlying issue.
I can not be certain here, but I think when we do suspend ljca device
it either resets part of HW internally or do some latch of output gpio pins.
I think that is related to the root of the problem.

> I'm still not saying no to the patch as it hides the problem or at least,
> but we should properly describe the problem in the driver.
Ok, I can add comment before setting the delay.

Regards
Stanislaw

> It may well be
> that after an unrelated update elsewhere in the kernel the problem
> reappears again.
> 
> > 
> > Fixes: acd6199f195d ("usb: Add support for Intel LJCA device")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > ---
> >  drivers/usb/misc/usb-ljca.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
> > index dcb3c5d248ac..062b7fb47114 100644
> > --- a/drivers/usb/misc/usb-ljca.c
> > +++ b/drivers/usb/misc/usb-ljca.c
> > @@ -810,6 +810,7 @@ static int ljca_probe(struct usb_interface *interface,
> >  	if (ret)
> >  		goto err_free;
> >  
> > +	pm_runtime_set_autosuspend_delay(&usb_dev->dev, 10);
> >  	usb_enable_autosuspend(usb_dev);
> >  
> >  	return 0;
> 
> -- 
> Kind regards,
> 
> Sakari Ailus

