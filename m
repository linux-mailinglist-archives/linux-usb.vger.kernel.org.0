Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 802B458C2D6
	for <lists+linux-usb@lfdr.de>; Mon,  8 Aug 2022 07:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234784AbiHHF3C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Aug 2022 01:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234670AbiHHF3B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Aug 2022 01:29:01 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FB90E0EC
        for <linux-usb@vger.kernel.org>; Sun,  7 Aug 2022 22:28:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id D5B1ACE0B33
        for <linux-usb@vger.kernel.org>; Mon,  8 Aug 2022 05:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EBEDC433D6
        for <linux-usb@vger.kernel.org>; Mon,  8 Aug 2022 05:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659936535;
        bh=IAHipI3KmqNurtXfA0NNGJ3Dy8SaW4Ggrw7bMJQkeqM=;
        h=From:To:Subject:Date:From;
        b=Ea6OriPZPlj0yVp8OqGGwLy6x2S2hMe1VBVTjjCHgT+eLNlwFwablnhZuDm4Bac3k
         BwoapUginfLDt4hENgyEeHz2CkXthTHvIsBuqyrOGPbaNHxi8lER7KVCIYJYd7n58p
         vQPLn12eJaWbQpU/Y+Uz6IAv2MG+MUgvywUcHyNK6tGjy8PhKaVoUTaJ6qSNKl2GzL
         3+LIb3xzADD7/JL45llb8dNp+IW4Uz25jDgnNnHEUgTbhzKCVDVMFtqrCGnfVq4V0L
         ELgdVGyAZQ3hfNtBxPxCsrOaJIJzTSeKrlUWYIMO8fLkB+U1+OyG2VAoXKX9IDeJ0+
         J9Ycq64NL3qpA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 03350C433E4; Mon,  8 Aug 2022 05:28:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216336] New: 3G USB Modem Huawei k4203 stop working on kernel >
 4.X
Date:   Mon, 08 Aug 2022 05:28:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: socratesdevel@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216336-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216336

            Bug ID: 216336
           Summary: 3G USB Modem Huawei k4203 stop working on kernel > 4.X
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.18.13
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: socratesdevel@protonmail.com
        Regression: No

i am new on kernel development,
i can successfully use my Huawei vodafone k4203 usb modem with kernel versi=
on
4.15(I test it on ubuntu-18.04.1 LTS with kernel 4.15 (i donwlaod this iso =
on
2018)) but when i try to use it with the newer 5.x.x kernel i get the error
"kernel: cdc_mbim 2-1.5:2.0: SET_NTB_FORMAT failed
kernel: cdc_mbim 2-1.5:2.0: bind() failure"

when I want to use I enter on ubuntu-18.04.1LTS, insert the device and rebo=
ot
and enter on fedora-36
but when I enter the fedora-36 and insert the device,  reboot and enter the
ubuntu-18.04.1 LTS, the device fails on ubuntu-18.04.1 LTS, just remove and
insert again and it works

Now i'm use (Fedora_36 kernel 5.18.13-200.x86_64)
I compiled the kernel-{5.4,4.19} longterm and the problem persist
But when I access the 4.x.x kernel then reboot the PC and access the 5.x.x
kernel it works, do you have any idea how I can solve this problem ? :)

Note: the modem has a dhcp server and web server.

My log on fedora-36:
[  115.571291] usb 2-1.4: new high-speed USB device number 7 using ehci-pci
[  115.652037] usb 2-1.4: New USB device found, idVendor=3D12d1, idProduct=
=3D1f1c,
bcdDevice=3D 1.02
[  115.652045] usb 2-1.4: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[  115.652049] usb 2-1.4: Product: HUAWEI Mobile
[  115.652052] usb 2-1.4: Manufacturer: Vodafone(Huawei)
[  115.652054] usb 2-1.4: SerialNumber: FFFFFFFFFFFFFFFF
[  115.779381] usb-storage 2-1.4:1.0: USB Mass Storage device detected
[  115.779821] scsi host4: usb-storage 2-1.4:1.0
[  115.779917] usbcore: registered new interface driver usb-storage
[  115.787770] usbcore: registered new interface driver uas
[  116.646327] usbcore: registered new interface driver cdc_ether
[  116.655897] usbcore: registered new interface driver cdc_ncm
[  116.665733] usbcore: registered new interface driver cdc_wdm
[  116.706710] cdc_mbim 2-1.4:2.0: SET_NTB_FORMAT failed
[  116.730917] cdc_mbim 2-1.4:2.0: bind() failure
[  116.730987] usbcore: registered new interface driver cdc_mbim
[  116.935660] usb 2-1.4: USB disconnect, device number 7
[  121.459317] usb 2-1.4: new high-speed USB device number 8 using ehci-pci
[  121.539511] usb 2-1.4: New USB device found, idVendor=3D12d1, idProduct=
=3D1f1c,
bcdDevice=3D 1.02
[  121.539520] usb 2-1.4: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[  121.539525] usb 2-1.4: Product: HUAWEI Mobile
[  121.539528] usb 2-1.4: Manufacturer: Vodafone(Huawei)
[  121.539531] usb 2-1.4: SerialNumber: FFFFFFFFFFFFFFFF
[  121.594546] usb-storage 2-1.4:1.0: USB Mass Storage device detected
[  121.594911] scsi host4: usb-storage 2-1.4:1.0
[  122.466808] cdc_mbim 2-1.4:2.0: SET_NTB_FORMAT failed
[  122.490514] cdc_mbim 2-1.4:2.0: bind() failure
[  122.567541] usb 2-1.4: USB disconnect, device number 8
[  127.091345] usb 2-1.4: new high-speed USB device number 9 using ehci-pci
[  127.172930] usb 2-1.4: New USB device found, idVendor=3D12d1, idProduct=
=3D1f1c,
bcdDevice=3D 1.02
[  127.172939] usb 2-1.4: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[  127.172943] usb 2-1.4: Product: HUAWEI Mobile
[  127.172947] usb 2-1.4: Manufacturer: Vodafone(Huawei)
[  127.172949] usb 2-1.4: SerialNumber: FFFFFFFFFFFFFFFF
[  127.226234] usb-storage 2-1.4:1.0: USB Mass Storage device detected
[  127.226706] scsi host4: usb-storage 2-1.4:1.0
[  128.090497] cdc_mbim 2-1.4:2.0: SET_NTB_FORMAT failed
[  128.114422] cdc_mbim 2-1.4:2.0: bind() failure
[  128.199565] usb 2-1.4: USB disconnect, device number 9

/var/lib/messages:
Aug  7 17:59:49 localhost kernel: usb 2-1.4: Product: HUAWEI Mobile
Aug  7 17:59:49 localhost kernel: usb 2-1.4: Manufacturer: Vodafone(Huawei)
Aug  7 17:59:49 localhost kernel: usb 2-1.4: SerialNumber: FFFFFFFFFFFFFFFF
Aug  7 17:59:49 localhost mtp-probe[1531]: checking bus 2, device 7:
"/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.4"
Aug  7 17:59:49 localhost mtp-probe[1531]: bus: 2, device: 7 was not an MTP
device
Aug  7 17:59:49 localhost systemd[1]: Created slice system-usb_modeswitch.s=
lice
- Slice /system/usb_modeswitch.
Aug  7 17:59:49 localhost systemd[1]: Starting usb_modeswitch@2-1.4:1.0.ser=
vice
- USB_ModeSwitch_2-1.4:1.0...
Aug  7 17:59:49 localhost kernel: usb-storage 2-1.4:1.0: USB Mass Storage
device detected
Aug  7 17:59:49 localhost kernel: scsi host4: usb-storage 2-1.4:1.0
Aug  7 17:59:49 localhost kernel: usbcore: registered new interface driver
usb-storage
Aug  7 17:59:49 localhost kernel: usbcore: registered new interface driver =
uas
Aug  7 17:59:49 localhost mtp-probe[1546]: checking bus 2, device 7:
"/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.4"
Aug  7 17:59:49 localhost mtp-probe[1546]: bus: 2, device: 7 was not an MTP
device
Aug  7 17:59:50 localhost usb_modeswitch[1551]: switch device 12d1:1f1c on
002/007
Aug  7 17:59:50 localhost kernel: usbcore: registered new interface driver
cdc_ether
Aug  7 17:59:50 localhost kernel: usbcore: registered new interface driver
cdc_ncm
Aug  7 17:59:50 localhost kernel: usbcore: registered new interface driver
cdc_wdm
Aug  7 17:59:50 localhost kernel: cdc_mbim 2-1.4:2.0: SET_NTB_FORMAT failed
Aug  7 17:59:50 localhost kernel: cdc_mbim 2-1.4:2.0: bind() failure
Aug  7 17:59:50 localhost kernel: usbcore: registered new interface driver
cdc_mbim
Aug  7 17:59:50 localhost kernel: usb 2-1.4: USB disconnect, device number 7
Aug  7 17:59:55 localhost kernel: usb 2-1.4: new high-speed USB device numb=
er 8
using ehci-pci
Aug  7 17:59:55 localhost kernel: usb 2-1.4: New USB device found,
idVendor=3D12d1, idProduct=3D1f1c, bcdDevice=3D 1.02
Aug  7 17:59:55 localhost kernel: usb 2-1.4: New USB device strings: Mfr=3D=
1,
Product=3D2, SerialNumber=3D3
Aug  7 17:59:55 localhost kernel: usb 2-1.4: Product: HUAWEI Mobile
Aug  7 17:59:55 localhost kernel: usb 2-1.4: Manufacturer: Vodafone(Huawei)
Aug  7 17:59:55 localhost kernel: usb 2-1.4: SerialNumber: FFFFFFFFFFFFFFFF
Aug  7 17:59:55 localhost kernel: usb-storage 2-1.4:1.0: USB Mass Storage
device detected
Aug  7 17:59:55 localhost kernel: scsi host4: usb-storage 2-1.4:1.0
Aug  7 17:59:55 localhost mtp-probe[1565]: checking bus 2, device 8:
"/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.4"
Aug  7 17:59:55 localhost mtp-probe[1565]: bus: 2, device: 8 was not an MTP
device
Aug  7 17:59:55 localhost systemd[1]: usb_modeswitch@2-1.4:1.0.service: Main
process exited, code=3Dkilled, status=3D15/TERM
Aug  7 17:59:55 localhost systemd[1]: usb_modeswitch@2-1.4:1.0.service: Fai=
led
with result 'signal'.
Aug  7 17:59:55 localhost systemd[1]: Stopped usb_modeswitch@2-1.4:1.0.serv=
ice
- USB_ModeSwitch_2-1.4:1.0.
Aug  7 17:59:55 localhost audit[1]: SERVICE_START pid=3D1 uid=3D0 auid=3D42=
94967295
ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0
msg=3D'unit=3Dusb_modeswitch@2-1.4:1.0 comm=3D"systemd"
exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Df=
ailed'
Aug  7 17:59:55 localhost systemd[1]: Starting usb_modeswitch@2-1.4:1.0.ser=
vice
- USB_ModeSwitch_2-1.4:1.0...
Aug  7 17:59:55 localhost mtp-probe[1575]: checking bus 2, device 8:
"/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.4"
Aug  7 17:59:55 localhost mtp-probe[1575]: bus: 2, device: 8 was not an MTP
device
Aug  7 17:59:55 localhost usb_modeswitch[1579]: switch device 12d1:1f1c on
002/008
Aug  7 17:59:56 localhost kernel: cdc_mbim 2-1.4:2.0: SET_NTB_FORMAT failed
Aug  7 17:59:56 localhost kernel: cdc_mbim 2-1.4:2.0: bind() failure
Aug  7 17:59:56 localhost kernel: usb 2-1.4: USB disconnect, device number 8
Aug  7 18:00:00 localhost kernel: usb 2-1.4: new high-speed USB device numb=
er 9
using ehci-pci
Aug  7 18:00:00 localhost kernel: usb 2-1.4: New USB device found,
idVendor=3D12d1, idProduct=3D1f1c, bcdDevice=3D 1.02
Aug  7 18:00:00 localhost kernel: usb 2-1.4: New USB device strings: Mfr=3D=
1,
Product=3D2, SerialNumber=3D3
Aug  7 18:00:00 localhost kernel: usb 2-1.4: Product: HUAWEI Mobile
Aug  7 18:00:00 localhost kernel: usb 2-1.4: Manufacturer: Vodafone(Huawei)
Aug  7 18:00:00 localhost kernel: usb 2-1.4: SerialNumber: FFFFFFFFFFFFFFFF
Aug  7 18:00:01 localhost kernel: usb-storage 2-1.4:1.0: USB Mass Storage
device detected
Aug  7 18:00:01 localhost kernel: scsi host4: usb-storage 2-1.4:1.0
Aug  7 18:00:01 localhost mtp-probe[1586]: checking bus 2, device 9:
"/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.4"
Aug  7 18:00:01 localhost mtp-probe[1586]: bus: 2, device: 9 was not an MTP
device
Aug  7 18:00:01 localhost systemd[1]: usb_modeswitch@2-1.4:1.0.service: Main
process exited, code=3Dkilled, status=3D15/TERM
Aug  7 18:00:01 localhost systemd[1]: usb_modeswitch@2-1.4:1.0.service: Fai=
led
with result 'signal'.
Aug  7 18:00:01 localhost systemd[1]: Stopped usb_modeswitch@2-1.4:1.0.serv=
ice
- USB_ModeSwitch_2-1.4:1.0.
Aug  7 18:00:01 localhost audit[1]: SERVICE_START pid=3D1 uid=3D0 auid=3D42=
94967295
ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0
msg=3D'unit=3Dusb_modeswitch@2-1.4:1.0 comm=3D"systemd"
exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Df=
ailed'
Aug  7 18:00:01 localhost mtp-probe[1594]: checking bus 2, device 9:
"/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.4"
Aug  7 18:00:01 localhost systemd[1]: Starting usb_modeswitch@2-1.4:1.0.ser=
vice
- USB_ModeSwitch_2-1.4:1.0...
Aug  7 18:00:01 localhost mtp-probe[1594]: bus: 2, device: 9 was not an MTP
device
Aug  7 18:00:01 localhost usb_modeswitch[1601]: switch device 12d1:1f1c on
002/009
Aug  7 18:00:01 localhost kernel: cdc_mbim 2-1.4:2.0: SET_NTB_FORMAT failed
Aug  7 18:00:01 localhost kernel: cdc_mbim 2-1.4:2.0: bind() failure
Aug  7 18:00:01 localhost kernel: usb 2-1.4: USB disconnect, device number 9
Aug  7 18:00:06 localhost kernel: usb 2-1.4: new high-speed USB device numb=
er
10 using ehci-pci
Aug  7 18:00:06 localhost kernel: usb 2-1.4: New USB device found,
idVendor=3D12d1, idProduct=3D1f1c, bcdDevice=3D 1.02
Aug  7 18:00:06 localhost kernel: usb 2-1.4: New USB device strings: Mfr=3D=
1,
Product=3D2, SerialNumber=3D3
Aug  7 18:00:06 localhost kernel: usb 2-1.4: Product: HUAWEI Mobile
Aug  7 18:00:06 localhost kernel: usb 2-1.4: Manufacturer: Vodafone(Huawei)
Aug  7 18:00:06 localhost kernel: usb 2-1.4: SerialNumber: FFFFFFFFFFFFFFFF
Aug  7 18:00:06 localhost kernel: usb-storage 2-1.4:1.0: USB Mass Storage
device detected
Aug  7 18:00:06 localhost kernel: scsi host4: usb-storage 2-1.4:1.0
Aug  7 18:00:06 localhost mtp-probe[1611]: checking bus 2, device 10:
"/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.4"
Aug  7 18:00:06 localhost mtp-probe[1611]: bus: 2, device: 10 was not an MTP
device
Aug  7 18:00:06 localhost systemd[1]: usb_modeswitch@2-1.4:1.0.service: Main
process exited, code=3Dkilled, status=3D15/TERM
Aug  7 18:00:06 localhost systemd[1]: usb_modeswitch@2-1.4:1.0.service: Fai=
led
with result 'signal'.
Aug  7 18:00:06 localhost systemd[1]: Stopped usb_modeswitch@2-1.4:1.0.serv=
ice
- USB_ModeSwitch_2-1.4:1.0.
Aug  7 18:00:06 localhost audit[1]: SERVICE_START pid=3D1 uid=3D0 auid=3D42=
94967295
ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0
msg=3D'unit=3Dusb_modeswitch@2-1.4:1.0 comm=3D"systemd"
exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Df=
ailed'
Aug  7 18:00:06 localhost systemd[1]: Starting usb_modeswitch@2-1.4:1.0.ser=
vice
- USB_ModeSwitch_2-1.4:1.0...
Aug  7 18:00:06 localhost mtp-probe[1620]: checking bus 2, device 10:
"/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.4"
Aug  7 18:00:06 localhost mtp-probe[1620]: bus: 2, device: 10 was not an MTP
device
Aug  7 18:00:07 localhost usb_modeswitch[1625]: switch device 12d1:1f1c on
002/010
Aug  7 18:00:07 localhost kernel: cdc_mbim 2-1.4:2.0: SET_NTB_FORMAT failed
Aug  7 18:00:07 localhost kernel: cdc_mbim 2-1.4:2.0: bind() failure
Aug  7 18:00:07 localhost kernel: usb 2-1.4: USB disconnect, device number =
10
Aug  7 18:00:12 localhost kernel: usb 2-1.4: new high-speed USB device numb=
er
11 using ehci-pci
Aug  7 18:00:12 localhost kernel: usb 2-1.4: New USB device found,
idVendor=3D12d1, idProduct=3D1f1c, bcdDevice=3D 1.02
Aug  7 18:00:12 localhost kernel: usb 2-1.4: New USB device strings: Mfr=3D=
1,
Product=3D2, SerialNumber=3D3
Aug  7 18:00:12 localhost kernel: usb 2-1.4: Product: HUAWEI Mobile
Aug  7 18:00:12 localhost kernel: usb 2-1.4: Manufacturer: Vodafone(Huawei)
Aug  7 18:00:12 localhost kernel: usb 2-1.4: SerialNumber: FFFFFFFFFFFFFFFF
Aug  7 18:00:12 localhost kernel: usb-storage 2-1.4:1.0: USB Mass Storage
device detected
Aug  7 18:00:12 localhost kernel: scsi host4: usb-storage 2-1.4:1.0
Aug  7 18:00:12 localhost mtp-probe[1633]: checking bus 2, device 11:
"/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.4"
Aug  7 18:00:12 localhost mtp-probe[1633]: bus: 2, device: 11 was not an MTP
device
Aug  7 18:00:12 localhost systemd[1]: usb_modeswitch@2-1.4:1.0.service: Main
process exited, code=3Dkilled, status=3D15/TERM
Aug  7 18:00:12 localhost systemd[1]: usb_modeswitch@2-1.4:1.0.service: Fai=
led
with result 'signal'.
Aug  7 18:00:12 localhost systemd[1]: Stopped usb_modeswitch@2-1.4:1.0.serv=
ice
- USB_ModeSwitch_2-1.4:1.0.
Aug  7 18:00:12 localhost audit[1]: SERVICE_START pid=3D1 uid=3D0 auid=3D42=
94967295
ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0
msg=3D'unit=3Dusb_modeswitch@2-1.4:1.0 comm=3D"systemd"
exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Df=
ailed'
Aug  7 18:00:12 localhost systemd[1]: Starting usb_modeswitch@2-1.4:1.0.ser=
vice
- USB_ModeSwitch_2-1.4:1.0...
Aug  7 18:00:12 localhost mtp-probe[1643]: checking bus 2, device 11:
"/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.4"
Aug  7 18:00:12 localhost mtp-probe[1643]: bus: 2, device: 11 was not an MTP
device
Aug  7 18:00:12 localhost usb_modeswitch[1647]: switch device 12d1:1f1c on
002/011
Aug  7 18:00:13 localhost kernel: cdc_mbim 2-1.4:2.0: SET_NTB_FORMAT failed
Aug  7 18:00:13 localhost kernel: cdc_mbim 2-1.4:2.0: bind() failure
Aug  7 18:00:13 localhost kernel: usb 2-1.4: USB disconnect, device number =
11
Aug  7 18:00:17 localhost kernel: usb 2-1.4: new high-speed USB device numb=
er
12 using ehci-pci
Aug  7 18:00:17 localhost kernel: usb 2-1.4: New USB device found,
idVendor=3D12d1, idProduct=3D1f1c, bcdDevice=3D 1.02
Aug  7 18:00:17 localhost kernel: usb 2-1.4: New USB device strings: Mfr=3D=
1,
Product=3D2, SerialNumber=3D3
Aug  7 18:00:17 localhost kernel: usb 2-1.4: Product: HUAWEI Mobile
Aug  7 18:00:17 localhost kernel: usb 2-1.4: Manufacturer: Vodafone(Huawei)
Aug  7 18:00:17 localhost kernel: usb 2-1.4: SerialNumber: FFFFFFFFFFFFFFFF
Aug  7 18:00:17 localhost kernel: usb-storage 2-1.4:1.0: USB Mass Storage
device detected
Aug  7 18:00:17 localhost kernel: scsi host4: usb-storage 2-1.4:1.0
Aug  7 18:00:17 localhost mtp-probe[1654]: checking bus 2, device 12:
"/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.4"
Aug  7 18:00:17 localhost mtp-probe[1654]: bus: 2, device: 12 was not an MTP
device
Aug  7 18:00:17 localhost systemd[1]: usb_modeswitch@2-1.4:1.0.service: Main
process exited, code=3Dkilled, status=3D15/TERM
Aug  7 18:00:17 localhost systemd[1]: usb_modeswitch@2-1.4:1.0.service: Fai=
led
with result 'signal'.
Aug  7 18:00:17 localhost systemd[1]: Stopped usb_modeswitch@2-1.4:1.0.serv=
ice
- USB_ModeSwitch_2-1.4:1.0.
Aug  7 18:00:17 localhost audit[1]: SERVICE_START pid=3D1 uid=3D0 auid=3D42=
94967295
ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0
msg=3D'unit=3Dusb_modeswitch@2-1.4:1.0 comm=3D"systemd"
exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Df=
ailed'
Aug  7 18:00:17 localhost systemd[1]: Starting usb_modeswitch@2-1.4:1.0.ser=
vice
- USB_ModeSwitch_2-1.4:1.0...
Aug  7 18:00:17 localhost mtp-probe[1663]: checking bus 2, device 12:
"/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.4"
Aug  7 18:00:17 localhost mtp-probe[1663]: bus: 2, device: 12 was not an MTP
device
Aug  7 18:00:18 localhost usb_modeswitch[1668]: switch device 12d1:1f1c on
002/012
Aug  7 18:00:18 localhost kernel: cdc_mbim 2-1.4:2.0: SET_NTB_FORMAT failed
Aug  7 18:00:18 localhost kernel: cdc_mbim 2-1.4:2.0: bind() failure
Aug  7 18:00:18 localhost kernel: usb 2-1.4: USB disconnect, device number =
12
Aug  7 18:00:25 localhost kernel: usb 2-1.4: new high-speed USB device numb=
er
13 using ehci-pci
Aug  7 18:00:25 localhost kernel: usb 2-1.4: New USB device found,
idVendor=3D12d1, idProduct=3D14fb, bcdDevice=3D 1.02
Aug  7 18:00:25 localhost kernel: usb 2-1.4: New USB device strings: Mfr=3D=
2,
Product=3D1, SerialNumber=3D0
Aug  7 18:00:25 localhost kernel: usb 2-1.4: Product: HUAWEI Mobile
Aug  7 18:00:25 localhost kernel: usb 2-1.4: Manufacturer: HUAWEI Technology
Aug  7 18:00:25 localhost mtp-probe[1672]: checking bus 2, device 13:
"/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.4"
Aug  7 18:00:25 localhost mtp-probe[1672]: bus: 2, device: 13 was not an MTP
device
Aug  7 18:00:25 localhost kernel: usbcore: registered new interface driver
option
Aug  7 18:00:25 localhost kernel: usbserial: USB Serial support registered =
for
GSM modem (1-port)
Aug  7 18:00:25 localhost kernel: option 2-1.4:1.0: GSM modem (1-port)
converter detected
Aug  7 18:00:25 localhost kernel: usb 2-1.4: GSM modem (1-port) converter n=
ow
attached to ttyUSB0
Aug  7 18:00:25 localhost kernel: option 2-1.4:1.1: GSM modem (1-port)
converter detected
Aug  7 18:00:25 localhost kernel: usb 2-1.4: GSM modem (1-port) converter n=
ow
attached to ttyUSB1
Aug  7 18:00:25 localhost mtp-probe[1679]: checking bus 2, device 13:
"/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.4"
Aug  7 18:00:25 localhost mtp-probe[1679]: bus: 2, device: 13 was not an MTP
device
Aug  7 18:00:38 localhost systemd[1]: usb_modeswitch@2-1.4:1.0.service:
Deactivated successfully.
Aug  7 18:00:38 localhost systemd[1]: Finished usb_modeswitch@2-1.4:1.0.ser=
vice
- USB_ModeSwitch_2-1.4:1.0.
Aug  7 18:00:38 localhost audit[1]: SERVICE_START pid=3D1 uid=3D0 auid=3D42=
94967295
ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0
msg=3D'unit=3Dusb_modeswitch@2-1.4:1.0 comm=3D"systemd"
exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Ds=
uccess'
Aug  7 18:00:38 localhost audit[1]: SERVICE_STOP pid=3D1 uid=3D0 auid=3D429=
4967295
ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0
msg=3D'unit=3Dusb_modeswitch@2-1.4:1.0 comm=3D"systemd"
exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Ds=
uccess'
Aug  7 18:00:48 localhost systemd[1149]: Starting grub-boot-success.service=
 -
Mark boot as successful...
Aug  7 18:00:48 localhost systemd[1149]: Finished grub-boot-success.service=
 -
Mark boot as successful.
Aug  7 18:00:57 localhost ModemManager[936]: <info>  [device
/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.4] creating modem with pl=
ugin
'huawei' and '2' ports
Aug  7 18:00:57 localhost ModemManager[936]: <warn>  [plugin/huawei] could =
not
grab port ttyUSB0: Cannot add port 'tty/ttyUSB0', unhandled port type
Aug  7 18:00:57 localhost ModemManager[936]: <warn>  [plugin/huawei] could =
not
grab port ttyUSB1: Cannot add port 'tty/ttyUSB1', unhandled port type
Aug  7 18:00:57 localhost ModemManager[936]: <warn>  [base-manager] couldn't
create modem for device '/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.=
4':
Failed to find primary AT port

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
