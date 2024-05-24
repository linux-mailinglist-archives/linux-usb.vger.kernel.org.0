Return-Path: <linux-usb+bounces-10515-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB0D8CE4ED
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2024 13:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFD651C215D9
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2024 11:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271BF86251;
	Fri, 24 May 2024 11:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nbGQhBWE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FCD433A4
	for <linux-usb@vger.kernel.org>; Fri, 24 May 2024 11:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716550929; cv=none; b=rXJpAnr3h08F1QNN569kUEizJfDuKDzQWyUEREzyjJNwEi8ZqyWT36mjHqp63frt/3DCHhcfuYO4pWVS4kLi4UHwtedYTSokB56xhAAdeDW7jvnrPHsfEGe93YWNrqNSyFs8jPB9M351sR8cZTIG+dHjUGlOLq7xRTfmQIDvffU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716550929; c=relaxed/simple;
	bh=um20z/0h51TyiN3ed0lhaWcGjCmT5HIqNWJUIu2xitM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=td0lYlRnPVcMYiVXge/0tDpGpVvNNx0S614zoI6YwzR0NhVNOsQRougWsLQIyu07eB/U4TPIf6rQzaOGHUkg+axoQ6iLqiBbPKCN6CxMth9jW405WoB8OUJpiEV/5Q2MrHc4c4/fYCCEgk8CjouE77VZRPhZP1S12af91cipC08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nbGQhBWE; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5295a66e775so890161e87.0
        for <linux-usb@vger.kernel.org>; Fri, 24 May 2024 04:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716550926; x=1717155726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U8ucJzSqULWl8fDGLbjGQazBi2zanFjR2g3fW7V53pQ=;
        b=nbGQhBWECshYUvssH8kdkKMJeXQoDXhESKvUMLK/5dTBvhLQ8bAj713dT7BGNKytps
         2GZuxeKUSizKl8S/3EADc0GKArT50M59/wprvpuuJRglZyhCXTlKyUqONm6lRYclmHNU
         zc8lYj5dQHMthMBcGJUqXPtFoCS2qxpcRf4uqTZsji24+bLCb5WtycaX6Vc9atYuN6/j
         8hqPDc8jgBZJ+8fUXBzctuDnSbGHRHVol7IkiLvpPkgUzuq6PMEFoaia3lwabLbaxhMl
         XROn6YliHopMOs0FCUIZ6ejEVjdpKtg+UjTN5aeK5GNsYGLmYsP7AqSU/eH/PrEttgp8
         s7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716550926; x=1717155726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8ucJzSqULWl8fDGLbjGQazBi2zanFjR2g3fW7V53pQ=;
        b=c+mOJUQPIu9tusDITbsM0DqxN7U2/ijeR7hXC0opslfFyjPVTpWvireg5+hnHoK38T
         f76ak1HRqUHWQQZ5HdM5qY/LjWFy6DFIkFvrqProcbVBGE8KGk5u6/GyClqo4QjzUBjl
         pv7jFaH7E770G6XaHdvghNASsVl7guxrQ0JAr4ResPPvQfv927P6K9QBInAigX55rEUH
         gMUgL9Rgbbs8ojG79hHRTdhx7ix16EXjxsudLQ0CVrLjhPi77bhNdIYv0naRtx8Wlrxa
         h6VYzCqyyUJTs5SlSbzc2n681FnM/g5iBBaQovyWQUwmsTuc/yvrw4XddNYgvuW9oxah
         6pgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXilmJa9ir8/4h8N54dXw9bjq4zocODvHT0M8PqzZ5+nFVZLvKgkaELFcet4f4SwC9HL2zsgXKI5DqRwvr5GOrIplR933aEilCO
X-Gm-Message-State: AOJu0YwGcii/TGFHhsL4BmfK9JbCUWBwalTGdM8h0d5wSG5NNEgsZvTR
	gZzoY9zCmyAYlXn+Vdkvf3XnD3jGpRrM2BGRAbVLouGwgmoBvDTvsmEXuHw3WloD4XI2oIgKL9W
	7
X-Google-Smtp-Source: AGHT+IHr7B3y1pvIPOhoBlsH5vP7fnRdRGNFoCQomY9uiTVTvzbuXki3VUxBhl97FiRxuDdtZV7Hng==
X-Received: by 2002:a05:6512:224c:b0:518:c69b:3a04 with SMTP id 2adb3069b0e04-529612c0598mr2635953e87.0.1716550925998;
        Fri, 24 May 2024 04:42:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52970d2a1f6sm160369e87.220.2024.05.24.04.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 04:42:05 -0700 (PDT)
Date: Fri, 24 May 2024 14:42:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v1 2/2] usb: typec: mux: gpio-sbu: Make enable gpio
 optional
Message-ID: <3z3gi2s2dxlflmfpcirutvesnj6gsxyriijl2jrc2udaqucoyb@6scxw5hb2nv7>
References: <20240524071034.4441-1-francesco@dolcini.it>
 <20240524071034.4441-3-francesco@dolcini.it>
 <5of64nmgpotr7fu66urgko5gfvr4ffhmff4dgkagkdvwh2dywk@etlw6rsmhki6>
 <ZlB6ruZ8j2rVsIio@gaggiata.pivistrello.it>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZlB6ruZ8j2rVsIio@gaggiata.pivistrello.it>

On Fri, May 24, 2024 at 01:31:58PM +0200, Francesco Dolcini wrote:
> Hello Dmitry,
> thanks for the review.
> 
> On Fri, May 24, 2024 at 12:56:15PM +0300, Dmitry Baryshkov wrote:
> > On Fri, May 24, 2024 at 09:10:34AM +0200, Francesco Dolcini wrote:
> > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > 
> > > The enable gpio is not required when the SBU mux is used only for
> > > orientation, make it optional.
> > > 
> > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > ---
> > >  drivers/usb/typec/mux/gpio-sbu-mux.c | 11 ++++++++---
> > >  1 file changed, 8 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/usb/typec/mux/gpio-sbu-mux.c b/drivers/usb/typec/mux/gpio-sbu-mux.c
> > > index 374168482d36..cf44259980a1 100644
> > > --- a/drivers/usb/typec/mux/gpio-sbu-mux.c
> > > +++ b/drivers/usb/typec/mux/gpio-sbu-mux.c
> ...
> > > @@ -66,6 +66,9 @@ static int gpio_sbu_mux_set(struct typec_mux_dev *mux,
> > >  {
> > >  	struct gpio_sbu_mux *sbu_mux = typec_mux_get_drvdata(mux);
> > >  
> > > +	if (!sbu_mux->enable_gpio)
> > > +		return -EOPNOTSUPP;
> > 
> > Can we skip registering the mux if there is no enable_gpio? This can
> > save users from the unexpected errors during runtime.
> 
> Yes, I considered this option.
> 
> The rationale for the current implementation is that if the device tree is
> correct (no mode-switch property, when enable-gpios is not present), nobody
> will call gpio_sbu_mux_set() so no runtime error is possible. If the
> configuration in the DT is not correct you get this runtime error.
> 
> With your proposal in case the DT configuration is not correct there will be no
> errors from the kernel, but the functionality will not work.

I'm slightly biased maybe, but I prefer an error from probe (or
dependent devices being deferred). On the other hand, current motto is
that 'the kernel should not duplicate dt-validate's work'.

-- 
With best wishes
Dmitry

