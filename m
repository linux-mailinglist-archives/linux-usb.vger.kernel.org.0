Return-Path: <linux-usb+bounces-21159-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25190A484B6
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 17:22:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFE1617D054
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 16:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C165D1AA1DA;
	Thu, 27 Feb 2025 16:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R3fqiv1Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B061B3952
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 16:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740672464; cv=none; b=u/pe9B9Q25GZWU/eKzPEvhNe5Bl+oGqfvG/6GjnwI5X5Vpgxv3AjLTUpx03tO0woygIIubRnjqat3uAhcEN/vwoF9I5T5z85lcBKT5PURB4K4wHYssGllpN6ogFBTEAB6Khhl1FOupWi2GjZ7Zuc67r4cBLvTiPRaW5rUMRMwSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740672464; c=relaxed/simple;
	bh=CWV28ba7/pK0pfEMDt6BpVkKjS1yOP/DZbLPMFCESts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HrukfdPqyzBeZuOqXnOq1iVgKS+EqnG04T9dMpv8FfveERQBdVSMPdpDHJNgKCCiKjpGeCGqaEWcG6hBzy26Rsqp/eHlLDSUHNYuAyDkC05+0E3LuuJ6DMSANeuVYMcTIwyKTvob2j3Od202u4dtPgzo2wRRGJ19YWWl8GiOy8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R3fqiv1Y; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30918c29da2so12653431fa.0
        for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 08:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740672460; x=1741277260; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xb088OdXJlTA9IPSpcKjiPeuNEBwco6JwP3ohVxG/tQ=;
        b=R3fqiv1YYZSIwyl573OWxgWA4kDjbCNBiTwSx+oI6zNaYF/DkAMuPWNbIdv8+mAUQC
         2wFfrTFS5AujvsmQali8BzjoP5jSjo9ocbc8B+9T7GivCk1QaAWGvYl8APZ+0sA5S2uJ
         odT3J7tRzrUvKo32MxFbAXISg228wgNa9Pi2ZdupkV8eHSojiYg3saYGfyF/qPZZ9OIs
         Ln+f/R2GLB6yqctHEhDp6Q38OacpgM3CfY6vDndLlRLUCEtd9aL3zkW0iMJK7V5QxpT8
         2m0ss6qr14x+k2NpFE1ZPMih9GXAXFBygivBcdBo8WgZFEqKAUEcLuLU+sEKlEUZeVYZ
         xOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740672460; x=1741277260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xb088OdXJlTA9IPSpcKjiPeuNEBwco6JwP3ohVxG/tQ=;
        b=qqpE4ZeenloQzL0MpPj/rF8YRKz+X8ftDZsOIkSnnhCR22o+/y2/SkfoNmpgRrQwQL
         hkCVfI64unmVvU93UjzSjiF0KYe/3fDOaN72K4cc02wbvBT1l2728Qp/KjmWVoV55tvM
         KVnsXaxmyWkSb62u3dqcmV1crNcKz4ok4Toc2efto5No9IzTJxQ+DSeVnr2l4aSgraYi
         qf7dG1repO6oeXUPbJpreIMbK77LpUlrJ5F678sWkT9dZpMDX0YVcV/gofeuvkfdyhip
         X3YY1h1KowcjnT2Ka7pj22MQ7pbdM6BTZqgFy/ANYwVMm27+Vg9WG/1UWzci/5c+ZdYl
         zniw==
X-Forwarded-Encrypted: i=1; AJvYcCVm+q+C+P8Ac6zm28QwakVjRqK9W+VNWOWJzl6ClmreEfaJF6aJolHXKqqeZSSEH4m4/D05QtBxauk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf1+LKXJKmKHmB/PtweGm00y4YT/xyeNVdzWw7gm+Tv32s+JLc
	IDyWMLb38288SAjxmDLP1TjJM+BL3vYCFEjm7V/qHTl6t1ZJpJ9eBYOMxxnc/FI=
X-Gm-Gg: ASbGncu4ubt0BubDkN2gFICRflNGnZ2a6ZEmjZchMNpTkP6sVRIqhhVw8xg2skS1RZC
	qEQQ9vQtjBJKipx1h2bUDFz7OchjiYA9LDXPYI/iQCsgRNjRHb5WQOZ6ugXIxTTkFOKQ/rgnElj
	2O4ZJnUDKjRK5RZYWjh8tgdz1u6Lst/BYeo/XniieRh9HND/JVB5Td0RvIeCWIP5tzrLTqDNXye
	H0r4TxT19bpFYa0VYcYJzaH8+v4dJ3DnWuG7X+pl0+KDfgJYzn5khKAy+xuDKdI7/19C7GEFofF
	yaGPdi9Bw4H40E07TZJ7ZBGtdpqtOt+NauSLZNX3YXIRQQlFzfAnl9rP7Q6LQ8vNCDZF/fUH3Jv
	3F4EM5w==
X-Google-Smtp-Source: AGHT+IE2tBs2MLi0CVU9yzfVsEhz9N65BqwobeMX6DA+APv9dvpZztToWRbeHRYswXJcbcUI2FoZ8A==
X-Received: by 2002:a2e:b607:0:b0:309:2747:e30 with SMTP id 38308e7fff4ca-30a80bff08amr59492871fa.10.1740672460272;
        Thu, 27 Feb 2025 08:07:40 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b8688a8e3sm1946411fa.112.2025.02.27.08.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 08:07:38 -0800 (PST)
Date: Thu, 27 Feb 2025 18:07:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Felipe Balbi <balbi@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Saravana Kannan <saravanak@google.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Konrad Dybcio <konradybcio@kernel.org>, 
	Frank Li <Frank.li@nxp.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/7] usb: dwc3: core: Don't touch resets and clocks
Message-ID: <x45slyuz5bboqzqdyhgd22dx4vfsam6unvzymrmjvunef7cpfv@ixqrlvyzt4jp>
References: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
 <20250226-dwc3-refactor-v4-3-4415e7111e49@oss.qualcomm.com>
 <w72zvfh3uf7crbkmuenxcjnu6moircjdy6rnbzszl4tjlm2jks@4z2k3iqt2ohi>
 <6v2kyk3rhss4itvo4dhwxyf3mp7ey7gh5abaklgwa27b4fw6ce@ofyuo3ortl4p>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6v2kyk3rhss4itvo4dhwxyf3mp7ey7gh5abaklgwa27b4fw6ce@ofyuo3ortl4p>

On Thu, Feb 27, 2025 at 09:55:29AM -0600, Bjorn Andersson wrote:
> On Thu, Feb 27, 2025 at 06:24:17AM +0200, Dmitry Baryshkov wrote:
> > On Wed, Feb 26, 2025 at 04:17:50PM -0800, Bjorn Andersson wrote:
> > > When the core is integrated with glue, it's reasonable to assume that
> > > the glue driver will have to touch the IP before/after the core takes
> > > the hardware out and into reset. As such the glue must own these
> > > resources and be allowed to turn them on/off outside the core's
> > > handling.
> > > 
> > > Allow the platform or glue layer to indicate if the core logic for
> > > clocks and resets should be skipped to deal with this.
> > > 
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > ---
> > >  drivers/usb/dwc3/core.c | 19 +++++++++++--------
> > >  drivers/usb/dwc3/glue.h |  1 +
> > >  2 files changed, 12 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > > index d9f0a6782d36..aecdde8dc999 100644
> > > --- a/drivers/usb/dwc3/core.c
> > > +++ b/drivers/usb/dwc3/core.c
> > > @@ -2328,6 +2330,7 @@ static int dwc3_probe(struct platform_device *pdev)
> > >  
> > >  	probe_data.dwc = dwc;
> > >  	probe_data.res = res;
> > > +	probe_data.ignore_clocks_and_resets = false;
> > 
> > Isn't it a default value?
> > 
> 
> I like the false because it's explicit, but I have no strong attachment
> to it.

I'm more biased to the 'make unusal cases stand out', which means the
defaults can go away to highlight non-default cases.

> 
> That said, it's not the default value, because probe_data isn't
> zero-initialized. That would however make sense to do, in order to avoid
> surprises in the future when probe_data grows.

:-)

> 
> Regards,
> Bjorn
> 
> > >  
> > >  	return dwc3_core_probe(&probe_data);
> > >  }
> > > diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
> > > index e73cfc466012..1ddb451bdbd0 100644
> > > --- a/drivers/usb/dwc3/glue.h
> > > +++ b/drivers/usb/dwc3/glue.h
> > > @@ -17,6 +17,7 @@
> > >  struct dwc3_probe_data {
> > >  	struct dwc3 *dwc;
> > >  	struct resource *res;
> > > +	bool ignore_clocks_and_resets;
> > >  };
> > >  
> > >  int dwc3_core_probe(const struct dwc3_probe_data *data);
> > > 
> > > -- 
> > > 2.45.2
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

