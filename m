Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 634A853F1FF
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jun 2022 00:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232193AbiFFWNO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jun 2022 18:13:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231521AbiFFWNM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jun 2022 18:13:12 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 815EB66F82
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 15:13:10 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id o6-20020a17090a0a0600b001e2c6566046so19105154pjo.0
        for <linux-usb@vger.kernel.org>; Mon, 06 Jun 2022 15:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=gcC0f2r6vjUw8wt2j/WuzLRomB9Sp/OFVJBYDRBjXSo=;
        b=TgnAMuxvJ2ZqD0MiMiMpQpANOkOgCF+ygRDJdZEMLxo5FVzdwONWd+Y8JU55fIShOK
         dwGXfMJ+sr6Q1sQDtnkUVW7Kn7UoTwT7ysi1Vmo/Co+xcwNOqGea6PsK0emRVGdvHje6
         2u3wsiQjlNzKBWCiVi3m8dVLqBft85JLyGZi9exaMuh72+HmXGnKaM0O2gy4OjBlvYji
         xgfDtKKZHpti3OFrKrG/RrtUWz6J2tH+G8ItQlHDyqcSHJJYDbBNGsa1hgtHi+AjThHl
         mfX+TcBZx6WbwFp+qbk+XqivMa8LizwGse8n+o8W6KtC0Nuznjc054im/rakVED2N1nm
         VEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=gcC0f2r6vjUw8wt2j/WuzLRomB9Sp/OFVJBYDRBjXSo=;
        b=HiYEFcmoSFdlbDgox8k7qeIKiZOOWJ/iEtsrkfEBqj7nYtKiKzrCUv8UDBe7SxBaj0
         W3wut9UfQak2j30jGURI7kNBm2kvzdhdde4KZyIZzq+p6Tsf7I4ZO+wbObuTB0YP96lP
         QPe6pgpTJWuwl1j6vstKP0wj+Ps+Rpu48mfM6Ts5jZvHG/IzvVxCTs4h8DlPKasc6Mxc
         X5vaifxJeEwb+m5hmPp28HmWYAD4n7ZBq2YJv+0PZ48QJdzzW5Iq3RyOj51LTs4tguL4
         tKsXlfAWi8/MK9QhQvbDCtZdKL8QkiwytK6zPqynzGaCm0aQMp+3GO09YcC6kSbygZJ4
         hg8Q==
X-Gm-Message-State: AOAM531cekH3sye+kRw5GeOHz0eKNe0iayxVdpR2IX5GIgLtGkVpN62T
        Z7DdYg77Y4EheDrYM0Qcyc04jJ3dT9o8iMXV+f9JtxBuq6Zk3EaO
X-Google-Smtp-Source: ABdhPJyT5KZC36IUKItcHAlLnLUJ2Hu76T/E5kTifN7zsuppiastcq++Dwra8tL9ZdYIjB+FPybEMNsNd4MfTgiXfIw=
X-Received: by 2002:a17:902:bd42:b0:164:bea:65bf with SMTP id
 b2-20020a170902bd4200b001640bea65bfmr26233963plx.111.1654553589744; Mon, 06
 Jun 2022 15:13:09 -0700 (PDT)
MIME-Version: 1.0
From:   Kevin Rowland <kevin.p.rowland@gmail.com>
Date:   Mon, 6 Jun 2022 15:12:58 -0700
Message-ID: <CAHK3GzziwVASKgvBQmv_DnhwLJ8Bj2K=42ptyTrtOFCAAPXcnw@mail.gmail.com>
Subject: Control of external VBUS on resume from sleep
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello all,

I've got a USB 3.0 host (an NXP i.MX8QM running 5.10.72 with Cadence
XHCI host controller IP) connected to a USB device on the same PCB,
which also happens to run Linux (although I think that's beside the
point here). The quirk is that, although D+/D- are routed directly
from host to device, VBUS is actually controlled by a separate GPIO on
the host. The dedicated VBUS pin on the USB host controller is pulled
high. ID is pulled high on the PBC but driven low by a GPIO from the
i.MX8, so we can imagine it's tied to ground.

I've made a little schematic drawing [1] to help visualize the connections.

We've run into an issue where, on resume from STR, the following
sequence occurs:
- the GPIO peripheral on the host is powered back on, VBUS is
immediately driven high
- the device signals attach on DP/DN, but _I believe_ the host
controller on the host is not yet powered on
- the host controller is then powered on and the {hub, hcd, xhci}
drivers all resume, but no port status change is detected; I believe
that attach signaling was missed by the host controller

I'd like for the host controller driver (or the root hub driver??) to
have explicit control of VBUS, so that it's driven high only when the
host controller regains power and is ready to detect attach signaling.
I see device-tree documentation about the USB connector node and
`vbus-supply`, but I'm having a hard time understanding how to square
my use-case with `drivers/usb/common/usb-conn-gpio.c`, which reacts to
state changes on VBUS or ID.

Any thoughts on where I should stick the logic that enables VBUS on
resume? My current (very hacky) fix is to initialize a global (argh!)
gpio_desc to refer to the VBUS GPIO, then to call
`gpiod_set_value(<gpio_desc>, 0); gpiod_set_value(<gpio_desc>, 1);` in
`usb_port_resume()`, which is where I ended up when tracking the
original issue. This toggles VBUS and allows us to catch the new round
of attach signaling from the device.

I'm happy to use the fixed-regulator framework instead, I'm just not
sure which driver should own the gpio_desc / regulator and where it
should be disabled / enabled during suspend / resume.

Best,
Kevin

[1]

 i.MX8                      device
.----------------.         .-------------.
|     GPIOX.Y ---|-------->| VBUS (in)   |
|                |         |             |
|  USB           |    _    |             |
| .------------. |    |    |             |
| |    VBUS ---|-|----'    |             |
| |     DP <---|-|-------->| DP          |
| |     DP <---|-|-------->| DN          |
| |     ID ----|-|----.    '-------------'
| '------------' |    |
'----------------'    v
