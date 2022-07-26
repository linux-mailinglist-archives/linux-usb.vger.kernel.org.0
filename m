Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5368A580A36
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jul 2022 06:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237162AbiGZEFE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jul 2022 00:05:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231184AbiGZEFD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Jul 2022 00:05:03 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D851F2A402
        for <linux-usb@vger.kernel.org>; Mon, 25 Jul 2022 21:05:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8A179B81109
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 04:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D844C341C0
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 04:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658808299;
        bh=sKVjzyqDF8A4TIWj9f8q85fJejGfM9PDnEP3MXhxizg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=axGcNdFMqm9+bzcYsMuY9ut+wrYnO/wVzN5+SqhyDR1P9m33EgQwPc7lhsbKmR1ob
         ZuJ4pFpy6JGb44Da9BjPr9GPzSCuvDcKURORjbejdtejkNnYfy880zSKyo+1Osjdxk
         Kb83oPlrdZmtIBPKzYmlTjs6safoD8rfWaG5dW9A0ALPsACLWgkhEGY+41Sk3TlKe7
         WRmAUmTZaHkr9egaEc/aJEk5nLPMoGeDyQXDzp8f9zEuvQJjKWLIUYTcVuRyBy0sBA
         yD4+5ctAE7nA9BpgIxMp2tp8IYkZqop1HsthF48FD39NMxbHpy9tlX5ZpOAcpJ0xow
         lFYn/JNdlDq9g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2D283C05FD2; Tue, 26 Jul 2022 04:04:59 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216282] usb-mass storage
Date:   Tue, 26 Jul 2022 04:04:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: audioprof2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216282-208809-ptQiY9mFM4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216282-208809@https.bugzilla.kernel.org/>
References: <bug-216282-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216282

--- Comment #6 from audioprof2001@yahoo.com ---
Similar:
https://superuser.com/questions/1206664/disable-mtp-udev-rules-for-specific=
-device-so-it-can-be-mount-as-a-usb-mass-stor

No HDD:

$ journalctl -fe

Jul 25 22:52:29 P- kernel: usb 2-4: new SuperSpeed USB device number 11 usi=
ng
xhci_hcd
Jul 25 22:52:29 P- kernel: usb 2-4: New USB device found, idVendor=3D174c,
idProduct=3D5106, bcdDevice=3D 1.00
Jul 25 22:52:29 P- kernel: usb 2-4: New USB device strings: Mfr=3D2, Produc=
t=3D3,
SerialNumber=3D1
Jul 25 22:52:29 P- kernel: usb 2-4: Product: BlacX
Jul 25 22:52:29 P- kernel: usb 2-4: Manufacturer: Thermaltake
Jul 25 22:52:29 P- kernel: usb 2-4: SerialNumber: 000000000002
Jul 25 22:52:29 P- kernel: usb-storage 2-4:1.0: USB Mass Storage device
detected
Jul 25 22:52:29 P- kernel: scsi host2: usb-storage 2-4:1.0
Jul 25 22:52:29 P- mtp-probe[247971]: checking bus 2, device 11:
"/sys/devices/pci0000:00/0000:00:14.0/usb2/2-4"
Jul 25 22:52:29 P- mtp-probe[247971]: bus: 2, device: 11 was not an MTP dev=
ice
Jul 25 22:52:29 P- systemd-udevd[247970]: 2-4:1.0: Process
'/usr/lib/snapd/snap-device-helper bind snap_remmina_remmina
/devices/pci0000:00/0000:00:14.0/usb2/2-4/2-4:1.0 0:0' failed with exit cod=
e 1.
Jul 25 22:52:29 P- mtp-probe[247990]: checking bus 2, device 11:
"/sys/devices/pci0000:00/0000:00:14.0/usb2/2-4"
Jul 25 22:52:29 P- mtp-probe[247990]: bus: 2, device: 11 was not an MTP dev=
ice
Jul 25 22:52:29 P- systemd-udevd[247970]: 2-4: Process
'/usr/lib/snapd/snap-device-helper bind snap_remmina_remmina
/devices/pci0000:00/0000:00:14.0/usb2/2-4 189:138' failed with exit code 1.

Jul 25 22:52:36 P- smartd[1378]: Device: /dev/sda [SAT], SMART Usage Attrib=
ute:
190 Airflow_Temperature_Cel changed from 71 to 72
Jul 25 22:52:36 P- smartd[1378]: Device: /dev/sdb [SAT], SMART Usage Attrib=
ute:
194 Temperature_Celsius changed from 73 to 75

Jul 25 22:52:44 P- NetworkManager[1318]: <info>  [1658807564.5537] dhcp4
(enp3s0f0): state changed new lease, address=3D192.168.0.00

Jul 25 22:52:54 P- kernel: usb 2-4: reset SuperSpeed USB device number 11 u=
sing
xhci_hcd
Jul 25 22:52:58 P- rtkit-daemon[2222]: Supervising 7 threads of 5 processes=
 of
1 users.
Jul 25 22:52:58 P- rtkit-daemon[2222]: Supervising 7 threads of 5 processes=
 of
1 users.


HDD OK:

Jul 25 22:59:42 P- kernel: usb 2-4: USB disconnect, device number 11
Jul 25 22:59:42 P- systemd-udevd[249165]: 2-4:1.0: Process
'/usr/lib/snapd/snap-device-helper unbind snap_remmina_remmina
/devices/pci0000:00/0000:00:14.0/usb2/2-4/2-4:1.0 0:0' failed with exit cod=
e 1.
Jul 25 22:59:42 P- systemd-udevd[249159]: 2-4: Process
'/usr/lib/snapd/snap-device-helper unbind snap_remmina_remmina
/devices/pci0000:00/0000:00:14.0/usb2/2-4 189:138' failed with exit code 1.

Jul 25 22:59:46 P- kernel: usb 2-4: new SuperSpeed USB device number 12 usi=
ng
xhci_hcd
Jul 25 22:59:46 P- kernel: usb 2-4: New USB device found, idVendor=3D174c,
idProduct=3D5106, bcdDevice=3D 1.00
Jul 25 22:59:46 P- kernel: usb 2-4: New USB device strings: Mfr=3D2, Produc=
t=3D3,
SerialNumber=3D1
Jul 25 22:59:46 P- kernel: usb 2-4: Product: BlacX
Jul 25 22:59:46 P- kernel: usb 2-4: Manufacturer: Thermaltake
Jul 25 22:59:46 P- kernel: usb 2-4: SerialNumber: 000000000002
Jul 25 22:59:46 P- kernel: usb-storage 2-4:1.0: USB Mass Storage device
detected
Jul 25 22:59:46 P- kernel: scsi host2: usb-storage 2-4:1.0
Jul 25 22:59:46 P- mtp-probe[249185]: checking bus 2, device 12:
"/sys/devices/pci0000:00/0000:00:14.0/usb2/2-4"
Jul 25 22:59:46 P- mtp-probe[249185]: bus: 2, device: 12 was not an MTP dev=
ice
Jul 25 22:59:46 P- systemd-udevd[249180]: 2-4:1.0: Process
'/usr/lib/snapd/snap-device-helper bind snap_remmina_remmina
/devices/pci0000:00/0000:00:14.0/usb2/2-4/2-4:1.0 0:0' failed with exit cod=
e 1.
Jul 25 22:59:46 P- mtp-probe[249205]: checking bus 2, device 12:
"/sys/devices/pci0000:00/0000:00:14.0/usb2/2-4"
Jul 25 22:59:46 P- mtp-probe[249205]: bus: 2, device: 12 was not an MTP dev=
ice
Jul 25 22:59:46 P- systemd-udevd[249180]: 2-4: Process
'/usr/lib/snapd/snap-device-helper bind snap_remmina_remmina
/devices/pci0000:00/0000:00:14.0/usb2/2-4 189:139' failed with exit code 1.
Jul 25 22:59:47 P- kernel: scsi 2:0:0:0: Direct-Access     ST18000N M013J=
=20=20=20=20=20=20
     GH02 PQ: 0 ANSI: 5
Jul 25 22:59:47 P- kernel: sd 2:0:0:0: Attached scsi generic sg2 type 0
Jul 25 22:59:47 P- kernel: sd 2:0:0:0: [sdc] Very big device. Trying to use
READ CAPACITY(16).
Jul 25 22:59:47 P- kernel: sd 2:0:0:0: [sdc] 35156656128 512-byte logical
blocks: (18.0 TB/16.4 TiB)
Jul 25 22:59:47 P- kernel: sd 2:0:0:0: [sdc] Write Protect is off
Jul 25 22:59:47 P- kernel: sd 2:0:0:0: [sdc] Mode Sense: 23 00 00 00
Jul 25 22:59:47 P- kernel: sd 2:0:0:0: [sdc] No Caching mode page found
Jul 25 22:59:47 P- kernel: sd 2:0:0:0: [sdc] Assuming drive cache: write
through
Jul 25 22:59:47 P- kernel:  sdc: sdc1 sdc2
Jul 25 22:59:47 P- kernel: sd 2:0:0:0: [sdc] Attached SCSI disk
Jul 25 22:59:47 P- systemd-udevd[249180]: sdc: Process '/usr/bin/unshare -m
/usr/bin/snap auto-import --mount=3D/dev/sdc' failed with exit code 1.
Jul 25 22:59:47 P- dbus-daemon[1317]: [system] Activating service
name=3D'org.kde.kded.smart' requested by ':1.52' (uid=3D1000 pid=3D2607
comm=3D"/usr/bin/kded5 " label=3D"unconfined") (using servicehelper)
Jul 25 22:59:47 P- dbus-daemon[1317]: [system] Successfully activated servi=
ce
'org.kde.kded.smart'
Jul 25 22:59:48 P- systemd-udevd[249180]: sdc1: Process '/usr/bin/unshare -m
/usr/bin/snap auto-import --mount=3D/dev/sdc1' failed with exit code 1.
Jul 25 22:59:48 P- systemd-udevd[249184]: sdc2: Process '/usr/bin/unshare -m
/usr/bin/snap auto-import --mount=3D/dev/sdc2' failed with exit code 1.
Jul 25 22:59:48 P- kernel: ntfs3: Unknown parameter 'windows_names'


Jul 25 22:59:49 P- ntfs-3g[249239]: Version 2021.8.22 integrated FUSE 28
Jul 25 22:59:49 P- ntfs-3g[249239]: Mounted /dev/sdc2 (Read-Write, label
"18-TB-1", NTFS 3.1)
Jul 25 22:59:49 P- ntfs-3g[249239]: Cmdline options:
rw,nodev,nosuid,uid=3D1000,gid=3D1000,windows_names,uhelper=3Dudisks2
Jul 25 22:59:49 P- ntfs-3g[249239]: Mount options:
nodev,nosuid,uhelper=3Dudisks2,allow_other,nonempty,relatime,rw,default_per=
missions,fsname=3D/dev/sdc2,blkdev,blksize=3D4096
Jul 25 22:59:49 P- ntfs-3g[249239]: Global ownership and permissions enforc=
ed,
configuration type 7
Jul 25 22:59:49 P- udisksd[1404]: Mounted /dev/sdc2 at /media/mama/18-TB-1 =
on
behalf of uid 1000

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
