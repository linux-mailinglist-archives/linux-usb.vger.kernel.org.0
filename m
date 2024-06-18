Return-Path: <linux-usb+bounces-11397-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3181290D3B8
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2024 16:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72A50280C78
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2024 14:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3EF882D6D;
	Tue, 18 Jun 2024 13:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RpjOODJw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7306C13AD1D
	for <linux-usb@vger.kernel.org>; Tue, 18 Jun 2024 13:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718719101; cv=none; b=TYH79eH91UpQcDLqf3ygMCvojQy34rYukzozVWDNPZisxlv05dCr0eC7qlGAmwvIUiAo4DOnPnuK2tPiN9lZdFdKPLNzoo066Uo9feqFtFuq0QDJ7FToKUrFhMSw+TY6fS65S2+f5YMuF6GVicAuTmWLP1gkw2YcnZabe+JPqew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718719101; c=relaxed/simple;
	bh=TGlheGZZm1ig7ZOxZQ9QiAOxJJBmYj5CpdO81CZUAdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDY/3JEEfKNm6VRNKAXmgm/1oUaMZRDFYghKx+6L59Pi/WDBYQ0fBQfWf74te9TNSlQ1lWIlJkfu/htEHg1H9PLXpewh84gSzo29HgvGcF6zNxAaru1BO509pOtYjpzj2Ko+1Hq0FRxarU24XSNPT7BEFBoaOzizVIgJRPprGpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RpjOODJw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69E0C4AF1D;
	Tue, 18 Jun 2024 13:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718719101;
	bh=TGlheGZZm1ig7ZOxZQ9QiAOxJJBmYj5CpdO81CZUAdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RpjOODJwsYBPpGEKLv8WJcDZHNk4YIyidmxMFjkCtnKXgjAc2eJWcsPzPM2dblvXx
	 JEnsARy7lwpwYjyuUQqJ0mn1Ha6Iu+DbtA8vPnAWS6bY7WOIYtiH0rB0yS4Gy8YgpF
	 SeKUD9zB6s6fCoStSZFeB6zP1rY8aBJM2IIL6j9U=
Date: Tue, 18 Jun 2024 15:58:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Changing the driver data type to void
Message-ID: <2024061809-monotone-freely-9e5f@gregkh>
References: <20240618120024.3384047-1-heikki.krogerus@linux.intel.com>
 <2024061858-boring-wrecker-3871@gregkh>
 <ZnGIURLIAMijpYUb@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnGIURLIAMijpYUb@kuha.fi.intel.com>

On Tue, Jun 18, 2024 at 04:14:57PM +0300, Heikki Krogerus wrote:
> On Tue, Jun 18, 2024 at 02:20:03PM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Jun 18, 2024 at 03:00:24PM +0300, Heikki Krogerus wrote:
> > > Let's use the same data type as struct device.
> > > 
> > > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > ---
> > >  drivers/usb/typec/ucsi/ucsi.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> > > index 97eda8cd63df..1280cac314fe 100644
> > > --- a/drivers/usb/typec/ucsi/ucsi.h
> > > +++ b/drivers/usb/typec/ucsi/ucsi.h
> > > @@ -395,7 +395,7 @@ struct ucsi_debugfs_entry {
> > >  struct ucsi {
> > >  	u16 version;
> > >  	struct device *dev;
> > > -	struct driver_data *driver_data;
> > > +	void *driver_data;
> > 
> > Nice, but why?
> > 
> > And how was this building?  I don't see a "struct driver_data" defined
> > anywhere here.
> 
> I had not even thought about that, but that's weird.
> 
> I can write anything after "struct" there, and it will just build
> without any warnings or errors. The complier does not seem to even
> check the type in this case, since the member is always assigned a
> void pointer.

Ah, I guess the compiler never actually has to look up what 'struct
driver_data' is if it is never referenced (i.e. you are only casting
void * to it.)

> So this is actually a bug, no?

Kind of?  But it works, so let's just leave it alone :)

I'll take this patch as it is "obviously correct" now, but sure looked
odd to start with.

thanks,

greg k-h

