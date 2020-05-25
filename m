Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E301E0978
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 11:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389183AbgEYJAP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 May 2020 05:00:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388660AbgEYJAN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 May 2020 05:00:13 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB129C061A0E
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2020 02:00:11 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id z22so10150541lfd.0
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2020 02:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AVbZ6tYIp/xVUyUP6VrSfGOnDOAgEBsy3lxuX9EX3i8=;
        b=PwJNOUDMK950t1PfuawMkGO980h5X3fnR2kVKzF+h78exsLmBgyUZTDgfjkuJtNJIo
         6CGui7qiJcCmRiDdMK8o4Z9KkdHcwbHjL7QqxUebvOgZbJZN7nzizdG9YQULLSQ8woe6
         ruSUemnmuVFo1q01gnwjPxrBceAsMAOD2BKTgupqL0yFtR3FOjCvsuoJtyv5mYva5aVw
         nGM0RzfqGAUIJZsBOvZ9dgiRA3HwLCtsR8lsp8LSiQqeLstZ2F35Tln1e1qRW/ZtRPBD
         PJifdjeIxULrERGEzuNRt+cEmOtf47JF3XmjIJI+0E4L5DcIDQCHeBZADLoRMFTjGYYD
         ktOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AVbZ6tYIp/xVUyUP6VrSfGOnDOAgEBsy3lxuX9EX3i8=;
        b=EsXpQxGJeWcnOqxXcWBW10G+u1FQFdr1dN8G4my7NCmVLUVH3eCbik7EMOYIo/9hGH
         hcw+0M+ryx+4Ua0ef3xtTtI7HGyYd0tmUMml/pwHNfxMKf3qENu5kv5ZMwcPVzqblUAQ
         y/D2l8//lCN28UdATyIzYfzW3A/BRFmRQLp9My2GAjcx7qnQGK0t9zD4K1CnwMMTLRU4
         m3fE4x2Cma/9mEBA2SBSALT7R8MovyckfwDcWzwYzaLzl90lZveSP4Vor6fB3AeGMaYd
         w+ZY9IhDeKNp2pNQ9n7pvKwwtjwO0rUKfPAFGHy0KvIi6Obr70Ik6o6HdsEfhiyYZIuv
         g59Q==
X-Gm-Message-State: AOAM532lE/WnbkTVI17Fz3xXVtQiP0oeGyf0Bttx18BqOMopDwbRoT1C
        TyfKK7OhMtvaHHt7XMyIkBtxEoB33QSFDoM1d8F+31Y0
X-Google-Smtp-Source: ABdhPJz2MDg67phcWCgGRBiLChLazpbn+5pVTJlj3rgm6su0EUVsdTIKubrpCsJfhSdKOoK4q+eTkg8CxvrbUPGzl10=
X-Received: by 2002:ac2:5cd1:: with SMTP id f17mr13019250lfq.4.1590397210185;
 Mon, 25 May 2020 02:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200428195651.6793-1-mani@kernel.org> <20200428195651.6793-3-mani@kernel.org>
 <CACRpkdZ3b-VLvxN06H_4cDOtUEQTVbe=Zw+NA=YjssMzK2d2sQ@mail.gmail.com>
 <20200429124918.GC6443@Mani-XPS-13-9360> <20200519085703.GB27787@localhost>
In-Reply-To: <20200519085703.GB27787@localhost>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 May 2020 10:59:59 +0200
Message-ID: <CACRpkdapMuMs_mEUHheGtaKYg97=nL1bH3zq4Tc3cnX9Jbw-Ew@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: serial: xr_serial: Add gpiochip support
To:     Johan Hovold <johan@kernel.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        patong.mxl@gmail.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 19, 2020 at 10:57 AM Johan Hovold <johan@kernel.org> wrote:
> > On Wed, Apr 29, 2020 at 02:12:24PM +0200, Linus Walleij wrote:

> > > to something that is device-unique, like "xr-gpios-<serial number>"
> > > which makes it easy to locate the GPIOs on a specific serial converter
> > > for lab use. However the USB serial maintainers know better what
> > > to use here. Whatever makes a USB-to-serial unique from a TTY
> > > point of view is probably fine with me too.
> > >
> > > My idea is that people might want to know which USB cable
> > > this is sitting on, so I have this USB cable and from this label
> > > I can always figure out which GPIO device it is.
>
> I think we've had this discussion before. First, not every device has a
> unique serial number. Second, we already have a universal way of
> distinguishing devices namely by using the bus topology. That's
> available through sysfs and shouldn't have to be be re-encoded by every
> driver in the gpiochip name.

I remember I even referred to this myself, but I've been waning a bit
on it recently, because it turns out that userspace/users aren't very
good at parsing sysfs for topology.

For userspace other than udev there seems to be a kind of agreement
gap. Dunno how best to bridge it though. Education maybe.

Yours,
Linus Walleij
