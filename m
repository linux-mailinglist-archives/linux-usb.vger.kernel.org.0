Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8652B11A021
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 01:41:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfLKAlV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 19:41:21 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35919 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbfLKAlV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 19:41:21 -0500
Received: by mail-lf1-f68.google.com with SMTP id n12so15280163lfe.3
        for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2019 16:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Fid9ZEccLBptzoOJUgvqGVoJRsstB5d1nYDlvhpYNSg=;
        b=JG3KwdCUiVNMSTx7r0pzWyjVfD4m7NeN/mcgO0qKMj4CVWBxgwvAWDaKFtrgWVhboQ
         HRsn3Qyx8I9cJvSMhRzC9yaWn5jD7rdAGxHbWaNAWC5K7ftuCrIMPHswXTZXRN0V16St
         9/T0uTq+RU864TLg7/3C47EjONKCVttEJ7ojJgVOVt81Q2yOXMAvBairnnCVoRlyLRs/
         zrn5iJhF15QDsKFmSAmozEtC3+vqnbkYLXa4JV5sNore9CjZ9FH9s29B7MlvPkXhKQin
         FVmzlXmAOm6Ga8s0TszglWJ/EVNXYFXsIKHm7e/U0r47s2tgjXQRaY5GNWr5iEb9O5xb
         fPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Fid9ZEccLBptzoOJUgvqGVoJRsstB5d1nYDlvhpYNSg=;
        b=XDildU1t6GbRXlYd1iyo+BijQg/+C9uL9Q5Sju5gD3KS4Ktw28kjZvshdejL+7VBPJ
         0DsWS8dgE4LkN9e05nqwnM1cqaN5GjkM9JiB+QARbPoUp4kcQ2BBs4Zb5uKM70vQ0u6X
         d7333+vfc0oExoJgobVkRmJ4s+R5l8tDpePS3cjJEJw6UIQKNmW9Ji7WoH0uhbn5b36l
         bUTzmXEItohec4Ro+rX/m/zMxt6IguE+ZKm/guo1S4fg2OwuWNzw3FLs+ve6Q1hy5ew8
         Rss6dLDnxdfxqFsTb1/RqRMkqpsh4zOBe0diro+ysRc/P4aUKkBhCdQK6Ts3aOSuleeF
         VChA==
X-Gm-Message-State: APjAAAV8imabQuowZwIqJwfWVUvUXS5t0fDv3OOpl8JVK8a48p356jI9
        +5zNnOF60Z79GodUG8clv7BUVZj7GY0Trzw3a1i7QA==
X-Google-Smtp-Source: APXvYqxXaC784UcLWEbh36E4RfuirOQlzwnQX6O81XmmUmoIhTqxDQidxOuKIc2qZThQbLcPv8uIqCkIIFTQssOAyOY=
X-Received: by 2002:ac2:5c4b:: with SMTP id s11mr387792lfp.133.1576024879216;
 Tue, 10 Dec 2019 16:41:19 -0800 (PST)
MIME-Version: 1.0
References: <20191205142200.145252-1-linus.walleij@linaro.org>
 <20191205201936.GA19754@uda0271908> <CACRpkdb1dY-fnH8Muse7gFoxzA2PhpLFskWJ+dz6DHbvm7H7zQ@mail.gmail.com>
 <CAMpxmJWRbQOFP_Ftq7q89P-f=3A3Q_wCKaRv6Zki=UJPsPqjvg@mail.gmail.com>
In-Reply-To: <CAMpxmJWRbQOFP_Ftq7q89P-f=3A3Q_wCKaRv6Zki=UJPsPqjvg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Dec 2019 01:41:07 +0100
Message-ID: <CACRpkdZLWJWsKb=qH+Go6SUAhkd8tR6LyjPAugBWKutSaE7rcg@mail.gmail.com>
Subject: Re: [PATCH] musb: davinci: Convert to use GPIO descriptor
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bin Liu <b-liu@ti.com>, linux-usb <linux-usb@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 9, 2019 at 11:41 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> pon., 9 gru 2019 o 01:25 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
> >
> > On Thu, Dec 5, 2019 at 9:20 PM Bin Liu <b-liu@ti.com> wrote:
> > > On Thu, Dec 05, 2019 at 03:22:00PM +0100, Linus Walleij wrote:
> > > > The DaVinci MUSB glue contains an optional GPIO line to
> > > > control VBUS power, convert this to use a GPIO descriptor
> > > > and augment the EVM board file to provide this descriptor.
> > > >
> > > > I can't get this driver to compile properly and it depends
> > > > on broken but when I didn get it to compile brokenly, it
> > > > did at least not complain about THIS code being broken so
> > > > I don't think I broke the driver any more than what it
> > > > already is.
> > > >
> > > > I did away with the ifdefs that do not work with
> > > > multiplatform anyway so the day someone decides to
> > > > resurrect the code, the path to get it working should be
> > > > easier as well since DaVinci is now multiplatform.
> > >
> > > Generally I don't take such patches unless they are part of the effor=
t
> > > to un-broken the driver. But is this patch a prerequisite of any clea=
nup
> > > in DaVinci family or ARM architecture? What is the motivation of this
> > > patch?
> >
> > The motivation is the clean-up of the internal GPIO API for the
> > kernel. It is described in drivers/gpio/TODO
> >
> > I can propose a patch simply deleting the code if you prefer that,
> > then whoever want to resurrect it can still get it out of git if
> > they need. As long as nothing includes <linux/gpio.h> anymore,
> > I am happy.
> >
> > Yours,
> > Linus Walleij
>
> I have a related WiP series that removes calls to legacy GPIO API from
> the dm355-evm which uses the same driver. Hopefully this week I'll
> have some time to take a look at it, especially since I've got the
> relevant HW now. Who knows, maybe I'll even resurrect this code. :)

Excellent Bartosz, thanks for looking into this.

Yours,
Linus Walleij
