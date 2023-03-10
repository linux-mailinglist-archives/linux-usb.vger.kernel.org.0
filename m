Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FDD56B36DF
	for <lists+linux-usb@lfdr.de>; Fri, 10 Mar 2023 07:52:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbjCJGw2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Mar 2023 01:52:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbjCJGwV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Mar 2023 01:52:21 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72EF4F7392
        for <linux-usb@vger.kernel.org>; Thu,  9 Mar 2023 22:52:10 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id z11so3016981pfh.4
        for <linux-usb@vger.kernel.org>; Thu, 09 Mar 2023 22:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678431130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5A4VxwAD0G1VmOtTjxYpU2wHPlC0rsgQbIavuPHT3A0=;
        b=ei9yAolQgZk8ljpvQp+daUFgqKjLew/WobCTGjJb2BjX+ueZ9nKJgHeu6Lpv5P8HBD
         2StqFieUpEtVCspiQhU188ZxRN+yyeZ+WQ4hkNRlqn/mlBb/r8AL9TvMYW/XUZgX4S9b
         Jk6wdhFt48tbZOiWriGeLYfvyYMEFny9YeZvc1EtyJ+Kyq1zzDPlwFRJQhGj+Ym4pRar
         GilpIXY7vxpVcH1Cz7dNtGp7PD+LGzjsBZPs+kFpkj7eUNMMvMsKCQ8xkmqAW//2UDUI
         7+3Q6IPAdSXZbJ7ZU3nQ8PPrGNE22xvfPXJFtPGFWwDsHUfVV8Dv3wh6sQrIeaenW5nK
         dAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678431130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5A4VxwAD0G1VmOtTjxYpU2wHPlC0rsgQbIavuPHT3A0=;
        b=WvvcoGjYupyc6iNoKa4d/RqfHU7kunt20jH0FOg/d+/YYOcuYMgf1vV1DuEiPgHMun
         MLRxyoyJlZgW94lClvQrQsI9YNTuh93WrGCIjnSKYguFZKacjt6oPStNTHI+2T7TUsv0
         jo+CByZ3LVeUf6wfnci0Agg2xxq0g/w5NZ66Al3jbiZXP2F20mUajYPGZzUkyLr0jXbu
         3X6didzEHIFStngmYukH9aWDghp2mrnese2DoFLmGhC1JjuEThgeY6tU6YJFBuDB8byW
         3PTUecC2YCBigigBUF/JSldflxBgxvQXx9Mm5QvlwaV5n0dOXGfSGVBYzKraf+xOxkdv
         kaZg==
X-Gm-Message-State: AO0yUKUsEjzp1ct7vzo13ayIQY8yW5BEQeJncl+WKaC0j2osX3VTMQVU
        BBHzqCHS3ZgfgqJzyFkeeFS5mXImFtrOnd0rb1w=
X-Google-Smtp-Source: AK7set9kl9mvzxNDKdXkm9pn1f1s/WnCyLnMiPQawsB/sPwQpwBMNORKap5EtGcIfRPiwJYvxq431uPRh8jXL+aKybo=
X-Received: by 2002:a62:65c1:0:b0:590:3182:933a with SMTP id
 z184-20020a6265c1000000b005903182933amr9918454pfb.1.1678431129641; Thu, 09
 Mar 2023 22:52:09 -0800 (PST)
MIME-Version: 1.0
References: <4772c6be-7918-9ab0-3dd5-983b293cf89f@gmail.com>
 <CAB=otbTdBPwrot9aigxbOH+GFU=gFgEpr+io7cEv-5P10BSK9w@mail.gmail.com> <62cf5f1a-c5a2-2108-5326-ae2b0c8b2264@gmail.com>
In-Reply-To: <62cf5f1a-c5a2-2108-5326-ae2b0c8b2264@gmail.com>
From:   Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date:   Fri, 10 Mar 2023 01:51:58 -0500
Message-ID: <CAB=otbQ+2d4EOg=deUUbwwAF7aJcPuMYyFSLKnfO_7-JurO-fg@mail.gmail.com>
Subject: Re: Question about f_uac1 gadget
To:     Noah Causin <n0manletter@gmail.com>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 8, 2023 at 11:24=E2=80=AFPM Noah Causin <n0manletter@gmail.com>=
 wrote:
>
> Hi Ruslan,
>
> I can't seem to get the f_uac1 to work with more than 2 channels. I'm
> able to setup f_uac2 with 8 channels.
>
> I've tried a 5.1 and 7.1 setup (c_chmask=3D63 or 255, c_srate=3D44100,
> c_ssize=3D2) but I get a urb 0 error on the connected Linux laptop and th=
e
> gnome sound-test freezes when testing a channel, no errors on the gadget
> device. My usb controller is a DWC3 on a RockPro64 board.
>
> usb 3-2: USB disconnect, device number 9
> usb 3-2: new high-speed USB device number 10 using xhci_hcd
> usb 3-2: New USB device found, idVendor=3D1d6b, idProduct=3D0104, bcdDevi=
ce=3D
> 1.00
> usb 3-2: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3
> usb 3-2: Product: audioproduct
> usb 3-2: Manufacturer: audiomanufacturer
> usb 3-2: SerialNumber: audioserial
> usb 3-2: cannot submit urb 0, error -90: internal error

Hmmm.. I also can reproduce this issue, it seems that's some bug in the
host USB audio driver. At least I see that it tries to send packets with si=
ze
bigger than the endpoint's max packet size.

I reproduced it on my Debian laptop with (kernel v6.1) and can't reproduce
on older Ubuntu with kernel v5.4.

BTW Noah what is the kernel version on your laptop where you see
this issue?

Thanks,
Ruslan
