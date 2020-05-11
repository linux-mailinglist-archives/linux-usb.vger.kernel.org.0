Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 453C11CD8BC
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2020 13:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729600AbgEKLo2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 May 2020 07:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729475AbgEKLo2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 May 2020 07:44:28 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9214C061A0C;
        Mon, 11 May 2020 04:44:27 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id h12so7330478pjz.1;
        Mon, 11 May 2020 04:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r9UHrXsbrgOr++DxzjQkfPs/L0KfhL6f2GKrka/MgsQ=;
        b=Z6ea+AqrA15W8CEParO5DzvhULrixOvrlDhhntNfp7pfApj/kW0fpzvn1n3LtvB1zI
         spYr4z+DbR9sxMV9ACps0wxuOOiEEP934ya9yiKudNTZt2L15mIakLKe+R/S0eG3G/ON
         jid3sbTFyZKBPsZoTDYYPeK9VWF+xt+4t6zmnMaj1eG0kSsPTNOvNZtKNhG4nkwMULr9
         j0NWrZWatWBoQQg2zsRbLEJd0AN49DKVOKdbO58NF9GqkkrlfEFdUV9F6lj1bvLxvBzK
         IKgKdle7WHNml1ApZr5U4zsbiQTvBvp2y93x5RMTQ893jaebjJdf3WAgPTYJEMjQmRFt
         AKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r9UHrXsbrgOr++DxzjQkfPs/L0KfhL6f2GKrka/MgsQ=;
        b=DZh64x09BPy8D1qLJG8qW4j2bCN3IR7OomvbB2uEguCauxqbKtOALw8RxPL5HphudI
         T2/1U4H9F65h1rJBVeWDAa6XxiTQXSTihc0LBYk3xO4SNuK6K2sa3Hwa0+//23cJSHLW
         xP5jrPW/3jaWCuDNJDUZmqpuomCOaNBWspsbEMrgc5Z6K50xTE3EL8C6oJrqolP1frun
         thLAq174eMga1FD9pFouwLGjFYTkJghLPG5/fJo/RFmPnHX2s1RM2A/O2ACNkF3i3QMr
         HQmj34PxlNnn7oRBPSGdmeRpLQNTMPzuVxDmkN6ej2JklRUyDW1bZv6K7ULMO0eEwsM3
         P6gg==
X-Gm-Message-State: AGi0Pub2HwW1oH065r3UGwnSAhI+Y73yfrQNXB3hbMexxbdT3Ztt0JbA
        Wea6Wkg6yCR0iG1bZqpVQ/8IG8ugXQMSTv2CrTrh8oQV
X-Google-Smtp-Source: APiQypJ76WfhXKVe0jpzzv3M5zg9WFaUDcMTJhY6CORp0ArZGOL6KutM8Kb5dcxhU62plxivfOBMHI1oyuPen/Xos40=
X-Received: by 2002:a17:90b:94a:: with SMTP id dw10mr22536348pjb.228.1589197467380;
 Mon, 11 May 2020 04:44:27 -0700 (PDT)
MIME-Version: 1.0
References: <526351589195104@mail.yandex.com> <20200511113506.GB2062175@kuha.fi.intel.com>
In-Reply-To: <20200511113506.GB2062175@kuha.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 11 May 2020 14:44:20 +0300
Message-ID: <CAHp75VcwUcbtZFQExEoJg9sFFVa_ueUT71SiMCVWetgaQg6kDQ@mail.gmail.com>
Subject: Re: your mail
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     jakub@bilan.me,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        USB <linux-usb@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

+Cc: Hans

On Mon, May 11, 2020 at 2:38 PM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> +Andy
>
> Adding also the linux-usb mailing list.
>
> On Mon, May 11, 2020 at 01:06:18PM +0200, jakub@bilan.me wrote:
> > Hello, I'm running Intel NUC10i3 with Ubuntu 20.04 on board. I have a problem
> > with cpu interrups causing issues with deeper CPU sleep and increased power
> > usage. Also load is always 1 even if machine has nothing to do.
> >
> > I made a reasearch and found that device named TPS6598x interrupts my CPU. This
> > device is related with USB and according to datasheet it's "USB Interface IC USB
> > Type-CG and USB PD controller power switch and high-speed multiplexer ". I have
> > nothing connected to NUC except power plug and ethernet cable.
> >
> > Screenshots: https://imgur.com/a/uw9NDCi
> >
> > How to solve this issue? Could you help me?
>
> My guess is that the IRQ resource is not correct for the PD
> controller causing you to see irq flood.
>
> The problem is that the ACPI device entry (the node) on this platform
> has 4 I2CSerialBus resources and 4 IRQ resources. The idea is that the
> single ACPI device entry can represent up to 4 USB PD controllers. The
> problem is that there is no way to know which IRQ resource belongs to
> which I2CSerialBus resource :-(.
>
> Andy, this is one of those multi-instantiate I2C slave devices with
> HID INT3515.
>
> The only solution I can think of is that we start maintaining DMI
> quirk table in drivers/platform/x86/i2c-multi-instantiate.c where we
> supply the correct i2c to irq resource mapping for every platform
> that has this device(s).

I would rather disable them and issue a firmware bug.
Vendors, including us, should do something sane about this.

> > Kernel version:
> >
> > Linux NUC 5.6.11-050611-generic #202005061022 SMP Wed May 6 10:27:04 UTC 2020
> > x86_64 x86_64 x86_64 GNU/Linux
> >
> > Bios version:
> > FNCML357 Version: 0039 Date: 3/12/2020

-- 
With Best Regards,
Andy Shevchenko
