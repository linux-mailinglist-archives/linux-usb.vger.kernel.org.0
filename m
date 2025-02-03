Return-Path: <linux-usb+bounces-19975-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50675A2529D
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 07:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B35691636EB
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 06:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911F11DA31D;
	Mon,  3 Feb 2025 06:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="Hp/h6E8B"
X-Original-To: linux-usb@vger.kernel.org
Received: from gw2.atmark-techno.com (gw2.atmark-techno.com [35.74.137.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA512557C
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 06:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.74.137.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738565851; cv=none; b=mZGuVlZwG4CjVAH/lB9YdqWPhx1O9TIcT7VrnSnQtfsGHUzBUAcoifx0xK8mEFpOoVVpVJSsQHCLcqnh+jWtCiCWuwFoNMs38RaVe6wC0lyVW1o4sXW7oLYIKe8xnsJo7riQNe7bWfF+cCbaPujtPznJuop1ESwIUNZI511jxZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738565851; c=relaxed/simple;
	bh=Dnm7Dq1UIHp6/LaIVBzQmOcnhfi7C5T3vPn99EjoNL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NS4P5Pk/qZyB+L4mr/EGh4eLlRLHQafaY/VT5xr0YO08rKtz3tfncQBg95OMQ+/zwh+ssTvJ3+EmFzmMETsgXKqfYIRcpVmJcp85muer8eQGlhW9uvY55mB27pjw25r1TlUGySkA+wCtQus8CrRUWoLtzLZzVHYxKY9XEV2H4q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com; spf=pass smtp.mailfrom=atmark-techno.com; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=Hp/h6E8B; arc=none smtp.client-ip=35.74.137.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atmark-techno.com
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=Hp/h6E8B;
	dkim-atps=neutral
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 94221370
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 15:57:28 +0900 (JST)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef728e36d5so7822649a91.3
        for <linux-usb@vger.kernel.org>; Sun, 02 Feb 2025 22:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1738565847; x=1739170647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KBpu38zoJhnbBuVt7xq5HkK4w7WkM2eVS3E6Ag+EQIY=;
        b=Hp/h6E8BDAuOYYLVlCjmOW5RP+cC5hxkU5uKpRzS2l8yMfMpaKZvtzKBs1wl8rr8CI
         RJ/dCS4tN1fBNaKT2oDm5Y5Xz2H6hEl+jwNAzWUMEcAg6u3ib5By9rK3ZOUFC5S9aEn+
         TBDbNs9eltlcWYC0DMgaHbO8TNdkq658hJMZLiAZmEUbZFLMuoNrox31nLmbfKN4OR6o
         Aqz1hnjvv2ZB3qj6UH1D4zBb1OgJqAcLMWBteAoVc/AYrJoflDAO6JOdGMrKwZUFi+PN
         LIeiTNoZM45K9z8fzDTwn/mX5V3xYezjnDTvkWEWiAlfJF/Xvgd2JLCkV27hPFBTlTC8
         qozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738565847; x=1739170647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBpu38zoJhnbBuVt7xq5HkK4w7WkM2eVS3E6Ag+EQIY=;
        b=MoqT5kyw2yBbD11PCZ5JMdF7/4y0xUWSgSMb3v4PPQbETErQdERMPSZR1cAddOLG0q
         8jNJ9wRxawOwtxS7ZsPqfuFJWh5hDmLDnty1en9bh3UDnMBHD+kOZ1cZAW57vZoZzqky
         c2oONPbvsBQ+cRL4nmRxZCQTsOwC+cGTUw4q2dfygir3Bze8IfbPBlL8RKr+Q/nyF8pV
         b1UOAmZ6qTOqeECcOkvepq2QNdfX7UfYS4kzRxyYFExSScpgVt1U7tqg3IIWothfzoKh
         InOQVUf2rlztFClySfKTsklDL+5PgLgANNNk1FetLQxrXSnCDc4Bgg6le5h+uTxJwVdx
         4m1g==
X-Gm-Message-State: AOJu0YxGTtI6dGkHmHvzTF1gcLO6U7faxvUTnmbpNVThWVCxIBAHMl3v
	+DF0IdmFW5ZWKqq6OgbiRdvTxJD9YqqiD0i/bEYlV5p0r24Ndqt9LLVILLNGZ+OBnRVjRkdJ/NG
	3DRBIVGuVvy7H1okneDt16oRPlYkDzWtNZZa65XKl4r1aMLUj8pp92P85GGs=
X-Gm-Gg: ASbGnctkr+5+GgQB6tReVDrFJNt9LmMWG00fW7BI1rm5FT0/i2nVc+ia3DTDjWDHr6H
	KL5bjFrve5YlmMxMERz/ITawV67XheZdqkZnY4AmTdoCS6rFzr1DJ2sYg09Z/1rOGSn2uHAmhPy
	lp9OpgTAXDL4R8Ap0YXswpZlbS333fYXXW8kL3reDfXOjvxb9BWgG9YtFhmF9bP1JY3qhvp9YEZ
	13dp/I2HYh0G5HT4OAs50ZFGt7He1dsqPrxuwpmDpveRhEjJFIx187aZg3j1m3Pr2qd92Ihv/du
	jmrl7nJZH95SgzALyAvar1iZ/2WyvuMrzhVRfNfzZFE+a3B1/schP+j9Dy44jtki
X-Received: by 2002:a17:90b:2c84:b0:2ee:b2e6:4275 with SMTP id 98e67ed59e1d1-2f83ac65958mr26047450a91.26.1738565847618;
        Sun, 02 Feb 2025 22:57:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeQG0nwmZr51/0vcXCzKKQK+KfHdJ43jCCy1lp4o7bkMpfm/h39HEEtpxsyBUKAvfYNo9pgA==
X-Received: by 2002:a17:90b:2c84:b0:2ee:b2e6:4275 with SMTP id 98e67ed59e1d1-2f83ac65958mr26047432a91.26.1738565847216;
        Sun, 02 Feb 2025 22:57:27 -0800 (PST)
Received: from localhost (162.198.187.35.bc.googleusercontent.com. [35.187.198.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31efbcbsm68878385ad.30.2025.02.02.22.57.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Feb 2025 22:57:26 -0800 (PST)
Date: Mon, 3 Feb 2025 15:57:15 +0900
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: phy: mxs: silence EPROBE_DEFER error on boot
Message-ID: <Z6BoyybpbaLet6jf@atmark-techno.com>
References: <20250203-defer_usb2-v2-1-69b3a941371a@atmark-techno.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203-defer_usb2-v2-1-69b3a941371a@atmark-techno.com>

Dominique Martinet wrote on Mon, Feb 03, 2025 at 03:32:05PM +0900:
> Use dev_err_probe to silence EPROBE_DEFER error on boot on i.MX8ULP:
> [    0.127301] mxs_phy 29910000.usb-phy: can't get the clock, err=-517
> 
> Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
> ---
> Changes in v2:
> - removed redundant error message and now useless braces, thank you for
>   the quick feedback!
> - adjusted message alignment (that was also bugging me...)
> - Link to v1: https://lore.kernel.org/r/20250203-defer_usb2-v1-1-2366f26462e0@atmark-techno.com
> ---
>  drivers/usb/phy/phy-mxs-usb.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index 7490f1798b461c39c29bb74e1e57e0a4adce2bd7..39b75199d11c6f9ec21174c20d0465cb79c133fb 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -769,11 +769,9 @@ static int mxs_phy_probe(struct platform_device *pdev)
>  		return PTR_ERR(base);
>  
>  	clk = devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(clk)) {
> -		dev_err(&pdev->dev,
> -			"can't get the clock, err=%ld", PTR_ERR(clk));
> -		return PTR_ERR(clk);
> -	}
> +	if (IS_ERR(clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(clk),
> +				     "can't get the clock");

Looking at the usb251xb patch also made me notice this is missing a
trailing newline, but I'm surprised because it "worked fine" (I don't
see garbage at the end of the line in my dmesg with the old 517 error)

There's no other missing \n in this file though so I guess I'll just
send a v3 in doubt, but I'm now curious if it really is needed and
couldn't find anything about that.

Anyway, sorry for the spam, and thanks for the quick review earlier!
-- 
Dominique

