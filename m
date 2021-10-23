Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 380074385EE
	for <lists+linux-usb@lfdr.de>; Sun, 24 Oct 2021 01:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbhJWXec (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 Oct 2021 19:34:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:59862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230284AbhJWXec (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 23 Oct 2021 19:34:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7FD8E6023E
        for <linux-usb@vger.kernel.org>; Sat, 23 Oct 2021 23:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635031932;
        bh=0YzSar7ZCfqm1m31r8Q0KYmufFlPMJzkfLqr8kg4klw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DVtdDlyQVpbSN8B2KWR2I5lnujK1Sh8jpVrykHS6hFNTeyvChTovdpH7lCui5jWE4
         U/2Wq+pL0fD72Izv1dnnXgvCqQAy4zoKu3BZ1aNhl8gL73asEtSme/3FvbFaRrQLoK
         wzoSaAUIorQijopp4j0423En88bpbE5aYT/voApOecvPal6TtagphiZclc2qLG0oaj
         vTb80X/BxyDQxwoy0ZWg7A5PMkBGVZpHCwkIok5FcGL6FGIorg+Y/iWAPfCV6xSv57
         fedDd0doyaO+0upliwh+GbLcLjIytIPGOkrsh4dcO+DNbuMWCMH8quM6bditnYiHKI
         0Oica3Ns2bsUw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 6874860F4D; Sat, 23 Oct 2021 23:32:12 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214797] ehci-pci: unable to enumerate Sony NW-WS623 Device
Date:   Sat, 23 Oct 2021 23:32:12 +0000
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
Message-ID: <bug-214797-208809-urzETcH8YL@https.bugzilla.kernel.org/>
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

--- Comment #6 from Stefan.Lauterwasser@gmail.com ---
@Alan Stern
You are right, it's working on an other port and with an other (shorter) ca=
ble.
It's a non-USB 3.0 port also - port is not blue at least.
I am so happy - thought I tried all ports already, sorry. :-/


kernel: usb 1-1.4: new high-speed USB device number 80 using ehci-pci=20=20=
=20=20=20=20=20=20=20=20=20
kernel: usb 1-1.4: New USB device found, idVendor=3D054c, idProduct=3D0bdf,
bcdDevice=3D 1.00=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
kernel: usb 1-1.4: New USB device strings: Mfr=3D1, Product=3D2, SerialNumb=
er=3D3=20=20=20=20=20
kernel: usb 1-1.4: Product: WALKMAN=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20
kernel: usb 1-1.4: Manufacturer: Sony=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20
kernel: usb 1-1.4: SerialNumber: 10455F55708440=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
kernel: usb-storage 1-1.4:1.0: USB Mass Storage device detected=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
kernel: scsi host8: usb-storage 1-1.4:1.0=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20
mtp-probe[215847]: checking bus 1, device 80:
"/sys/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.4"=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
mtp-probe[215847]: bus: 1, device: 80 was not an MTP device=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
mtp-probe[215848]: checking bus 1, device 80:
"/sys/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.4"=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
mtp-probe[215848]: bus: 1, device: 80 was not an MTP device=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
kernel: scsi 8:0:0:0: Direct-Access     SONY     WALKMAN          1.00 PQ: 0
ANSI: 2=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20
kernel: sd 8:0:0:0: Attached scsi generic sg2 type 0=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
kernel: sd 8:0:0:0: [sdc] 7032832 512-byte logical blocks: (3.60 GB/3.35 Gi=
B)=20=20=20
kernel: sd 8:0:0:0: [sdc] Write Protect is off=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
kernel: sd 8:0:0:0: [sdc] Mode Sense: 0b 00 00 00=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
kernel: sd 8:0:0:0: [sdc] Write cache: enabled, read cache: enabled, doesn't
support DPO or FUA=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
kernel:  sdc: sdc1=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
kernel: sd 8:0:0:0: [sdc] Attached SCSI removable disk=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
udisksd[1208]: Mounted /dev/sdc1 at /run/media/<user>/WALKMAN on behalf of =
uid
1000

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
