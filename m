Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC0EB227857
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jul 2020 07:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbgGUFuJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jul 2020 01:50:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgGUFuI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jul 2020 01:50:08 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639F3C061794
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2020 22:50:08 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id i19so5758654lfj.8
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2020 22:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=dt80hbEOtASF8k7tNC7l6WffPpiCUoKmZ9tNVyqMSXA=;
        b=bOK7kcAWGZTbReRstO98MjoMLM20jr1puDwabwv/D3lydkSXe+ns4b3Q3GRzgg1gM6
         blOkZ3vMYBRhayjrN5jDwtMrOI8A9ESd1gQnDKTZTcCZtDxWV5MT/Plcp5J4vhtk0E7y
         8nfmlAULuzEeHrpwVbTD8ekx1tiAXf4TJ/CE4FJdwYXasiJ+GUifx7rBhFM67ohW7GiA
         wPMQZ/PzRf4eUDJU/NkdjeaiEJTwoQLaMcguSI9no/rP7DDwbAb3KYzRhUxW0nLhhDjU
         QQkt3TrzljAjQRWmsL6kPu1dNM2gwlcG4myYj7W/pkiqgLr3nxxO9zEy4QoeKkgO2NQM
         nglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=dt80hbEOtASF8k7tNC7l6WffPpiCUoKmZ9tNVyqMSXA=;
        b=kFUZIy0m4xrqlxa/p9E0lbh8hqrox8DX2tnTYWQji07SYAaHnOGG+Tfz4FTOxGSuba
         AOskKMewfEkxfOJR1CSL6vAfKBs7zmHoGAduTv02WiDj9so+FnSKy6yNszjkv2HRAO/E
         MmWDBdTD7DDd4mJLADsqsoOQj37/U65dKjFYzvxXyBNeo9nBVT9Fk2umFerrXsKG0tdT
         uDUC3h/L2JphaRwPqXRcu3f3eAXydZ8AK+izZjJQvDaAMka7MjnL/dVZDK6OH0A1Tn/D
         19M8Ti+h/wBOE4HQ2voR5USTo+Flaa8BjGlpwHQpeT7ZbhPZdpojA8tL5A//8zQLql0V
         LsVg==
X-Gm-Message-State: AOAM531PPfjPh+niNmCnbUd16ZxDhDzv+vsBdekIQkaOpeaiP4ND1IHr
        IfXnOzVIpcYBHdeE0QFN1K1Bhc4Lp0G+Oiqb2HrPtU6m
X-Google-Smtp-Source: ABdhPJw0BsG4TjWzV4eP2VNRtAnmub/GrcV0vvv9EBrlAUjH4gypW0yhy5+fGOVGwOoPHjZNtLImfZQaX4XMWxyrP88=
X-Received: by 2002:a19:c7d0:: with SMTP id x199mr7356452lff.205.1595310606453;
 Mon, 20 Jul 2020 22:50:06 -0700 (PDT)
MIME-Version: 1.0
From:   Forest Crossman <cyrozap@gmail.com>
Date:   Tue, 21 Jul 2020 00:49:55 -0500
Message-ID: <CAO3ALPyB1JDvvC27JGgAoTuHh0w+897tPhmTKX9PQWBFCrrnbQ@mail.gmail.com>
Subject: ASMedia ASM2142 USB host controller tries to DMA to address zero when
 doing bulk reads from multiple devices
To:     linux-usb@vger.kernel.org
Cc:     linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello, again!

After fixing the issue in my previous thread using this patch[1], I
decided to do some stress-testing of the controller to make sure it
could handle my intended workloads and that there were no further DMA
address issues that would need to be fixed. Unfortunately, it looks
like there's still more work to be done: when I try to do long bulk
reads from multiple devices simultaneously, eventually the host
controller sends a DMA write to address zero, which then triggers EEH
in my POWER9 system, causing the controller card to get hotplug-reset,
which of course kills the disk-reading processes. For more details on
the EEH errors, you can see my kernel's EEH message log[2]. The
results of the various tests I performed are listed below.

Test results (all failures are due to DMA writes to address zero, all
hubs are USB 3.0/3.1 Gen1 only, and all disks are accessed via the
usb-storage driver):
- Reading simultaneously from two or more disks behind a hub connected
to one port on the host controller:
  - FAIL after 20-50 GB of data transferred for each device.
- Reading simultaneously from two disks, each connected directly to
one port on the host controller:
  - FAIL after about 800 GB of data transferred for each device.
- Reading from one disk behind a hub connected to one port on the host
controller:
  - OK for at least 2.7 TB of data transferred (I didn't test the
whole 8 TB disk).
- Writing simultaneously to two FL2000 dongles (using osmo-fl2k's
"fl2k_test"), each connected directly to one port on the host
controller:
  - OK, was able to write several dozen terabytes to each device over
the course of a little over 21 hours.

Seeing how simultaneous writes to multiple devices and reads from
single devices both seem to work fine, I assume that means this is
being caused by some race condition in the host controller firmware
when it responds to multiple read requests. I also assume we're not
going to be able to convince ASMedia to both fix the bug in their
firmware and release the details on how to flash it from Linux, so I
guess we'll just have to figure out how to make the driver talk to the
controller in a way that avoids triggering the bad DMA write. As
before, I decided to try a little kernel hacking of my own before
sending this email, and tried separately enabling the
XHCI_BROKEN_STREAMS and XHCI_ASMEDIA_MODIFY_FLOWCONTROL quirks in an
attempt to fix this. As you might expect since you're reading this
message, neither of those quirks fixed the issue, nor did they even
make the transfers last any longer before failing.

So now I've reached the limits of my understanding, and I need some
help devising a fix. If anyone has any comments to that effect, or any
questions about my hardware configuration, testing methodology, etc.,
please don't hesitate to air them. Also, if anyone needs me to perform
additional tests, or collect more log information, I'd be happy to do
that as well.


Thanks in advance for your help,

Forest


[1]: https://patchwork.kernel.org/patch/11669989/
[2]: https://paste.debian.net/hidden/2a442aa6
