Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97DEDB627E
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2019 13:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbfIRLvr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Sep 2019 07:51:47 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:40996 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbfIRLvr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Sep 2019 07:51:47 -0400
Received: by mail-vs1-f65.google.com with SMTP id l2so4239673vsr.8
        for <linux-usb@vger.kernel.org>; Wed, 18 Sep 2019 04:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FNV0yidpbDZLkT4EJ2cbRVz6TcTIQHgolGEicyJu7CM=;
        b=d9UM4bP1teAd+ulUyJUZBQwOxod2wVfCGKk0zjhlkn5GZ4Qbiog9xLIsmK7eWMhFAG
         3N4KDaY+kipT78Cl63oCdbxMtx7O+VYD/ZwwquIGJm6bPJdmR4He2C0hpKF413G/e0pZ
         2OqLATUuHk1884YiY0LweFauCGgObfWr/jDXhMJExCq/gYjkUqRj+rMHwPuU4ETJHgK/
         SUPbFa1Eg0vUP/fu8aMAM8mUnJ1kENhELztChlH+vSYUNipCLYgflwlUMS+eo/4ETfES
         f8B/CA2CGGHYj72lbjPChGayuSKUh52y0tisPim0MDCP7gdISvtV9qZXS3JzI+/+ChQt
         og9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FNV0yidpbDZLkT4EJ2cbRVz6TcTIQHgolGEicyJu7CM=;
        b=VU23DqZaoGpFQ0ssS1vKPIcf5oOVe292gfWT4LirajQHD84At6zjSPDlYb0Zw5tla7
         V8Dco+njA46/YKeIioFIz3hcLkbpFqugAhWoUys65sWhFQ9xG23HU64AAgh/VHqJeBbg
         IHQoBxIHfAijNR8+pX0dpVbH7gML7h6t/ui1DuK8if+IHwqz403kQvyIRW1gyHJffyKz
         8EBM6U5TSnjoE0zgfMBULiEgfXeQUrkO4UG5FixU4PHtNeBkc4K91UCuCSYWPA6AtIgc
         eJQY0zjnleMqOIv1jYtyObjHPG6OwtMcZzhZK9AGBiZ0dURaLF/1Q9Tf2QBHwgjNyPzx
         KEEQ==
X-Gm-Message-State: APjAAAWP9Uf5QzgvbhGcQl5m1OaHOHsaYUKMKV+qqNhFeCtM0022jU1q
        Dr/BhUWgIAeXGbBtmO01idAUvfHw1H1R6FYl8rYkkHnH
X-Google-Smtp-Source: APXvYqwD8vhe7VB2A+m3n2akbImIlNWazGb8XqDarbC7+sj6kj+vZuDW4+P9sUSoQ5RBQeEZcwPGzF7XMzwLv43T1CQ=
X-Received: by 2002:a67:e298:: with SMTP id g24mr1886886vsf.164.1568807506278;
 Wed, 18 Sep 2019 04:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190918091415.23683-1-yegorslists@googlemail.com>
 <20190918110814.GC1894362@kroah.com> <CAGm1_kvb--Ckxxft=Nqx4GDoHhA_qU3+ZCoqF86dEua_V2VrtA@mail.gmail.com>
 <20190918114511.GA1899089@kroah.com>
In-Reply-To: <20190918114511.GA1899089@kroah.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Wed, 18 Sep 2019 13:51:29 +0200
Message-ID: <CAGm1_kv9x234BSE1U0u=huwQDZdxmX-zURS6mB6ypbahmbAC_A@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: add port statistics
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 18, 2019 at 1:45 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Sep 18, 2019 at 01:22:42PM +0200, Yegor Yefremov wrote:
> > On Wed, Sep 18, 2019 at 1:08 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Wed, Sep 18, 2019 at 11:14:15AM +0200, yegorslists@googlemail.com wrote:
> > > > From: Yegor Yefremov <yegorslists@googlemail.com>
> > > >
> > > > Add additional port statistics like received and transmitted bytes
> > > > the way /proc/tty/driver/serial does.
> > > >
> > > > As usbserial driver already provides USB related information and
> > > > this line is longer than 100 characters, this patch adds an
> > > > additional line with the same port number:
> > > >
> > > > 0: module:ftdi_sio name:"FTDI USB Serial Device" vendor:0403 ...
> > > > 0: tx:112 rx:0
> > > >
> > > > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> > > > ---
> > > >  drivers/usb/serial/usb-serial.c | 22 ++++++++++++++++++++++
> > > >  1 file changed, 22 insertions(+)
> > >
> > > You can't change existing proc files without having the chance that
> > > userspace tools will break.
> > >
> > > Have you tried this and seen what dies a horrible death?
> >
> > This patch is more a proof of concept (forgot to add RFC keyword). I
> > find statistics provdes by the 8250 driver very useful for debugging
> > purposes. What would be the best way to implemnt this feature for
> > usbserial driver?
> >
> > a) extend current line:
> >
> > 0: module:ftdi_sio name:"FTDI USB Serial Device" vendor:0403 ...tx:112 rx:0
> >
> > though this still can break parsing
> >
> > b) creating special entries for FTDI and other UARTs? Though it would
> > be greate to have all usbserial UART handled the same way in the same
> > file
>
> Why is any of this needed at all?  Also, be very aware of the security
> issues involved here, we had to disable access of these values by
> "normal" users for other tty devices, so please don't break that by
> offering it up here again.
>
> What is going to use this information?

This feature is not a "must have" one but it is convenient to see
transferred/received bytes and error flags from user space. If some
serial software is not working like expected and doesn't provide
enough debugging information one can quickly look at port statistics
from the console in order to check whether and how many bytes were
transferred or whether the were some communication errors.

Yegor
