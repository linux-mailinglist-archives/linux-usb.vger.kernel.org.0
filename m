Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E010F116B48
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2019 11:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727614AbfLIKll (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Dec 2019 05:41:41 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42603 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727567AbfLIKll (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Dec 2019 05:41:41 -0500
Received: by mail-ot1-f66.google.com with SMTP id 66so11745378otd.9
        for <linux-usb@vger.kernel.org>; Mon, 09 Dec 2019 02:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gYzrRHvROzWEHsbqPSdryz7OtZViUV/3m1bnx/0ZnPI=;
        b=v6h4FTXLN9u6J4OWpD223dFncNFgKD0HCKx1Fs7MqMEpYaNbIdbl5SEPnroSLWBCCZ
         Pmd5pNexM0K6YHXvVmdsQ9zEgsE5IWhUllrKlhXjM738xi1ut70t1lipkaAAM5RP2EsS
         3PObG+shQwNfifO8asmPHBCi7ynvNXQ+iB41dte30Ag9mgKTag6vG2SLwsY8tOB1sn9B
         XyL45Ld302H/GNgtzEWuokz4l4ZQpaElYFPC/BmjzCAs9tdBlzZ1KmeQKldMvGL/u6KA
         +is4N4ZjiQo5+qI7V3+4ZHN2HY6EykmpiBLR56IoJUO9/Tn6NDfs5wVLARpwACv3r+Kl
         HFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gYzrRHvROzWEHsbqPSdryz7OtZViUV/3m1bnx/0ZnPI=;
        b=TaxgfNTAUejfMmxRAMD/mvP7JjrYfuAw5W+BtFcPbkbVOCvk0Lp6eU4NxTZY0W2ZDv
         ZgB6WwLp0UyfXJiJSJFxCfMDumU4P7D/ZPAf1sHRipUv8NTJXO3uesK97r7WZSAUIFZY
         OnshQoJhKLs2s9w0QZK8LG6dzzzCznVPSXZ1b4/jeRFEKtwKCztExhuU1HVNuXZY5Zfl
         7AInC8I3FdBrOuB5g2/A2c3uJ6CKfLBQ/rsd5CrQLdkd5LQe2yh9kS8fFiaF5IH0ZcDe
         FFvf4/QNG1+pXzw0A3d7UQb7mdeLeWZtVIxzyb8f3Wjg3Nh9Y/iquZJVX6y9qmNVaLhU
         YFEA==
X-Gm-Message-State: APjAAAV02NatPx+oKjxLGpE5CAbn5soBEug/V0Acbsosn1KOG3DNdjVn
        ReO9zspu9/QwtbAl6Rjj0AvbolLBGmsu/WBVCun+s6UM
X-Google-Smtp-Source: APXvYqzwkO87e91T9s6pX+vP9Q4cIqivs7kZxM8F08a/F1nYK6lwny6bIiLPiQceTcD8kSb/cfntoj886BGCc3fmmqY=
X-Received: by 2002:a9d:7a46:: with SMTP id z6mr21115890otm.194.1575888100901;
 Mon, 09 Dec 2019 02:41:40 -0800 (PST)
MIME-Version: 1.0
References: <20191205142200.145252-1-linus.walleij@linaro.org>
 <20191205201936.GA19754@uda0271908> <CACRpkdb1dY-fnH8Muse7gFoxzA2PhpLFskWJ+dz6DHbvm7H7zQ@mail.gmail.com>
In-Reply-To: <CACRpkdb1dY-fnH8Muse7gFoxzA2PhpLFskWJ+dz6DHbvm7H7zQ@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 9 Dec 2019 11:41:29 +0100
Message-ID: <CAMpxmJWRbQOFP_Ftq7q89P-f=3A3Q_wCKaRv6Zki=UJPsPqjvg@mail.gmail.com>
Subject: Re: [PATCH] musb: davinci: Convert to use GPIO descriptor
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bin Liu <b-liu@ti.com>, linux-usb <linux-usb@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

pon., 9 gru 2019 o 01:25 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> On Thu, Dec 5, 2019 at 9:20 PM Bin Liu <b-liu@ti.com> wrote:
> > On Thu, Dec 05, 2019 at 03:22:00PM +0100, Linus Walleij wrote:
> > > The DaVinci MUSB glue contains an optional GPIO line to
> > > control VBUS power, convert this to use a GPIO descriptor
> > > and augment the EVM board file to provide this descriptor.
> > >
> > > I can't get this driver to compile properly and it depends
> > > on broken but when I didn get it to compile brokenly, it
> > > did at least not complain about THIS code being broken so
> > > I don't think I broke the driver any more than what it
> > > already is.
> > >
> > > I did away with the ifdefs that do not work with
> > > multiplatform anyway so the day someone decides to
> > > resurrect the code, the path to get it working should be
> > > easier as well since DaVinci is now multiplatform.
> >
> > Generally I don't take such patches unless they are part of the effort
> > to un-broken the driver. But is this patch a prerequisite of any cleanu=
p
> > in DaVinci family or ARM architecture? What is the motivation of this
> > patch?
>
> The motivation is the clean-up of the internal GPIO API for the
> kernel. It is described in drivers/gpio/TODO
>
> I can propose a patch simply deleting the code if you prefer that,
> then whoever want to resurrect it can still get it out of git if
> they need. As long as nothing includes <linux/gpio.h> anymore,
> I am happy.
>
> Yours,
> Linus Walleij

I have a related WiP series that removes calls to legacy GPIO API from
the dm355-evm which uses the same driver. Hopefully this week I'll
have some time to take a look at it, especially since I've got the
relevant HW now. Who knows, maybe I'll even resurrect this code. :)

In other words: please hold off removing of this driver.

Best regards,
Bartosz Golaszewski
