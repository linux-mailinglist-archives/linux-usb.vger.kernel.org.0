Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3DD03BA461
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jul 2021 21:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230481AbhGBTgW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jul 2021 15:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230180AbhGBTgV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jul 2021 15:36:21 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 684BBC061762
        for <linux-usb@vger.kernel.org>; Fri,  2 Jul 2021 12:33:48 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id n25so14643550edw.9
        for <linux-usb@vger.kernel.org>; Fri, 02 Jul 2021 12:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GAippCKrMb1Zcv9GDuupcKoLDEyKodAAtcqMwLW9uGk=;
        b=RqwplAzqrz19C9fLsFGpKT8JEgnG7WAuyVurOAxZZhDDidxFRQ5cHQQXZEbj7BifjA
         1aFVTdClwewbVINOswVfiONwH4vRpORVYw1FKgFY5V9syKMi9qU6NTumdYm2fNapWX1N
         PU4bc7W2tA38vlyNvVJ2VleY3eHFudY4cmHov8xNIMY2h4w5GhTaz9lNdHO4y2MLljAv
         Il1TxPLwjsElcIelrfLWuVjE4wlUmV/Mg3tdPwyLyBoivIXGFO6L0UhRaQ7x8w5ZxGyt
         iDRADv8F1ChODzON+HZybEwh3rjkjFLTUgj4Ypdy93O+DQKlaaSwVl6jbVQxH5DI3JOY
         ZkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GAippCKrMb1Zcv9GDuupcKoLDEyKodAAtcqMwLW9uGk=;
        b=Qy8UB1C2woyCDnTJ0hi52TM9tETzpoS8FXydG9SU45E1KydiZn88Zg7dMDP1EVXN/i
         AllR/cLbSFokwCKJlK85Fhyx3eyKZhXcGZZ1WFSkLO+SuW3UMexwOZNB5dAvXj40qpnc
         iCPcCp3Y9sUlFHko3GGkQKh4DVvnmuQelC7RhzwjFsb3OkbHrYSlc7H9Gl7Il7bljbJu
         9iV8OVpAp7/21g8jcJD73P58tUoAgyNZAq3aE8/Fe2Uje0nIEsur60jVcfePtXu2JVqZ
         m8G2pR+zPm+zI1he8197oo3ja/POeWrtM0q1IJQcU1QLTKqAugNshgfnt9eLBOlqh5/g
         dggA==
X-Gm-Message-State: AOAM532qnj2u6LUmI5aQd2sv/ihgju6n8z+YTMshlSUSOoM1rkKkol1C
        i/DbjRRMq8VumjpmVLYXheGwDuSPq9nq8TxA5gc=
X-Google-Smtp-Source: ABdhPJyex567wCzsmEkjroEDmUk8nR8+4zi+GGJU3ihof7nflp5/++YuxyTht6hMh3a2XekCUZYyOU6Ik1tIdMc/NaM=
X-Received: by 2002:aa7:d74b:: with SMTP id a11mr1421372eds.40.1625254426936;
 Fri, 02 Jul 2021 12:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210628005825.GA638648@rowland.harvard.edu> <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
 <20210628011628.GC638648@rowland.harvard.edu> <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
 <20210628142418.GC656159@rowland.harvard.edu> <CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com>
 <20210629150541.GB699290@rowland.harvard.edu> <CAFBinCCOGJfHSSHgRrOO-FQJZAUB=QuMr=BoddPLt19spp0QBg@mail.gmail.com>
 <20210629161807.GB703497@rowland.harvard.edu> <CAFBinCDsGtQaPLhMAb+A6DBihWzQiU409i2oer_ud5yQBvfM5w@mail.gmail.com>
 <20210630003556.GA718579@rowland.harvard.edu> <CANAwSgQadG+A2Tg2Ok5-Nw4i1a2tenABeyQnyTjzJKGHHw+6aA@mail.gmail.com>
 <CAFBinCC0nfrnQGmrXJ4FDTuy3RGX_FC8egjVaxhKaOSi9q+xzA@mail.gmail.com> <CANAwSgRPvTyMaQHWFeXcS-r5jdigSbcP0QvaTyJ1GFfUyPpqAg@mail.gmail.com>
In-Reply-To: <CANAwSgRPvTyMaQHWFeXcS-r5jdigSbcP0QvaTyJ1GFfUyPpqAg@mail.gmail.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Fri, 2 Jul 2021 21:33:36 +0200
Message-ID: <CAFBinCCFhK9Nx9ub5h3JctfXCnbrwL7XPV5dvPXWcvWqupnHkA@mail.gmail.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
To:     Anand Moon <linux.amoon@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Matt Corallo <oc2udbzfd@mattcorallo.com>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Anand,

On Fri, Jul 2, 2021 at 9:12 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> > > I am attaching my usbmon output on Odroid C2.
> > Can you please specifically state the testing steps you have used to
> > obtain that output?
>
> I followed the kernel documentation to get the output
> [0] https://www.kernel.org/doc/html/v5.10/usb/usbmon.html
Alan has previously provided the following command to get the usbmon output:
  cat /sys/kernel/debug/usb/usbmon/0u >mon1.txt

The output of that command depends on various factors:
- which USB devices were plugged in during boot
- which USB devices are plugged in when running "lsusb -vv"
- whether you are using the kernel cmdline option usbcore.autosuspend=-1

For the first two factors the "USB device" can be one of:
- no USB device plugged in at all
- one USB device which is not detected when running "lsusb -vv" (we're
calling this group of devices "first group", an example is my Corsair
Voyager USB 3.0 flash drive)
- one USB device which is being detected when running "lsusb -vv" and
also causing all other devices to be detected (we're calling this
group of devices "second group", an example is a cheap 1GB USB 2.0
flash drive that I have)

As you can see there's lots of combinations possible.
That's why it's important that you mention the exact steps to generate
the usbmon output.

If you're interested you can look at one of my earlier emails [0] (not
sure if you were Cc'ed then) where I was running the cat command as
suggested by Alan three times (each time plugging in different devices
at different times) and got three different outputs.


Best regards,
Martin


[0] https://lore.kernel.org/linux-amlogic/CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com/
