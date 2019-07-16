Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90F496AED2
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jul 2019 20:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728575AbfGPSkf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jul 2019 14:40:35 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39529 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728121AbfGPSke (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Jul 2019 14:40:34 -0400
Received: by mail-lj1-f195.google.com with SMTP id v18so20965398ljh.6
        for <linux-usb@vger.kernel.org>; Tue, 16 Jul 2019 11:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dawes-za-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FyqGLvi4NAZk/5KIGFKFWIo1eHJX/XkdYp7C+eMqueQ=;
        b=PN4Vvk/2jO6liEMeA4TWXAU7THScRbWttjQnfZpGGEAySEgyfCmQ15T3iaFSuUhnJF
         5snZV2afCnhYzCbzFXgCjfAnvPoNlhIiUuwaLgFx6ukhvfMIQPjl+g4vG9BtLTO+Y7ta
         86uNaHi5O2UCHhwp8wdiCORTL/YY3qyY0yGJaCJsEA/Qwbg7A2t/iqoyQfyIsb0fjjgy
         np6oY/DNpjcMK/tK9qK60AVtj2jetOVVZPGFSjnse1/v3yx95eqAQGvvldjnycqrL8k9
         NJj4vJnc8d4WEsE0XNxxfE71eE5c8ikqSIKClYwCiif3IOSE+0nitdf47tmnKoxSxEzW
         YVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FyqGLvi4NAZk/5KIGFKFWIo1eHJX/XkdYp7C+eMqueQ=;
        b=RSVDKS501eE8DmxUrMZ60ENRbabTXWlwJXDkdm3pYHqeZNzwilkj+HETukC4SjQt7u
         zcvccY6Ka7MVT9MCzU78LQMJ63WohNKsN4xUs+mJevDzITHdu++bCdBp/bdGuV2pv0Qd
         Z8C3Ujk4rtxvC01aF6KGTzkQoWOmwcvqDOXRZmShz9NqYPkj5DUeIHdvSw5q+TnchIvz
         FcFVe/X5qq+NOP2OxFRCt52o7qxcldPZkshZigAaiVYKT7pbH2OXKEhuLAeb862fiqDc
         VA9LKBq3lGb5MdHH5C+pcHFujIslR2aORzwNW0Knc2ccCUWxHrUEXlgNhg3b/DriOQRb
         X9ig==
X-Gm-Message-State: APjAAAUYRcEH+NSNmCzYfMseAQDs+mijUiOBbZxisGvDdvl394FM/Bx/
        xslYyVH5Qwh40F+QyE1cXaUVJzi3BsDJNJoqsVQ=
X-Google-Smtp-Source: APXvYqxnTe0wTORzQ6VbjjMLekwy6v1nHxa/Oi66EZmL/lYRbSVaOtRIpeGFFzRO0lboUyKAooHQNunvQ8jXpshpCTQ=
X-Received: by 2002:a2e:9a82:: with SMTP id p2mr19018111lji.64.1563302433017;
 Tue, 16 Jul 2019 11:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190711094012.GA16316@lisa.dawes.za.net> <20190711103457.GA17414@lisa.dawes.za.net>
 <20190716091122.GB3522@localhost> <CAOYdKdiEUsk9O=ytis=u2yD-69LoKNSE8=ivwer8K3sMNCd8Dw@mail.gmail.com>
 <20190716111711.GD3522@localhost> <1eda7a85-f71d-950b-8efd-d3258ffeeab5@gmail.com>
 <20190716180510.GO3522@localhost>
In-Reply-To: <20190716180510.GO3522@localhost>
From:   Rogan Dawes <rogan@dawes.za.net>
Date:   Tue, 16 Jul 2019 20:40:21 +0200
Message-ID: <CAOYdKdjFODZYpgQQJtck7Z=wtb5qPRujC5WiEvGEfZrDnCFyig@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: option: add D-Link DWM-222 device ID
 [version 2]
To:     Johan Hovold <johan@kernel.org>
Cc:     Lars Melin <larsm17@gmail.com>, linux-usb@vger.kernel.org,
        Dan Williams <dcbw@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I have no idea how to do that, I'm afraid.

I'm mostly a cargo cult C-programmer :-) I can copy and paste, but
that's about it!

On Tue, Jul 16, 2019 at 8:05 PM Johan Hovold <johan@kernel.org> wrote:
>
> On Tue, Jul 16, 2019 at 09:34:56PM +0700, Lars Melin wrote:
> > On 7/16/2019 18:17, Johan Hovold wrote:
> >
> > snip
> >
> > > Ok, thanks. Do you have any idea what all those vendor interface are
> > > for? Some of the other D-Link entries blacklist a speech and debug port
> > > for example.
> > >
> > > We can always do that later if we need to, but perhaps you or someone
> > > already know (also adding Lars and Dan on CC).
> > >
> > > Johan
> > >
> >
> > This is the interface composition:
> >
> > MI_00 D-Link HS-USB Diagnostics
> > MI_01 D-Link HS-USB Modem
> > MI_02 D-Link HS-USB AT Port
> > MI_03 D-Link HS-USB NMEA
> > MI_04 D-Link HS-USB WWAN Adapter (qmi_wwan)
> > MI_05 USB Mass Storage Device
>
> Thanks, Lars.
>
> Then interface 0 and 4 should be blacklisted, right?
>
> Rogan, would you mind doing that in a v3? You can include above
> composition details in the commit message as well.
>
> Thanks,
> Johan
