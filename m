Return-Path: <linux-usb+bounces-10525-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B902F8CEAD6
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2024 22:26:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41CE51F223A2
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2024 20:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED28284047;
	Fri, 24 May 2024 20:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oNnmfKn8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E906FE16
	for <linux-usb@vger.kernel.org>; Fri, 24 May 2024 20:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716582353; cv=none; b=nxKUH/ACzRMsNtmHRGcYG+qK6nVZfWOxiB99HRNIqqdNMWFUXTLoIJSr4Usza3t9AWUcU+noHtNwaeq04i8k2i7KSVNJOjHuaVdzT8DnkztrPjTtMT/u3Gu+ED6BcW59OKML4tu3tWzebSD6blujZ+o/nCEu/FdnVCfVfnDcTg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716582353; c=relaxed/simple;
	bh=RaY9hyFpOtYNxTIBYqwOINTifAgs22Scq79hnarJ7A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pfkudR/6A4Nf79dFaUzhQ87DTiRlLfz+mN9wY6hORtW4BTYYiO3XsfFEgRgAxuAh0bgPKl/Kgt+KMwb/Yt8eiCuznCXagdg2uqD9LiiaO21REw04VSVZfj8ohxA18xZNrtu8jLHbEQlYJZYVSE5pj9G3Vmj28IsaqfTJwJXNlzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oNnmfKn8; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e73441edf7so60446351fa.1
        for <linux-usb@vger.kernel.org>; Fri, 24 May 2024 13:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716582350; x=1717187150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jx3BprpNUSkVM0+eAZtkzOHyPIQhydfm1dAtCiLJcW0=;
        b=oNnmfKn8gqMocKUM/xSHq/bF6eK3xxhS/IhqtjLDvjaHBH+7+xPRYzvxaOcaPUqlYr
         51PrVqOhM5ZqMATO0PJeejR7aLiKp9oZrMcrq517dwaFJsbq4LsjPNQrKuGCPGSQFqHM
         Ya4XlKk140hDyBEofJr01zT/+tlyEShhRH8CG/GZfveMwKmzLzC4DIV6YSs111lRF4sc
         nrp4tmRoK0WIvyEcQomi2XeTCPbgmjdWW2bRSalpowqNpKld+10T40ADw3ygvhWEQo3P
         428CZHEWFHRxrgtdHLQAjpp8dR3pT/EBFC1WlAbWY8I7CnZylHoBpOR3Df8LagUyF0b3
         TQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716582350; x=1717187150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jx3BprpNUSkVM0+eAZtkzOHyPIQhydfm1dAtCiLJcW0=;
        b=RxYOYZFad5JzNUGSLV+CZLqKLqWjn0vMUfdCAknrxbvG3nbpfuhoa3X9i4l4P0GjH5
         Yhz3cw0PQXgTCkzcEVVdr7c+JqX9m7c/rxjdi+O/DrMdK1rpO+1V+cvyMhlcWipuqkE2
         9Lh60MaTVNANXuUYj2UY9d4m0kvHnqUn0jqntXKwKB1bepVhL1oHlV0uhmSguni59bKH
         Zs67+g4FzBTD+MdEg3P7SSKF+Tp9+7W//FJ8va2Tr4uFiSnJ8DZEV0p9NaruVVDSGrBr
         KCF5SQJ+XrV94yiwanpVv6gRQfODdi6THNHIx+EGYO439uaCM4/8g7+msso01UfzYX5J
         RJvw==
X-Forwarded-Encrypted: i=1; AJvYcCUNShCyWV5IQ/j4LA34B4hPxJUMx5gy/LSBtKQTN5BZmdbz+XFLqAbdEkqaQ+H7gBYu8eH6cXV3SNZCThV3jhJflWE/Ymn4YoO7
X-Gm-Message-State: AOJu0Yz+1J3XFRVSys20kp2NiVKdDVZwzwpG1SbxJwI8k7VEteia86rl
	bHWMGxiBD6dXHfAQiqu93NPaDkOxotpKsFbbX+swfChhozeqY1LgwZjEaPNFFSs=
X-Google-Smtp-Source: AGHT+IHc8QdXshz7wqYQ4pXl2zwktTW8YbFqc2ze8CN1ItkHWWwaXtP/kKIr0mhOWT08wbsu5SiRYQ==
X-Received: by 2002:a2e:9c0b:0:b0:2e7:3224:9f51 with SMTP id 38308e7fff4ca-2e95b09a966mr22545641fa.18.1716582349971;
        Fri, 24 May 2024 13:25:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcc48bcsm3357461fa.1.2024.05.24.13.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 13:25:49 -0700 (PDT)
Date: Fri, 24 May 2024 23:25:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v1 2/2] usb: typec: mux: gpio-sbu: Make enable gpio
 optional
Message-ID: <hepsaenglmlupksq336b36p5ppkpdxg6ndkjgrpi6ea6zyple6@j5t5baspa2id>
References: <20240524071034.4441-1-francesco@dolcini.it>
 <20240524071034.4441-3-francesco@dolcini.it>
 <5of64nmgpotr7fu66urgko5gfvr4ffhmff4dgkagkdvwh2dywk@etlw6rsmhki6>
 <ZlB6ruZ8j2rVsIio@gaggiata.pivistrello.it>
 <3z3gi2s2dxlflmfpcirutvesnj6gsxyriijl2jrc2udaqucoyb@6scxw5hb2nv7>
 <ZlCNPg2iuvSTpVJs@gaggiata.pivistrello.it>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZlCNPg2iuvSTpVJs@gaggiata.pivistrello.it>

On Fri, May 24, 2024 at 02:51:10PM +0200, Francesco Dolcini wrote:
> Hello Dmitry,
> 
> On Fri, May 24, 2024 at 02:42:04PM +0300, Dmitry Baryshkov wrote:
> > On Fri, May 24, 2024 at 01:31:58PM +0200, Francesco Dolcini wrote:
> > > On Fri, May 24, 2024 at 12:56:15PM +0300, Dmitry Baryshkov wrote:
> > > > On Fri, May 24, 2024 at 09:10:34AM +0200, Francesco Dolcini wrote:
> > > > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > > 
> > > > > The enable gpio is not required when the SBU mux is used only for
> > > > > orientation, make it optional.
> > > > > 
> > > > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > > ---
> > > > >  drivers/usb/typec/mux/gpio-sbu-mux.c | 11 ++++++++---
> > > > >  1 file changed, 8 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/usb/typec/mux/gpio-sbu-mux.c b/drivers/usb/typec/mux/gpio-sbu-mux.c
> > > > > index 374168482d36..cf44259980a1 100644
> > > > > --- a/drivers/usb/typec/mux/gpio-sbu-mux.c
> > > > > +++ b/drivers/usb/typec/mux/gpio-sbu-mux.c
> > > ...
> > > > > @@ -66,6 +66,9 @@ static int gpio_sbu_mux_set(struct typec_mux_dev *mux,
> > > > >  {
> > > > >  	struct gpio_sbu_mux *sbu_mux = typec_mux_get_drvdata(mux);
> > > > >  
> > > > > +	if (!sbu_mux->enable_gpio)
> > > > > +		return -EOPNOTSUPP;
> > > > 
> > > > Can we skip registering the mux if there is no enable_gpio? This can
> > > > save users from the unexpected errors during runtime.
> > > 
> > > Yes, I considered this option.
> > > 
> > > The rationale for the current implementation is that if the device tree is
> > > correct (no mode-switch property, when enable-gpios is not present), nobody
> > > will call gpio_sbu_mux_set() so no runtime error is possible. If the
> > > configuration in the DT is not correct you get this runtime error.
> > > 
> > > With your proposal in case the DT configuration is not correct there will be no
> > > errors from the kernel, but the functionality will not work.
> > 
> > I'm slightly biased maybe, but I prefer an error from probe (or
> > dependent devices being deferred). On the other hand, current motto is
> > that 'the kernel should not duplicate dt-validate's work'.
> 
> I am in favor of "the kernel should not duplicate dt-validate's work".
> 
> Now the question is if you are ok with the current implementation or you want
> me to change the way you suggested.
> 
> Or maybe there is a third variant, not doing the return -EOPNOTSUPP and
> registering gpio_sbu_mux_set() even if the gpio get returns NULL. This is a
> one-line patch and everything will work just fine.

I'm fine either way.

-- 
With best wishes
Dmitry

