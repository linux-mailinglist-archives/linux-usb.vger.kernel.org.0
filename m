Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B03E2114E80
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 10:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbfLFJ5K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 04:57:10 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33167 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbfLFJ5K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 04:57:10 -0500
Received: by mail-lf1-f68.google.com with SMTP id n25so4839251lfl.0
        for <linux-usb@vger.kernel.org>; Fri, 06 Dec 2019 01:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=61H9cvTkyoGIeOkod7NC5UKVSHkIkA8x7UV+W5gp358=;
        b=kFAkDfNmQ6I/SC05b0PIeMvH7rZ6Tjf/Kq74qsNDeQ1S1IZQRKemMzhNFatLB9Ub6u
         6Djc5Q7edAQQNzhwCh1qpsyhdjR8AMxWkgayneX4fULQBErd/I80k1Goqd+WLgdIp/DZ
         esFIS7I53LGoiCHQHRDmUwvlHzQr5n5/VwTeA9ntaTF2i2vomRhcVM5cOM8dGjfuLpP3
         3vU711f1CwKT9Olsxu9IF/wPsHm6u9E3/PQG9l0JH+kmZvsMW9tmogoX9Bh+emuf1u0F
         kDKhwBtZSkLyAqrqCDKfAEmGZTjaasVr/REIyZfdg2s3Exd8jxywmTfrVt9GXeVj8mPB
         A93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=61H9cvTkyoGIeOkod7NC5UKVSHkIkA8x7UV+W5gp358=;
        b=c7hD1xq+Jl28Ol3dNgIrdgsiktPuKwDD0zQ1/barxZbbE0fGFkoO2bRmHy3/KH+J1F
         g5MJaFkGR2YeWkr2iwqqpJWhoYrnq4NIZk4OWJ0f/WKZDrLtgDePvve9T6vRH/jOiyqF
         3/Sa6GHXzXjYFpIzFwFEcJYUNAV2SnV89yT5duS86LDIlYmickK/k64OzfjICYiV1+1O
         /9uMxYGNwW9DC7g8K7pwE/MFjOlYIJcft1vgYP89gF26w7x+6cS84ZvQzBJvbbWzqMrB
         wirKELp89xKS0klPQZkRGANwPihbkXY2vc1C2ZO+eWYGO+5A9bidJjgXbngCUnP8+cM0
         wAxA==
X-Gm-Message-State: APjAAAWpS9/AOY9rEFwMnE8gap6ccmlQPKnz646K9fxQKB23peRViVG/
        Nz09k4/U7pLN9lDrRBL4xYvR5dZX9R/NvKa9kO+Z0g==
X-Google-Smtp-Source: APXvYqxJfSjdyBeGrIaxr/t2wl5NvISLSBfkLlwlONpWGURhcvnaWrCX0QQnJi09Ho7/jIODA+O3WD0LonhOdM7sjaw=
X-Received: by 2002:a19:c84:: with SMTP id 126mr7626520lfm.5.1575626228664;
 Fri, 06 Dec 2019 01:57:08 -0800 (PST)
MIME-Version: 1.0
References: <CGME20191205145641eucas1p1e3f40dff8a0c8e9ca47425e2370eabbb@eucas1p1.samsung.com>
 <20191205145633.187511-1-linus.walleij@linaro.org> <39902b1d-656c-2dc9-34bc-3bfe715db22f@samsung.com>
 <e4ba86d5-3c25-8b2c-981c-efaad4ebc60c@samsung.com>
In-Reply-To: <e4ba86d5-3c25-8b2c-981c-efaad4ebc60c@samsung.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 6 Dec 2019 10:56:57 +0100
Message-ID: <CACRpkdaV9zoVzpZ3SW-Nvjo6ytUCEjA6fWuW1FSBciQ24j5SZg@mail.gmail.com>
Subject: Re: [PATCH] usb: usb3503: Convert to use GPIO descriptors
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Stefan Agner <stefan@agner.ch>,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 6, 2019 at 10:14 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> On 06.12.2019 08:55, Marek Szyprowski wrote:

> > NAK.
> >
> > Sorry, but this patch breaks USB3503 HUB operation on Arndale5250
> > board. A brief scan through the code reveals that the whole control
> > logic for the 'intn' gpio is lost.
>
> Well, I've checked further and 'intn' logic is there. The issue with
> Arndale5250 board is something different. Changing the gpio active
> values in arch/arm/boot/dts/exynos5250-arndale.dts from GPIO_ACTIVE_LOW
> to GPIO_ACTIVE_HIGH fixed operation of usb3503 HUB. I really wonder why
> it worked fine with non-descriptor code and the ACTIVE_LOW DT flags...
>
> I'm not sure how to handle this. Old code works also fine with DT flags
> changed to GPIO_ACTIVE_HIGH, which seems to be a proper value for those
> gpio lines.

We should of course fix up the device trees so the polarity in them
is correct.

If the compatibility with elder device trees is mandatory I will make
a quirk into the gpiolib-of.c that enforce active high on this specific
GPIO line. This is pretty straight-forward, I can just use the compatible
of the board and usb3503 in combination to enforce it.

Yours,
Linus Walleij
