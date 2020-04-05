Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6578719E89F
	for <lists+linux-usb@lfdr.de>; Sun,  5 Apr 2020 04:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgDECvo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Apr 2020 22:51:44 -0400
Received: from mail-il1-f178.google.com ([209.85.166.178]:40842 "EHLO
        mail-il1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726444AbgDECvn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Apr 2020 22:51:43 -0400
Received: by mail-il1-f178.google.com with SMTP id j9so11419690ilr.7
        for <linux-usb@vger.kernel.org>; Sat, 04 Apr 2020 19:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cDYSzr35MPD0+BllF+O9w43kH3zVS1+w1EZZRAPz+Q4=;
        b=t2puYk2hefd/fDpiQWVSSkYFhYYQHyqgnWuvZjZU0hphZhiEARrUaQCpiDbodzou+u
         8bGVlAkzMKPJtemucTqc8qH/Um82WpH/DIlIc8l37KAv7BnFLPAW5/izh7ZyyqqP2CZz
         FAXG4zkQNoOCw0MJl9dugvXMWfVirlY8iAahDxrIRON505UveB6Y7Zene2IuZLX3M3Kr
         B9D4GwXD7M7qH3razsvbFzzu6tZrzLoBnjwDaiIozs0/xvvg0DV5vvmfoywLaDTU4s8p
         0SAZ3HIYqjVBXqfMcvWDDL/aoWLwnkkDwO2eTD/e46N9IjYSVUrb8sm2tARt0kKPv5l/
         7+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cDYSzr35MPD0+BllF+O9w43kH3zVS1+w1EZZRAPz+Q4=;
        b=sgRG+hX3vPsoGVo0tccaaCSy04ZIoPabW5Ugwcha+/9xSKIL7F+KLy2DTMITsa0bVL
         tVYs4pW20AO9Mz+gbQSkCdeogSaIc4m305HbYDXWmeBS+RQGgx3b3s2AfmVGW+7RBAnq
         GB9Cu3RjtgYPkPNzqyom2MCmaScXPcAkZhG1t80jYyyRXYool6mDlsHPwlbpORyANwA9
         A2sGTjmgMlKKM66XK2CbnuqA1llxG7czjwzFWT/znXnfLoxMayNzJ8EdYfXaWrRZzods
         J31dttkz7ppuMngfdGsaGOC2VX9KlJGIzoPebyNyJ15WKHrH21r6Z4DwHInUXUJJH5PU
         R+yw==
X-Gm-Message-State: AGi0PubOtg9dVDx86NB+RXXbTxz8IvEe+h3xyPCyAXxfgU0MkuVj2B7s
        1xjJo488q3SXwqJQ/CyzA62RduBrtDjSg7p1Nak1o0lLG/w=
X-Google-Smtp-Source: APiQypIi4F9URUiQMdLqdTS4zv2bnMOxtn0N4vAMYhkJPbDCJ7pQpIuWUJDDV2G4q4TVY7kt0ZlN1wVyUAIVX96/454=
X-Received: by 2002:a92:3b11:: with SMTP id i17mr16060722ila.161.1586055101108;
 Sat, 04 Apr 2020 19:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAB=otbS1RTnn9PixJYjsW4U_37GcFvR-O3WZ-7YnamdcDGKvRA@mail.gmail.com>
 <Pine.LNX.4.44L0.2004042124390.25831-100000@netrider.rowland.org>
 <CAPXXXSBLHYdHNSS4aM2Ax07+GQSB1WbPziOrk0iVWf-LXLmQRg@mail.gmail.com> <CAPXXXSAajets4AqcBKt8aRd8V1AL4bjAmCyuBOKr8qBG-AHO1A@mail.gmail.com>
In-Reply-To: <CAPXXXSAajets4AqcBKt8aRd8V1AL4bjAmCyuBOKr8qBG-AHO1A@mail.gmail.com>
From:   Colin Williams <colin.williams.seattle@gmail.com>
Date:   Sat, 4 Apr 2020 19:51:30 -0700
Message-ID: <CAPXXXSA18e7Qw66boVjQpmOibMRyC98oD2xfNHFyscf0jPWFEg@mail.gmail.com>
Subject: Re:
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Linux USB <linux-usb@vger.kernel.org>,
        alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello all


This is embarrassing but I think my issues were due to a bad USB cable.


Thank You


On Sat, Apr 4, 2020 at 7:50 PM Colin Williams
<colin.williams.seattle@gmail.com> wrote:
>
> Hello all
>
>
> This is embarrassing but I think my issues were due to a bad USB cable.
>
>
> Thank You
>
>>
>> On Sat, Apr 4, 2020 at 6:27 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>>>
>>> On Sun, 5 Apr 2020, Ruslan Bilovol wrote:
>>>
>>> > Hi,
>>> >
>>> > Please also add to CC related mailing lists (alsa-devel, linux-usb) rather
>>> > then directly emailing - community may also help with the issue. Also it can be
>>> > googled so if somebody else have same issue it can find answers faster.
>>> >
>>> > On Fri, Apr 3, 2020 at 10:56 AM Colin Williams
>>> > <colin.williams.seattle@gmail.com> wrote:
>>> > >
>>> > > https://ubuntuforums.org/showthread.php?t=2439897
>>> > >
>>> > > On Thu, Apr 2, 2020 at 4:50 PM Colin Williams <colin.williams.seattle@gmail.com> wrote:
>>> > >>
>>> > >> Hello,
>>> > >>
>>> > >> Is it possible that one of these commits or related broke support for the Blue Mic Yeti?
>>> > >>
>>> > >> https://github.com/torvalds/linux/blame/ac438771ccb4479528594c7e19f2c39cf1814a86/sound/usb/stream.c#L816
>>> >
>>> > Tha'ts workaround to ignore last altsetting which is the same as previous.
>>> > During UAC3 implementation, I reimplemented that workaround carefully,
>>> > but I didn't have (and still do not own) any Blue Mic USB device.
>>> > I don't know whether it was tested after that by anyone.
>>> >
>>> > >>
>>> > >> I am getting the following when I plug my mic in:
>>> >
>>> > Which kernel version is that? Have you tried latest Linux Kernel?
>>> >
>>> > >>
>>> > >> [ 1283.848740] usb 1-1.2: new full-speed USB device number 82 using ehci-pci
>>> > >> [ 1283.964802] usb 1-1.2: New USB device found, idVendor=b58e, idProduct=9e84, bcdDevice= 1.00
>>> > >> [ 1283.964808] usb 1-1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
>>> > >> [ 1283.964810] usb 1-1.2: Product: Yeti Stereo Microphone
>>> > >> [ 1283.964812] usb 1-1.2: Manufacturer: Blue Microphones
>>> > >> [ 1284.080671] usb 1-1.3: new low-speed USB device number 83 using ehci-pci
>>> > >> [ 1284.784678] usb 1-1.3: device descriptor read/64, error -32
>>> > >> [ 1285.180674] usb 1-1.3: device descriptor read/64, error -32
>>> > >> [ 1285.992682] usb 1-1.3: new low-speed USB device number 84 using ehci-pci
>>> > >> [ 1286.696672] usb 1-1.3: device descriptor read/64, error -32
>>> > >> [ 1287.092695] usb 1-1.3: device descriptor read/64, error -32
>>> > >> [ 1287.200804] usb 1-1-port3: attempt power cycle
>>> > >> [ 1287.804662] usb 1-1.3: new low-speed USB device number 85 using ehci-pci
>>> > >> [ 1288.220686] usb 1-1.3: device not accepting address 85, error -32
>>> > >> [ 1288.508685] usb 1-1.3: new low-speed USB device number 86 using ehci-pci
>>> > >> [ 1288.924690] usb 1-1.3: device not accepting address 86, error -32
>>> > >> [ 1288.924916] usb 1-1-port3: unable to enumerate USB device
>>> > >> [ 1288.925391] usb 1-1.2: USB disconnect, device number 82
>>> > >> [ 1289.308736] usb 1-1.3: new low-speed USB device number 87 using ehci-pci
>>> > >> [ 1289.596727] usb 1-1.3: device descriptor read/64, error -32
>>> > >> [ 1289.992635] usb 1-1.3: device descriptor read/64, error -32
>>> > >> [ 1290.596683] usb 1-1.3: new low-speed USB device number 88 using ehci-pci
>>> > >> [ 1290.888718] usb 1-1.3: device descriptor read/64, error -32
>>> > >> [ 1291.284673] usb 1-1.3: device descriptor read/64, error -32
>>> > >> [ 1291.392928] usb 1-1-port3: attempt power cycle
>>> >
>>> > Looking at this log, it seems the issue happens during enumeration,
>>> > so mentioned workaround isn't executed yet at this moment.
>>> > So it seems this is related to USB core, not to ALSA driver.
>>>
>>> All those errors were for the 1-1.3 device.  The microphone was 1-1.2.
>>> It's not clear from the log above what the relationship between those
>>> two devices is, but it sure looks like the microphone was enumerated
>>> okay.
>>>
>>> What shows up in /sys/kernel/debug/usb/devices?
>>>
>>> Alan Stern
>>>
