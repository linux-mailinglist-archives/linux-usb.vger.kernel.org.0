Return-Path: <linux-usb+bounces-29494-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AE497BF7A5E
	for <lists+linux-usb@lfdr.de>; Tue, 21 Oct 2025 18:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 32B75354B7E
	for <lists+linux-usb@lfdr.de>; Tue, 21 Oct 2025 16:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9F73491E4;
	Tue, 21 Oct 2025 16:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="fAvmGZ4T"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04B33491CD
	for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 16:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761063985; cv=none; b=A+zIxwoqxGiA12GmJlFCuS6YfGz0Ch09M0TAfuv/GOHpezmc6SH0u7CaX92ZpkNxL3UriM/GK+qOJ7W+8fszmezbB36D6+QP+ttsqoN2kwRMh3C4BFhPDxzLaUfN+28i7oaGb64yOKKHG7NiGC/DTP6DyJ6/8jD7jP+sufwWqKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761063985; c=relaxed/simple;
	bh=CuQeZe4Y5bn9FzHbLB46TKbarzG3ntEyBt3DxwbZKqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cp4ULrlLsLxqd71r10uvZB73oha4swYLAfrQxiMTXta6Xr1aK4pOJ3s7dTT+lcIHXLdKDNusm9hNJfevaMFuKu7R8Sn9BwWkJT5Vtbs6DAcf4lEPZqxbofg95ww1BfnPPpZPePEjqDg1BhNRfOFZHnugjNbytNpSGAHvwPGsBfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=fAvmGZ4T; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4e8b20885dcso1265301cf.1
        for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 09:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1761063982; x=1761668782; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TBIEUW1Ijn6qLPXihQhrTNnQ7Cp+uMufdF3SJ+N/9tw=;
        b=fAvmGZ4TClMRZ9T7NyftoGiXfKXDAS6PVmP/+mpLloPvrVPQL1+w7tEjSTtFcldxmJ
         /aL/QZ9juGa/WmJ8FJ5ivvzQL2IFhorCjWpe2uoSFuOjoEtEc9vIBAU/9zJEyQHg5fVv
         GIpS+xbHWX0CX1SdQ/uD19hG03viQAihcGcuTX4Ho/0vA88Kdo0jvqfxU00KlG1DwgBK
         9ABVl98Ckt1LwktLfceJT0zeVWijZbu19rwdamhAPqTkVwB21han01Ih0U6nviqn8vOH
         iqEF0rgEwOHHk31ww9wFtyy1DdawU75VTQi5+BxQYpjoH6/3rqmdos8LArlzeYIm4uib
         W65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761063982; x=1761668782;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TBIEUW1Ijn6qLPXihQhrTNnQ7Cp+uMufdF3SJ+N/9tw=;
        b=pUPAXrvghn7gQJ/IHKHc1yVkN8pFAuoXjAsAy4JMmzORIdF8/x2rHiaM1K0EiSmsMC
         vuSu/VeHa9b/YXTMGnQhH/jFZfYfy/k3LbaJpW1CsuUQBU4orWLx+W5oElMvzMb4g46a
         vS0xfIUO3z3wOWzhCW864TpYJvyB6xNEUfTYhafYuS3+90s1G6BXI9W52nihJ8mGYwZm
         SSKica/pET4vToDUZI+1M8nv0OASfeyc2MagZkC7ACy7xpx4stwvMZPevaWVpz4gOWV0
         A6aFy4vGAXUvRNg0hqcTeIM2Lwgy7JtxVg0telmcyiIJx8iQ7RYOGGNJb0rLrfkNsZhf
         lMOA==
X-Forwarded-Encrypted: i=1; AJvYcCXNq7SXRqG4QqxvDvA91BkwnGnuxuhJM2YNSHEZAs2UBQRP2KMdXcomD/dBfFoNblt2VaIOzV47sj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNUpW1o1yyC+x+0ToBXFD5c56ooCiKguvUG9D3WdEza4X1+J6K
	XtHBmWiEvbRcfLjsloc4zWRcYSEjP/iyiJyGYpIUCarvXy4v8rFNPhtWeGLRsz2SKeAKunZysZh
	qg6A=
X-Gm-Gg: ASbGnctuHoRs9cg0Zn/CKACRaBbC0bEAMslPRIpmdS5ScKZM+JvR8Q6Bu+auXoZ23f4
	/0wiq1kQ2af+esSLmNmhKnk1jiWqC7Win3shIcKulmrWzMMxNS+aI8KB1aDGZ93kIGPZN4Z06rc
	tQInfjSWA6NcErLIRLHAMr+8obnNqXOQSvgRRFpyR0tyG0KAzXvLDD+JYs1c2lZHhyjX3Wy54tP
	ur5BFy/mngUkhPzHNj8tDE3lTIvVZA7xzq6ITOk9pVxLxuIw6P47MbeV5MXE7nw9zZhEl2fpv+T
	fdGgmcuL47Xmr63O80+xMlxD92FaZp1pe8xFroEVdJ6pKXZN4Uy7Tt0ziUqMGhQQtBkAm0bM5SA
	7xCguPQ5b9XyJ/bUluDduwSyH3PU09e0KuTvIbgO8m4/rQbK5iQakxAYEm3wye7/I7foTkDWHYd
	XA9A==
X-Google-Smtp-Source: AGHT+IHA/MSFpgq5NDyGr8WrflLyOACBFE86QRu/uhfrAdUbUBGXWHWfTlUHBZGHXFWlLPjyOYFF1w==
X-Received: by 2002:ac8:7d94:0:b0:4e8:b979:c7c8 with SMTP id d75a77b69052e-4e8b979cc1bmr117233881cf.28.1761063982457;
        Tue, 21 Oct 2025 09:26:22 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::ba76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87cf5235863sm70942586d6.29.2025.10.21.09.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 09:26:22 -0700 (PDT)
Date: Tue, 21 Oct 2025 12:26:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Yi Cong <yicongsrfy@163.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, linux-usb@vger.kernel.org, michal.pecio@gmail.com,
	netdev@vger.kernel.org, oliver@neukum.org, pabeni@redhat.com
Subject: Re: [PATCH net v5 2/3] net: usb: ax88179_178a: add USB device driver
 for config selection
Message-ID: <3fe0a4f7-ba9a-4eb2-9df9-0273584ebbc3@rowland.harvard.edu>
References: <7353775a-bc2c-4c2d-93bc-b8d3e03c3496@rowland.harvard.edu>
 <20251021062629.2919772-1-yicongsrfy@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251021062629.2919772-1-yicongsrfy@163.com>

On Tue, Oct 21, 2025 at 02:26:29PM +0800, Yi Cong wrote:
> On Mon, 20 Oct 2025 22:59:36 -0400, Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Tue, Oct 21, 2025 at 10:29:25AM +0800, Yi Cong wrote:
> > > On Mon, 20 Oct 2025 11:56:50 -0400, Alan Stern <stern@rowland.harvard.edu> wrote:
> > > >
> > > > Instead of all this preferred() stuff, why not have the ax88179 driver's
> > > > probe routine check for a different configuration with a vendor-specific
> > > > interface?  If that other config is present and the chip is the right
> > > > type then you can call usb_driver_set_configuration() -- this is exactly
> > > > what it's meant for.
> > >
> > > I tried calling usb_driver_set_configuration inside driver's probe()
> > > to select the configuration, but my USB network card has three
> > > configurations (bNumConfigurations=3), which causes usb_driver_set_configuration
> > > to be called twice within probe():
> > > ```
> > > static int ax88179_probe()
> > > {
> > >         if (bConfigurationValue != I_WANT) {
> > >                 usb_driver_set_configuration(udev, I_WANT)
> > >                 return -ENODEV;
> > >         }
> > >         //else really probe
> > > }
> > > ```
> >
> > Why is it called twice?  The first time probe() runs, it calls
> > usb_driver_set_configuration() with the config that you want.  Then the
> > second time probe() runs, the config you want has been installed, so
> > there's no reason to call usb_driver_set_configuration() again.
> >
> > Unless something is going wrong, that's how it should work.  And the
> > total number of configurations should not matter.
> 
> It might not be caused by the number of configurations, but rather by
> the fact that usb_driver_set_configuration handles configuration changes
> through a work queue.

I don't see why using a work queue should make any difference.  If you 
really want to find out what's going on, you could add a dump_stack() 
call to the probe routine.  And maybe a printk at the point where it 
calls usb_driver_set_configuration().

Alan Stern

> I suspect this is the reason (although I haven't verified it further
> —I just observed this behavior and switched to a different implementation
> by using choose_configuration):
> ```
> int usb_driver_set_configuration(struct usb_device *udev, int config)
> {
> ...
> 	INIT_WORK(&req->work, driver_set_config_work);
> 	schedule_work(&req->work);
> 	return 0;
> }
> ```

