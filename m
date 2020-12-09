Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53CAB2D3EED
	for <lists+linux-usb@lfdr.de>; Wed,  9 Dec 2020 10:39:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728957AbgLIJgq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Dec 2020 04:36:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729046AbgLIJgq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Dec 2020 04:36:46 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9214C0613D6
        for <linux-usb@vger.kernel.org>; Wed,  9 Dec 2020 01:36:05 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id s30so2201667lfc.4
        for <linux-usb@vger.kernel.org>; Wed, 09 Dec 2020 01:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7HVozN5AHG/Y9Pr4H7WM0Q2+ceA7g7F5TP2nZ6SuOwI=;
        b=hh/+pNwH+UZekebc+079X4G8sJsk4E1IMIIKvCXtTDxOynqA8XqfknGLh1g0ZQWbVN
         KZUmsn6DE6UvJRP0XyVij32ntRHKdtlSx9uBCn7Q39ikz/xCg8uXFGjE1SJ0Nln/2C/7
         yGSZZybbXFAt/g+yH+kaB29rWONoXd5m/08qc2o7AdCNJmrbINdbuQQZFWKkBZhOA2ze
         4YhG73RxDPBCTMBozrA29lz/VeyB7P8eZbuK0eyWFj9ATQRX8irHV6rkWzj7Fkl+ULx1
         UbDpbkeiT4tEV8hjdgzaSADvb2YnoKNMRWOqUPETj7ZgDRtQrIEDVZrQ5AcrKIv8ls0A
         EzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7HVozN5AHG/Y9Pr4H7WM0Q2+ceA7g7F5TP2nZ6SuOwI=;
        b=Vnn2Juu7csNzuMWc7RSi/WY7JHdV+x3WRtICEqkuE5y9P+QS3Pyao2voFjv7cJ1ilC
         DFnZJDCfnl+GED3SLkHbo1XosRRDt0YkgD1vS05hvbBpZtYn3Yf1tQphmWh31kWO4/N9
         kUoDZsisgNFX7Cn5gZViHYoz9u2mGOi0czph+UKPMBi00D1ghyaPRHz9O4jFyvzSMaW0
         fou7VrhXxofelFJFA9uHbRmqEjt2DzFss/Si4YtJXrqBvpnAQJGh4qIm54pnq02EzAwN
         iXeZqsfNy+6cPe3gX+5lOyKz60tzOM8uIQF0TT1ekWq0y+RyHB0bhg7/I+AtQghcTsFY
         8s6A==
X-Gm-Message-State: AOAM530NsAyc7qBWUwrTCUf43BsMLkzVEK/UjyBIi8mIFC4Oa9SJIcAw
        YukRaH+jVXdLD/nN+Y4rEaxbUS9T7l9uumo55t29qleTlXG9Aw==
X-Google-Smtp-Source: ABdhPJzoXcb7GFOWYSpMVM71M9A5Q12QNayCfIfDT2VAFUEWJ7wnbIRD/8Jwbm5Vt8NPCvdqrkAQdTP8gpuuKstvH3U=
X-Received: by 2002:a19:8384:: with SMTP id f126mr657330lfd.649.1607506564366;
 Wed, 09 Dec 2020 01:36:04 -0800 (PST)
MIME-Version: 1.0
References: <20201204164739.781812-1-maz@kernel.org> <20201204164739.781812-4-maz@kernel.org>
 <X848LXNv3GRmmSXA@localhost> <02b461244a33d5eb0620cfaa13c2b03e@kernel.org> <X85IC5NvcWikXfZY@localhost>
In-Reply-To: <X85IC5NvcWikXfZY@localhost>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Dec 2020 10:35:53 +0100
Message-ID: <CACRpkda+JJ9ZMmwPcA_Rc0tgqKQw+VTgfVyp8PsZG55VM82uzg@mail.gmail.com>
Subject: Re: [PATCH 3/4] USB: serial: ftdi_sio: Log the CBUS GPIO validity
To:     Johan Hovold <johan@kernel.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 7, 2020 at 4:19 PM Johan Hovold <johan@kernel.org> wrote:
> On Mon, Dec 07, 2020 at 03:00:37PM +0000, Marc Zyngier wrote:
> > On 2020-12-07 14:29, Johan Hovold wrote:
> > > On Fri, Dec 04, 2020 at 04:47:38PM +0000, Marc Zyngier wrote:
>
> > >> +  if (!bitmap_full(valid_mask, ngpios))
> > >> +          dev_warn_once(&port->dev, "Consider using a tool such as ftx-prog
> > >> to enable GPIOs if required\n");
> > >> +
> > >
> > > And again, this is not something that belongs in the logs of just about
> > > every system with an attached ftdi device.
> >
> > Fine by me, this patch can be dropped without issue. After all,
> > I now know how to deal with these chips.
> >
> > > While not possible to combine with the valid_mask approach, this is
> > > something which we could otherwise add to the request() callback for
> > > the
> > > first request that fails due to the mux configuration.
> >
> > That was Linus' initial suggestion. But I think a consistent user
> > API is more important than free advise in the kernel log.
>
> I tend to agree. So since your valid-mask approach clearly has some
> merit in that it marks the lines in use when using the new cdev
> interface, perhaps we should stick with that.

It sounds like we agree that this patch sans prints is acceptable.

It makes things better so let's go with that.

The problem for the user is that the line looks to be
"used by the kernel" (true in some sense) but they have no
idea what to do about it and that the ftx-prog will solve
their hacking problem.

It's a matter of taste admittedly, I have noticed that some
subsystem maintainers are "dmesg minimalists" and want
as little as possible in dmesg while some are "dmesg maximalists"
and want as much messages and help as possible for
users in dmesg. I tend toward the latter but it's not like
I don't see the beauty and feeling of control that comes
with a clean dmesg.

My usual argument is that different loglevels exist for a
reason and those who don't want advice can just filter out
anything but errors or worse. But it seems they don't really wanna
hear that because on their pet systems KERN_INFO it is on
by default so it bothers them.

Yours,
Linus Walleij
