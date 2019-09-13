Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46807B24D0
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2019 20:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731194AbfIMSAT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Sep 2019 14:00:19 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:44716 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbfIMSAS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Sep 2019 14:00:18 -0400
Received: by mail-io1-f66.google.com with SMTP id j4so64458182iog.11
        for <linux-usb@vger.kernel.org>; Fri, 13 Sep 2019 11:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sk6zRwIJkZ2nyuNbu/AWU1hA4NRPSM/+3OMmqohibwM=;
        b=lrI5FdZBZbr1i2i77IO8wCLdCsTcgGeHbG8y41JH7Ws/WAQU7J5fsrqfY12FGrQoTg
         a8xct/3ZzUwV7y27q3/mHMdsQpWSdIbreEVgNft/rQJq/W09w8kV/lcIFru/w6ClWt5d
         C1PlJa10gJXQYJ/xiVhD0+X5tdwlE5YsY4TyP9l7+HL8AOEeq4dt5Srq3JG6hIn3ifEc
         dyYCHNRZCfEqw7ByiqYt6T5PeGSs4k0JJm41MxglB3Y7HRjd1Cl1ek+mQy4TYusGP5GJ
         yuy8bu8vx/IDy7yCiI7XLWON9aqo449Yj5d3ZDLpqYhGaWx/cI7+0gKPWdqOx9s05wzS
         ctRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sk6zRwIJkZ2nyuNbu/AWU1hA4NRPSM/+3OMmqohibwM=;
        b=cCCaMOXFljIPK3lyyqnRLXdePfzjiotqlXqeHs18MWe5fsOS6+paQBw+2B1Z183vNM
         YVptrxExCCtIS4OtLvKTKxmRl9Ly21Dy0w5N4GnRnyyulZWC1GDTpCNB3wQ1oExg369/
         /5GbwMEHCfddhLTwipnEJ3EzilFsClOG358/la4atbeCESEzB9XyMEKomPIT83gYb3PR
         OVn/5mFTcqtkXugfQFcZASO7DNq40GYxulALD5oifCq67O+5UodJe7Zv1FdvGhZqY/TY
         gQmlBaeus6UAvhLI/T7FV61J4rLMqzinVAdYI9RWGaAapipzj301IWTYI8HSI6rP0vAn
         3zkQ==
X-Gm-Message-State: APjAAAUbvTeDYB6tfyIL6O7tqoptkENp+xUvcIk2gUUjoSmkOuuNLhlv
        wDH72Epm30Oua9SEqzT/pV5HpGCBSjZ1rVNlF1NdrQ==
X-Google-Smtp-Source: APXvYqwSlwzTZNcbl3yCX0l6je8Y8gPsFxZbFPl9h2VkEqTXGEpwHg+21I17GTvPkbxSq7iF+dim1lFL4xqXx75vtN0=
X-Received: by 2002:a6b:6f0d:: with SMTP id k13mr1175320ioc.277.1568397615643;
 Fri, 13 Sep 2019 11:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190729000631.GA24165@embeddedor> <201907290936.F5F486A6F@keescook>
In-Reply-To: <201907290936.F5F486A6F@keescook>
From:   Olof Johansson <olof@lixom.net>
Date:   Fri, 13 Sep 2019 19:00:04 +0100
Message-ID: <CAOesGMh=H8MnZYH7xUFjF4rGWTt+cdkOGfDG4gr=Uaa1mU8A+A@mail.gmail.com>
Subject: Re: [PATCH] usb: phy: ab8500-usb: Mark expected switch fall-throughs
To:     Kees Cook <keescook@chromium.org>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 29, 2019 at 5:36 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Sun, Jul 28, 2019 at 07:06:31PM -0500, Gustavo A. R. Silva wrote:
> > Mark switch cases where we are expecting to fall through.
> >
> > This patch fixes the following warnings:
> >
> > drivers/usb/phy/phy-ab8500-usb.c: In function 'ab8500_usb_link_status_update':
> > drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
> >    event = UX500_MUSB_RIDB;
> >    ~~~~~~^~~~~~~~~~~~~~~~~
> > drivers/usb/phy/phy-ab8500-usb.c:425:2: note: here
> >   case USB_LINK_NOT_CONFIGURED_8500:
> >   ^~~~
> > drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
> >    event = UX500_MUSB_RIDC;
> >    ~~~~~~^~~~~~~~~~~~~~~~~
> > drivers/usb/phy/phy-ab8500-usb.c:441:2: note: here
> >   case USB_LINK_STD_HOST_NC_8500:
> >   ^~~~
> > drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
> >    event = UX500_MUSB_RIDA;
> >    ~~~~~~^~~~~~~~~~~~~~~~~
> > drivers/usb/phy/phy-ab8500-usb.c:460:2: note: here
> >   case USB_LINK_HM_IDGND_8500:
> >   ^~~~
> > drivers/usb/phy/phy-ab8500-usb.c: In function 'ab8505_usb_link_status_update':
> > drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
> >    event = UX500_MUSB_RIDB;
> >    ~~~~~~^~~~~~~~~~~~~~~~~
> > drivers/usb/phy/phy-ab8500-usb.c:333:2: note: here
> >   case USB_LINK_NOT_CONFIGURED_8505:
> >   ^~~~
> > drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
> >    event = UX500_MUSB_RIDC;
> >    ~~~~~~^~~~~~~~~~~~~~~~~
> > drivers/usb/phy/phy-ab8500-usb.c:353:2: note: here
> >   case USB_LINK_STD_HOST_NC_8505:
> >   ^~~~
> > drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
> >    event = UX500_MUSB_RIDA;
> >    ~~~~~~^~~~~~~~~~~~~~~~~
> > drivers/usb/phy/phy-ab8500-usb.c:371:2: note: here
> >   case USB_LINK_HM_IDGND_8505:
> >   ^~~~
> >
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Acked-by: Olof Johansson <olof@lixom.net>

Felipe, Greg, this is still throwing warnings, several months later --
patch was never applied.

Mind picking it up as a fix to get a quieter build?


Thanks,

-Olof
