Return-Path: <linux-usb+bounces-11395-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B00790D208
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2024 15:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 243A228416A
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2024 13:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29ACC1AB502;
	Tue, 18 Jun 2024 13:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+cjrnpf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527EA1591FC
	for <linux-usb@vger.kernel.org>; Tue, 18 Jun 2024 13:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718716502; cv=none; b=aT4TagMafKzg7N7GX+bpGQ3XTXDJp1jb5rijyzYe9p+7hOfqhcomLHKmGOjwMslshlS8fRqegCA/wEofTm6dlTekbYqAsUOejiyjiOvPgwBtHJwRQKZNK04WGLRgnRQ4fawqGo+r7Hx8la7H3tVkTG1ZXNZd6m8xbyBLT3lm/Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718716502; c=relaxed/simple;
	bh=cedYYYK/Og/w8drdZof+aFndR8WS1rg3dfsw99d/eYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EEuyKBp+VT4WGZnEfKlKHbBT0tWJV9ajW5nxSFDF4p7RvgUGuoaKCdtukf8uXpOMxk/oUQtJFc9WZSZTnK0DYblMPvox+MEBk5LARPQKPfMagJldx4K9I3RHM8S6ot8+4dXIHaWk+1xxAAy4ZGsB+RLQ2dWb9SRaSBRzgZXXHWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+cjrnpf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718716501; x=1750252501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cedYYYK/Og/w8drdZof+aFndR8WS1rg3dfsw99d/eYQ=;
  b=W+cjrnpf/QIGdE9BjMjGc5NQUSxkYAFq7slEk/RmcRufjtY9tnm9s4cn
   a4erFgqtRu3rUaD9B+LMpvqkqMkhHNlf9hMvylz5+9GywvqDaZegeRMTO
   L8ElSf9MOJFTafvpyHthne03wtk0AOeztNKJCiT6DccQCU6ftqiStO57g
   0qRr/vOPsK8MxDQFFSr0FSOl0aNIFuoyxeI85/vdhh4288I8+pZ0IntQi
   wVtjMUqHVEANqUZ9Kp61tv1fE+4dR3s+SWBuxD++BNbaHHSSYytH5mQ6m
   wPSb7das15gry7xiiV0rlrylH9cxW+W1BJu+dq3lUtnFMDV9yzYsjfHS+
   g==;
X-CSE-ConnectionGUID: qRBTwelfRp2/Xr/a0o8G6w==
X-CSE-MsgGUID: orDFDWiOSyS4uBboEMybIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="26713486"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="26713486"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 06:15:00 -0700
X-CSE-ConnectionGUID: 5b2CHaAhTFmbEkf7MOEQVQ==
X-CSE-MsgGUID: kWoaOQqbRtKrToAd6YC8bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="41660021"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmviesa010.fm.intel.com with SMTP; 18 Jun 2024 06:14:59 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 18 Jun 2024 16:14:57 +0300
Date: Tue, 18 Jun 2024 16:14:57 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Changing the driver data type to void
Message-ID: <ZnGIURLIAMijpYUb@kuha.fi.intel.com>
References: <20240618120024.3384047-1-heikki.krogerus@linux.intel.com>
 <2024061858-boring-wrecker-3871@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024061858-boring-wrecker-3871@gregkh>

On Tue, Jun 18, 2024 at 02:20:03PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Jun 18, 2024 at 03:00:24PM +0300, Heikki Krogerus wrote:
> > Let's use the same data type as struct device.
> > 
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> >  drivers/usb/typec/ucsi/ucsi.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> > index 97eda8cd63df..1280cac314fe 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.h
> > +++ b/drivers/usb/typec/ucsi/ucsi.h
> > @@ -395,7 +395,7 @@ struct ucsi_debugfs_entry {
> >  struct ucsi {
> >  	u16 version;
> >  	struct device *dev;
> > -	struct driver_data *driver_data;
> > +	void *driver_data;
> 
> Nice, but why?
> 
> And how was this building?  I don't see a "struct driver_data" defined
> anywhere here.

I had not even thought about that, but that's weird.

I can write anything after "struct" there, and it will just build
without any warnings or errors. The complier does not seem to even
check the type in this case, since the member is always assigned a
void pointer.

So this is actually a bug, no?

thanks,

-- 
heikki

