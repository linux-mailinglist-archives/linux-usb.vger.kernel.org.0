Return-Path: <linux-usb+bounces-18610-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5B09F5D41
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 04:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3EA516740F
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 03:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D255C13C695;
	Wed, 18 Dec 2024 03:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fU5vT5Sb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C070235956;
	Wed, 18 Dec 2024 03:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734491399; cv=none; b=khgwhPs6vJOjgbwYsOsCVVPw1hidHWATmLouNVVlIM2DU+0BxNJor8GlQCekSr71LrGRv4gOBp2s0Mqtpr9wvGYlCxgFTgUF8VT3BU9B5Z5Kr6XiyGmjtOAR8skqMYGzr2RoPqQXWtELNS9SWQrIZ0DuHfiRZxXWJZigKscvM30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734491399; c=relaxed/simple;
	bh=W8owNub1aszXjPCqGlXDi2BFKxvi0kAS4antY3MJuzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c/NxhCsInnq3RyPAHnKkBYazzlI9gmdQ1aL2QzDxRzIDSogJXVXNqT5QVYfO0cetvoFx8tR2MDiNeq42MJeHwKQW+qUSqfcu6QtGtJEZRTcEZNeyUHD+qH53EoHBH0sRpwd7/0QWhSxusxT1pRBQj+aw1F2jpsIjDuC0V5tqSx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fU5vT5Sb; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so8523832a12.3;
        Tue, 17 Dec 2024 19:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734491396; x=1735096196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P66047c8XBV06QMzkQCsKE4H+cNlYRJ0HjyWcLrKxQE=;
        b=fU5vT5SbA/mwIbhWpanLZdLfon3FNBVlhn4o5c3gnRhWkhaN2jinWpBnXuIk0CSqGb
         IsiFPf17+z09Svez6rk1BaRRviYKrmyrL+xgnIb5VTq9Xw4ew9Cudg6eriI5NQ5vaN91
         sTuGV/qRHAha/SnJ1jNhbLoo8JvUcNlMhUebtz11Ju65Xc5UFB++/iKxVm7Suk+vFtSx
         34n9Nzo+bks726IzrUPKfd+8ams/0HRWP0iMeCJTwKcQ19tYZ7AN514HMIG3tj473zg8
         BV/9m2A/BVM/1ZgvIucvUTnflIdOurMkS3BfYHCSzz7Tt/P5eD231IVjUKmioR3+Leap
         qS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734491396; x=1735096196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P66047c8XBV06QMzkQCsKE4H+cNlYRJ0HjyWcLrKxQE=;
        b=cwZQixqOS80akEncTVbaZy80WuaLq7pG1EAVnBov175tHvKu0Qfwkb/Jb+Tiy0t+Hd
         7Wg2uk2gChlKq9mRDWg4s6V9C3MKIcjfvj5e2mj71WFymWtwwaYBbafIsq6/CGqqXf73
         uz2+P70bTDN2c/UGhH7qyvZ4RFZbbyo68c8SpCbzZkR+E+7bRBUZWbaBazjbSJ/Uy5Nm
         XvXpBfEuJeZay4N/qM7Kfgcj52dbczTl3Yp6VSfgGUc1hSy1YfiMLbWSULOFV/t3Tw/e
         Ty6/45iPiLS3dwheHWF/Ng7SCmDsw1oclm8Pr4zA5Dq+Jw4VC0H3P66KuASYoInJf1lr
         bR3w==
X-Forwarded-Encrypted: i=1; AJvYcCU2PXuIZFkMh7hn/bI/ypYfweuItxC2p3c8oHdqYEQjodp8q/z2Jx3osPeW4z6Mg4O3TJmrcXnGfWaajjs=@vger.kernel.org, AJvYcCVLXleKjn1N+ycA5Dm5ptvU9VEU4p2miunMyPyoO4LKLoZHN3M/VnzJzRH5olS6nRJCh4t/QI28x2Wf@vger.kernel.org
X-Gm-Message-State: AOJu0YxGnnq6oCHIZoNa/R3DSnghQQ+5V0R/utrouQJTKU6cTTMK5X8M
	0B4iRBn/Eie+4C0r8uXdivqPBSR7T8x6jPI2Ib2951DcSNUTSl5KDYc9XeJerQRzyOcdLrx/prn
	B5tXbiJvivXOG9Pt4Gt82U6QdUNQ=
X-Gm-Gg: ASbGncvPCrI5322slE9YQCXLV2G4/dVqpz6zLn3ibNxs6YUepwNCrO5NUrp6/sJ+stV
	WP38jPy8xsOte3SJo8AH0Z7TZ58YQiPJGGAscxWL/mp8a1WblD/0TdDC1BFZcrZ0nOFroFA==
X-Google-Smtp-Source: AGHT+IGsXHD+UoDXrLt+v0E92y1/stKNPfj4/6UVrfVDLPNgWdfObP9OfTFvd/hc189eh7JiQTTpMzQDTMNa8WV+gbM=
X-Received: by 2002:a05:6402:27c8:b0:5d3:f6cb:73e4 with SMTP id
 4fb4d7f45d1cf-5d7ee410f9emr1231938a12.34.1734491395963; Tue, 17 Dec 2024
 19:09:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241215210006.4114454-1-zmw12306@gmail.com> <2024121649-dreadlock-undesired-d9de@gregkh>
In-Reply-To: <2024121649-dreadlock-undesired-d9de@gregkh>
From: Mingwei Zheng <zmw12306@gmail.com>
Date: Tue, 17 Dec 2024 22:09:44 -0500
X-Gm-Features: AbW1kvZWXvP-ZQnXtnti4tnmyg8aE8BW6dty6dWzUkdPKXfNmE3SqTB13ejWMgQ
Message-ID: <CAN4iqtTXfTqtQCpTg7hKAhRexOK6KnKJeys52t5BVn+7R-2gOA@mail.gmail.com>
Subject: Re: [PATCH] USB: phy: tahvo: Add check for clk_enable()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: u.kleine-koenig@baylibre.com, aaro.koskinen@iki.fi, balbi@ti.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, Dec 16, 2024 at 2:56=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sun, Dec 15, 2024 at 04:00:06PM -0500, Mingwei Zheng wrote:
> > Add check for the return value of clk_enable() to catch the potential
> > error.
> >
> > Fixes: 9ba96ae5074c ("usb: omap1: Tahvo USB transceiver driver")
> > Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> > ---
> >  drivers/usb/phy/phy-tahvo.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/phy/phy-tahvo.c b/drivers/usb/phy/phy-tahvo.c
> > index ae7bf3ff89ee..0b8801318cd2 100644
> > --- a/drivers/usb/phy/phy-tahvo.c
> > +++ b/drivers/usb/phy/phy-tahvo.c
> > @@ -342,8 +342,11 @@ static int tahvo_usb_probe(struct platform_device =
*pdev)
> >       mutex_init(&tu->serialize);
> >
> >       tu->ick =3D devm_clk_get(&pdev->dev, "usb_l4_ick");
> > -     if (!IS_ERR(tu->ick))
> > -             clk_enable(tu->ick);
> > +     if (!IS_ERR(tu->ick)) {
> > +             ret =3D clk_enable(tu->ick);
> > +             if (ret)
> > +                     return ret;
> > +     }
>
> Same questions, why the signed-off-by order and how was this found and
> tested?
>
> thanks,
>
> greg k-h

We wrote the patch together so I listed both of our names.

We used a static analysis tool to find this. Additionally, we
validated the patch's correctness
using the built-in tests provided during the compilation process.

Please kindly let me know if you have any questions or suggestions. Thank y=
ou!


Best,
Mingwei

