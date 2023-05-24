Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D889670F5B8
	for <lists+linux-usb@lfdr.de>; Wed, 24 May 2023 13:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231882AbjEXL4s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 May 2023 07:56:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231867AbjEXL4r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 May 2023 07:56:47 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A0E139
        for <linux-usb@vger.kernel.org>; Wed, 24 May 2023 04:56:44 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1ae87bdc452so1187565ad.2
        for <linux-usb@vger.kernel.org>; Wed, 24 May 2023 04:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684929403; x=1687521403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8oqqYjrlQMg6X8JoyTmjqSkC/76h8IM5Nk1Jkm7vNk=;
        b=dNdnkY8a/d7ZviAzl85zpGmk3wvzN8uUg9v4ceYW4xwn9qwCoKhFO8BGDGqwJltAuR
         +UfdusXw+TFsqo1EGMXOlQ+JZmyTCBgpJEg0YQLUfou638zQtDNkvlrpL6jNBATsKq18
         tp47W2xmNjNUSqffZX9P/XgtOhk84ZrMqh6L7V9bTxX+kXgVYl8Fkk1iXUoGTY2s4RyM
         TURO6H6HH3BI5Y+jeCwXoJtgy8cQIhjgG/OFV0AGZrSjm6R5EleKeI4TjSKbcmAbBmlo
         TytCIDPu2BG2YJ9yOoZ8b+70E1bLRy7dhU0uwhvdhY9l4UW4jQ8SX2bZPhuvNQKIOH4c
         uPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684929403; x=1687521403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8oqqYjrlQMg6X8JoyTmjqSkC/76h8IM5Nk1Jkm7vNk=;
        b=UK4pFq/mBETQHVerVh+iI/tamNABV0EblAq6Sd0rQ/sw612N9e09FAtjltlRbYtDhG
         ICg6gJm3h2PIuSK/AOH9YnqhCmlGI/1bmiwMOQRyxHMxsWjJ2aLlSDIIm1HCMSu0VZf7
         LBvknB2R3SkSbpR/wibTg0dUfB6WN5uHyTdrjaFbXOC83vTYMKaYZFEoU/U6JmfGmVcQ
         ObwZ9rzj+IyJeV4w7UqnA5YFmqGpcCloC0QrSY/Ab/74snxjTod2DcRxKbwMLlVr6th7
         Q0JfQBhf4m9mHW/FRt3Rp6GmzeYInmAMsTmN+hrQIMtCJMx+DNoSE0WJDalQer8SaET4
         z3VA==
X-Gm-Message-State: AC+VfDy5HvVomexmUSPSGXFcV6gx868IiVzaxWSnqIlU+lvYU3d/FaL1
        UQQfWE+D1wsvvoRIS3dL7stQ1Cm2WlwM8GcJ+5P5nluvvgM=
X-Google-Smtp-Source: ACHHUZ7mCAhzEW3RlbzpL08qWeBYR+Sw7I5A6dsAkGfwk9Bg03e4jrNOEI4X282jRrWAH/3joX1SzWkT3ibcN4wVfvk=
X-Received: by 2002:a17:902:e9c5:b0:1a2:9ce6:6483 with SMTP id
 5-20020a170902e9c500b001a29ce66483mr15630314plk.64.1684929403201; Wed, 24 May
 2023 04:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191106134217.37e221af@tesx-pc> <7cb80237ed20f96d1eb0d3be58c64b71d0c6e9a0.camel@archlinux.org>
In-Reply-To: <7cb80237ed20f96d1eb0d3be58c64b71d0c6e9a0.camel@archlinux.org>
From:   Fabrizio Pelosi <tesfabpel@gmail.com>
Date:   Wed, 24 May 2023 13:56:31 +0200
Message-ID: <CANyQ3qBWcVjCDynM-+Ti3ebuXaFaR2Sd=ceburscLOuNNE-wtg@mail.gmail.com>
Subject: Re: Logitech mouse G900 works only after ~6 seconds after plugging it in
To:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I confirm this bug is still present as of kernel 6.3.3-arch1-1.

I've tried running `udevadm monitor` and then switching the mouse on
and this was the output.
Notice that there is a jump between 204 seconds of uptime to 219
seconds after which the mouse starts effectively working.

BTW, for those who don't know, the mouse is a hybrid wireless / wired
one and I keep it always plugged in but with the switch underneath it
on OFF.
Only with the switch ON the mouse works (even wired), otherwise the
mouse charges up its battery.

$ udevadm monitor

monitor will print the received events for:
UDEV - the event which udev sends out after rule processing
KERNEL - the kernel uevent

KERNEL[204.392972] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3 (usb)
KERNEL[204.459877] change
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3 (usb)
KERNEL[204.462886] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.0
(usb)
KERNEL[204.469946] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.0/0003=
:046D:C081.0009
(hid)
KERNEL[204.469977] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.0/0003=
:046D:C081.0009/input/input33
(input)
KERNEL[204.470004] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.0/0003=
:046D:C081.0009/input/input33/event2
(input)
KERNEL[204.470096] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.0/0003=
:046D:C081.0009/input/input33/mouse0
(input)
KERNEL[204.470160] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.0/0003=
:046D:C081.0009/hidraw/hidraw2
(hidraw)
KERNEL[204.470189] bind
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.0/0003=
:046D:C081.0009
(hid)
KERNEL[204.470210] bind
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.0
(usb)
KERNEL[204.470228] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.1
(usb)
KERNEL[204.477003] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.1/0003=
:046D:C081.000A
(hid)
KERNEL[204.477037] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.1/0003=
:046D:C081.000A/input/input34
(input)
KERNEL[204.533609] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.1/0003=
:046D:C081.000A/input/input34/event28
(input)
KERNEL[204.533634] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.1/usbm=
isc/hiddev2
(usbmisc)
KERNEL[204.533651] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.1/0003=
:046D:C081.000A/hidraw/hidraw3
(hidraw)
KERNEL[219.960876] remove
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.1/0003=
:046D:C081.000A/input/input34/event28
(input)
KERNEL[219.987314] remove
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.1/0003=
:046D:C081.000A/input/input34
(input)
KERNEL[219.987361] remove
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.1/usbm=
isc/hiddev2
(usbmisc)
KERNEL[219.987376] remove
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.1/0003=
:046D:C081.000A/hidraw/hidraw3
(hidraw)
KERNEL[219.987414] bind
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.1
(usb)
KERNEL[219.987446] bind
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3 (usb)
UDEV  [220.004789] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3 (usb)
UDEV  [220.006104] change
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3 (usb)
UDEV  [220.006832] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.0
(usb)
UDEV  [220.007558] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.0/0003=
:046D:C081.0009
(hid)
UDEV  [220.008239] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.1
(usb)
UDEV  [220.008651] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.0/0003=
:046D:C081.0009/input/input33
(input)
UDEV  [220.008953] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.1/0003=
:046D:C081.000A
(hid)
UDEV  [220.010192] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.1/0003=
:046D:C081.000A/input/input34
(input)
UDEV  [220.010634] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.1/usbm=
isc/hiddev2
(usbmisc)
UDEV  [220.010975] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.0/0003=
:046D:C081.0009/input/input33/mouse0
(input)
UDEV  [220.011169] remove
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.1/usbm=
isc/hiddev2
(usbmisc)
UDEV  [220.011451] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.1/0003=
:046D:C081.000A/input/input34/event28
(input)
UDEV  [220.012159] remove
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.1/0003=
:046D:C081.000A/input/input34/event28
(input)
UDEV  [220.012513] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.0/0003=
:046D:C081.0009/hidraw/hidraw2
(hidraw)
UDEV  [220.012815] remove
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.1/0003=
:046D:C081.000A/input/input34
(input)
UDEV  [220.013516] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.1/0003=
:046D:C081.000A/hidraw/hidraw3
(hidraw)
UDEV  [220.014110] remove
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.1/0003=
:046D:C081.000A/hidraw/hidraw3
(hidraw)
UDEV  [220.014753] bind
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.1
(usb)
UDEV  [220.132774] add
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.0/0003=
:046D:C081.0009/input/input33/event2
(input)
UDEV  [220.133439] bind
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.0/0003=
:046D:C081.0009
(hid)
UDEV  [220.134102] bind
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3/7-1.3:1.0
(usb)
UDEV  [220.136452] bind
/devices/pci0000:00/0000:00:08.1/0000:0e:00.3/usb7/7-1/7-1.3 (usb)


Il giorno mer 6 nov 2019 alle ore 14:01 Filipe La=C3=ADns
<lains@archlinux.org> ha scritto:
>
> On Wed, 2019-11-06 at 13:42 +0100, Fabrizio Pelosi wrote:
> > I'm having this issue since some kernel releases but I never took the
> > time to report it since it's not so severe...
> > Anyway, if I plug my mouse (a Logitech G900) the device gets detected
> > immediately but starts to work only after ~6 seconds as you can see
> > from the log.
> >
> > The mouse is connected via USB cable (without the wireless receiver).
> >
> > I have this issue on a ArchLinux box (running kernel 5.3.8-arch1) and
> > also on a Fedora 31 box.
> >
> > NOTE: Also reported here:
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D205449
> >
> > LOG:
> > nov 06 08:29:50 tesx-pc kernel: mousedev: PS/2 mouse device common
> > for all mice
> > nov 06 08:29:50 tesx-pc kernel: logitech-hidpp-device
> > 0003:046D:C081.0007: Device not connected
> > nov 06 08:29:45 tesx-pc kernel: logitech-hidpp-device
> > 0003:046D:C081.0006: input,hidraw5: USB HID v1.11 Mouse [Logitech
> > Gaming Mouse G900] on usb-0000:0f:00.3-1.2/input0
> > nov 06 08:29:45 tesx-pc kernel: input: Logitech Gaming Mouse G900 as
> > /devices/pci0000:00/0000:00:08.1/0000:0f:00.3/usb5/5-1/5-1.2/5-
> > 1.2:1.0/0003:046D:C081.0006/input/input36
> > nov 06 08:29:45 tesx-pc kernel: hid-generic 0003:046D:C081.0007:
> > input,hiddev4,hidraw6: USB HID v1.11 Keyboard [Logitech Gaming Mouse
> > G900] on usb-0000:0f:00.3-1.2/input1
> > nov 06 08:29:45 tesx-pc kernel: input: Logitech Gaming Mouse G900
> > System Control as
> > /devices/pci0000:00/0000:00:08.1/0000:0f:00.3/usb5/5-1/5-1.2/5-
> > 1.2:1.1/0003:046D:C081.0007/input/input33
> > nov 06 08:29:45 tesx-pc kernel: input: Logitech Gaming Mouse G900
> > Consumer Control as
> > /devices/pci0000:00/0000:00:08.1/0000:0f:00.3/usb5/5-1/5-1.2/5-
> > 1.2:1.1/0003:046D:C081.0007/input/input32
> > nov 06 08:29:45 tesx-pc kernel: input: Logitech Gaming Mouse G900
> > Keyboard as /devices/pci0000:00/0000:00:08.1/0000:0f:00.3/usb5/5-1/5-
> > 1.2/5-1.2:1.1/0003:046D:C081.0007/input/input31
> > nov 06 08:29:45 tesx-pc kernel: hid-generic 0003:046D:C081.0006:
> > input,hidraw5: USB HID v1.11 Mouse [Logitech Gaming Mouse G900] on
> > usb-0000:0f:00.3-1.2/input0
> > nov 06 08:29:45 tesx-pc kernel: input: Logitech Gaming Mouse G900 as
> > /devices/pci0000:00/0000:00:08.1/0000:0f:00.3/usb5/5-1/5-1.2/5-
> > 1.2:1.0/0003:046D:C081.0006/input/input30
> > nov 06 08:29:44 tesx-pc kernel: usb 5-1.2: SerialNumber: 0E6C36503233
> > nov 06 08:29:44 tesx-pc kernel: usb 5-1.2: Manufacturer: Logitech
> > nov 06 08:29:44 tesx-pc kernel: usb 5-1.2: Product: Gaming Mouse G900
> > nov 06 08:29:44 tesx-pc kernel: usb 5-1.2: New USB device strings:
> > Mfr=3D1, Product=3D2, SerialNumber=3D3
> > nov 06 08:29:44 tesx-pc kernel: usb 5-1.2: New USB device found,
> > idVendor=3D046d, idProduct=3Dc081, bcdDevice=3D 1.03
> > nov 06 08:29:44 tesx-pc kernel: usb 5-1.2: new full-speed USB device
> > number 5 using xhci_hcd
>
> Oh, it looks to me like the driver thinks the usb device it's a
> receiver. I will check this out when I get home.
>
> Cheers,
> Filipe La=C3=ADns
