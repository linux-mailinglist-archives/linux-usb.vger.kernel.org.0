Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22D792E2DE2
	for <lists+linux-usb@lfdr.de>; Sat, 26 Dec 2020 11:00:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgLZJ7D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Dec 2020 04:59:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgLZJ7C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 26 Dec 2020 04:59:02 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63E21C061757
        for <linux-usb@vger.kernel.org>; Sat, 26 Dec 2020 01:58:22 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id z5so5379076iob.11
        for <linux-usb@vger.kernel.org>; Sat, 26 Dec 2020 01:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=o9E2F4A0VTVbbheqKm2e0N4/ec6vyCGIK8aRsF7KuwU=;
        b=OmseWf9DDD656oREEs9G9lBsrfYr7SzF8pgmg6d4RK/7I7FXSJ+A9X11+7u5OmlDXD
         /omuXSfN78dTAR3UjXXeplo8EEmsHVrkOqfTFOn7mB5ZHF+I7wA6Mz3Qn7fsuVfcfReK
         76AZ3JUQkWXDCZGDcFpF/1LBWiQRs+FnM+4UD2W3SwL6biFbZDfEx5elnAlp2h/IEtn+
         xkUHvwl/UvmPqnnxGKkQ7tt0zsX3BTQgFZ6kIfKZkp4WxfGi9HVf34czyqzZ8f9B22Nd
         FrHnh/Cwsok1a6Gd41uI3Rkxo+YxjGoz+9CEKImYWe71O7MbKHmFykc6sp4ypkn/BGNy
         NUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=o9E2F4A0VTVbbheqKm2e0N4/ec6vyCGIK8aRsF7KuwU=;
        b=QwCzujh5WB/Qo3imwSa5Yk69r/CDdce3Sr1cccA8JxIyUKYER2JXRQkyPHS8mzKl62
         8vRsT0wd6EBntqQmflBYTqeZlcWGxmOfr0qJWthM2Ks/Veou3jOANVSFjbxCsMrtr4jJ
         npV6QehzPB/cYoHuzo2kkII/gBynGYLNR4Eb0l5Q40CdHSj4OxRNPLGiCHXniMilGaEf
         NYSrWjd3f8wQ/d0xbrm3tkJvMfiX3qdX/tf9WV6On7woGq3DQfXiK9PsRfQqjrKUIJuh
         XX25J9PRzEBVYp7S8GH5pwX8SF+X3lRqbevNn2OYrLsSUYl3kAKxIKVu6Tq5KLtrAqJz
         pYyw==
X-Gm-Message-State: AOAM532nY5V2ChE+LOxH+cipDo9sytUUZ2+gv9o99g09Fb/m8R43ts+z
        9cNZNEFpkzvyj6WDukUlSuA3TrVJopkWZaWVnLCpcKkt2/XRhQ==
X-Google-Smtp-Source: ABdhPJwoNcEkdvS8iogIP0/RBDQKTeIVYmuAHGdsZCexMO7vMsjvmtRA2ryaK2xkxtEsFvEASUrgHgyXAMkP84+LQoU=
X-Received: by 2002:a6b:c9cb:: with SMTP id z194mr30047597iof.110.1608976701501;
 Sat, 26 Dec 2020 01:58:21 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUWHOZ9GSY7JCkooXP1oJ10_8GzHD--uuAFry_1jYDJOow@mail.gmail.com>
 <Pine.LNX.4.44L0.1606151149200.1914-100000@iolanthe.rowland.org>
 <CA+icZUWCnoBp8_Qcsxiua_en35YO7YGuc9aSmaNwNWc_RH8U=Q@mail.gmail.com> <87porhxwtt.fsf@nemi.mork.no>
In-Reply-To: <87porhxwtt.fsf@nemi.mork.no>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Sat, 26 Dec 2020 10:58:10 +0100
Message-ID: <CA+icZUW3p-QOGwoi9xj1pireghg26Tne34KZrS605soP9FWMpw@mail.gmail.com>
Subject: Re: Reset hanging Huawei USB-2.0 Internet stick
To:     =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 16, 2016 at 12:17 PM Bj=C3=B8rn Mork <bjorn@mork.no> wrote:
>
> Sedat Dilek <sedat.dilek@gmail.com> writes:
> > On Wed, Jun 15, 2016 at 5:51 PM, Alan Stern <stern@rowland.harvard.edu>=
 wrote:
> >
> >> sudo ./usbreset /dev/bus/usb/001/005
> >>
> >> 001 and 005 are the Bus and Device numbers from the lsusb output.
> >>
> >
> > Thanks, Alan.
> >
> > I will look and test this (or adapt your) line as soon as I get in
> > front of my machine.
> >
> > I have seen that the corresponding "usb-port" provides a usb3-hub and
> > a usb2-hub, so I think I have to reset both?
> > Are those hubs independent?
> > I will re-check my outputs which I had sent here.
> >
> > Can you add an example-line to the "help-text" when invoking usbreset
> > with no (or wrong) device-filename argument?
>
> I noticed a while ago that the OpenWrt guys have made a few useful
> changes to this utility, including the ability to name the device by
> VID:PID. This makes it a lot easier to use:
> http://git.openwrt.org/?p=3Dopenwrt.git;a=3Dblob;f=3Dpackage/utils/usbres=
et/src/usbreset.c
>
> I've been planning to get that diff submitted to usbutils, but haven't
> gotten around to it yet.  Yes, I move slowly ;)
>

Hi Bj=C3=B8rn and Alan,

I remembered this thread as I still want to reset my Huawei UMTS/3G
USB Internet stick via CLI.

Downloaded usbreset.c file from new OpenWrt Git repo (see [1])...

$ wget "https://raw.githubusercontent.com/openwrt/openwrt/master/package/ut=
ils/usbreset/src/usbreset.c"

...compiled it successfully:

$ gcc-10 -o usbreset usbreset.c

$ sudo lsusb | grep -i huawei
Bus 001 Device 005: ID 12d1:1436 Huawei Technologies Co., Ltd. Broadband st=
ick

# LC_ALL=3DC ll /dev/bus/usb/001/005
crw-rw-r-- 1 root root 189, 4 Dec 26 10:46 /dev/bus/usb/001/005

Via /dev/bus/BBB/DDD it did NOT work...

$ sudo ./usbreset /dev/bus/usb/001/005
No such device found

...but via VID:PID:

$ sudo ./usbreset 12d1:1436
Resetting HUAWEI Mobile ... ok

I tested this with the Linux v5.10.2 from Debian/experimental.

Any hints why BBB/DDD does not work here?

Thanks.

Happy Xmas,
- Sedat -

[1] https://raw.githubusercontent.com/openwrt/openwrt/master/package/utils/=
usbreset/src/usbreset.c
