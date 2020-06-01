Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 581BB1EB055
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2020 22:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728376AbgFAUjn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jun 2020 16:39:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727096AbgFAUjn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Jun 2020 16:39:43 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C39FC061A0E
        for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2020 13:39:43 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id 69so9154540otv.2
        for <linux-usb@vger.kernel.org>; Mon, 01 Jun 2020 13:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RPgsvmsceQElv0ozLEaWZZlkfQr9AeVv/O9Th10daWE=;
        b=DWcC0fQiZp6+ZInLSwjYUS0CFltBHeRF68tsMCxpE7l8uOSzDXpY+MKIkKky/Ds9iB
         igQ4g16lBhKmBAZWc3+1r3DtsyegD+6933LoY9y0wnwH2YgVK1tKerG9q9TdU2u0VA0k
         z5oh6A7txCJ1YE34ZSNx+PyL0rNsqNBnm4nbW285GUY/gHUXCq1bPNc+eMKgIgsO3Lpc
         eikymAtPmfq/O/1H7uWesqJeQleLIXdNkSa5IWDveiAn4tOTqJ0cGL0vWEDU2dJ3RYrA
         m46y3vQYwOPSLd9LXVsqGv5QA736J72baUvZ1A8vHdQLAIB06ND0N1APRULKgncAac5R
         DRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RPgsvmsceQElv0ozLEaWZZlkfQr9AeVv/O9Th10daWE=;
        b=Lmd+8UoUiOb1rOck2unf9ctsmASzCv5+pk96k37AcmqJ2kUtXLL/zoKSyl2Q7w0JXs
         GgoTF0D2C+Ju/eKq4YXwPXxrcJQrfEyxN9LCR2vJrGyuE8WYUI+NrFY+IRgKUV2hLMUc
         c+nvL6wAGlO6l4UKw74v0HA50BUoBlp2osDNP5IJnbSoL0LvXCMLC8BYUd/gMc8ttd+l
         jul/0jCAFNjOZjSQQl9/CfjthhLvXCBz+ynGcfR0Je6Iy5LTUgJ92736cB6XdPk/mRsH
         zOH3JvdyP/a4Av7F1lKrlN1AD08o42hjoiCfur9+qosXayHvzgz7KPbG5DKE+UwllvjT
         t4HQ==
X-Gm-Message-State: AOAM533zeCSHoKFPhO6LXh6m+x6H2eO85/P/bQN34r5NwRBaxX/T80x1
        0Wlzzv92nO4KYkLeilLRRP4GAf3s0RqzNi655nOJ8w==
X-Google-Smtp-Source: ABdhPJyCPfMySEQtxJpkDiWwL2wlJS292G6oePG9DQUdgHs/FDEzPxFGSieFMMrsfRcZNonrrROnPncpVF/C9cwQrds=
X-Received: by 2002:a9d:62cb:: with SMTP id z11mr19097563otk.102.1591043981750;
 Mon, 01 Jun 2020 13:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200530040157.31038-1-john.stultz@linaro.org> <CAKgpwJXU9uuT6C0NMGhZRYQMxZ9b_cCZ8=8=Yb8DwQn7aZcV7g@mail.gmail.com>
In-Reply-To: <CAKgpwJXU9uuT6C0NMGhZRYQMxZ9b_cCZ8=8=Yb8DwQn7aZcV7g@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 1 Jun 2020 13:39:31 -0700
Message-ID: <CALAqxLXmOjHvP2yB0nie8o7nCyT0xhVU+0+6DGiVaoDHwRr=ig@mail.gmail.com>
Subject: Re: [RFC][PATCH] usb: typec: tcpci_rt1711h: Try to avoid screaming
 irq causing boot hangs
To:     Jun Li <lijun.kernel@gmail.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        YongQin Liu <yongqin.liu@linaro.org>,
        Linux USB List <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, May 30, 2020 at 3:30 AM Jun Li <lijun.kernel@gmail.com> wrote:
>
> Hi John,
>
> John Stultz <john.stultz@linaro.org> =E4=BA=8E2020=E5=B9=B45=E6=9C=8830=
=E6=97=A5=E5=91=A8=E5=85=AD =E4=B8=8B=E5=8D=8812:02=E5=86=99=E9=81=93=EF=BC=
=9A
> >
> > I've recently (since 5.7-rc1) started noticing very rare hangs
> > pretty early in bootup on my HiKey960 board.
> >
> > They have been particularly difficult to debug, as the system
> > seems to not respond at all to sysrq- commands. However, the
> > system is alive as I'll occaionally see firmware loading timeout
> > errors after awhile. Adding changes like initcall_debug and
> > lockdep weren't informative, as it tended to cause the problem
> > to hide.
> >
> > I finally tried to dig in a bit more on this today, and noticed
> > that the last dmesg output before the hang was usually:
> >   "random: crng init done"
> >
> > So I dumped the stack at that point, and saw it was being called
> > from the pl061 gpio irq, and the hang always occurred when the
> > crng init finished on cpu 0. Instrumenting that more I could see
> > that when the issue triggered, we were getting a stream of irqs.
> >
> > Chasing further, I found the screaming irq was for the rt1711h,
> > and narrowed down that we were hitting the !chip->tcpci check
> > which immediately returns IRQ_HANDLED, but does not stop the
> > irq from triggering immediately afterwards.
> >
> > This patch slightly reworks the logic, so if we hit the irq
> > before the chip->tcpci has been assigned, we still read and
> > write the alert register, but just skip calling tcpci_irq().
> >
> > With this change, I haven't managed to trip over the problem
> > (though it hasn't been super long - but I did confirm I hit
> > the error case and it didn't hang the system).
> >
> > I still have some concern that I don't know why this cropped
> > up since 5.7-rc, as there haven't been any changes to the
> > driver since 5.4 (or before). It may just be the initialization
> > timing has changed due to something else, and its just exposed
> > this issue? I'm not sure, and that's not super re-assuring.
> >
> > Anyway, I'd love to hear your thoughts if this looks like a sane
> > fix or not.
>
> I think a better solution may be move the irq request after port register=
,
> we should fire the irq after everything is setup.
> does below change works for you?

Unfortunately the patch didn't seem to apply, but I recreated it by
hand. I agree this looks like it should address the issue and I've not
managed to trigger the problem in my (admittedly somewhat brief)
attempts at testing.

Thanks for sending it out. Do you want to submit the patch and I'll
provide a Tested-by tag, or would it help for me to submit your
suggested change?

thanks
-john
