Return-Path: <linux-usb+bounces-18609-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9E49F5D37
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 04:07:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F844163101
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 03:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6994B145B1B;
	Wed, 18 Dec 2024 03:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KR7bO6Om"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC1484D29;
	Wed, 18 Dec 2024 03:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734491201; cv=none; b=PEXcVptUXt8t+4oDRU2wyHFygquIrO+CdLKTlF1Uwt/8BtC7fTQQr2XcZXZ3qCvqHYEilDU3awM5BJYuQ9vxDQrESjMNfmgcEncAFoOXmsWegD4xO01zScKP80ke0kxh2SCIvJdOJDe892k80fuQOsh3Th/I1W3r7IJeXJbsIjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734491201; c=relaxed/simple;
	bh=2Yi4pF2CPSSdsB89dhS5XPTabFd1OrKY9RqCaxNh/N0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rbgtocwEtpB5P0oH+c5f6VBGpo09A+SW8YaLyFKXrglFfAmMDPwijRRmEj2vvIxJLhf330sFNdftOSCkTWMOndvtajg5glRu88ycy/OeSVj9NRcAE+5enozy6S4GA8jspc1gmojGYxK0MwWQfWHSG1+on5qNWZvPSPSaUuqP+fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KR7bO6Om; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3e9f60bf4so9619214a12.3;
        Tue, 17 Dec 2024 19:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734491197; x=1735095997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOMGnqpjrkYWm51OzhhER1XtV+78hClT9d291U7miJ0=;
        b=KR7bO6OmmQXGLbXaj5olPUrlbZxDdeH7mNw911MGgST1q6EkXquRfeEwuUGGNxFpHb
         be5PoPX53PIYkSeLBjPbqvwHg+u6VEInL2B3Ns4Osz8bigB2KTw1EdMca+FEWT6SG/oX
         kN+tUtAda1gC1PObxjiEeGknKQuIIFUw5YZ1RC5+0ywyiM0gJGhKe2PjNhwRybnaY+ne
         8kOuMbq39B8Lmypibu2C8hEfeyFYGA4bqNoJH7IpB/SPMDzRrF3lByJ5aNvtk/sKyuqw
         Y+1lLVnT1EwGygGZGtkUis4P1z5hG9Gkfyu4kDVw9tibBFcqI1f0mk/J7neqAkMeAa+M
         jnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734491197; x=1735095997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOMGnqpjrkYWm51OzhhER1XtV+78hClT9d291U7miJ0=;
        b=KH9lnVNg0tXjVlRiIwhPn7fucM+Pz8/qHf9+GpMiah4hHFR2SnkTf+J8iRKdqPLI4Q
         nkmVupOM/al7aK86TuAw7BvvH4JpFdeQMWaaIqEftJ0GsLKKK7Xzbjh1yCKRLspxrwNZ
         nNCC9p0kVWm1vIaWcvzKTroZVlsMQt7U8Xp81Ev48BXyo9CvZ2sE2RHBKUg5eAD0jEJG
         M7bvKrWKN1CcsCplVdDEiJdq/ZtPPVxVSz7WcEJM1B5nXIWO7hKij9jAI/6w04G+2ntQ
         /CZM/mQi9jDL4pb77JHa2mNy6wyzVOADX738L84XnzQ952pMyK98KVEPO4ZuRB2zH62K
         shZA==
X-Forwarded-Encrypted: i=1; AJvYcCUjQQONUJL9ipBOFq7fXtQwgvLPbOXtM6i5l/e56+HhE0DwbbUQwpk0IJA3/jNsL0LgLI5O1E9gy68N@vger.kernel.org, AJvYcCXMtBv8hAXDWS0O+Nt4humRo4KpVV/ABu7lB6f6SliJ+uQTEQytCcGqdW1bKmKhCekZrlQ9Wuhie98Oyfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDBaOXV4lLgMr8B462q5IGQ1tjDYwVuOTqCssWhXe355us5E1F
	26lib82oNZgC0RBVdSZt3wbclhHR5swRuh3ZtnrDnjg67voHzb8Z3Oc/STiw1MC8oA8zlnOwGd9
	IxL9pz6ETJXS52mEhAzuvB70l0Cuah67UjtQ=
X-Gm-Gg: ASbGncssSLWJhGuupXBHTpKkllAGlrSp2etWfhRZ2oaatVlGIHd0bhs6w9lmxdk07dW
	HNjc22o4iTcn7I6jaeWuKdKgmfNdT2geCM10L48hd0SSLC+Ka6sf9vxboQI4yMDY54t/QXw==
X-Google-Smtp-Source: AGHT+IHuHa/dsXdsKaz4bHhhSWU8rQMP+KltKg46X453NdpSE4QilK3200+kie4jvr1XEqyGDNwMhplz9yjk6JTGM58=
X-Received: by 2002:a17:907:7817:b0:aa6:aa8a:9088 with SMTP id
 a640c23a62f3a-aabf48f72d8mr80242466b.41.1734491196998; Tue, 17 Dec 2024
 19:06:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241215205358.4100142-1-zmw12306@gmail.com> <2024121606-preflight-lure-e02c@gregkh>
In-Reply-To: <2024121606-preflight-lure-e02c@gregkh>
From: Mingwei Zheng <zmw12306@gmail.com>
Date: Tue, 17 Dec 2024 22:06:26 -0500
X-Gm-Features: AbW1kvZY92-QNgtSm9uXPG0NXhcc5cRLBYJnl0Noce2iuBztu8XNW76P1sKCRvU
Message-ID: <CAN4iqtQGJw+Nyt_K+uMSfpqXhfzGN4nLmFTPdEydyAf_wsWMog@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: m66592-udc: Add check for clk_enable()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: u.kleine-koenig@baylibre.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jiasheng Jiang <jiashengjiangcool@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, Dec 16, 2024 at 2:56=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sun, Dec 15, 2024 at 03:53:58PM -0500, Mingwei Zheng wrote:
> > Add check for the return value of clk_enable() to catch the potential
> > error.
> >
> > Fixes: b4822e2317e8 ("usb: gadget: m66592-udc: Convert to use module_pl=
atform_driver()")
> > Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
>
> Why this order of signed-off-by lines?  Shouldn't yours be last?  Who
> wrote this patch?
>

I listed two names because both of us co-authored this patch.

> > ---
> >  drivers/usb/gadget/udc/m66592-udc.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/gadget/udc/m66592-udc.c b/drivers/usb/gadget/u=
dc/m66592-udc.c
> > index a938b2af0944..bf408476a24c 100644
> > --- a/drivers/usb/gadget/udc/m66592-udc.c
> > +++ b/drivers/usb/gadget/udc/m66592-udc.c
> > @@ -1606,7 +1606,11 @@ static int m66592_probe(struct platform_device *=
pdev)
> >                       ret =3D PTR_ERR(m66592->clk);
> >                       goto clean_up2;
> >               }
> > -             clk_enable(m66592->clk);
> > +             ret =3D clk_enable(m66592->clk);
> > +             if (ret) {
> > +                     clk_put(m66592->clk);
> > +                     goto clean_up2;
> > +             }
>
> How did you find this and how was it tested?
>
> thanks,
>
> greg k-h

We found it through a static analysis tool. Additionally, we validated
the patch's correctness
using the built-in tests provided during the compilation process.
Please kindly let me know if you need further details or have any
questions. Thank you!

Best,
Mingwei

