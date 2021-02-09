Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFDDF315B15
	for <lists+linux-usb@lfdr.de>; Wed, 10 Feb 2021 01:25:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234072AbhBJAYy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Feb 2021 19:24:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234571AbhBIXsh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Feb 2021 18:48:37 -0500
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA988C061574
        for <linux-usb@vger.kernel.org>; Tue,  9 Feb 2021 15:47:46 -0800 (PST)
Received: by mail-vk1-xa30.google.com with SMTP id w140so107289vkw.0
        for <linux-usb@vger.kernel.org>; Tue, 09 Feb 2021 15:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WZJZ7c+5yTH+OoovuAuE2pVfxu47aSKzlNQXDtyZ89s=;
        b=TtAC8SFgKhEvLX0dcTvHXnd8o3UsWyJ1HvBTHSBWM03YTb862tvFoD3BP9RP1FuHoX
         FN+uL9eiWlH/xyTv/Ud1njg2DBSjHiLtZZ/zrtQX92yKE4r3IYwm71GPo0h24eLkG917
         2JykkZqZmgmcrVrefVnj1+5ynWO7Cj8HFEHnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WZJZ7c+5yTH+OoovuAuE2pVfxu47aSKzlNQXDtyZ89s=;
        b=jMy/ViyqHxfERcbvYBiy808lMRQnANk+TYfSwajo0Rx3vD1qnsL5FR/5sePsr7ArS7
         mad6juUa/+cw1yZAcofO/rCCMILQPJCtzlrvnAT8vb5gMu8qsiZQVFvdNkhkVU1TdCNm
         5sJNPUa0czAiSbwtJMjikC0oKLttT+fPO9LkKVIVjkspwmbpCbiP/vAW8nzTg3q+BqeJ
         kt2/laPEAJ8mxu7rItnz4vPDs/cgkEYpObmf7jimk5t43Th8Br+cbhJIM2K9q0sXQB0M
         HdFtX23B/CMyp7zGi1+Nb4QXyVGZhSbehs4KcP+mKUx4oxKDvoZy5pID1B9OTJWqUKvm
         DJ3A==
X-Gm-Message-State: AOAM533tQOtEzwEZjljKXpXFN3RTF6SAREltDn2Zqok7hDw284LxmYpA
        mMZk9NCDEQZJnI43jEbGr9DcZZSl2OHOqcPG0qQbeQ==
X-Google-Smtp-Source: ABdhPJw8kgfCY05OTr7HXAAlmYjhvKpnSWhxzNi2guh3xKgqHzBslovQWm57U2E6PYZhcXC+PP7r71P0CkZ9/PYcz9s=
X-Received: by 2002:a1f:9004:: with SMTP id s4mr188156vkd.6.1612914465800;
 Tue, 09 Feb 2021 15:47:45 -0800 (PST)
MIME-Version: 1.0
References: <20210121125731.19425-1-oneukum@suse.com> <YAoqXZJVhRDiRI+9@lunn.ch>
 <CANEJEGs7VQ4N9OgtDJ0k7DqgqruwpEm7LZ07UUdD3PGepLeLHg@mail.gmail.com>
In-Reply-To: <CANEJEGs7VQ4N9OgtDJ0k7DqgqruwpEm7LZ07UUdD3PGepLeLHg@mail.gmail.com>
From:   Grant Grundler <grundler@chromium.org>
Date:   Tue, 9 Feb 2021 23:47:34 +0000
Message-ID: <CANEJEGuXmBwYdb3Vr7QhwEUFNXyLgQ0PkqP+H1Qya+Kceh7G7w@mail.gmail.com>
Subject: Re: [PATCHv2 0/3] usbnet: speed reporting for devices without MDIO
To:     Grant Grundler <grundler@chromium.org>
Cc:     Andrew Lunn <andrew@lunn.ch>, Oliver Neukum <oneukum@suse.com>,
        Hayes Wang <hayeswang@realtek.com>,
        David Miller <davem@davemloft.net>,
        netdev <netdev@vger.kernel.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Oliver,
it's been a few weeks, do you have time to post an updated patchset or
is there someone else you would trust to help land this series?

cheers,
grant

On Fri, Jan 22, 2021 at 2:10 AM Grant Grundler <grundler@chromium.org> wrote:
>
> On Fri, Jan 22, 2021 at 1:29 AM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Thu, Jan 21, 2021 at 01:57:28PM +0100, Oliver Neukum wrote:
> > > This series introduces support for USB network devices that report
> > > speed as a part of their protocol, not emulating an MII to be accessed
> > > over MDIO.
> > >
> > > v2: adjusted to recent changes
> >
> > Hi Oliver
> >
> > Please give more details what actually changed.  Does this mean you
> > just rebased it on net-next? Or have you made real changes?
>
> My apologies to Oliver - the changes he's referring to are the ones I submitted:
>    https://www.spinics.net/lists/netdev/msg715248.html
>
> which is related to this series:
>    https://www.spinics.net/lists/netdev/msg714493.html
>
> I wasn't aware of and didn't look for the series Oliver had previously
> posted. *sigh*  I have been talking to Realtek about getting the issue
> of RTL8156 spewing notifications every 32ms fixed (thinking a FW
> change could fix it) for nearly three months.  It is unfortunate
> timing that Roland Dreier decided to do something about it in December
> - which I didn't expect to happen given this problem was reported
> nearly two years ago.
>
> > The discussion with v1 suggested that this framework should also be
> > used by anything which gets notified in CDC style. So i was expecting
> > to see cdc_ether.c also use this.
>
> Agreed. That's a two lines change to cdc_ether.c. I can submit this if
> Oliver doesn't want to spin the series.
>
> I've reviewed all three patches and besides one nit (which could be
> ignored or fixed later), I'm offering my
>    Reviewed-by: Grant Grundler <grundler@chromium.org>
>
> in the off chance that helps get this accepted into net-next (and/or
> 5.11 RC release).
>
> cheers,
> grant
>
> >
> >             Andrew
