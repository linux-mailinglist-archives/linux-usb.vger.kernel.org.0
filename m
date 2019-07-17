Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C58666B967
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2019 11:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbfGQJhx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Jul 2019 05:37:53 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37471 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbfGQJhx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Jul 2019 05:37:53 -0400
Received: by mail-lj1-f195.google.com with SMTP id z28so22994599ljn.4
        for <linux-usb@vger.kernel.org>; Wed, 17 Jul 2019 02:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dawes-za-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2iaQRv5fbN519F8sRP3Bts2ZxB15aMVnHnuJaJZ1r6c=;
        b=JJ/RmJ2P6ixySa28EVG0QVzQWr0OvbmxCzxYyQRrjQqwBGAZpvEAhRZlh98m0GSmAH
         hZz8TagEjks6rNo8s2HHEAo4XVyVQE9T4Wk/D2+SXocZwfxOuWf2rvoogjultxpgoM0d
         W9fV4PsknrS5k/V580PO5ufR5+8bFm+tDhVq81O9tFNvoidOPGbYf28REL3cbEP5MSs8
         xVNiJjGz3lV6uzjPWvhknhFskeKmrgMeQ9nX6ewmJbi2Pp5a6vOnYNhpulqxI3Fwrcsl
         siu4Z+ZNzewUUMablsJE51J/EtAPpBLqGzU1jevTZOuSDXnckLRihcV/sAObucZMoVoa
         LktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2iaQRv5fbN519F8sRP3Bts2ZxB15aMVnHnuJaJZ1r6c=;
        b=fFGx9Bi/cSwQG+NirWhwaC/Ig2ciShwbDoFHGRJKceFmrLo5iF5Cag+I76tgguR/1J
         TaX2f76GD5c4bHPqLa+alro0yOQ0PiTvYsTweNyAvY/9uZX7jDWotqLYO8qPLNcbVE6P
         GSzpZ6iL23sW5Wh8AGdc64AK1B5qjPy7VKdo1Y4omb50fVrZF6NvlL3vJVy4nAX3Coso
         ucZESEWlQLoDEAeXptFNDOAJ+CekCFOljpIcsqTm5FYM10jw9GMdvCahXWPaXBzx1l9s
         oBSYTuO7KW/qccQOlIavmxMIAuV4T91pkBkeLFhg3XTDKzanzoDfxgrJr6FU+XzCpP6q
         lg5Q==
X-Gm-Message-State: APjAAAXdSGaa1hRJ5e+1QKblnBz7WQTaBJpsb5zlrqKntwwbcA2nTDzL
        tI9gcOs/M0zqhEMOu0uIyYOsaVqF2BwdCOBHvWo=
X-Google-Smtp-Source: APXvYqxy026+R8bszCpw5t2mUK5wElKd960icVsVtWsJZBAFap8rWFHIzfddMDPatA0Zs1K4HiJj/fyZM28qnsBUP8Y=
X-Received: by 2002:a2e:720b:: with SMTP id n11mr20837164ljc.213.1563356270807;
 Wed, 17 Jul 2019 02:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAOYdKdjBtYt_2CuBxaTYKXCt7En+ESdOKeJ+kEEvvcNhkYs_7w@mail.gmail.com>
 <20190717091134.GA5179@lisa.dawes.za.net> <20190717092007.GD16694@localhost>
In-Reply-To: <20190717092007.GD16694@localhost>
From:   Rogan Dawes <rogan@dawes.za.net>
Date:   Wed, 17 Jul 2019 11:37:39 +0200
Message-ID: <CAOYdKdiL2j4n7_+neFK1zZ4oidKpXiTV5WZjdz7R1oJuJB=JRQ@mail.gmail.com>
Subject: Re: [PATCH v6] USB: serial: option: add D-Link DWM-222 device ID
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thank you for all the hand holding ...

On Wed, Jul 17, 2019 at 11:20 AM Johan Hovold <johan@kernel.org> wrote:
>
> On Wed, Jul 17, 2019 at 11:11:34AM +0200, Rogan Dawes wrote:
> > Add device id for D-Link DWM-222 A2.
> >
> > MI_00 D-Link HS-USB Diagnostics
> > MI_01 D-Link HS-USB Modem
> > MI_02 D-Link HS-USB AT Port
> > MI_03 D-Link HS-USB NMEA
> > MI_04 D-Link HS-USB WWAN Adapter (qmi_wwan)
> > MI_05 USB Mass Storage Device
> >
> > Cc: stable@vger.kernel.org
> > Signed-Off-By: Rogan Dawes <rogan@dawes.za.net>
>
> Perfect, thanks for sticking with it.
>
> I'll queue this is up after the merge window closes.
>
> Johan
