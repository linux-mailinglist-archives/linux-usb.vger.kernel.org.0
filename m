Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8C3811510B
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 14:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbfLFNia (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 08:38:30 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41414 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbfLFNia (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 08:38:30 -0500
Received: by mail-lj1-f194.google.com with SMTP id h23so7681582ljc.8
        for <linux-usb@vger.kernel.org>; Fri, 06 Dec 2019 05:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h4fuuBJRzU+SEuvzZtWTRsJSKRAEbiyeA7gW4BZz8iE=;
        b=evJ5mpt2TagUYXg1JAoWJFHsSjvqa0y2VwFTRRBUZMJLJkXVJfxHpaw/HeovHqFDNJ
         ojX2UUy1+KfBKtDnj15ZUGUdfSgpj9MVkN1gN52M4OQqReoPb4EZAZqZ/Fn+YpbbeOTP
         hIh2KT7TBhNsQuYMnnG8lmPceJHIFx6evVI2eL299wurEwBSZy5or4NQ6kRSxWnI5afU
         reCLMGGTxD9cRoGb+qI4mS6ER7ynl3mXp2JlRo2AxsyzTP4+ZK11HncxvnzRxVgG6zlV
         20S7qPNKez/Tgv7oR0PDql1CvgsU6Ftj1Bog/rpogojBY0DYwAS+nqQ6gHRz6x5sQ+Vc
         YRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h4fuuBJRzU+SEuvzZtWTRsJSKRAEbiyeA7gW4BZz8iE=;
        b=GJzrxFOXQAVJMnSjV1psjqlTQZYGeQtCkAn9S7a6Dvo7OcgjGS/ouS8eigQNZnS/T2
         GE2V3yyjWa46yI4fFbK25gyJ1Qgws0kwFE0CQ7OmeoCfXnL1m2IE8Pg7P9l12i4sGsK2
         MSMBRWHhacdA9TfH++Cc8X5puH0v1AznAuTpKgYWFqD+ZMey1CEuRk+fzmIjonPUZQzQ
         R8KMd+IXF+Q82093a8ZjWRtqjTjLh8tF/4zbPjB2y3F9h73ddMX0h1Q6dTb4uORTOXwJ
         eNrvNpoaLAfALdglesT4zBNbW9TpjJSWIHXBc3IXJLpt0eKaZ+6CGuCuHjf2geZ3/+yU
         TItQ==
X-Gm-Message-State: APjAAAV4Rx2wnyQxqH2tnlfEd6eAfQeEE2Fo8zLw508Zq1UEwNW/V9iY
        1Ju4Ts4triQpb1GwNgu5fBwKlUDG0H2mlosP9lo6uw==
X-Google-Smtp-Source: APXvYqxmdNJaVP4FetZ29RHKEBRQrhvMhTHygrynrK2lYGL2lOo1xsrndTA972l4jGrYATZx/zUGfgdPHTByYiUzazQ=
X-Received: by 2002:a2e:8045:: with SMTP id p5mr8707540ljg.251.1575639508503;
 Fri, 06 Dec 2019 05:38:28 -0800 (PST)
MIME-Version: 1.0
References: <CGME20191205145641eucas1p1e3f40dff8a0c8e9ca47425e2370eabbb@eucas1p1.samsung.com>
 <20191205145633.187511-1-linus.walleij@linaro.org> <39902b1d-656c-2dc9-34bc-3bfe715db22f@samsung.com>
 <e4ba86d5-3c25-8b2c-981c-efaad4ebc60c@samsung.com> <CACRpkdZmPN-3_+VgBcrC_DczT4HzBWAg6tDa1hd=yAktnpYPdA@mail.gmail.com>
 <cc924d9c-d8b2-d14e-f758-556551557e5d@samsung.com> <CACRpkdYABrazSkSn0Qn-dCguxhgJUiQ2viDRMw4VAggafmZrQQ@mail.gmail.com>
 <c39f102f-532d-fb07-b5f4-920412fafef7@samsung.com>
In-Reply-To: <c39f102f-532d-fb07-b5f4-920412fafef7@samsung.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 6 Dec 2019 14:38:16 +0100
Message-ID: <CACRpkdbzU6O=ZTCFCgRRvvfXym-rZ2UuugbJ3LOMD1E2SAq43g@mail.gmail.com>
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

On Fri, Dec 6, 2019 at 2:33 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> On 06.12.2019 14:21, Linus Walleij wrote:

> > I think we should do a two-stage rocket here, if you make a patch to
> > all the DTS files I will make sure to add some logic enforcing the
> > right line levels in this patch as well.
> >
> > I'll make sure to assert reset expecting it to be flagged as active low.
>
> Frankly, if delay applying this patch one release after the DTS changes
> are applied, no workarounds in gpio core are needed. In such case we
> combine your patch with a driver logic cleanup for the reset gpio, so
> DTS can use ACTIVE_LOW flag then.

OK I'm not overly commited to DT ABI stability with old bugs anyway.

Let's do like that, CC me on that patch, I'll wait for it to trickle in
and then postpone resending this patch until a safer point in time.

(I hope the DT ABI-stable-nonsense debate will not happen...)

Yours,
Linus Walleij
