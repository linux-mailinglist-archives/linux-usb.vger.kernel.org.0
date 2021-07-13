Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F189D3C7662
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jul 2021 20:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234179AbhGMSW0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jul 2021 14:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbhGMSW0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jul 2021 14:22:26 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE24C0613DD
        for <linux-usb@vger.kernel.org>; Tue, 13 Jul 2021 11:19:34 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id r132so36361241yba.5
        for <linux-usb@vger.kernel.org>; Tue, 13 Jul 2021 11:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Xq3T5huG37vLN9YIht5jNLm7GICSuV57t/QCI0c73P4=;
        b=JMdghS/FwjVndIIe3lHCDYXOWnJuA9A7mGKZpi+o3DPl1BFstlAredPL4NTii2it8Q
         xLTcU4C0wvDfKCusm7ZbdvdFkaeuNGFM7W7LBsRoajkHShfbtU485xHOm+Au7h2Ga8yl
         Jd2dWUVgVwTnjWBGADwYD2BwOafyOCnwrZnTx6WOJ5DPDkTrqgvYeA493DGmOYe8pAy6
         Y5O0Pu+uUyLKSB1LvBbEjSbhX09K/B92F4pPJxJB4EF2k12G8Z8kYqazVsEV/E086XJ1
         B08q8jqjKeZJ1Fa07dBtieQu+c1V5fJx3bvmbQEDHpkege5wEvkQI6uM4l4PcGAMgg4t
         8swA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Xq3T5huG37vLN9YIht5jNLm7GICSuV57t/QCI0c73P4=;
        b=hX+5cgD7SFt0h9+ia7ZVtI8gFh2+/Z0AMVheEdNN9Qn27pT0RUPjSOCLTXz7lH6EV1
         JhcqLjhrNQ6w7XYgrO0/dVUKQQC7FTPtCSX3pHPef62LGgZEZ97i4rEAs714MaR+oVFV
         Qc3myDGMCrOBEyiUnTZeSp+lEI31CuRI6tVuFD+lHD0Y0r7F0hHR74pncu0j7denyR4X
         qzuC7oHwDVvkn/vMixm3vSy+Y7WPpCzKxMeoQyyt5wPw8+VNFC9/y1+Tb4764NnJkzYP
         VLgvuGDJygey5PBsYicAhhmjlUw5K8q0Vij74HR3B/2hn8wlPIC7rbwQooqCOJvGn7un
         /UBA==
X-Gm-Message-State: AOAM531xqo5eXRzGDGKYc/YF07K68HWyKuMg+EC6W5RtA4Ejd9H2IZXa
        jg5BoZeCdvU04kQtavI+KVk5nClzyyiOX/aL6X8nx8usniCdyA==
X-Google-Smtp-Source: ABdhPJx7xJRBQr5wiZZkEX4oHOsFG2MlLiwKn4F7SUk9kdsFkm2B7i40A9E8rr5NuIsjg4aNdAkYQGA/nLF7Ni2WcTU=
X-Received: by 2002:a25:4009:: with SMTP id n9mr7822079yba.128.1626200374105;
 Tue, 13 Jul 2021 11:19:34 -0700 (PDT)
MIME-Version: 1.0
From:   Hylke Hellinga <hylke.hellinga@gmail.com>
Date:   Tue, 13 Jul 2021 20:19:23 +0200
Message-ID: <CABUoX8tR+DpknjXCwtVkBh6O-rUisZ2V5RepzxRO-k5XBX7J=g@mail.gmail.com>
Subject: ASMedia Technology Inc. ASM1143 USB 3.1 Host Controller causing
 random full speed USB resets
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hey there,

For my desktop setup I have a usb kvm switch ordered from amazon.
Found here:
https://www.amazon.com/Switcher-Selector-Computers-Keyboard-Compatbile/dp/B082K87B87/ref=sr_1_6?dchild=1&keywords=usb+switch&qid=1626199073&sr=8-6

I've got 3 usb devices attached to this switch. A full speed ROG
Claymore keyboard, a full speed Roccat Tyon mouse, and a full speed
Arctis 5 headset.
Whenever I have this switch connected and I'm on my gentoo linux
system with kernel:

Linux 5.12.9-gentoo-x86_64 #1 SMP Mon Jul 5 03:11:12 CEST 2021 x86_64
AMD Ryzen 9 3950X 16-Core Processor AuthenticAMD GNU/Linux

It is randomly disconnecting and connecting my devices.
So I figured this would be a power issue, where the usb port of my
desktop is drawing not enough power for the supported devices.

The switch comes with a 5v micro usb power interface. I have this
micro usb connected to a 5v power adapter at all times in a separate
power socket.

This problem does not occur on proprietary operating systems such as
Windows 10 and Mac OS X on the same hardware.
Which has led me to believe that perhaps this has to do with the USB
chipset drivers for my motherboard in the linux kernel.

Underneath is my dmesg log that will display the following entries at the end:
[ 5620.383044] usb 1-7.2: reset full-speed USB device number 7 using xhci_hcd
[ 5649.905700] usb 1-7.3: reset full-speed USB device number 9 using xhci_hcd

https://gist.github.com/Simbaclaws/3cde9ea6732b1db151e69a71c1978965

Here is my lspci output:

https://gist.github.com/Simbaclaws/b88b7d0e2fd7609af1cf579527b6326f

I think the one that is causing issues is:
04:00.0 USB controller: ASMedia Technology Inc. ASM1143 USB 3.1 Host Controller

The motherboard that I am using is a Crosshair VI Hero, I doubt that
the motherboard hardware is the issue here, since these issues don't
seem to apply to other operating systems.

Are there any further steps I can take to diagnose this issue any further?
Perhaps I can debug the kernel that I'm using somehow?

I'm not that familiar with C code, the best I can do is write some
small patches for DWM. Just so you get a feeling of what my current
expertise is at in this regard.

Please help me fix this annoying bug, since it is literally
disconnecting my keyboard every random amount of seconds causing me to
have a hard time on linux.


Let me know if this is the right place to ask these kind of things.
I've never reported a kernel issue before.


Yours sincerely,
Hylke Hellinga,
Simbaclaws
