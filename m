Return-Path: <linux-usb+bounces-17907-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A319DA68D
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2024 12:09:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D9D9281F34
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2024 11:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4031E0DFC;
	Wed, 27 Nov 2024 11:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UJFq4QYO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C7F189F20
	for <linux-usb@vger.kernel.org>; Wed, 27 Nov 2024 11:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732705752; cv=none; b=d3Tosn1nTkKPj9HwnJRVGr1RJdNPa/pyMWWEGds19EV9RoWwdLOTc7/i+gH0yWVCRMQ1P9vvbVJbxXYVRPrUBAtuzD1BFPWG+hd1G4ICYb2MysFFwECsgshcPLqaN6Gn9MpbMP54eYUrRXtsyeeWcNL/3N/sePN9huYACNOA/oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732705752; c=relaxed/simple;
	bh=KIHyVa4m2W+IgrN2rte6ZTxtItq9mIpsQ6FBYB1Vvus=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cFGWPmxSpcVZ/AMg4TtWby/57Amwq1CvdBFTSl0YvZg396+aWXXZuuN/tQT1mQvHMKin/T9+fbAWXDG26rJw381WB+HTi7U2SUPk0BuZLPqTC7yE3fgVJLlkH3C/UuzjLJbhqB6iD19A2iocZ4uAYHvoJmpYebSmoyOky4PPHRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UJFq4QYO; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3823eaad37aso436262f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 27 Nov 2024 03:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705749; x=1733310549; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KIHyVa4m2W+IgrN2rte6ZTxtItq9mIpsQ6FBYB1Vvus=;
        b=UJFq4QYO1KvssG7XYaNNKQjRiDycPZwl1qhEgeMDLXgn5oF/rnU8t6glrPlEz0Pdm0
         BrHc5zNzRgbDhagG5jnRuEGaMaetsW16OI4cVSAHyYCkwoD/gtswQ+yucFVTnXkmX26f
         0Ewgk9L6p6ZUxjbdj+tVEuNWjOz4YQDEWP5kOVy1l6eaJ79NQvZy4kum5X0t1GuA9s3G
         5UiBn8STmxWKqVGkMBkppMSYf22e0r06D9riX8hnxQzJc3Z7jvZBK/NXdA2F/ec6kr7w
         D1X/uix1iQKAl0I4F/bUOFcZNRL0pISaFKMUTypAiS2e873B5ayFzLv/2FUpXA9hNxAA
         wOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705749; x=1733310549;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KIHyVa4m2W+IgrN2rte6ZTxtItq9mIpsQ6FBYB1Vvus=;
        b=WyODL36uUDc9uwnD7ptDiUkN7TF/hxRPtsIhQrnbLYniNiNdxu7j6Ts1Z8bu/xVt6L
         n/xRH1ezb4+dqvkCH5cTDwuR8QMEmspRpJTyQQWeDnOELNFDkEGijh5eUK9gVcP5veB8
         tXuAkYgs3tOX6AnnAKakIwQYlrFMSEXCiQMcDsRr+2tyU7uZLxfHe6wf4lo4hy9uNyL6
         t8Sf6F+gczK5c6uB2EuAs8kr2Vy7GvFt1kPbOTkdDTJpXOhe3NNi+jD2mXpnOWGgjTGX
         +4Oa/WO8gmCfLPrtNSwp0bDvTS7hIQL4kuVBO79ZcZkLx4eLsJx4GRHeZE3FE6/b/XZo
         zY6Q==
X-Gm-Message-State: AOJu0Ywd0yxjuj5HUys7qJmjGLsMCd0Q+qfNrTTcbgDtgtPAt7e/7zf2
	VW4sOiYY3NfmFOaLOUVRLZjJRTvpbcy20J+IYeevDSIimPps//NpdPM/CAbcmaA=
X-Gm-Gg: ASbGncse4haS7LnQmxLA8w1/L8FXBAOOOKNeU48qXY3qPQ8BIFbCRSYvrJvPidkwNgP
	ac+bXZlosCS3BoiS0QkZZL5dACdnFayzz4PjAPgHoKGWNQfZkdJpDJE9t25lxINTFGIrtCbbPCY
	vDSLgIAnL74U6zdRwDE/OnQDkQv0tSbv6FhfXtWu3c7PvdgkoTfAxExWMCfYkOHQaVts8ej/5WF
	+xsS/e4viupJb/dWuPDINlK3/99tsUwislWETyTXb0bdCIn3ubJGas=
X-Google-Smtp-Source: AGHT+IG1kjd60OoIDsm2k9fnmTAzFppDmAUl6jdHsRKDvKHyjWcAMie1uR5e6BNHQ7g7zmDFBCuRIA==
X-Received: by 2002:a5d:6d0e:0:b0:37d:46ad:127f with SMTP id ffacd0b85a97d-385bfb1e4bamr5480665f8f.26.1732705748772;
        Wed, 27 Nov 2024 03:09:08 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbedf40sm15826667f8f.98.2024.11.27.03.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:09:08 -0800 (PST)
Message-ID: <6e53c7c71d6fecc232d6d94720c9dfa04f1fecf0.camel@linaro.org>
Subject: Re: DWC3 runtime suspend on cable disconnect while UDC is active
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, Peter
 Griffin <peter.griffin@linaro.org>, "kernel-team@android.com"
 <kernel-team@android.com>,  "linux-samsung-soc@vger.kernel.org"
 <linux-samsung-soc@vger.kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Date: Wed, 27 Nov 2024 11:09:07 +0000
In-Reply-To: <20241125201135.kmif7pglkhitenfh@synopsys.com>
References: <269e3ad7cbdb3b97fb8dc75cae4d487ce7f908c3.camel@linaro.org>
	 <20240809231012.lmgqemcwjdfiaxak@synopsys.com>
	 <cd87836fbd0a030d0b52902e04167fe044ce447d.camel@linaro.org>
	 <20240813230625.jgkatqstyhcmpezv@synopsys.com>
	 <a40ac04beb4501ad95b50f79be3495315e38a880.camel@linaro.org>
	 <e40f27c2323077d9b35fac7572f30114b6e33372.camel@linaro.org>
	 <20241125201135.kmif7pglkhitenfh@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-11-25 at 20:11 +0000, Thinh Nguyen wrote:
> On Thu, Nov 21, 2024, Andr=C3=A9 Draszik wrote:
> > On Thu, 2024-11-21 at 12:34 +0000, Andr=C3=A9 Draszik wrote:
> > > Unfortunately, this only works once: After restoring those bits and
> > > reconnecting the cable, USB comes up as expected, but a subsequent
> > > disconnect with the same sequence as during the first disconnect
> > > doesn't
> > > trigger the DWC3_DEVICE_EVENT_DISCONNECT event anymore (others still
> > > happen,
> > > like DWC3_DEVICE_EVENT_SUSPEND).
> > >=20
> > > Kinda looks to me like either I'm still missing something, or e.g. th=
e
> > > event
> > > is somehow masked.
> > >=20
> > > I anybody aware of anything related by any chance?
> >=20
> > Hm, the missing DWC3_DEVICE_EVENT_DISCONNECT event comes when I insert
> > the
> > cable another time, i.e. after the DWC3 driver has reconfigured
> > everything
> > after cable attach. This throws everything off of course.
> >=20
> > Looks like still something wrong in phy/dwc3 interaction in the Exynos
> > case.
> > I'll debug a bit more.
> >=20
>=20
> Ok.

I have a working solution now - with snps,dis_rxdet_inp3_quirk in the DT,
this works reliably now:

https://lore.kernel.org/r/20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7=
fce24960b@linaro.org
https://lore.kernel.org/r/20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7=
fce24960b@linaro.org

Thanks again,
Andre'


