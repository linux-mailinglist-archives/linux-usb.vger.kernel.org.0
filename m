Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E306E3B7679
	for <lists+linux-usb@lfdr.de>; Tue, 29 Jun 2021 18:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232636AbhF2Qcs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Jun 2021 12:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbhF2Qcs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Jun 2021 12:32:48 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89829C061760
        for <linux-usb@vger.kernel.org>; Tue, 29 Jun 2021 09:30:20 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id n25so5577530edw.9
        for <linux-usb@vger.kernel.org>; Tue, 29 Jun 2021 09:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OHe0eFcmYQ5PzF6+xoOarEjDNa4SGeNkpxUxScaUgS4=;
        b=t3eoRPSOLgu5xXYDncaiPemns4rJGTQGB06bA4RRSGxs596Xlk54/O6KcPDd9+zl6x
         Umw6zd8Njas5JRZ2rsfunXn0kGMlDuppXB/VCYQFdlWcFy3Do1FbWo8MYaohLOpEY7/E
         tlyhNDsiFrOUGL1NhnRoSLB/425u1B/3Ek4ov4R/WUjgmYzRdJfvR0f2mt6AaEE9s88j
         qZIlNfcm+65jWyZTBIiNsQBOs0meLkE5yeLhIy/HvvaLCzaGeq5e1MEl3762PpZnbgcT
         zsQUEXckTTAZWN4R+jgryen63q5c5WpzKIkUcE2JA4MQZacSvNByPvI7YibYfxxazryG
         5oMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OHe0eFcmYQ5PzF6+xoOarEjDNa4SGeNkpxUxScaUgS4=;
        b=r/jBTsTvWbMH/DJ4iZG+46L6Kp6gEDxYRutgeKaq06Hz45DOgb4EbGPl5I7tkz9Vz3
         UlJmEtUFiAsG5PcffoOl/2jT8BT3/4Gm3L8cOb8QL+PoYrTGhAPRjM7Sn3Qy/fDUIeRk
         JqxK/0Pa7SSgCR08FjY/8eJ4mfMEmqB8r5n+Mui7Id5btas1+iPN+hGK9AOXTLVrAJZB
         GA/x6A2j9mxkwLiJNechB0B+dJe+C99mgWrOjrpyyttuVqCVCudOQRK8AlglSqK6ckaq
         o9SLrXnxN7NgowiuGX0FM33kHZRiIx8stl9TlkTi5Lp9b/3FEYmLbmlm/vKMQJy7oZOJ
         HK6g==
X-Gm-Message-State: AOAM531RSid5UbPfxgxfHlvGZvIClQxEGrpFf+D+ER2b6rOjHeXgoppV
        8mkU/pRb+PeE0R0kxu+pEgUTWZu+3gKfLiP5llDLIDHRp2A=
X-Google-Smtp-Source: ABdhPJyGFyDiZmBAnJdyWdrmQ6lVbMTFrADDLhgM5U20QbJcoJn59GmHrLHtrzF5WC9FPb9jR6Ie7F2QZd0lG1WEQrY=
X-Received: by 2002:a50:ec08:: with SMTP id g8mr16012397edr.98.1624984219164;
 Tue, 29 Jun 2021 09:30:19 -0700 (PDT)
MIME-Version: 1.0
References: <0badab7c-f12e-e9ed-2f90-2cf5f25f4038@bluematt.me>
 <20210628005825.GA638648@rowland.harvard.edu> <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
 <20210628011628.GC638648@rowland.harvard.edu> <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
 <20210628142418.GC656159@rowland.harvard.edu> <CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com>
 <20210629150541.GB699290@rowland.harvard.edu> <CAFBinCCOGJfHSSHgRrOO-FQJZAUB=QuMr=BoddPLt19spp0QBg@mail.gmail.com>
 <20210629161807.GB703497@rowland.harvard.edu>
In-Reply-To: <20210629161807.GB703497@rowland.harvard.edu>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Tue, 29 Jun 2021 18:30:08 +0200
Message-ID: <CAFBinCDsGtQaPLhMAb+A6DBihWzQiU409i2oer_ud5yQBvfM5w@mail.gmail.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
To:     Alan Stern <stern@rowland.harvard.edu>,
        Minas Harutyunyan <hminas@synopsys.com>
Cc:     Matt Corallo <oc2udbzfd@mattcorallo.com>,
        linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux.amoon@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

On Tue, Jun 29, 2021 at 6:18 PM Alan Stern <stern@rowland.harvard.edu> wrote:
[...]
> > >         usbcore.autosuspend=-1
> > wow, this helps indeed
> > my steps are:
> > - power off my Odroid-C1+
> > - unplug all USB devices
> > - boot with usbcore.autosuspend=-1 in the kernel cmdline
> > - plugin my Corsair Voyager USB 3.0 flash drive (which was only
> > detected before if an additional USB 2.0 flash drive was plugged in
> > during boot)
> > -> without any lsusb magic the device was immediately recognized
>
> That does show pretty convincingly that runtime suspend is causing the
> problem.  But I still have no idea why the problem affects some devices
> and not others.  It's a mystery.
Maybe because there's two related problems (I am guessing here):
The first issue is that USB hotplug is not working at all on my
Odroid-C1+ (which means: dwc2 + GL852G USB hub).
The second issue is that the workaround we had before (running lsusb
-vv to make "hot plugged" devices show up) is not working for some USB
devices.

It seems that using a different workaround (usbcore.autosuspend=-1)
makes *all* USB devices show up - even without any "lsusb -vv" call.
So I think we should focus on the first issue as it may also fix the
other problem as well.

[...]
> > after rebooting without usbcore.autosuspend=-1 (and no USB device
> > plugged in during boot):
> > # grep "" /sys/bus/usb/devices/*/power/autosuspend
> > /sys/bus/usb/devices/1-1/power/autosuspend:0
> > /sys/bus/usb/devices/usb1/power/autosuspend:0
> >
> > I think the next step is narrowing down which component is causing this issue.
>
> Maybe Minas can help.  He knows a lot more about dwc2 than I do (which
> is practically nothing).
I'll wait for Minas then

> > Interestingly my PC (running 5.12.13-arch1-2) also has two Genesys
> > Logic USB hubs with the same USB vendor and device IDs as my
> > Odroid-C1+: 05e3:0610.
> > These hubs are connected to my AMD Ryzen 5000 CPU or the B550 chipset:
> > usb1              1d6b:0002 09 1IF  [USB 2.00,   480 Mbps,   0mA]
> > (xhci-hcd 0000:02:00.0) hub
> >  1-3               05e3:0610 09 1IF  [USB 2.10,   480 Mbps, 100mA]
> > (GenesysLogic USB2.0 Hub) hub
> > [...]
> >  1-7               05e3:0610 09 1IF  [USB 2.00,   480 Mbps, 100mA]
> > (Genesys Logic, Inc. Hub) hub
> >
> > So far I have not observed any problems on my PC.
>
> Presumably because it uses xHCI rather than dwc2.
indeed. I think it's good to know that it's not an issue affecting all
Genesys Logic USB 2.0 hubs.
As you mentioned above it's most likely that dwc2 is the culprit here.
Or it might be some interoperability issue between dwc2 and GL852G


Best regards,
Martin
