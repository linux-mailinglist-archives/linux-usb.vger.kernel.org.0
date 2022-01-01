Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01FC948283F
	for <lists+linux-usb@lfdr.de>; Sat,  1 Jan 2022 19:46:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231447AbiAASqs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Jan 2022 13:46:48 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:59260 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbiAASqs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Jan 2022 13:46:48 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id AD6E8CE049A
        for <linux-usb@vger.kernel.org>; Sat,  1 Jan 2022 18:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 103DFC36AED
        for <linux-usb@vger.kernel.org>; Sat,  1 Jan 2022 18:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641062805;
        bh=Uja0EXbICiyMFrRs7TMQ5i2VhDoqmF+JAAjEjMtTOd0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=TogcqWPGbDNd5PYmR9UC5etWcDR0FSuNN6WGpjRLWyMqH6cdf/Yo9vUlq/liP6Jcl
         P6vKCp4jW/V76Qd8gw2VaqyNn4vWrFlybOn4VCXZh9TQpFvuDnNQK/6v2SCYZ1YahJ
         HLxw7gV5lRrzUYv2DRYSDuKCPEtGq40iIW/pjcoT5mIwHN8aFjpT2iZ5NxKw8soPpA
         QnpsmwwloSkMdm2sL/nGcsGju/Fpv/CJzmSLxuzYvHiMtUXBHcNp4n3slIpxIUQ0iB
         eFG+08p311HBmRiIf1QGa21xFpm5fpcgL2SpF7bjE0hFPXjNCU0plKkNeS9qN10p0R
         SYnxdGI+cSnrQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EE3A8C04E57; Sat,  1 Jan 2022 18:46:44 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213839] XHCI 7 port usb hub does not work correctly
Date:   Sat, 01 Jan 2022 18:46:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: noodles@earth.li
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213839-208809-Q3PvjMM1XS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213839-208809@https.bugzilla.kernel.org/>
References: <bug-213839-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213839

--- Comment #16 from Jonathan McDowell (noodles@earth.li) ---
Excellent. Your fix appears to make things work fine. Built it on top of
5.12.12, plugged in the hub, plugged flash drive into a port off the second=
 hub
chip and it gets detected fine:

[   64.055322] usb 1-1: new full-speed USB device number 2 using xhci_hcd
[   64.223348] usb 1-1: New USB device found, idVendor=3D0a05, idProduct=3D=
7211,
bcdDevice=3D 1.00
[   64.223357] usb 1-1: New USB device strings: Mfr=3D0, Product=3D1,
SerialNumber=3D0
[   64.223360] usb 1-1: Product: USB2.0 HUB
[   64.272644] hub 1-1:1.0: USB hub found
[   64.275305] hub 1-1:1.0: 4 ports detected
[   64.715299] usb 1-1.4: new full-speed USB device number 3 using xhci_hcd
[   64.843578] usb 1-1.4: New USB device found, idVendor=3D0a05, idProduct=
=3D7211,
bcdDevice=3D 1.00
[   64.843584] usb 1-1.4: New USB device strings: Mfr=3D0, Product=3D1,
SerialNumber=3D0
[   64.843586] usb 1-1.4: Product: USB2.0 HUB
[   64.880662] hub 1-1.4:1.0: USB hub found
[   64.883305] hub 1-1.4:1.0: 4 ports detected
[   78.843353] usb 1-1.4.2: new full-speed USB device number 4 using xhci_h=
cd
[   78.982539] usb 1-1.4.2: not running at top speed; connect to a high spe=
ed
hub
[   79.000617] usb 1-1.4.2: New USB device found, idVendor=3D0951,
idProduct=3D1697, bcdDevice=3D 1.00
[   79.000626] usb 1-1.4.2: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[   79.000629] usb 1-1.4.2: Product: DT Ultimate G3
[   79.000631] usb 1-1.4.2: Manufacturer: Kingston
[   79.000633] usb 1-1.4.2: SerialNumber: 0018F30C9F50BE5181712973
[   79.013499] SCSI subsystem initialized
[   79.015328] usb-storage 1-1.4.2:1.0: USB Mass Storage device detected
[   79.015438] scsi host0: usb-storage 1-1.4.2:1.0
[   79.015492] usbcore: registered new interface driver usb-storage
[   79.016658] usbcore: registered new interface driver uas
[   80.026221] scsi 0:0:0:0: Direct-Access     Kingston DT Ultimate G3   PM=
AP
PQ: 0 ANSI: 6
[   80.029716] scsi 0:0:0:0: Attached scsi generic sg0 type 0
[   80.032151] sd 0:0:0:0: [sda] 61407232 512-byte logical blocks: (31.4
GB/29.3 GiB)
[   80.033068] sd 0:0:0:0: [sda] Write Protect is off
[   80.033070] sd 0:0:0:0: [sda] Mode Sense: 2b 80 00 08
[   80.033986] sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled,
doesn't support DPO or FUA
[   80.271640]  sda: sda1
[   80.275055] sd 0:0:0:0: [sda] Attached SCSI removable disk
[   82.061123] EXT4-fs (sda1): mounted filesystem with ordered data mode. O=
pts:
errors=3Dremount-ro. Quota mode: none.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
