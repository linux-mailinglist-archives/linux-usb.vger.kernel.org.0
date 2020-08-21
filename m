Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80FC624D505
	for <lists+linux-usb@lfdr.de>; Fri, 21 Aug 2020 14:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728586AbgHUMaw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Aug 2020 08:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbgHUMaf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Aug 2020 08:30:35 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8B6CC061385
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2020 05:30:34 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id y2so1670387ljc.1
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2020 05:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=FWpkJTLzjKB4Cz/WBUnrWVVtEr+9lceUnVEcdgS9cv4=;
        b=DPC+vYd3UOzD2pau1wTiI/nFKLgHXGRoxf4pHHjRgz/K0hbKxzzV4KekNDl9jO1vQS
         b1OJBFUdVsZjaCkWj1K/nJSmPy9SYvxCvZ1x3f9ZYTIDFbERNCmCivghaNoSr5yHAf+l
         Spig22J8KM6amJR7pq2EA8epN/52xqbhiwLJMMXMEdWRfWtzUqZkQOzeF4aVDbigRY9H
         Wi81NBmVzx0AF4OrCcSPy3abGJF4Qu4Jf9Ubik3v3yJnugyZ4mCRfSqjBqxHSzKhhnOq
         YFYEuKv0whXFJKkiwoX3AEAnFQmhmbbG3lqLmTx937wGasN/ZgNPuxYUyn1X9Q6H/5jG
         MZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=FWpkJTLzjKB4Cz/WBUnrWVVtEr+9lceUnVEcdgS9cv4=;
        b=OcQdwS686JnCYJGOlTcITiOAIhs4+BaGHln2M6TvgZ6VwvhBv8hipSmkDcgQT6pG3J
         QXMJ9FHjs4jaTh66urzScHnPNr+I4eHCu94FijdEkDyQoHt33QouaGJ4vXTfNZVanm6l
         hp9ZUSOKmt+44dakk62BMZiFKnXbLWlj5DGf34DAuXnKnd4V5bsM/ja207Gn4IAWKiDw
         bxnWbC2nVYWHIdXIzNc7ugV7sV6UBsqmiUc5FG4zM2CxxEnI/R5sfRtvD+50gTew/SDA
         C1WiyJT04DJwCOSt+sXrI3jbAxBhK85zl6S6YwQ97qxYwM+7x9ulx1sxKnXamMbS6DHh
         Vg7w==
X-Gm-Message-State: AOAM531U2K1urbwBoMWfCqYVER9Hqgk89UBL3w5BS+rLB3h0c/1/O8r/
        4btyytsIWaDz6BJDvhBRDC09W8+Fqc8o60rtQ2icfAwwQr1z7g==
X-Google-Smtp-Source: ABdhPJw5GMHRhYkK1xZBcBgG92AaqCxRnJZz91OofTGxiaCqJ0/47PaBwJepVmvEnaMJ1VJLSJX/4JV7tFOpSa1JNnI=
X-Received: by 2002:a05:651c:217:: with SMTP id y23mr1392102ljn.123.1598013027733;
 Fri, 21 Aug 2020 05:30:27 -0700 (PDT)
MIME-Version: 1.0
From:   Martin Thierer <mthierer@gmail.com>
Date:   Fri, 21 Aug 2020 14:30:12 +0200
Message-ID: <CAL3BvCzb6dGZOm6jy2PddSfioM7hThMEBm+aQ_gmMAWAXFYOuQ@mail.gmail.com>
Subject: Data toggles not reset on "set configuration" for ports handled by
 "xhci_hcd" driver
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I'm debugging a problem with the "xum1541" usb adapter (used to
interface with legacy cbm floppy drives), which doesn't work correctly
when plugged into some usb ports but works fine in others.

The symptom of failure is that the host command only works the first
time after the device has been plugged in.

This is what I found so far:

The device mostly uses bulk transfers for communication. After every
start, the host program issues a "set configuration" command (even
though the device only has a single configuration). On receiving the
"set configuration" message, the firmware of the xum1541 device does
an endpoint reset including a reset of the data toggles.

The problem is, that my host computer only seems to reset its data
toggles when the device is plugged into a usb port that as per syslog
uses the "ehci-pci" driver, while it does not in ports using the
"xhci_hcd" driver.

That's why the data toggles get out of sync when the device is plugged
into a port handled by the "xhci_hcd" driver and therefore stops
working.

For now I try to work around this issue by avoiding the "set
configuration" call altogether, but I'm still curious what the correct
behaviour is.

The notion of a "set configuration" call that doesn't really change
the configuration triggering a "lightweight reset" seems to be common,
but I'm not sure if there's consensus what the reset should include.

So I'm not sure which behaviour (to reset the data toggles or not) is
correct, but I think at least the linux kernel should behave
consistently regardless of the usb driver / port used?

Is resetting the data toggles even handled by the driver (or by the
hardware)? There are reports of what seems to be the same problem
(device not working after the first command but only when using an usb
3 port) on windows as well. I personally can't reproduce that, but
that's no big surprise because the current libusb on windows doesn't
actually send the "set configuration" message to the device. It might
do using a different libusb version and/or windows usb driver, though.

This is what lspci reports about the usb controllers on my machine:

> lspci | grep -i usb
00:14.0 USB controller: Intel Corporation 7 Series/C210 Series Chipset
Family USB xHCI Host Controller (rev 04)
00:1a.0 USB controller: Intel Corporation 7 Series/C216 Chipset Family
USB Enhanced Host Controller #2 (rev 04)
00:1d.0 USB controller: Intel Corporation 7 Series/C216 Chipset Family
USB Enhanced Host Controller #1 (rev 04)

> lsusb | grep -i hub
Bus 003 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

The device does not work correctly when connected to bus 2, but it
does when on bus 3.

The host is running arch linux with currently linux 5.8.1, but the
problem existed at least in the last few kernel versions. The host
program is using libusb 1.0.23.

Let me know if there's anything I can do to help debug this.

Thanks!

Martin
