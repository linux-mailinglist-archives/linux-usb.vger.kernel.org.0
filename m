Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA4260C5C0
	for <lists+linux-usb@lfdr.de>; Tue, 25 Oct 2022 09:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232055AbiJYHqv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Oct 2022 03:46:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232021AbiJYHqp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Oct 2022 03:46:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B851BC9D
        for <linux-usb@vger.kernel.org>; Tue, 25 Oct 2022 00:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666684001;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=o8DX+bDypOZe/6PD1GV8jba1dm1lR5pWc1QrfOh/LAI=;
        b=Rf1vZ+Nt0UgA6MNUuST3nQdtklxIe+CzEMhDX8TYaJZNPSWog52f6nO29CcXzJCDIAyszd
        z1+6tn90jKBdloJLEzNHNOo6IsNGCp3yrdih7SI7aNucy6M7Cj/tKBSGqlR4ocwBTD5sqT
        aJdysf6GZX3Kz+Kp18Ytz/v94WmpCA8=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-6-GFFp4kghPEy6HPeNMcgBuA-1; Tue, 25 Oct 2022 03:46:35 -0400
X-MC-Unique: GFFp4kghPEy6HPeNMcgBuA-1
Received: by mail-lj1-f197.google.com with SMTP id y13-20020a05651c220d00b002770461394eso2959167ljq.22
        for <linux-usb@vger.kernel.org>; Tue, 25 Oct 2022 00:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o8DX+bDypOZe/6PD1GV8jba1dm1lR5pWc1QrfOh/LAI=;
        b=rMHSGH0D7x0BXCQzZpdtdGFuY3Wp02isStnYePMMI8hwRR7AjUdFxbjzMY8YBySO6e
         BknFfm/gdji7FIMcRV3er+SK9nHGoFAOwell33+n77pUvEDYz21gJE1kYSBdathFDteJ
         GzSVdwhYYHdYcSrls3M3Gv1V9io5u3CwRvA6Q5PYooJ6004st2i4qKt4lKNAXF9DLoBl
         1z0JNGp1pRd8xDPghBIVZQKhOtCshij9kRw0K+q1eQHR2ynrR2GWyoKFpYpcMZcnuX7O
         A5kJYLD13dG9eyk+GA2uLhbil955toS79ElO5aWTbe6Mq6wTAwne1kKelBMr7HZBn4vr
         buYw==
X-Gm-Message-State: ACrzQf0EkntCgiEC3HQBYoT+85PBOB0xDvVG50AYyNSRCKT7Imrbe3SH
        2iP6jASONRstSXRNAy79H9/JkfgZm75z5NRvxrLkJDz02d6VplG9bGNvT8L1PRBE5Bj7cDMfazd
        Zmjcme6ccfFjv8IhlAsJx7xPcHSdU/wSzOjfY
X-Received: by 2002:a05:6512:3606:b0:4a2:71df:7938 with SMTP id f6-20020a056512360600b004a271df7938mr14037335lfs.279.1666683993760;
        Tue, 25 Oct 2022 00:46:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Og/NiHMUvnQkaY4GNgwlTseDziPVSkZKgPKQ/dnl0SSpgTzBTkBLm0sDarb+h2edHlO9oDi0J6zBw2lLZ1Pc=
X-Received: by 2002:a05:6512:3606:b0:4a2:71df:7938 with SMTP id
 f6-20020a056512360600b004a271df7938mr14037325lfs.279.1666683993574; Tue, 25
 Oct 2022 00:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <Y1AVDck5sQf8+QFX@rowland.harvard.edu> <CABfF9mPU52OXTGcsbatJCG4nbP4zaPN3iJnttMg+xRyGY6dUEQ@mail.gmail.com>
In-Reply-To: <CABfF9mPU52OXTGcsbatJCG4nbP4zaPN3iJnttMg+xRyGY6dUEQ@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 25 Oct 2022 09:46:21 +0200
Message-ID: <CAO-hwJJ7cF-4kd8Mi6bb5n-k5LuMrWbpdMqFs82y7iQOscr-7g@mail.gmail.com>
Subject: Re: Litra Glow on Linux
To:     Andreas Bergmeier <abergmeier@gmx.net>
Cc:     linux-input@vger.kernel.org,
        USB mailing list <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Andreas,

On Sat, Oct 22, 2022 at 2:48 PM Andreas Bergmeier <abergmeier@gmx.net> wrote:
>
> > Date: Mon, 17 Oct 2022 18:45:30 +0200
> > From: Andreas Bergmeier <abergmeier@gmx.net>
> > To: linux-usb@vger.kernel.org
> > Subject: Litra Glow on Linux
> >
> > On my Ubuntu machine i am running 5.15.0. Now when I plugin in my
> > Logitech Litra Glow, it gets detected and the following shows up in my
> > dmesg:
> >
> > ```
> > input: Logi Litra Glow Consumer Control as
> > /devices/pci0000:00/0000:00:14.0/usb3/3-4/3-4.2/3-4.2:1.0/0003:046D:C900.000B/input/input75
> > hid-generic 0003:046D:C900.000B: input,hiddev0,hidraw2: USB HID v1.11
> > Device [Logi Litra Glow] on usb-0000:00:14.0-4.2/input0
> > ```
> >
> > Via (hardware) buttons you can switch the device on, regulate the
> > color temperature as well as the brightness.
> So I looked into the sources of `hid-input` and `hig-lg` and I hope
> that I have a halfway decent
> understanding why the linux modules/dev nodes handle the way they do.
> What I do not yet understand is how to map the device to input "primitives".

Depending on how the device presents itself, we might have to use
hid-logitech-hidpp, not hid-lg FWIW.

And to answer the question "how to map the device to input
"primitives".", it all depends on how the device exports itself.

> To recap there are 5 hardware buttons and 3 states:
> - State: "Color temperature in range [u, x]" Button: up
> - State: "Color temperature in range [u, x]" Button: down
> - State/Button On/Off
> - State "Brightness in range [y, z]" Button: up
> - State "Brightness in range [y, z]" Button: down

FWIW, you should be able to use hid-recorder[0] (as root) to record
traces of the events, and to parse them on the fly. Also, if you
provide us the output, we can replay the traces locally as if we
virtually plugged in the device.

>
> What would be a best practice to expose these correctly via HID (as
> e.g. ABS_WHEEL?)?

This doesn't look like a wheel at all, but more like simple buttons
from your description. We should let userspace deal with the
representation as a slider by its own.

Also, are the buttons configuring the hardware directly or do you need
some software to actually change the brightness/color?

And FWIW, the device looks like we should probably just export it as a
led class device, with brightness and color support.

> Or at least - what are the canonical options?
>
> Since the exposed Record interface seems "wrong" I assume I need to
> write code to fix the device handling.
> Now, is this better suited in `hid-input` or `hid-lg`?

Again, it depends. If the device speaks the same high level interface
as other consumer Logitech devices (mice, keyboards, etc...)
hid-logitech-hidpp is the best way forward, but if not, hid-lg would
be the place to start.

> The former currently tries to handle the device (wrongly) and the
> latter yet ignores the device but seems to be
> the one stop to fix Logitech devices.
>
>
> > I know of no way to fully control the device from my computer and
> > would like to change that.
> By now I am confident that I will soon have the full device control figured out.
>

Glad to hear that. But again, we need to know the device a little bit more.
FWIW, if the first byte you have to send to control the LED is 0x10,
0x11 or 0x12 then this is a HID++ device that needs to go in
hid-logitech-hidpp and a lot of groundwork is already done in the
kernel for it.

Cheers,
Benjamin

