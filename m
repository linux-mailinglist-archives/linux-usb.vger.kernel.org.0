Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0FD2FFA4D
	for <lists+linux-usb@lfdr.de>; Fri, 22 Jan 2021 03:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbhAVCLQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Jan 2021 21:11:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbhAVCLL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Jan 2021 21:11:11 -0500
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 701ABC06174A
        for <linux-usb@vger.kernel.org>; Thu, 21 Jan 2021 18:10:29 -0800 (PST)
Received: by mail-vs1-xe29.google.com with SMTP id s2so2247574vsk.2
        for <linux-usb@vger.kernel.org>; Thu, 21 Jan 2021 18:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IPV6PmbYU2gwkanIK2+z9F2DbEY+8hcpTu/drzyeUqQ=;
        b=P2vdFRdQ129SlJTrxq5hPPT5YvVn+xEtZ0ly6HcBuBxMz9VrBgUKfBWT1s1TJat52q
         b9tDan7ScdtnWNAwwLqXTbb5NJA2D00KxYQpYkaEmzmARpeD2rtdelIsJ7D7MPKZXRuG
         eg46T71ee2lgihM3wNqSbQsfKIv158NTseFt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IPV6PmbYU2gwkanIK2+z9F2DbEY+8hcpTu/drzyeUqQ=;
        b=Mk+sphlC9kiozKxzNH9204SElpawtA9G6VKhu6pyuOdIt8P9H+fg2DIqIYey4sknai
         UUKuwcyu4AxRb7015F9sApkBwZSuUPnXbNXDk5/Cpam/5jMPbxVgV4+SOaCHGEPzInfH
         bZu29KEWO5M72kX2yPQybaxQjz8sDOgRigAluRdKD8PX0th0aCWkTLbTddVh3zZnUv0Z
         o6EDJ/4QR4I/XAZQd96NkadWLvcHJzMr+uOdACQuD63SJviOqq8d8Yd0NLaNKtblFwQV
         A+UpBkQeLsSyalLuD743EGcG55adzJ6Iz2dgecpGpSmKv1epQGofovzcLTArvawQRCsG
         FU0w==
X-Gm-Message-State: AOAM531noudzr1I/V4b4Vut6fDQuIfsemdQF5yY8HnUWlthmg/dlw1/Z
        U+ot3Tw5yKNRBBPWOaXkmAZiaRANtkibj/JujseHAQ==
X-Google-Smtp-Source: ABdhPJwftGhTAEkd3ofI2fb+kV1jWpvn0D6bzVLuF3TPqxg6o+Rd5AcJ6qsP+3xf96d6Cx+PWmeb8CFKYxRUxt27AdE=
X-Received: by 2002:a05:6102:1276:: with SMTP id q22mr1609759vsg.20.1611281428351;
 Thu, 21 Jan 2021 18:10:28 -0800 (PST)
MIME-Version: 1.0
References: <20210121125731.19425-1-oneukum@suse.com> <YAoqXZJVhRDiRI+9@lunn.ch>
In-Reply-To: <YAoqXZJVhRDiRI+9@lunn.ch>
From:   Grant Grundler <grundler@chromium.org>
Date:   Fri, 22 Jan 2021 02:10:17 +0000
Message-ID: <CANEJEGs7VQ4N9OgtDJ0k7DqgqruwpEm7LZ07UUdD3PGepLeLHg@mail.gmail.com>
Subject: Re: [PATCHv2 0/3] usbnet: speed reporting for devices without MDIO
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Hayes Wang <hayeswang@realtek.com>,
        Grant Grundler <grundler@chromium.org>,
        David Miller <davem@davemloft.net>,
        netdev <netdev@vger.kernel.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 22, 2021 at 1:29 AM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Thu, Jan 21, 2021 at 01:57:28PM +0100, Oliver Neukum wrote:
> > This series introduces support for USB network devices that report
> > speed as a part of their protocol, not emulating an MII to be accessed
> > over MDIO.
> >
> > v2: adjusted to recent changes
>
> Hi Oliver
>
> Please give more details what actually changed.  Does this mean you
> just rebased it on net-next? Or have you made real changes?

My apologies to Oliver - the changes he's referring to are the ones I submitted:
   https://www.spinics.net/lists/netdev/msg715248.html

which is related to this series:
   https://www.spinics.net/lists/netdev/msg714493.html

I wasn't aware of and didn't look for the series Oliver had previously
posted. *sigh*  I have been talking to Realtek about getting the issue
of RTL8156 spewing notifications every 32ms fixed (thinking a FW
change could fix it) for nearly three months.  It is unfortunate
timing that Roland Dreier decided to do something about it in December
- which I didn't expect to happen given this problem was reported
nearly two years ago.

> The discussion with v1 suggested that this framework should also be
> used by anything which gets notified in CDC style. So i was expecting
> to see cdc_ether.c also use this.

Agreed. That's a two lines change to cdc_ether.c. I can submit this if
Oliver doesn't want to spin the series.

I've reviewed all three patches and besides one nit (which could be
ignored or fixed later), I'm offering my
   Reviewed-by: Grant Grundler <grundler@chromium.org>

in the off chance that helps get this accepted into net-next (and/or
5.11 RC release).

cheers,
grant

>
>             Andrew
