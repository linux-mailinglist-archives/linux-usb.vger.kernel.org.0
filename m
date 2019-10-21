Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE5A2DF4E8
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2019 20:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728513AbfJUSOd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Oct 2019 14:14:33 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:40248 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbfJUSOd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Oct 2019 14:14:33 -0400
Received: by mail-ed1-f65.google.com with SMTP id p59so2348623edp.7
        for <linux-usb@vger.kernel.org>; Mon, 21 Oct 2019 11:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=RiqhG1uWtrM1WZrqo5Vemd5WPoj0HQvDQS6Dm9Q+Fpo=;
        b=E30h0lY9a/lFsF0utQxVC7HY9WoNq0RfVLcpDalFRGn2eNzkgsnulXmks3fmfeGbZ6
         YX07JrTbdJKAeiqgru/BFuQncSmHg9NptWqZl0pXrBX8mky3REkm/NS71k+T+/IK8mGL
         RGODnE6us9T6fvoNFNcDMoEa+D8/EV6iAVzRsszY0M2qubm7ra9bPVnx1kKiLl/Qvba5
         fpLqhuDN/ZS8mn+wgXcnxN9rGiJZDU6kbPAo8Gjj41MHVGBsdJXj2P3iNPNAuyosNAMD
         3GUkg9FJ9MTYBP2ga2CpfykAuS+9/jlw+uXzGPX28FcgilNFO4cfQLc7ki5RVsp1/EBK
         qvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=RiqhG1uWtrM1WZrqo5Vemd5WPoj0HQvDQS6Dm9Q+Fpo=;
        b=Z1/kmQlYye6DuFOx9xzRCFD6QRQzgmn7UsxscZmzQCgvXmilx46KsXw8J3ZMuu7aqi
         OqkHCWoK3PFM2p0bW5d4+511szXMwDiTdZzHaybFHT2HuQRQevJO0rovhCkMYRjmYG7M
         mnHB4qeY8u+LN6U1Q5anfvxcLQqDRK2ulKvBNc7l7fMmZQ/kzTklljfwg1Fm+ldVn5j6
         k8pMr7KWTCjUcecgJa5d2CIqymFRoY1iXHMk3ivLKhijQO1wo9ioaX6e/YgoIT9aVu3k
         nr+3fDVvAu9QaNWTueB5/drmZvlAHBNuvr879t/Y0kHyhUhfQ3iqj3cb+AI24fbmrESY
         +wIA==
X-Gm-Message-State: APjAAAUojrYDKPeg8mqtO17IvG4WPD7PHhpc0AulsNd5AOKe5XYUIBle
        EDbItwAtnG29/25me35AQlIcVI/+4vWfoGuA9QKdErJX3e8=
X-Google-Smtp-Source: APXvYqwws/c4FwoUzawzM+ZA31s/Uh1/O6Lzes89A6M2+stBWQ2bGvjrMkHd3QbAdjrU5kqfU14DSp1YtC6rIAllymY=
X-Received: by 2002:a17:906:1ec6:: with SMTP id m6mr23061157ejj.6.1571681670640;
 Mon, 21 Oct 2019 11:14:30 -0700 (PDT)
MIME-Version: 1.0
From:   Ross Zwisler <zwisler@google.com>
Date:   Mon, 21 Oct 2019 12:14:19 -0600
Message-ID: <CAGRrVHzta7YfzZYuc3d_5CS_SyG+at_=-T7Sm-DG-AS_ejsWug@mail.gmail.com>
Subject: problem with XHCI_SPURIOUS_WAKEUP quirk
To:     Takashi Iwai <tiwai@suse.de>,
        Laura Abbott <labbott@fedoraproject.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Aaron Durbin <adurbin@google.com>,
        Benson Leung <bleung@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I'm hitting an issue on a Broadwell based Chromebox that appears to be
related to the XHCI_SPURIOUS_WAKEUP quirk.

Here are the reproduction steps:

1) Start with a fully booted system on a recent kernel.  I've been
testing with v5.4-rc4.

2) Gracefully shut down the system, either with 'halt -p' or by
pushing the power button.  This causes the XHCI_SPURIOUS_WAKEUP quirk
to be applied on shutdown via xhci_shutdown().

3) Quickly (within a few seconds) restart the system using the power button.

4) After the system restarts, we end up in a state where USB 2.0
devices work fine, but all USB 3.X devices don't work at all.  The
kernel never sees them being inserted, we never call usb_new_device()
or any other USB related kernel code.  This state persists for the
duration of the boot on all ports for the internal USB 3.0 hub, and is
independent of which devices were plugged into the hub during boot.

Attaching a USB analyzer between the USB hub and the USB 3.0 device, I
see that the hub sees the device insertion, but disables SuperSpeed.
From then on all the USB analyzer sees is garbage, and the connection
never successfully drops down to USB 2.0.

Disabling the above mentioned quirk prevents this from happening, and
it also doesn't happen if the system is warm rebooted or if the system
is left off for a longer period of time (~10 seconds or more) before
powering back on.

So, a few questions:

1) I'm running on a Chromebox using Coreboot.  Does anyone have a
BIOS-based BDW system to see if they can reproduce it there?

2) What is the appropriate way to deal with this issue?  From looking
at the history of the quirk, it looks like it was put in for good
reasons and that it still needs to be there for other systems.
Assuming other vendors' systems don't reproduce the above issue,
should I just exclude Google made systems from the quirk?  Something
else?

Thanks,
- Ross
