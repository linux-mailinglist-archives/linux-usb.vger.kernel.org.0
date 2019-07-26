Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F55D76B6F
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2019 16:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbfGZOWJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Jul 2019 10:22:09 -0400
Received: from mail-qk1-f179.google.com ([209.85.222.179]:35798 "EHLO
        mail-qk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbfGZOWI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Jul 2019 10:22:08 -0400
Received: by mail-qk1-f179.google.com with SMTP id r21so39189081qke.2
        for <linux-usb@vger.kernel.org>; Fri, 26 Jul 2019 07:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qu+GUHYMiXIaNn9bHhKBGonN0veqvfBYcXQGguF4XVg=;
        b=oiXtbinDG7g8GKuGU1MjqT2aanVSHLgPevsLAlK0jhoUYwI6iToEvIAnKWWMqIoN3S
         YbXelHQMgEnWhu5MXI7gJFNt9K1nn5U7IDCHC0KE9x5miqlGQ5aRvgpSGwxv0CZpcy/g
         hXu93hPuE7WMpOusdgOTnfKHcHzUbMPiCBY01qrP42Kr21odD5Ev/pNvjpJgsMmjO5WE
         4fz2Ur/ek501yKm7Wyd3RU6hj6Mef73kog00hxHnBV9Sc4OJsxh+sn9CLwnDI9j7tERG
         p3hCrHzpPphR9yrjMdJgeCK0irz4Oj4YNy4aEMLijhc/qtQEiSL944SBYHLe/IWGwDdQ
         wYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qu+GUHYMiXIaNn9bHhKBGonN0veqvfBYcXQGguF4XVg=;
        b=hWR5Ybv4ZpOvmXPLsjejyGiDxZl2uh5mqxidp1ZNDe+XNbn257BF9afLbhj/6VhmwI
         xRJkhf8eczY/7NZ3NhGTYeqORXph+lYaejnO0b0766pibc/F90FgLDyod9EJIDeokL6+
         MgTWw08q/wTtiJTcL+qgSmPcmwp3CtekzO/XXlvDF3J+TqHkh9fRnL5IQKYfFq7OS5X2
         UYFX2zzGM5B/KMSehhw91Dp1SOXy0zmbxO+8HFa1D4j7j7ZbrKt71PI9sO5DdLFrI1y/
         3oqUpxBuqgKRPl1uECoumR1puEFuFv+Vb9QGWAIBaOT06tGapBrcLBPJ/j1nq9Rs++dp
         V97Q==
X-Gm-Message-State: APjAAAV/JjrdGxrbnu+7Rc5AGfbeyMvH/AoqbYhUQWnD7m5HKBGb1ukL
        dQzOcKBXJuLIE9Fl7c75WzUFYj4dcgKvUBqCL5h/N94z0N8=
X-Google-Smtp-Source: APXvYqwrkcZVWSexptrF4QwiZB4bI0wDXLaQ+xN9oJvpZNYLK9i5nJW1YybOy+uqjbVK0g6tYyuFWGXwElC0HiXav2Q=
X-Received: by 2002:a05:620a:12f7:: with SMTP id f23mr60858323qkl.499.1564150927505;
 Fri, 26 Jul 2019 07:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAGRyCJGg8Z6PO1tuWJr9NgXgVEVgxC5jsbN_qSdEDT-t+pHehA@mail.gmail.com>
 <325d7934-092c-2e01-1e34-cd4ad06b7088@linux.intel.com>
In-Reply-To: <325d7934-092c-2e01-1e34-cd4ad06b7088@linux.intel.com>
From:   Daniele Palmas <dnlplm@gmail.com>
Date:   Fri, 26 Jul 2019 16:21:55 +0200
Message-ID: <CAGRyCJH12SgezRMgyTcLD1sKD2ctZJX37jhy07w7ZwtUMm-3kA@mail.gmail.com>
Subject: Re: xhci-hcd errors with Qualcomm based modem and Asmedia ASM1042A
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias,

Il giorno ven 26 lug 2019 alle ore 10:50 Mathias Nyman
<mathias.nyman@linux.intel.com> ha scritto:
>
> On 24.7.2019 22.09, Daniele Palmas wrote:
> > Hello all,
> >
> > I've a system with kernel 4.14.127 that is showing unexpected xhci-hcd
> > (ASM1042A) errors with a Qualcomm based modem, when running the
> > following test:
> >
> > - signal strength qmi requests looping every few seconds on
> > /dev/cdc-wdm (driver qmi_wwan)
> > - iperf tcp data connection test on the modem network interface
> >
> > The issue is showing also with kernel 5.0
> >
> > The issues is showing in three different ways:
> >
> > First one:
> >
> > 2019-07-24 15:17:45.495293 kern.err kernel:xhci_hcd 0000:03:00.0:
> > ERROR Transfer event TRB DMA ptr not part of current TD ep_index 28
> > comp_code 13
>
>
> > 2019-07-24 15:17:45.495392 kern.warning kernel:xhci_hcd 0000:03:00.0:
> > Looking for event-dma 000000007725b420 trb-start 000000007725b400
> > trb-end 000000007725b400 seg-start 000000007725b000 seg-end
> > 000000007725bff0
>
> The xhci driver expects events for transfers in the same order they were
> queued. For some reason we get an event for the transfer block queued at
> address b420 before we get events for transfers at b400 and b410.
>
> xhci traces of a 5.0 kernel would show in more detail what's going on.
> can be taken with:
>
> mount -t debugfs none /sys/kernel/debug
> echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
> echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
> echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
> echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
> < reproduce the issue >
> Send output of dmesg
> Send content of /sys/kernel/debug/tracing/trace
>
> Note that the trace file can be huge
>

thanks for the explanation.

For 4.14.127 I already gathered traces related to that dmesg (you can
find them at https://drive.google.com/open?id=1c-vjusa44UgMzrIjAvpz6HKbxEk1Trw1),
but I'll try to get the same info for 5.

Thanks,
Daniele

> -Mathias
