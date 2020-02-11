Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B79815961E
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2020 18:26:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729219AbgBKR0H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 12:26:07 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53297 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728624AbgBKR0H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Feb 2020 12:26:07 -0500
Received: by mail-wm1-f66.google.com with SMTP id s10so4628449wmh.3
        for <linux-usb@vger.kernel.org>; Tue, 11 Feb 2020 09:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gLgP1onPrPgFDge6UK3SXmSS3D/74ambFRjbtx5/Bxw=;
        b=k0DsvGNI8SCJmT80z9K4JoR0f1kSEaiEs6biWChmPfHWPdntu3OOsJglXpCZtC1Sct
         9HjZwQN8IBlzoEZ/+DLBAZLKXU1ticeAcgizqO9yEyjy+UyF9EH7wd6JQ4rod7jN3ndS
         U7sWlnfBKVdjOgnwR2+/hAcahav1vboO1BcbzuGNbTCHnZoFDZyQ8jRXf4JWFJfngcVs
         6cWmcQRUST1/FNgDi8OGAXu18xINKxpi3GXFGXYqt/KAKRdwSaJjMw0X01sQ4R+tZiRT
         fP/48yfsjTLqkpPnU+bcp7bG/DzwpkhKqH8VX8aK6NR7lPMj5o9R23AJfcF3QHLfJ+l8
         J+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gLgP1onPrPgFDge6UK3SXmSS3D/74ambFRjbtx5/Bxw=;
        b=HyKV5KItPKGTz9Z/8bsB1p3gMoKycGjwqDbe2W5wq0hR8laidL24NuajiqUkUjtMmB
         3O/a18FpPGaV1VsU504Z3VEemBRLn+YnEBqiQe11CSDbDYE88GmB20PDyU727IeIh9cp
         Od0Tn7FvvslaIUgf8RRaVGLAYX/YzZdhIbP9ca1fArJ+XfW9zhDjfE1KeM4yY2GkELkd
         TsjpY0jjhke+AwtHoY8WgvoVzrhWPWpyZd8UlRgJayf04QKva04+nf7yD3+FuAs+x2M2
         aFPAxGI8zU5v6iLQ5xvf9DOKl5BTDoEQLp1aXP3tuh+rOJhKu++q8Rbz14HlLAySzY4v
         nmyg==
X-Gm-Message-State: APjAAAVcm+KGmFbRd+q1z4qg+VyBsbGA4mDbHGYj/DlAyTFuGAdD5x87
        XqYjmDLM6TZTSWAVtumE4NK6kgPcHzUgx8dysFoCYiw3
X-Google-Smtp-Source: APXvYqxt15WC4fOfsBVaBDvQrEgsqoWx3helanCU/Bm6hXiD7dTdsXh9ceZP58EzqmZqcJEKUR41QuADs3nc3rsxv6s=
X-Received: by 2002:a7b:c407:: with SMTP id k7mr6914455wmi.46.1581441966169;
 Tue, 11 Feb 2020 09:26:06 -0800 (PST)
MIME-Version: 1.0
References: <CABatt_xcct6nNp6OELNMO3-R+JPLdh_bn6pH5RxyWQu=m9NhGw@mail.gmail.com>
 <Pine.LNX.4.44L0.2002101005210.14460-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2002101005210.14460-100000@netrider.rowland.org>
From:   Martin Townsend <mtownsend1973@gmail.com>
Date:   Tue, 11 Feb 2020 17:25:54 +0000
Message-ID: <CABatt_x5unKx-O0WENEHfm7az-pPXO8sayk+jWuYrksbEgghnA@mail.gmail.com>
Subject: Re: Enumerating USB devices in the Bootloader
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 10, 2020 at 3:12 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Mon, 10 Feb 2020, Martin Townsend wrote:
>
> > Hi,
> >
> > We are using the USB mass storage gadget driver in Linux and
> > everything is working fairly well but sometimes we are finding that we
> > are exceeding the 100mA limit (which I think is the default the host
> > will provide) before Linux has had a change to enumerate the USB
> > device at which point we ask for 500mA.  We have tried to reduce the
> > power by ensuring all clocks are turned off, devices not used disabled
> > etc but can't seem to satisfy the 100mA limit.  We were thinking that
> > maybe we could enumerate the USB device during U-Boot at which point
> > we know we are under the 100mA limit.  Does anyone know a reason why
> > this would not work?
>
> It won't work because U-Boot isn't the kernel.  When the kernel takes
> over the USB controller, it will force the host to re-enumerate the
> gadget -- and you will be right back where you started.
>
> The only way to make this work would be to prevent U-Boot from ever
> actually booting the Linux kernel.  This probably isn't the way you
> want your device to behave, though.
>
> > would at some point from U-Boot enumerating a new
> > bMaxPower would the connection be reset and drop back to 100mA during
> > the kernel startup? Are there any considerations that we would need to
> > take care of in the kernel for this to work?
>
> If you can't satisfy the 100-mA current limit then you should make your
> device be self-powered instead of relying on power delivered over the
> USB bus.
>
> Be aware also that bus-powered USB-2 hubs can't deliver 500 mA to their
> downstream ports.  They are always limited to 100 mA or less.  If your
> gadget was plugged into one of them, it wouldn't be able to work at
> all.
>
> Alan Stern
>

Alan,
Thank you for the swift response.  On the first point, if we modify
the kernel to re-enumerate the same bMaxPower of 500mA would this
still be a problem? ie is there a period when the kernel takes over
the USB controller that the Host side would go back to 100mA after
U-Boot negotiates the 500mA?  The last point you make is a very good
one and something I hadn't thought of. If we can overcome the first
hurdle I think we would be happy for it to be a requirement for the
device to be plugged directly into a PC.
