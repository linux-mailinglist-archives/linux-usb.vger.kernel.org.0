Return-Path: <linux-usb+bounces-24699-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64737AD5EE0
	for <lists+linux-usb@lfdr.de>; Wed, 11 Jun 2025 21:17:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E6B0189E3F1
	for <lists+linux-usb@lfdr.de>; Wed, 11 Jun 2025 19:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4F027CCDB;
	Wed, 11 Jun 2025 19:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jRXt3QTR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CD879C4
	for <linux-usb@vger.kernel.org>; Wed, 11 Jun 2025 19:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749669472; cv=none; b=Osoty/qtU/opiXNIjCHOzqnp16Qdlf5DNO50MAl5W7pb7PtoGXRRiI+qrd/FVTqLKbvSCgNkZGN2LXgtMOMQtn+GlbKTE6hi+0ljIV+xX51AilkcyVb8s5pUD6HvX7dJqT/uw8pvkG1oMcDrNdGnvDyu0yD2n/fZmHeFBRpPgOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749669472; c=relaxed/simple;
	bh=fUrUvj/NKrnOKNMJe9QMJYc8JHU2TblrN3dQxgOBq8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUK1ZLYpvzlzN2qy0m0DlNPeHpHru7vd9AQ9+7zjJOWgD8l8Cj6sFuk0LqsLdaEEyUzyodWP9UknrKIAeZImRI03oScl2+gcul95I1Y+nLq6APwTxVN4hVniDhBweSZRFfaXyhTNnW75qtR61uI61LViO4BmwAe5kC2TbvTkOOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jRXt3QTR; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4531e146a24so973505e9.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Jun 2025 12:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749669469; x=1750274269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cnqd7Mp+YWPevCABnNJ+cz/TVLBtwGacs5s2BQshssM=;
        b=jRXt3QTR0RkTFpZZ9RHIHotyB/bNZ6Ph723nU/rrsLoadckzIJbf8Ifp5Srk4b2sDs
         0HZSKV2YCrT7w5Y8EMT+yejZgbQdujrHJ6TBgPAqn/PuIjzX4dwXyin62EWbgLr1n0z5
         nN8tAGrW8breBBMCvG7WnWV6Ra7ktuOlaDzi6Qp5GeLcC99nfVtUJFxCswUhOgrAl5l6
         m9zNPu4bouUVN18QOSUuveL06OKc3s3BJ848tvIiNGWnKznIdi6GpWo6idHkMhMjXxVH
         Z1eNRkWKc4BcaZTHm3rOvNQD30dN2tXMQ7E9TFRausAaP+2Bc/B9PC6U1bjLhLCcjPEY
         Lr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749669469; x=1750274269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnqd7Mp+YWPevCABnNJ+cz/TVLBtwGacs5s2BQshssM=;
        b=UnYte4ERLdunwau2dtiT1PsldkMYyk4tdG3zkvRvgDdHZesbdHt89lVyyG/7FvYT+v
         0NshpBTmKcU1lx0EFp8qsb4h2z4s7GXtA1fiHScBrfPb0RVdOSUg33p0o6jro5YHazrr
         Ujg3aXfntEpOkY9joW1G6ryzhvUXKruRhuzfSyTtMqxCC6D/cnp9bUv0AE8uZgtncLka
         1BPOgvZZ/0Jr8zqpuTNOtp9Tm02RuLEKm1Q6k8JArskhmQx/KTbnfok2N/C6XpS78NE1
         XUp7gFufHxoFV0MHvHfO352p2Bb0xB3Rh0hun6tatEsGnq6SE66TdxQ+RKWbe00r70rJ
         s2zw==
X-Forwarded-Encrypted: i=1; AJvYcCWv64J4kNFxmcjSeiHewAiIQwtt+1jo27ZXW4UN05sDJrLhBTA7wnc5P2OJ5B9bCDuNZqZnTCkwPnY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE5Cp6tlbTUZWFm9AfURtkaTBMT9UvYazTbyMP3UxQkipXR7pd
	PCRHTiZVbucBpG0XNYX5DSEqQqgodYWGuqGLJbwcs7nILQk1dIVYZpFZQDokVlsA/XA=
X-Gm-Gg: ASbGncvxGqIoOBblUMk++CNTUysSA1i6bv5wZQwPlsGoik2GPZE3trycfLluaZbhOEp
	V8KLI9oZPSXOfl1IWYfJ6pI2krCsd0jbpEjyMfDMahYm1tqRzZucLEcP+SFT+N1fB+8A5LpVHXR
	GYZzh10MAJ1kd8jghcueD0M3todqIRK0JTcyce7n5YXVtc6LfkemRzKBN9tCZybcTlNGhNxpkIa
	irsfVigi7xhDP+XmUOmON15baRXuvxHbm9zPnDeBIMfUqM9ao+lzd4obrdToPfipOy9b5avIrSH
	z4pu6yI1Xb8PtFxFwgnb7HAkV7UT24fAlOhdwqcelAHr8vNyLNR0dkhgNtRXMAABxyI=
X-Google-Smtp-Source: AGHT+IGJ3NQ8AU+WANwLf0nZAuX7XDSfVjhF8GwX89vHnWLiFcZb6a/55FgYJ7VjRdDmwl1wu3ltxw==
X-Received: by 2002:a05:600c:6612:b0:44a:ac77:26d5 with SMTP id 5b1f17b1804b1-4532487b346mr48416505e9.14.1749669468976;
        Wed, 11 Jun 2025 12:17:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45325176cf5sm29370725e9.21.2025.06.11.12.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 12:17:48 -0700 (PDT)
Date: Wed, 11 Jun 2025 22:17:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, s32@nxp.com,
	linaro-s32@linaro.org
Subject: Re: [PATCH 4/4] usb: chipidea: s32g: Add usb support for s32g3
Message-ID: <aEnWWPgXseRGdSz1@stanley.mountain>
References: <cover.1748453565.git.dan.carpenter@linaro.org>
 <c7c9319793b439cb35909621381ca2d4a78699dd.1748461536.git.dan.carpenter@linaro.org>
 <aDeCwUsYTh7z7uuo@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDeCwUsYTh7z7uuo@lizhi-Precision-Tower-5810>

On Wed, May 28, 2025 at 05:40:17PM -0400, Frank Li wrote:
> On Wed, May 28, 2025 at 10:57:39PM +0300, Dan Carpenter wrote:
> > From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> >
> > Enable USB driver for the s32g3 USB device.
> >
> > Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/usb/chipidea/ci_hdrc_imx.c |  1 +
> >  drivers/usb/chipidea/usbmisc_imx.c | 15 +++++++++++++++
> >  2 files changed, 16 insertions(+)
> >
> > diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> > index ce207f8566d5..d062399ce15e 100644
> > --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> > +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> > @@ -95,6 +95,7 @@ static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
> >  	{ .compatible = "fsl,imx7ulp-usb", .data = &imx7ulp_usb_data},
> >  	{ .compatible = "fsl,imx8ulp-usb", .data = &imx8ulp_usb_data},
> >  	{ .compatible = "nxp,s32g2-usb", .data = &s32g_usb_data},
> > +	{ .compatible = "nxp,s32g3-usb", .data = &s32g_usb_data},
> 
> If it is same, suggest compatible string fallback to nxp,s32g2-usb
> 
> compatible = "nxp,s32g3-usb", "nxp,s32g2-usb".
> 

These are the same, yeah.  I'm not sure I understand.  Did you mean just
add the "nxp,s32g2-usb" string to the driver, and put both the g2 and g3
in the devicetree file?

regards,
dan carpenter


