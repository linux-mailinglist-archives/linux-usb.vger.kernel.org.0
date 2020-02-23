Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7913B169966
	for <lists+linux-usb@lfdr.de>; Sun, 23 Feb 2020 19:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbgBWSV0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Feb 2020 13:21:26 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:41110 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbgBWSV0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Feb 2020 13:21:26 -0500
Received: by mail-il1-f195.google.com with SMTP id f10so5843228ils.8
        for <linux-usb@vger.kernel.org>; Sun, 23 Feb 2020 10:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=agHmJufwc5n016o2XYWPc9er9j+KJzKqCvCWyMVkDYU=;
        b=OXybnUTspyhHEpoAFnr1xFQuc6wIsOpJr3S35MFD2MJ0NJGfxCIATZ5TSqOy7wmnVX
         kmFmYbQ/aVO1GEzMl2V0/2GOG+RdjSzMkSqonn5Beqj28whwH+hyoEaH97EDwq8JXG5h
         vE3BmyWubU+9GHw9skUnIstDFMz8lcrV+4q5Egv/McIYPDBFoOOolWTPoDr6yiZaVjMS
         cdn450NLzpHCZTsrE/JyzeyaHaNVRyTnaZBkbU12MsTVqAFs3KmeAkz9bn5kUAF8ix7Z
         HHsMeWxXlvQt8STKqFa9gCWrfmDGOe85yXN64k5bWQE4QpnaMpEq69W8ltfxFx5Qmzwn
         PMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=agHmJufwc5n016o2XYWPc9er9j+KJzKqCvCWyMVkDYU=;
        b=fsY87G8u1lj36eol8vQ3CNqP41Gb9BhFiCkkEnz2QDUzrkFMuAtBuzVFNJ7ZamN1+A
         XgOvtAcQasYEwLfpRnoLpG5T1XB64l6ZuQ9AkzfGXTC8AVXBAA2maWKG6KPK873Cu5Uo
         Y8SRIsV8AlXnNqMCGN7Pd0KAXQxy+8I7VXQ4gU5HvuaGr4nGsf66uJR7yuOGKcBh3GCf
         PYm86o+F/y7EVx4wqUoQDAWhIifQ9Jl/340cyMhaumynPmiAKaA0v0ona8eBBtBuGibF
         4EhcrJW6OByn/vYdvxCyHIg/KCeO4rTrca47p7j/xSX9+KZ5LRfQGFVdUasScxPClWfr
         ixRg==
X-Gm-Message-State: APjAAAWln9oyPUMohCyq6kjl6cB1TFPuFDH6oqB/WFhycQycYB6Y/jNy
        8iT4nr3iNalflE4AqT+xwDRWwOX5YN2LNfPELbQ=
X-Google-Smtp-Source: APXvYqwCZ2Tuwz1Dmdx79brilm/+WarUAPFBW/eUIGDh6SvdRLbG/Hee58trZ9p6Dman9sCQDcH/mXnRouxMP6nfRiU=
X-Received: by 2002:a92:c848:: with SMTP id b8mr55549388ilq.168.1582482085421;
 Sun, 23 Feb 2020 10:21:25 -0800 (PST)
MIME-Version: 1.0
References: <20200210213906.GA24079@roeck-us.net> <20200211054953.GA2401@tungsten>
 <20200211161522.GA1894@roeck-us.net> <20200215053647.GA10345@tungsten>
 <20200219211056.GA829@roeck-us.net> <CAKv9HNZx_YTC1QEyT-T2_BuXnnju+9czKx-JJjduk9TjUSjS7A@mail.gmail.com>
 <587c8fd7-6a31-098e-7fcb-815208f602bc@roeck-us.net>
In-Reply-To: <587c8fd7-6a31-098e-7fcb-815208f602bc@roeck-us.net>
From:   =?UTF-8?B?QW50dGkgU2VwcMOkbMOk?= <a.seppala@gmail.com>
Date:   Sun, 23 Feb 2020 20:20:49 +0200
Message-ID: <CAKv9HNYoyzMbufYyaByDoKgwDO3Vfw2vk7RmpcGdf9pvzREjVA@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc2: extend treatment for incomplete transfer
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Boris ARZUR <boris@konbu.org>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        William Wu <william.wu@rock-chips.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 23 Feb 2020 at 15:45, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 2/23/20 3:00 AM, Antti Sepp=C3=A4l=C3=A4 wrote:
> > Hi Guenter,
> >
> > On Wed, 19 Feb 2020 at 23:11, Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> Yes, those patches didn't address the core problem. Can you test with =
the
> >> attached two patches ?
> >>
> >> Thanks,
> >> Guenter
> >
> > I took a look at your patch (usb: dwc2: Simplify DMA alignment code)
> > and I don't believe it is correct.
> >
> > The patch re-introduces the dma_aligned_buffer struct and takes some
> > care to align the beginning of the struct to dma cache lines. However
> > we should be aligning the data[0] pointer inside the struct instead.
> > With the code in the patch data[0] gets pushed to be at an offset from
> > the alignment by kmalloc_ptr and old_xfer_buffer pointers. In other
> > words data[0] is now not aligned to dma cache boundaries.
> >
>
> I thought so too initially. However,
>
> temp =3D PTR_ALIGN(kmalloc_ptr + 1, TEGRA_USB_DMA_ALIGN) - 1;
>
> aligns the structure pointer such that its _end_ is DMA-aligned,
> which is ->data[0].
>

Hmm, looks like you're right. I somehow missed the - 1 at the end.
Sorry for the noise I guess.

Would be nice to know what makes the previous code prone to pointer
corruption issues though. With the added padding that pointer should
also be on another dma cache line.
--=20
Antti
