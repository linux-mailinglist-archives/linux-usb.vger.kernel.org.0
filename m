Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4E81B622A
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2019 13:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729977AbfIRLXB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Sep 2019 07:23:01 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:39609 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbfIRLXB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Sep 2019 07:23:01 -0400
Received: by mail-vs1-f68.google.com with SMTP id f15so4201889vsq.6
        for <linux-usb@vger.kernel.org>; Wed, 18 Sep 2019 04:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=55S2kURMWRQgYIP42ijv/tZRKJ1fMejTFkOvdXY7gGI=;
        b=j4Rfnsu09rEny870zVjL5nde5hzQc22bJR/jinFuTkKGQZGM3yhruDe0NJfGalCXgx
         QgjKd1p7tmIlVYZaJoRnPc+e4cNVe/Qtxrtnt9PaAI9DOxFtQUrvCce2CYJhAJKa+LR6
         9rQ3u6f4mZD3JOIY0DQgSUHIdsOIpV5Cd/OiCz9uJo55LZ3HEanoj9pHuAGR2I47MxWJ
         6Q5T2xmatEdRgd7CwytQUNP/udpThUtDg8HIlBTk8j0H1AtusW3Z4toRsDp5TpPmMadF
         3v9NioJWR2DpgasM+1qrRyqBwQpNTxM5tMzR6/kl/Bc60pNEoy2lw0VsHTyvLGhcbnjA
         2LWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=55S2kURMWRQgYIP42ijv/tZRKJ1fMejTFkOvdXY7gGI=;
        b=pnbe/XujQ8Hd21HSSFI4BPtFDeZb4PlXM9PeU4yilUwGaWp8HF3hzkT6jP6Ai4X+9L
         MQ89RKfxig5LPr1nBWagXkSspNXOwX/plRRaaG3j3OAsN+bskDMCnUzTge3kDwjpL2FD
         7h8kQfumsXmRRADu6cR7qp5Ai2psnC2iFNA6kPjO+cbuwAJunwhXYjGIsHTHJfjfX8HZ
         NfCGl3+WKhXk0uuTqAWAeb/So+3/LxFcRldXeHAL8CvK80A5iIfEEjDMVzc8H3srzyiT
         3awtboAP1shU4n0mdAOKuoSWEJvEvwd69Nv4giiOuouslVkyyFV3AjREr8zqNTMxfJn6
         Vl9A==
X-Gm-Message-State: APjAAAW0MBY3GvrOx3lPKyxz4eDtfCwp06FIl19Rz+j/lupKo32p0bPi
        HNuWhUm6JnHWwuEZkUu+mZA9ZvQUssqUFbwBSac=
X-Google-Smtp-Source: APXvYqwvjlzQXeHAlpq5LMthIplkRHqXwYEietdIUwdgfKqWONeHkeo58O3do9YBvEtIxxAGlgBMySTvVR8QQiEvJ58=
X-Received: by 2002:a67:2c92:: with SMTP id s140mr1882335vss.142.1568805778927;
 Wed, 18 Sep 2019 04:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190918091415.23683-1-yegorslists@googlemail.com> <20190918110814.GC1894362@kroah.com>
In-Reply-To: <20190918110814.GC1894362@kroah.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Wed, 18 Sep 2019 13:22:42 +0200
Message-ID: <CAGm1_kvb--Ckxxft=Nqx4GDoHhA_qU3+ZCoqF86dEua_V2VrtA@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: add port statistics
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 18, 2019 at 1:08 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Sep 18, 2019 at 11:14:15AM +0200, yegorslists@googlemail.com wrote:
> > From: Yegor Yefremov <yegorslists@googlemail.com>
> >
> > Add additional port statistics like received and transmitted bytes
> > the way /proc/tty/driver/serial does.
> >
> > As usbserial driver already provides USB related information and
> > this line is longer than 100 characters, this patch adds an
> > additional line with the same port number:
> >
> > 0: module:ftdi_sio name:"FTDI USB Serial Device" vendor:0403 ...
> > 0: tx:112 rx:0
> >
> > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> > ---
> >  drivers/usb/serial/usb-serial.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
>
> You can't change existing proc files without having the chance that
> userspace tools will break.
>
> Have you tried this and seen what dies a horrible death?

This patch is more a proof of concept (forgot to add RFC keyword). I
find statistics provdes by the 8250 driver very useful for debugging
purposes. What would be the best way to implemnt this feature for
usbserial driver?

a) extend current line:

0: module:ftdi_sio name:"FTDI USB Serial Device" vendor:0403 ...tx:112 rx:0

though this still can break parsing

b) creating special entries for FTDI and other UARTs? Though it would
be greate to have all usbserial UART handled the same way in the same
file

Best regards,
Yegor
