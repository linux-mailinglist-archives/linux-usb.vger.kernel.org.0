Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4700D4385E5
	for <lists+linux-usb@lfdr.de>; Sun, 24 Oct 2021 01:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbhJWXKX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 Oct 2021 19:10:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:50354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230463AbhJWXKW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 23 Oct 2021 19:10:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id CDD8F601FC
        for <linux-usb@vger.kernel.org>; Sat, 23 Oct 2021 23:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635030482;
        bh=pZ//gojFiCpUK1Q2PTcWtMe55S1Yk4SqHlr0eRTR+bA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=F8IfWkvHy5zRnKrJQobOyOn/HeZdEtI8YR4R6VLIuPgmzaMNQOTADmvtdE21tMDRl
         q2+7/tJfDCpup8Zo+TasWnf+SjK05iYGNwYs28jIi9vWWiwI5wwhuRVkMSW3PQO49r
         c1yxILtNkNADWhb/TMqlmJcRAFPutYkQcLBBd8mh6o50Q+wUL3oB0P0EHNsNl2V7uB
         Flm+zybBP0EGIsZBiNjBtogd4xXQcb/F7EfYkmyuT9HOZPbn7akyrSb8wWA5lPfc0h
         dijra3uCfYlGik23SikV7F+mEE5TNaJoXXvHsyZDjxtYP4hOqm47ZuPaJ0D/PPjNsu
         QwvGRq5BpaB7A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id B983060F4D; Sat, 23 Oct 2021 23:08:02 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214797] ehci-pci: unable to enumerate Sony NW-WS623 Device
Date:   Sat, 23 Oct 2021 23:08:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: Stefan.Lauterwasser@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214797-208809-6ll0b93kIL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214797-208809@https.bugzilla.kernel.org/>
References: <bug-214797-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214797

--- Comment #3 from Stefan.Lauterwasser@gmail.com ---
@Alan Stern
Same host controller, same port, same cable - both devices with mini-USB po=
rt.
My mouse is working properly:

kernel: usb 1-1.5: new full-speed USB device number 79 using ehci-pci
kernel: usb 1-1.5: New USB device found, idVendor=3D25a7, idProduct=3Dfa98,
bcdDevice=3D 2.03
kernel: usb 1-1.5: New USB device strings: Mfr=3D1, Product=3D2, SerialNumb=
er=3D0
kernel: usb 1-1.5: Product: 2.4G Dual Mode Mouse
kernel: usb 1-1.5: Manufacturer: Compx
kernel: input: Compx 2.4G Dual Mode Mouse as
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.5/1-1.5:1.0/0003:25A7:FA98.00=
23/input/input74
kernel: hid-generic 0003:25A7:FA98.0023: input,hidraw6: USB HID v1.10 Mouse
[Compx 2.4G Dual Mode Mouse] on usb-0000:00:1a.0-1.5/input0
kernel: input: Compx 2.4G Dual Mode Mouse Keyboard as
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.5/1-1.5:1.1/0003:25A7:FA98.00=
24/input/input75
kernel: input: Compx 2.4G Dual Mode Mouse as
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.5/1-1.5:1.1/0003:25A7:FA98.00=
24/input/input76
kernel: input: Compx 2.4G Dual Mode Mouse as
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.5/1-1.5:1.1/0003:25A7:FA98.00=
24/input/input77
kernel: hid-generic 0003:25A7:FA98.0024: input,hiddev100,hidraw7: USB HID v=
1.10
Keyboard [Compx 2.4G Dual Mode Mouse] on usb-0000:00:1a.0-1.5/input1
mtp-probe[214798]: checking bus 1, device 79:
"/sys/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.5"
mtp-probe[214798]: bus: 1, device: 79 was not an MTP device
upowerd[843]: treating change event as add on
/sys/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.5
systemd-logind[471]: Watching system buttons on /dev/input/event27 (Compx 2=
.4G
Dual Mode Mouse Keyboard)
mtp-probe[214811]: checking bus 1, device 79:
"/sys/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.5"
mtp-probe[214811]: bus: 1, device: 79 was not an MTP device

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
