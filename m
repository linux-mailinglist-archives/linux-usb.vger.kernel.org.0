Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42807BC564
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2019 12:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbfIXKI7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Sep 2019 06:08:59 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:44203 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbfIXKI6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Sep 2019 06:08:58 -0400
Received: by mail-ed1-f65.google.com with SMTP id r16so1233755edq.11
        for <linux-usb@vger.kernel.org>; Tue, 24 Sep 2019 03:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=ekToZBRsT9SKgAx2bojK6rdRNSU4mqm6jYloSyEr5ow=;
        b=U3V1Ck/K+gJ7KUmjC29j3itiIdTAeS04Yr/gCjB2LO5fwl/pT4qTr6gD+op7iJ+nNr
         vdfdt6c9BReex2umUUR74I2CuvgySd/WlATr2oF6WXzZgXrWrSDd+LD3ph/PZHSVpt58
         02U2oLF2IilOwa30eKExCByK6H+qqXh4bCb5kjnB+4RGd6issLxbA6ZPTWijBcBNG/ZA
         1GAPeqBGnS0TyTzNtpmCqiMmIok3d/CWllpMwguCNnlim/QW8tpyBymZRCgkjvm+ybiY
         tSLwmAGs1PuRj7AtrhB3pd4scPh4AQW1UxsbkP/pOjOTitctQ6QOLw6Z6nQuFnTZtlms
         YDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=ekToZBRsT9SKgAx2bojK6rdRNSU4mqm6jYloSyEr5ow=;
        b=E33uD5PqvfFUBEJTvZZtbj88/KheMRoTePfwTEPtijaeA0SdSGSMSGEese60yx1WTl
         hwjVy+SOe99MpT16WlzJ6hXfYbDSqD5fpwnx4RpdfNtZF8vPF3pwbmwWikQj2AsEyWnU
         AJ6XBvV4yMxdyMHKsFo9c+ovs3RhPMdg1eaboKRW1qmd1qWEhpNla8BGTOWEyvFxv/BI
         WUsy9YQWDl5ccLNtVet6uyOkHpgeKKUxWe4Cem2awhceyJWAwcZxNVy1ZfFIBSIPmffs
         fEYFFB1xSI1t9L2xp/dF+9/6gfWQr3GYw6cH2vPsMURlqbtNXjEzvd5Go82Uhh0vpMu1
         Nkkw==
X-Gm-Message-State: APjAAAVsi0du/hn347t8n8tSXh5NWujgtxS8hxI7mo6T5TzS6++Jp1Et
        Xna192vYAr1ceoPGrPI51VRMHoZ3Q3MqPi7o0Uw=
X-Google-Smtp-Source: APXvYqyhAjE+jKJp5wHAaoleT5spsnZwFnrKVc8VQ3biDJ1XZGL42/bk4xEJDCS3Kb3toMxAaOFbETtnv+2384ZdTlc=
X-Received: by 2002:a17:906:b298:: with SMTP id q24mr1670840ejz.168.1569319735899;
 Tue, 24 Sep 2019 03:08:55 -0700 (PDT)
MIME-Version: 1.0
From:   Igor Opaniuk <igor.opaniuk@gmail.com>
Date:   Tue, 24 Sep 2019 13:08:45 +0300
Message-ID: <CAByghJYLLdtYiQGNCxJ4HEjm5Y1v0LQ1pc+dmHemoNWxx2h6jg@mail.gmail.com>
Subject: [chipidea] continuous USB resets on NXP i.MX 6ULL device
To:     Fabio Estevam <festevam@gmail.com>,
        Peter Chen <peter.chen@nxp.com>, stefan.wahren@i2se.com
Cc:     Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Stefan Agner <stefan.agner@toradex.com>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Fabio, Peter, Stefan,

I've incidentally discovered your last year discussion in ML [1] (I
hope it rings
the bell) regarding the issue I'm still observing on the same device with
the mainline kernel.

The difference between i.MX 6ULL EVK and this particular device,
is that usbotg2 is used only in host mode with the usb hub integrated on
the carrier board [2] [3].

root@colibri-imx6:~# lsusb -s 1:1 --tree
/:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M

However I can't reproduce the same behavior with i.MX 6ULL EVK
with connected usb hub to usbotg2. Also this behavior can't be reproduced
with NXP downstream kernel (Linux version 4.9.144) on my device.

After digging in a bit I found out that this happens only when
autosuspend is enabled for the usb controller:
echo auto > /sys/bus/usb/devices/1-1/power/control

It tries to go to suspend mode, but everytime fails and resumes:
root@colibri-imx6:~# cat /sys/bus/usb/devices/1-1/power/runtime_status
suspended
root@colibri-imx6:~# cat /sys/bus/usb/devices/1-1/power/runtime_status
resuming
root@colibri-imx6:~# cat /sys/bus/usb/devices/1-1/power/runtime_status
suspended
root@colibri-imx6:~# cat /sys/bus/usb/devices/1-1/power/runtime_status
suspended
root@colibri-imx6:~# cat /sys/bus/usb/devices/1-1/power/runtime_status
suspended
root@colibri-imx6:~# cat /sys/bus/usb/devices/1-1/power/runtime_status
resuming

I'm observing ~2 seconds wakeup interrupts handled in ci_irq() in core.c an=
d
subsequent invocation of imx_controller_resume().

Meantime usboh3 remains enabled all the time
(though imx_disable_unprepare_clks() should disable it):
root@colibri-imx6:~# cat /sys/kernel/debug/clk/clk_summary | grep usb
    usbphy2_gate                      1        1        0           0
        0     0  50000
    usbphy1_gate                      1        1        0           0
        0     0  50000
          pll7_usb_host               1        1        0   480000000
        0     0  50000
             usbphy2                  1        1        0   480000000
        0     0  50000
          pll3_usb_otg                2        3        0   480000000
        0     0  50000
             usbphy1                  0        0        0   480000000
        0     0  50000
                         usboh3       1        1        0    66000000
        0     0  50000

While I'm trying to localize the root cause, maybe you can give some hints
where to look into?

Thanks for helping me!

[1] https://marc.info/?l=3Dlinux-usb&m=3D151844741732751
[2] https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/imx6ull=
-colibri.dtsi#L191
[3] https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/imx6ull=
-colibri-eval-v3.dtsi#L143

--=20
Best regards - Freundliche Gr=C3=BCsse - Meilleures salutations

Igor Opaniuk

mailto: igor.opaniuk@gmail.com
skype: igor.opanyuk
+380 (93) 836 40 67
http://ua.linkedin.com/in/iopaniuk
