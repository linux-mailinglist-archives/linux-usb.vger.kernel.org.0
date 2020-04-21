Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31F0A1B1CB7
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2020 05:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728399AbgDUDYR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Apr 2020 23:24:17 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:35218 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728379AbgDUDYO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Apr 2020 23:24:14 -0400
Received: from mail-pl1-f197.google.com ([209.85.214.197])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <matthew.ruffell@canonical.com>)
        id 1jQjW7-0007e4-2w
        for linux-usb@vger.kernel.org; Tue, 21 Apr 2020 03:24:11 +0000
Received: by mail-pl1-f197.google.com with SMTP id y21so10492104plr.12
        for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2020 20:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=3iAj2p8sk6QsZzfvIOcaK6qrCn7cvYBRjXCuGapcgHU=;
        b=I0qMG7T96K2P4vCvI7vqF2CToSYEh/9aX5YEznyfDyi7xH6uqq8vUnTPjwKhiJhIq3
         rSCS0cXbWp1AdgetVL9HQm37OBkNNreM9CVmb7fLjDtdOSN7MSnprFQs0NJPwr93k1CC
         FBR1QJzKfpgnUbtBXp9X5Gz5f6SRHxtLuQZiEscSn1RRvBmLnOQjlUzPP/cv8BeJ6Hy+
         1V5W0U72RplVSgr3qKM0O8r55jZJ4OQTre1Wpmh3xVw0baucGoLDO2Wj+5//vu2n4vVq
         4ldwQOzCPiVN+QrULfo7vySY+YgYM5zxu+JIsN52QO9F4dE0YuqKJpnplHKbz/ZEo/7v
         wvgg==
X-Gm-Message-State: AGi0PuZS+fCw0IpeM/IGbHsSLG7pzBoF5z3BU5nVZsvoVwnL61ur5blu
        HMJgYJYtnNSpR49QUweMqZuO6LNM7DE24SdjHHiYExBGpSTcpuE4AXlDXcPTqIZi1zzyJ2GTCKe
        t0s+qiiy8dMKMu5xh0Y/F4tAt3tFIxef2k9IgXg==
X-Received: by 2002:a17:902:bc46:: with SMTP id t6mr4742141plz.56.1587439446706;
        Mon, 20 Apr 2020 20:24:06 -0700 (PDT)
X-Google-Smtp-Source: APiQypKIN7KGiLJ2kSd+IsbhkKE2dN8Ubo+eN3XNGFmqlvqqR+1P5++BOa+DeGUtkHUGjXzPMiAzUg==
X-Received: by 2002:a17:902:bc46:: with SMTP id t6mr4742126plz.56.1587439446258;
        Mon, 20 Apr 2020 20:24:06 -0700 (PDT)
Received: from [192.168.1.107] (222-154-99-146-fibre.sparkbb.co.nz. [222.154.99.146])
        by smtp.gmail.com with ESMTPSA id v127sm942179pfv.77.2020.04.20.20.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 20:24:05 -0700 (PDT)
To:     linux-usb@vger.kernel.org
Cc:     dann.frazier@canonical.com, heitor.de.siqueira@canonical.com,
        glogow@fbihome.de
From:   Matthew Ruffell <matthew.ruffell@canonical.com>
Subject: [PROBLEM]: Infinite warm reset loops resulting in "Cannot enable.
 Maybe the USB cable is bad?" messages
Message-ID: <cd36bf27-fc7b-9a22-7065-2fabb8e89674@canonical.com>
Date:   Tue, 21 Apr 2020 15:24:01 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I am struggling to debug a regression, and it would be great if we could work
this out together. I'm not very familiar with the USB subsystem, but I will try
my best.

We have had a few reports from users where their USB devices are extremely slow,
to the point where they are unusable. Their dmesg buffers are filled with:

[ 14.000130] usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
[ 18.092123] usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
[ 22.172116] usb usb2-port2: Cannot enable. Maybe the USB cable is bad?
[ 26.252116] usb usb2-port2: Cannot enable. Maybe the USB cable is bad?

This only seems to happen with specific hardware combinations. We did a git
bisect, and determined that the below commit was the root cause:

commit 4fdc1790e6a9ef22399c6bc6e63b80f4609f3b7e
Author: Jan-Marek Glogowski <glogow@fbihome.de>
Date:   Fri Feb 1 13:52:31 2019 +0100
Subject: usb: handle warm-reset port requests on hub resume

We had to revert this commit from the Ubuntu kernels for the time being, but we
wish to re-apply it once we determine how to fix this regression.

The problem still exists on the latest 5.7-rc1 kernel, and if we revert the
above commit, the problem vanishes.

Logs (from an affected system, it has a LOT of USB devices):

System Info:
Ubuntu 18.04, 4.15.0-72-generic kernel.

lsusb:                                  https://paste.ubuntu.com/p/Syh2StCyyT/
lsusb -t:                               https://paste.ubuntu.com/p/fG7DdXvh58/
filtered dmesg, with usbcore.dyndbg=+p: https://paste.ubuntu.com/p/DyY9SJRcdv/
filtered lspci:                         https://paste.ubuntu.com/p/Kr96PvRmH4/

My commentary on the problem:

First the hubs come onto the scene:

USB 2:

xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
usb usb1: Product: xHCI Host Controller
hub 1-0:1.0: USB hub found

USB 3:

xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
xhci_hcd 0000:00:14.0: Host supports USB 3.0 SuperSpeed
usb usb2: New USB device found, idVendor=1d6b, idProduct=0003
usb usb2: Product: xHCI Host Controller
hub 2-0:1.0: USB hub found 

Next, the USB 2 and 3 port peering happens. Let's only look at usb1-port2 and
usb2-port2.

usb usb2-port2: peered to usb1-port2

The next interesting message is hub 1-0 reporting normal state, followed by 
hub 2-0 reporting okay, then going into hub suspend.

hub 1-0:1.0: state 7 ports 16 chg 201c evt 0000
hub 2-0:1.0: state 7 ports 10 chg 0000 evt 0000
hub 2-0:1.0: hub_suspend
usb usb2: bus auto-suspend, wakeup 1

A new USB device is found on port 2. It gets registered under usb 1-2 and not
usb 2-2.

usb 1-2: new high-speed USB device number 2 using xhci_hcd

Following that, hub 2-0 resumes, noting a race event:

usb usb2: suspend raced with wakeup event
usb usb2: usb auto-resume
hub 2-0:1.0: hub_resume

Things keep on going with usb 1-2 though:

usb 1-2: New USB device found, idVendor=0424, idProduct=2807
usb 1-2: Product: USB2807 Hub
usb 1-2: Manufacturer: Microchip
hub 1-2:1.0: USB hub found

Its a Microchip USB hub. It becomes hub 1-2. The next thing to happen is where
the faults start coming in:

usb usb2-port2: do warm reset

A warm reset is issued to usb 2-2. But as we have previously gathered before,
2-2 is an "empty" port, peered to 1-2, and the device is under 1-2. This seems
to be linked with the hub 2-0 suspend and auto-resume event.

This of course matches the text in the problematic commit message:

> This just happens, if its the only device on the root hub, the hub
> therefore resumes and the HCDs status_urb isn't yet available.
> If a warm-reset request is detected, this sets the hubs event_bits,
> which will prevent any auto-suspend and allows the hubs workqueue
> to warm-reset the port later in port_event.

At the moment, usb 1-2 is the only device on the hub 1-0 root hub. Or so I think
anyway. I think I am reading correctly that hub 2-0 has no devices yet.

Anyway, the warm reset is tried again after the first timeout:

usb usb2-port2: not warm reset yet, waiting 50ms
usb usb2-port2: not warm reset yet, waiting 200ms

While this is happening, usb 1-2 is trying to set up the new hub 1-2.

usb 1-2-port1: status 0101 change 0001
usb 1-2-port2: status 0101 change 0001
...

A new warm reset is tried:

usb usb2-port2: not warm reset yet, waiting 200ms

hub 1-2 starts discovering new devices:

usb 1-2.1: New USB device found, idVendor=0403, idProduct=6011
usb 1-2.1: Product: Quad RS232-HS
usb 1-2.1: Manufacturer: FTDI

So things seem to be functioning normally at USB 2.0 speeds for usb 1-2. Back
on the usb 2-2 front:

usb usb2-port2: not warm reset yet, waiting 200ms
usb usb2-port2: not enabled, trying warm reset again...

From there on hub 1-2 keeps on discovering new devices and bringing them up,
and usb 2-2 keeps trying to warm reset.

Looking at the problematic code: 

/* Make sure a warm-reset request is handled by port_event */
if (type == HUB_RESUME &&
hub_port_warm_reset_required(hub, port1, portstatus))
set_bit(port1, hub->event_bits);

It almost feels like we are missing a check to see if the port in question is
already in use in another bus. Or if the port is "empty".

In any case, reverting this commit on a mainline 5.7-rc1 kernel fixes the problem.

We have obtained access to an affected machine, and we can gather any debug data
that might be useful, or test any patches. Let me know what I can do, and I will
promptly fetch output.

Thanks for any help,

Matthew Ruffell
