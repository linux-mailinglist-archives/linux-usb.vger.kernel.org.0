Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E628714922B
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jan 2020 00:53:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729568AbgAXXxK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jan 2020 18:53:10 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:33477 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729368AbgAXXxK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jan 2020 18:53:10 -0500
Received: by mail-pj1-f67.google.com with SMTP id m7so944501pjs.0
        for <linux-usb@vger.kernel.org>; Fri, 24 Jan 2020 15:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=KIxZSRE2nTyDTIU7WkSHVpdhmX+AjqAvpUWU2+MZxWI=;
        b=OTqBE8ZQTiJowrEhu4ePxKW4YK0RGiQyga/GEdJvOfjcvuxoeTwLrXnZDcn8WNUGy7
         WDg4X9dBTLGdoHuR2JUxWyb0khK6YcIPbp5ukMp+001MZvAr+YBlAKTip1zS9biaWns1
         4PUNI5jz2ozAPg3ZtKlFtCmbcSNkUuTOTuy+LpcWMdvCIlnKBQmyI6ukEbyizSNVxI9q
         jZJsuCbxxEkR9hh2mbt6zijQ4ejBSeK/xR8zZSlOVdumc8V0CNWSab+Cn6vOf9W6dwl9
         KcjKLS9HZcWoF8dGy8wH9JGzZps4RgZMtJPCl329ODvokqCmreq1I+VnJGLFaAddhCpg
         Homw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=KIxZSRE2nTyDTIU7WkSHVpdhmX+AjqAvpUWU2+MZxWI=;
        b=BmKBntAHsuYQgMWNy69p9e7R4Xjp1Pqxi852Rn/GWYhlqqbCV1Qvs/3+yvoswGzoD2
         yWgFF7Kp6ttbc3vJc2JmYnpxJa8F745635esad7ftDTw3j3d4+Nm54B3QTjm5bTkFxIi
         vFU1udERdEq51jwxZ3YGe7ZzYvYrRmK2WvOIm5oLUZNx/LZ7p+JtEex/AMdrz0pDXGJ2
         1HcEkSK3D9PksyxvsvppZMtnMX0fV1w4JxseKYBjFGkDcTGYw5gClbwCAK8G4Cnsvp1T
         4Pk+K1CIgRTzqc7HHIBdnto5PQgHoD/XsjGVHL6Xp8NSVKYuBZJknYp3tXAiW0C3RMaI
         6/KA==
X-Gm-Message-State: APjAAAW2ml2ueKKJrzi9n29S9D3vAHG2D4qgFLI5BYO4DGEZKhr3BnWv
        MviIsZ9rQozenObZyZNBRYrz0o3iTjo=
X-Google-Smtp-Source: APXvYqyRLoWkk0g94z6ikJxHnf1siTnQ9d63AQpRy7twh5at27bxMZtFVa2MtTYk5EOl/hfzjjda/A==
X-Received: by 2002:a17:90a:c708:: with SMTP id o8mr2026516pjt.104.1579909989223;
        Fri, 24 Jan 2020 15:53:09 -0800 (PST)
Received: from hermes.lan (204-195-22-127.wavecable.com. [204.195.22.127])
        by smtp.gmail.com with ESMTPSA id d3sm7466151pjx.16.2020.01.24.15.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 15:53:08 -0800 (PST)
Date:   Fri, 24 Jan 2020 15:53:01 -0800
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     kai.heng.feng@canonical.com, hayeswang@realtek.com
Cc:     linux-usb@vger.kernel.org
Subject: Fw: [Bug 206291] New: Realtek Ethernet dock (DA200) via
 USB-C/Thunderbolt not working (on Dell Latitude 7300)
Message-ID: <20200124155301.2c719202@hermes.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Begin forwarded message:

Date: Thu, 23 Jan 2020 19:57:13 +0000
From: bugzilla-daemon@bugzilla.kernel.org
To: stephen@networkplumber.org
Subject: [Bug 206291] New: Realtek Ethernet dock (DA200) via USB-C/Thunderbolt not working (on Dell Latitude 7300)


https://bugzilla.kernel.org/show_bug.cgi?id=206291

            Bug ID: 206291
           Summary: Realtek Ethernet dock (DA200) via USB-C/Thunderbolt
                    not working (on Dell Latitude 7300)
           Product: Networking
           Version: 2.5
    Kernel Version: 5.4.14-050414-generic
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: IPV4
          Assignee: stephen@networkplumber.org
          Reporter: mario.gleirscher@tum.de
        Regression: No

Hi, I was redirected to here by the ubuntu-bug/Apport tool. 

I have had wired ethernet troubles with a USB-C docking adapter (DELL DA 200,
internally Realtek GBE 8153 USB adapter) connected with the Thunderbolt jack on
my Latitude 7300. Slowly, I manage to get it to work (basically by using a
newer mainline Ubuntu kernel, switching off Bluetooth and suspend/resume +
reconnect cables + restarting NetworkManager). I recognised "PTE Write access
is not set" as one of the top messages showing up on the boot screen when
booting with a recent kernel 5.4.14-050414-generic (from dmesg).

[    0.155135] APIC: Switch to symmetric I/O mode setup
[    0.155137] DMAR: Host address width 39
[    0.155138] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[    0.155142] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c40660462
ecap 19e2ff0505e
[    0.155143] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[    0.155145] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c40660462
ecap f050da
[    0.155146] DMAR: RMRR base: 0x00000078563000 end: 0x00000078582fff
[    0.155147] DMAR: RMRR base: 0x0000007d000000 end: 0x0000007f7fffff
[    0.155147] DMAR: RMRR base: 0x00000078907000 end: 0x00000078986fff
[    0.155148] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
[    0.155149] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
[    0.155149] DMAR-IR: Queued invalidation will be enabled to support x2apic
and Intr-remapping.
[    0.155753] DMAR: DRHD: handling fault status reg 2
[    0.155758] DMAR: [DMA Write] Request device [39:00.0] PASID ffffffff fault
addr 7a891000 [fault reason 05] PTE Write access is not set
[    0.157591] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.157592] x2apic enabled
[    0.157616] Switched APIC routing to cluster x2apic.
[    0.163699] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1

The corresponding device is (from lspci):

39:00.0 USB controller: Intel Corporation JHL6340 Thunderbolt 3 USB 3.1
Controller (C step) [Alpine Ridge 2C 2016] (rev 02)

Following some issue reports (e.g.
https://bugzilla.redhat.com/show_bug.cgi?id=1573021, although many referring to
a graphics device 00:02.0 or a PCI bridge 02:00:0), I switched off IOMMU via
grub: intel_iommu=off, but as that actually would be for video acceleration (or
something like that) it (of course) doesn't seem to show any effect. 

Still getting the same message and the same behavior: Trying to reconnect the
dock adapter requires to switch off Bluetooth, suspend/resume and handling with
cables and restarting NetworkManager to have the device identified, the r8152
module loaded, getting rid of the NO-CARRIER flag shown by ip link, and finally
get a stable ethernet connection (notably without reboot). Even after booting,
I have to repeat this procedure.

It is worth saying that under 5.3.0-26 (Ubuntu 19.10 default), I got the
following messages via journalctl -f: 

dhclient: DHCPDISCOVER on myif to 255.255.255.255 port 67 interval 17
(xid=0xfeee5e2c)
dhclient: send_packet: No such device or address
dhclient: dhclient.c:2569: Failed to send 300 byte long packet over myif
interface.
kernel: r8152 4-1.1:1.0 myif: Tx status -71 

and

kernel: r8152 4-1.1:1.0 xxx: Tx status -71
systemd-resolved: Failed to send hostname reply: Invalid argument
kernel: r8152 4-1.1:1.0 xxx: Tx status -71

Why I am reporting this here? Because I suppose it has some to do with the
unstable ethernet functionality that keeps my machine from being properly
usable. I didn't find anything similar here (may that one
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1697053). Also
https://bugzilla.kernel.org/show_bug.cgi?id=82761 and
https://bugzilla.kernel.org/show_bug.cgi?id=115931 don't seem to capture my
case.

More background:
Overall, I am on Ubuntu 19.10, Dell Latitude 7300, i7 8th gen, all firmware
(chipset, TB3, BIOS) has been updated. I have switched off Intel AMT, set
Thunderbolt 3 to USB-C only mode (as the DA 200 adapter only uses USB-C). 
I use UEFI Secure Boot.

The overall behaviour did not change much from kernel 5.3.0 packaged with
Ubuntu 19.10, however, the trick described above has only been tested with
5.4.14.

The ethernet adapter works seemingly totally fine with Windows 10 (which I have
in a dual boot setting).

I assume this is some kind of bug and hope for some help with that. Thanks.

-- 
You are receiving this mail because:
You are the assignee for the bug.
