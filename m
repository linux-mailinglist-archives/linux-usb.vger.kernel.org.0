Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB35D1150F2
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 14:21:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbfLFNVc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 08:21:32 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43770 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbfLFNVc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 08:21:32 -0500
Received: by mail-lj1-f194.google.com with SMTP id a13so7615942ljm.10
        for <linux-usb@vger.kernel.org>; Fri, 06 Dec 2019 05:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0gHoEDyloYkfzEPNSS6uEQmV6zqlFrICEVvBJMY5Ms8=;
        b=nzjyFBHRYOpqjcKpHHACGU75XMNohRYxY3jL07dTPgdsoDuuF84wI0heY+ELzoyIHv
         /FROUtlTzRyfwsyI2GyeDX7RVwEQMBMmhk0mKdQN+zySHzU4LAlEoec8P5G+LBD02rtg
         XYYgxHZdNO4yMwnu+Lq1TraT/tVimwYXwvyKTswid8JQ0ax2D663gCTWrZvifvM3F2jQ
         ZxquFfXYB9USWi7njaLRr5iUPbjwQBli6ccvSezx6B8GEvTb36Flg/OYjwRdfMWl0ZBK
         Uko1FX2T+w2F/IaxZ9XIPXJ7Nh4246499Fvb3kuEZ5x5sQeTuEiGfmdoGq5wqtzKcT+E
         uDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0gHoEDyloYkfzEPNSS6uEQmV6zqlFrICEVvBJMY5Ms8=;
        b=LjjyizFdP5jFqfqWAcvMwrtta+PaV7jUqs2ZLz6qi/VBZNyECY4tOGhSJK+rEadyiN
         jB+iWXxA47cLQ5Pvs0rWREd5VjPwSfa0kmwxEsEahHSZqXjpZXU0YvNFDP/tDtCZ3Bv9
         AVde3H7dwW+GzvgQajrej5stwYpOLSbCtm7bf4aLiNVAnJBfn03iPx7fN9wgaU/aBtRj
         muRt8Cl8XODuZ8R1ML4TPq8luz/P0GKdOYw9msJfaP7QjJthcXx8pIuag9Fzw0xNjpW/
         34nUladkVHZCMhXYvK1UK4sbV5rO1ZaoHMTsnJejIO8A6SGcErkZUwjPqIHXXHO5XsZC
         4qSg==
X-Gm-Message-State: APjAAAUc6B+O0w94YZwDLc5jSb1ZMLt5aE3lrhyrB2+M4KFyR9zMpwxp
        YiV1ClXRgEkt/rEYlyf1XGZ3eE/yn+JXiWW2YzOtoQ==
X-Google-Smtp-Source: APXvYqzZjz1qTmUyRJMXv2yDBwl/pZEU99zbPdxrMg0D4sa/u0KAyg8a9d0KcM0YBVHAAez6hXSVMCWb1sF4c28kBzw=
X-Received: by 2002:a2e:8045:: with SMTP id p5mr8665666ljg.251.1575638490622;
 Fri, 06 Dec 2019 05:21:30 -0800 (PST)
MIME-Version: 1.0
References: <CGME20191205145641eucas1p1e3f40dff8a0c8e9ca47425e2370eabbb@eucas1p1.samsung.com>
 <20191205145633.187511-1-linus.walleij@linaro.org> <39902b1d-656c-2dc9-34bc-3bfe715db22f@samsung.com>
 <e4ba86d5-3c25-8b2c-981c-efaad4ebc60c@samsung.com> <CACRpkdZmPN-3_+VgBcrC_DczT4HzBWAg6tDa1hd=yAktnpYPdA@mail.gmail.com>
 <cc924d9c-d8b2-d14e-f758-556551557e5d@samsung.com>
In-Reply-To: <cc924d9c-d8b2-d14e-f758-556551557e5d@samsung.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 6 Dec 2019 14:21:19 +0100
Message-ID: <CACRpkdYABrazSkSn0Qn-dCguxhgJUiQ2viDRMw4VAggafmZrQQ@mail.gmail.com>
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

On Fri, Dec 6, 2019 at 12:53 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> On 06.12.2019 10:58, Linus Walleij wrote:
> > On Fri, Dec 6, 2019 at 10:14 AM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >
> > BTW:
> >
> >> I really wonder why
> >> it worked fine with non-descriptor code and the ACTIVE_LOW DT flags...
> > The old code ignored the polarity flags in the device tree and
> > assumed everything was active high, that's how. It could as well
> > be hardcoded to 1337.
>
> Okay, then to restore current driver behavior after your patch, one has
> to change gpio flags in all dts to ACTIVE_HIGH...

Yeah :/

I think we should do a two-stage rocket here, if you make a patch to
all the DTS files I will make sure to add some logic enforcing the
right line levels in this patch as well.

I'll make sure to assert reset expecting it to be flagged as active low.

Yours,
Linus Walleij
