Return-Path: <linux-usb+bounces-28066-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FF7B56992
	for <lists+linux-usb@lfdr.de>; Sun, 14 Sep 2025 16:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84FE8188E058
	for <lists+linux-usb@lfdr.de>; Sun, 14 Sep 2025 14:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC31A212548;
	Sun, 14 Sep 2025 14:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NDQQN2iZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329C935949
	for <linux-usb@vger.kernel.org>; Sun, 14 Sep 2025 14:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757859010; cv=none; b=uF+bVQI7PFnti6CqD9Bswxa+NovWS9oE384VlIgO+mlY3SGVG9zWvvACfwTrbx2jXv7b1WTTdbkxtc4iLOsaImVboCKfTVbH4n7oz9iv2pSLCiN8FRbnmmcPr2ED5tBRtprJTSGKDDAUEeQQANbH4uDXTagXus7TggiOE8Ghi7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757859010; c=relaxed/simple;
	bh=AiXb8Sh7zSg5Hq0XZxSkmuFtIG9MhEdxEZ3+CGUB09c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sMHXVikbxmkTRNp17XM2HkIUc16R6gWP0i+m3fIHsKJjPMFIHVNS/HQnuEPcMp9zn7oUQ44MyyUIFIQPn/kkf5xzOBV8zPOKVjdTmaQOuCKbbGbM86l4owNfFP9HmQidcX/v3FOK8VuP2yIyNegtVFJZiZDWT8Q4wZAmYyS/Tvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NDQQN2iZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E1CC4CEF0;
	Sun, 14 Sep 2025 14:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1757859009;
	bh=AiXb8Sh7zSg5Hq0XZxSkmuFtIG9MhEdxEZ3+CGUB09c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NDQQN2iZIzgLHNuCAKO5Wxr9yUIGoAXZjpR1QFnseY7wsfBu7SlmSdAbQ/1qx8foI
	 DiVxQBgnPD7rYKn9w4gFv75jkppDYqZ7UyUFQFAoOcJ3z0/sKN2nApB4H6hkkUCoIf
	 FgX6apVHPgUEZjJsdTlQKkftj1n7Jx0+qkF3bHuY=
Date: Sun, 14 Sep 2025 16:10:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Owen Gu <guhuinan@xiaomi.com>
Cc: linux-usb@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>,
	Christian Brauner <brauner@kernel.org>,
	Chen Ni <nichen@iscas.ac.cn>, Peter Zijlstra <peterz@infradead.org>,
	Sabyrzhan Tasbolatov <snovitoll@gmail.com>,
	Akash M <akash.m5@samsung.com>, chenyu <chenyu45@xiaomi.com>,
	yudongbin <yudongbin@xiaomi.com>, mahongwei <mahongwei3@xiaomi.com>,
	jiangdayu <jiangdayu@xiaomi.com>
Subject: Re: [PATCH] usb: gadget: f_fs: Fix epfile null pointer access after
 ep enable.
Message-ID: <2025091403-favorite-dealmaker-1703@gregkh>
References: <20250912040506.142146-1-guhuinan@xiaomi.com>
 <2025091255-bluff-next-ea2b@gregkh>
 <aMQckhj2UotZZpVa@oa-guhuinan-2.localdomain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMQckhj2UotZZpVa@oa-guhuinan-2.localdomain>

On Fri, Sep 12, 2025 at 09:47:26PM +0800, Owen Gu wrote:
> On Fri, Sep 12, 2025 at 07:32:04AM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Sep 12, 2025 at 12:05:06PM +0800, guhuinan wrote:
> > > A race condition occurs when ffs_func_eps_enable() runs concurrently
> > > with ffs_data_reset(). The ffs_data_clear() called in ffs_data_reset()
> > > sets ffs->epfiles to NULL before resetting ffs->eps_count to 0, leading
> > > to a NULL pointer dereference when accessing epfile->ep in
> > > ffs_func_eps_enable() after successful usb_ep_enable().
> > > 
> > > Signed-off-by: guhuinan <guhuinan@xiaomi.com>
> > 
> > Please use your name, not your email alias for the From: and
> > signed-off-by lines.
> > 
> Okay
> > > ---
> > >  drivers/usb/gadget/function/f_fs.c | 9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> > > index 08a251df20c4..f4aae91e7864 100644
> > > --- a/drivers/usb/gadget/function/f_fs.c
> > > +++ b/drivers/usb/gadget/function/f_fs.c
> > > @@ -2407,7 +2407,13 @@ static int ffs_func_eps_enable(struct ffs_function *func)
> > >  	ep = func->eps;
> > >  	epfile = ffs->epfiles;
> > >  	count = ffs->eps_count;
> > > -	while(count--) {
> > > +	if (!epfile) {
> > > +		pr_err("%s: epfiles is NULL\n", __func__);
> > 
> > No need for this debugging line, right?
> > 
> Okay
> > > +		ret = -ENOMEM;
> > > +		goto done;
> > > +	}
> > > +
> > > +	while (count--) {
> > 
> > What prevents the pointer from changing right after you check it?  This
> > will still race :(
> > 
> > You need a lock somewhere to fix this properly.
> 
> Dear, 
> The ffs->epfiles pointer is set to NULL in both ffs_data_clear() and 
> ffs_data_close() functions, and its modification is protected by the
> spinlock ffs->eps_lock.
> And the whole ffs_func_eps_enable() function is also protected by ffs->eps_lock.

Ah, that's good.  Please mention that in the changelog text when you
resubmit a new version of this patch.

thanks,

greg k-h

