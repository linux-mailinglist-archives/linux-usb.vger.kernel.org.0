Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B65D92B0F20
	for <lists+linux-usb@lfdr.de>; Thu, 12 Nov 2020 21:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727155AbgKLUnB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Nov 2020 15:43:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727025AbgKLUnB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Nov 2020 15:43:01 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EB50C0613D1
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2020 12:43:01 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id 74so10480781lfo.5
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2020 12:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=wxwl1Ls/3gFJRcyba11bJr9CwJo7zW4muQyQiz0ZX6k=;
        b=uoM7D2CNwr2jhLTptMv6q/uHCUjnBKMtzeEmjDB6rXyTUcF7iJRwz9GopeMlEAkzyn
         1l282KciEaC8YLclGqV83qAQb5aJmEnZH60AbnyGmHfAe+EPmWrIRLxJki9PHYW5/7G9
         4KsFaoJLde3u5++IEG1B7KNjeJJiqeaWzKrtUcaZOh0yknd0r9Heub5+xTuoCwbwoIGr
         jbaTqW4A2b41+wCNKj1gHbHZAQCULyCL8JDcr2bt/WW0CJ6ri1DXe05Na2yFx8hL7DeN
         Dq6Pn/EuuOZ5uRjCcgTqiypfBHFwJ38kjDkcN3h8R2D0dWPM6A0SKx4jWFnjfxAFu26Y
         GCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=wxwl1Ls/3gFJRcyba11bJr9CwJo7zW4muQyQiz0ZX6k=;
        b=dgafKULCHXmpBtIDgPLni3m7g8qn7O7FB6uar3aMPariM0teIlGjtOscCk4dF3tXXC
         nIL1HNugcI8gMIlLSzZBa5s4AoGmNe9M3Xpk83EEup2jzpVQGn1dPP0emGyQheXtjSQ1
         3pY4ETaZbow+NuWrQcS8Kld9LRgTDTClxKsghty3AM+lG9zOBn/tKK6PPDm2LPDDcwbP
         pNfkeR5J5YUj6lFq+XLd1qkfUZWKNEDBZ1vwX+b7YlI9UsItVj8C+d9s2mvT2bcod/IV
         p/JoywVt0ZnlH6xc6fzzzGTwyBjQtl2ftALqGxO2/Kp3AxkTIWP/yZ/VR/JiCxM6J/C5
         a7aA==
X-Gm-Message-State: AOAM533V6fcZOwWEpYHcdLwCqqUWOjClwh8PSXRdS3BWdHtAWXa/3Ep6
        dMttOKDMeE5nX3nrO2O5qI2+YwOGj9vCgiUtRdx6/CoSIKpbXLAj
X-Google-Smtp-Source: ABdhPJxdcJZdniK+SHl/wdeEpFqIXgKG0+lJdAfgAfBaGz3M8vgyN4uewQRveh6BYRoV1DMC5lqVuqIuiS1yuJawKqY=
X-Received: by 2002:a05:6512:1050:: with SMTP id c16mr431613lfb.597.1605213778940;
 Thu, 12 Nov 2020 12:42:58 -0800 (PST)
MIME-Version: 1.0
From:   Glenn Schmottlach <gschmottlach@gmail.com>
Date:   Thu, 12 Nov 2020 15:42:47 -0500
Message-ID: <CAMS2kBGqFx_8ErjXr4F8r=f2y6VEjFAVq2qoVf0DZA5ryqBB6g@mail.gmail.com>
Subject: Re: [PATCH 0/3] UAC2 Gadget: feedback endpoint support
To:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>, peter.chen@nxp.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Ruslan -

> I applied your patches, but WIN10 still can't recognize it well.
> The UAC1 is OK for WIN10 with the below same configuration.
> Any debug information you would like to know to check it?

> if [ "$FUNC" =3D=3D "uac2" ]; then
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

I too applied your patch and configured my UAC2 gadget with the
following pertinent parameters:

mkdir -p "/sys/kernel/config/usb_gadget/g_multi/functions/uac2.usb0"
echo "${req_number:-4}" >
"/sys/kernel/config/usb_gadget/g_multi/functions/uac2.usb0/req_number"
echo "${c_ssize:-4}" >
"/sys/kernel/config/usb_gadget/g_multi/functions/uac2.usb0/c_ssize"
echo "${c_srate:-48000}" >
"/sys/kernel/config/usb_gadget/g_multi/functions/uac2.usb0/c_srate"
echo "${c_chmask:-0xFFFFFFFF}" >
"/sys/kernel/config/usb_gadget/g_multi/functions/uac2.usb0/c_chmask"
echo "${c_sync:-adaptive}" >
"/sys/kernel/config/usb_gadget/g_multi/functions/uac2.usb0/c_sync"
echo "${p_ssize:-4}" >
"/sys/kernel/config/usb_gadget/g_multi/functions/uac2.usb0/p_ssize"
echo "${p_srate:-48000}" >
"/sys/kernel/config/usb_gadget/g_multi/functions/uac2.usb0/p_srate"
echo "${p_chmask:-0xFFFFFFFF}" >
"/sys/kernel/config/usb_gadget/g_multi/functions/uac2.usb0/p_chmask"

Unfortunately, under Windows 10 I get the following error loading the driver:

This device cannot start. ( Problem Code 10)
Problem Status: C0440022

So the generic Windows (Thesycon) UAC2 driver appears to fail loading
the Linux UAC2 gadget device. Can you share with us your configuration
or how you tested this with Windows 10? I tested audio capture with
another Linux PC running Audacity and it was correctly detected and
seemed to work. I'm hoping it's a simple misconfiguration issue. Can
you offer suggestions?

Thanks,

Glenn
