Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A328A2B12A7
	for <lists+linux-usb@lfdr.de>; Fri, 13 Nov 2020 00:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgKLXU6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Nov 2020 18:20:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbgKLXU5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Nov 2020 18:20:57 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 985B3C0613D1
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2020 15:20:57 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id c128so34138oia.6
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2020 15:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y8a6btcC9J6Dw5jZHhUTjFeljNlNpRFxIyBHKQFn+3o=;
        b=N4Y/3V/dFLOIkeTgF8HCiTialN6ZCiLAoev5ZNV7YiDWAdY9SlcgA6/NwmVi70sIeK
         8ZR+GSwEpNQU0ir6V7LZZfDfHUrzSCcuuZSB4cjzUNiatvwomOYyBNe27pnN7Rn/UING
         /Vb13zFPN7mx1PGQs2E9Bz5b1gwSzqGEAw8XNnYKhfogoQzQKau+tkfx5oFYesOtzrYY
         L+8Rsjac37qz6QPb6BRQwaF8uTobBpceUYCb+A6YCf3hRgxteXFBf0Frv3O+WqDYuYBY
         SQRUcBBcmPNHbqfJ+UlO0eIRqsotp1xPNE2U2l2INB1wXFGG24I+cfw3Th5VHlEeLcnZ
         bGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y8a6btcC9J6Dw5jZHhUTjFeljNlNpRFxIyBHKQFn+3o=;
        b=MxZVerG7tMwfNJtKR3k/kZfehYGlHVXahS80Xzh/C5FAGwBaS3lr2K1l+WuUxO3V44
         ntVVtn7ycgLYkYhV1UMBK0NTr/0SfOzM9jPGFf5LF8JWITMAna/obFvM2+3xoN1CHfxT
         9gCwCW4cEXACRb1tZHwK9UY3QPz0F869SRxBE/mXsqnIaSHYH2RwScFZ0IddrOe4Pkq5
         9+2K/Lfmu0YB9nNd0MfX8XBK6XHjhbcM6U8s/62+XSIgfoPr8HYD5z/pJy/UOcaA4yFw
         9iK2t2qfpllqqpo7bsN1h0etSo1dEUxNwcZq16ADNQFTRqv71hun6NqsJycP52AlDZjB
         MRBQ==
X-Gm-Message-State: AOAM531q6uexRorf3HIhP0GQlnkgmYCHUMuEYBILtp8NCZyskoGraYHB
        V3wH21QPjy2BaF9pVNqRHITYganGXhSHS8xYm84=
X-Google-Smtp-Source: ABdhPJzgHFypd4u1AZN6uguIA2US7l9PjvuIezb6cl3IwNqmynG+/FW16iYNrAHv1qZX62DVq5/vnf9GD77OREkmDe4=
X-Received: by 2002:aca:518a:: with SMTP id f132mr149102oib.34.1605223256955;
 Thu, 12 Nov 2020 15:20:56 -0800 (PST)
MIME-Version: 1.0
References: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com> <20201111092941.GJ14896@b29397-desktop>
In-Reply-To: <20201111092941.GJ14896@b29397-desktop>
From:   Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date:   Fri, 13 Nov 2020 01:20:45 +0200
Message-ID: <CAB=otbSAGhDYxim9_fsyH4pZCLqgq+bxNJfv5hXqgQRVngVaig@mail.gmail.com>
Subject: Re: [PATCH 0/3] UAC2 Gadget: feedback endpoint support
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gschmottlach@gmail.com" <gschmottlach@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 11, 2020 at 11:30 AM Peter Chen <peter.chen@nxp.com> wrote:
>
> On 20-11-08 02:18:28, Ruslan Bilovol wrote:
> > Current UAC2 gadget implements capture/sync paths
> > as two USB ISO ASYNC endpoints (IN and OUT).
> >
> > This violates USB spec which says that ISO ASYNC OUT endpoint
> > should have feedback companion endpoint.
> > See USB2.0 spec  "5.12.4.1 Synchronization Type": asynchronous
> > sink provides explicit feedback (isochronous pipe).
> > Interesting that for ISO ASYNC *IN* endpoint respective
> > feedback isn't required since source provides implicit
> > feedforward (data stream).
> >
> > While it's not an issue if UAC2 Gadget is connected to
> > Linux host (Linux ignores missing feedback endpoint),
> > with other hosts like Windows or MacOS the UAC2 Gadget
> > isn't enumerated due to missing feedback endpoint.
> >
> > This patch series adds feedback endpoint support to
> > UAC2 function, new control to UAC2 mixer which can
> > be used by userspace tools (like alsaloop from alsa-utils)
> > for updating feedback frequency reported to the host.
> > This is useful for usecases when UAC2 Gadget's audio
> > samples are played to another codec or audio card
> > with its own internal freerunning clock so host can
> > be notified that more/less samples are required.
> >
> > The alsaloop tool requires some (relatively small)
> > modifications in order to start support driving
> > feedback frequency through UAC2 mixer control.
> > That change will be sent as a separate patch
> > to ALSA community.
> >
> > Also added ability to switch ISO ASYNC OUT endpoint into
> > adaptive endpoint which doesn't require feedback endpoint
> > (as per USB spec).
> >
> > Ruslan Bilovol (3):
> >   usb: gadget: f_uac2/u_audio: add feedback endpoint support
> >   usb: gadget: f_uac2: add adaptive sync support for capture
> >   usb: gadget: u_audio: add real feedback implementation
>
> Hi Ruslan,
>
> I applied your patches, but WIN10 still can't recognize it well.
> The UAC1 is OK for WIN10 with the below same configuration.
> Any debug information you would like to know to check it?
>
>
> if [ "$FUNC" == "uac2" ]; then
> mkdir functions/$FUNC".0"
> echo 2 > functions/$FUNC".0"/p_ssize
> echo 48000 > functions/$FUNC".0"/p_srate
> echo 3 > functions/$FUNC".0"/p_chmask
>
> echo 2 > functions/$FUNC".0"/c_ssize
> echo 48000 > functions/$FUNC".0"/c_srate
> echo 3 > functions/$FUNC".0"/c_chmask
> #echo 4 > functions/$FUNC".0"/req_number
> ln -s functions/$FUNC".0" configs/c.1
> echo high-speed > /sys/kernel/config/usb_gadget/g1/max_speed
> fi
>

Hmm... I just tested below config and it works fine with my Win10.
The only thing I noticed is Windows doesn't enable UAC2 gadget
by default, but this can be done from Win10 sound settings

--------------------------------->8--------------------------------------
mkdir cfg
mount none cfg -t configfs
mkdir cfg/usb_gadget/g1
cd cfg/usb_gadget/g1
mkdir configs/c.1
mkdir functions/uac2.0

# 44.1 kHz sample rate
echo 44100 > functions/uac2.0/c_srate
echo 44100 > functions/uac2.0/p_srate

mkdir strings/0x409
mkdir configs/c.1/strings/0x409
echo 0x0101 > idProduct
echo 0x1d6b > idVendor
echo my-serial-num > strings/0x409/serialnumber
echo my-manufacturer > strings/0x409/manufacturer
echo "Test gadget" > strings/0x409/product
echo "Conf 1" > configs/c.1/strings/0x409/configuration
echo 120 > configs/c.1/MaxPower
ln -s functions/uac2.0 configs/c.1
echo musb-hdrc.0 > UDC
--------------------------------->8--------------------------------------

Thanks,
Ruslan
