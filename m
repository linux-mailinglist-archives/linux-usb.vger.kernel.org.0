Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83EFD3E4058
	for <lists+linux-usb@lfdr.de>; Mon,  9 Aug 2021 08:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233318AbhHIGnR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Aug 2021 02:43:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:51792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233234AbhHIGnQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Aug 2021 02:43:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C6D2360527
        for <linux-usb@vger.kernel.org>; Mon,  9 Aug 2021 06:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628491376;
        bh=kI0UZWSKN9sqfshVlny3EYmnuGmOXxyNYaBcYPqPW1g=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=F5Rv1VLYsmOGmKQ6qn8Ne4N0mlxa+MiG/kZaAlxI3LnIpAnszKYly5/CWu0+uGYc1
         dJaD868YAV2XAEXkcy/DFbqpo3pF1QcqUwSwaQkrPb3iuCAor+bjbJ6020v5aSmKuK
         bJ5Yog3vejCBbf7CZ7eBa/mpSjdNaanChh/kDmH+97J402Jx+OZMeUFPI4sPokWCry
         7rtVw7wRYzSSW/B/kJPG4AeISVMRFUW+q8/3af2AnZfCQ6KBr7T4rlUZCOKblY5ysc
         S14BQYYsyKvIHaTQLl2RJM5WrL65sQ7N8QqVszLJEsZPJpGF7RilaUciFyyMRaaJNx
         Q+RpCJvVpj7ig==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id B510560FDB; Mon,  9 Aug 2021 06:42:56 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213967] Thinkpad T14 Chicony Webcam not recognized by kernel
Date:   Mon, 09 Aug 2021 06:42:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bjorn@mork.no
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213967-208809-CsG4fvXHtw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213967-208809@https.bugzilla.kernel.org/>
References: <bug-213967-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213967

--- Comment #2 from Bj=C3=B8rn Mork (bjorn@mork.no) ---
bugzilla-daemon@bugzilla.kernel.org writes:

> https://bugzilla.kernel.org/show_bug.cgi?id=3D213967
>
> --- Comment #1 from Horatiu Ion (dev@horatiuion.com) ---
> I've managed to get some more info:
>
> On the non-working kernel versions, I get these messages during boot
>
> ```
> [    7.292465] xhci_hcd 0000:06:00.0: xHCI Host Controller
> [    7.292476] xhci_hcd 0000:06:00.0: new USB bus registered, assigned bus
> number 2
> [    7.292499] xhci_hcd 0000:06:00.0: Zeroing 64bit base registers, expec=
ting
> fault
> [   17.324564] xhci_hcd 0000:06:00.0: can't setup: -110
> [   17.324573] xhci_hcd 0000:06:00.0: USB bus 2 deregistered
> [   17.324679] xhci_hcd 0000:06:00.0: init 0000:06:00.0 fail, -110
> [   17.324697] xhci_hcd: probe of 0000:06:00.0 failed with error -110
> ```
>
> From what I could gather, it is timing out while trying to communicate wi=
th
> the
> USB device

Did you recently update your BIOS?

The reason I ask, is that I ended up with the same problem on my
Thinkpad X1 Carbon 4th Gen a few days ago after updating to the latest
revision (version 1.49 - obviously model specific and irrelevant. The
bios_date is 05/25/2021)


I tried the tricks I know of in an attempt to solve this without a reboot:
 - unloading and reloading the XHCI driver and the complete USB subsystem
 - removing the PCI device from the bus and rescan

Nothing of that helped. This is the log from the problem occured and
with all these attempts to "fix" it:

Aug  4 00:39:42 miraculix kernel: [18556.116475] xhci_hcd 0000:00:14.0: xHC=
 is
not running.
Aug  4 00:39:42 miraculix kernel: [18556.148257] xhci_hcd 0000:00:14.0: xHCI
host controller not responding, assume dead
Aug  4 00:39:42 miraculix kernel: [18556.148278] xhci_hcd 0000:00:14.0: HC
died; cleaning up
Aug  4 00:39:42 miraculix kernel: [18556.180743] usb 1-2: USB disconnect,
device number 2
Aug  4 00:39:42 miraculix kernel: [18556.181032] qcserial ttyUSB0: Qualcomm=
 USB
modem converter now disconnected from ttyUSB0
Aug  4 00:39:42 miraculix kernel: [18556.181059] qcserial 1-2:1.0: device
disconnected
Aug  4 00:39:42 miraculix kernel: [18556.181467] qcserial ttyUSB1: Qualcomm=
 USB
modem converter now disconnected from ttyUSB1
Aug  4 00:39:42 miraculix kernel: [18556.181496] qcserial 1-2:1.2: device
disconnected
Aug  4 00:39:42 miraculix kernel: [18556.182016] qcserial ttyUSB2: Qualcomm=
 USB
modem converter now disconnected from ttyUSB2
Aug  4 00:39:42 miraculix kernel: [18556.182057] qcserial 1-2:1.3: device
disconnected
Aug  4 00:39:42 miraculix kernel: [18556.182145] cdc_mbim 1-2:1.12 wwan0:
unregister 'cdc_mbim' usb-0000:00:14.0-2, CDC MBIM
Aug  4 00:39:42 miraculix kernel: [18556.196829] usb 1-7: USB disconnect,
device number 3
Aug  4 00:39:42 miraculix kernel: [18556.202586] usb 1-8: USB disconnect,
device number 4
Aug  4 00:39:42 miraculix kernel: [18556.244493] usb 1-9: USB disconnect,
device number 5
Aug  4 01:18:59 miraculix kernel: [20902.755697] xhci_hcd 0000:00:14.0: rem=
ove,
state 4
Aug  4 01:18:59 miraculix kernel: [20902.755703] usb usb2: USB disconnect,
device number 1
Aug  4 01:18:59 miraculix kernel: [20902.755934] xhci_hcd 0000:00:14.0: USB=
 bus
2 deregistered
Aug  4 01:18:59 miraculix kernel: [20902.755954] xhci_hcd 0000:00:14.0: rem=
ove,
state 4
Aug  4 01:18:59 miraculix kernel: [20902.755956] usb usb1: USB disconnect,
device number 1
Aug  4 01:18:59 miraculix kernel: [20912.758042] xhci_hcd 0000:00:14.0: USB=
 bus
1 deregistered
Aug  4 01:19:10 miraculix kernel: [20924.069460] xhci_hcd 0000:00:14.0: xHCI
Host Controller
Aug  4 01:19:10 miraculix kernel: [20924.069470] xhci_hcd 0000:00:14.0: new=
 USB
bus registered, assigned bus number 1
Aug  4 01:19:20 miraculix kernel: [20934.070403] xhci_hcd 0000:00:14.0: can=
't
setup: -110
Aug  4 01:19:20 miraculix kernel: [20934.070421] xhci_hcd 0000:00:14.0: USB=
 bus
1 deregistered
Aug  4 01:19:20 miraculix kernel: [20934.070573] xhci_hcd 0000:00:14.0: init
0000:00:14.0 fail, -110
Aug  4 01:19:20 miraculix kernel: [20934.070629] xhci_hcd: probe of
0000:00:14.0 failed with error -110
Aug  4 01:21:32 miraculix kernel: [21065.728049] xhci_hcd 0000:00:14.0: xHCI
Host Controller
Aug  4 01:21:32 miraculix kernel: [21065.728091] xhci_hcd 0000:00:14.0: new=
 USB
bus registered, assigned bus number 1
Aug  4 01:21:42 miraculix kernel: [21075.728994] xhci_hcd 0000:00:14.0: can=
't
setup: -110
Aug  4 01:21:42 miraculix kernel: [21075.729068] xhci_hcd 0000:00:14.0: USB=
 bus
1 deregistered
Aug  4 01:21:42 miraculix kernel: [21075.729234] xhci_hcd 0000:00:14.0: init
0000:00:14.0 fail, -110
Aug  4 01:21:42 miraculix kernel: [21075.729275] xhci_hcd: probe of
0000:00:14.0 failed with error -110
Aug  4 01:22:40 miraculix kernel: [21134.566144] usbcore: deregistering
interface driver btusb
Aug  4 01:22:58 miraculix kernel: [21152.129055] usbcore: deregistering
interface driver cdc_mbim
Aug  4 01:22:58 miraculix kernel: [21152.152995] usbcore: deregistering
interface driver cdc_ncm
Aug  4 01:22:58 miraculix kernel: [21152.189604] usbcore: deregistering
interface driver cdc_ether
Aug  4 01:22:58 miraculix kernel: [21152.257441] usbcore: deregistering
interface driver cdc_wdm
Aug  4 01:23:17 miraculix kernel: [21170.766144] usbserial: USB Serial
deregistering driver Qualcomm USB modem
Aug  4 01:23:17 miraculix kernel: [21170.766170] usbcore: deregistering
interface driver qcserial
Aug  4 01:23:17 miraculix kernel: [21170.809014] usbserial: USB Serial
deregistering driver generic
Aug  4 01:23:17 miraculix kernel: [21170.809076] usbcore: deregistering
interface driver usbserial_generic
Aug  4 01:23:56 miraculix kernel: [21210.258661] usbcore: deregistering
interface driver uvcvideo
Aug  4 01:23:56 miraculix kernel: [21210.276965] usbcore: deregistering dev=
ice
driver usb
Aug  4 01:23:56 miraculix kernel: [21210.277049] usbcore: deregistering
interface driver usbfs
Aug  4 01:23:56 miraculix kernel: [21210.277104] usbcore: deregistering
interface driver hub
Aug  4 01:23:56 miraculix kernel: [21210.277157] ACPI: bus type USB
unregistered
Aug  4 01:24:17 miraculix kernel: [21230.786839] ACPI: bus type USB registe=
red
Aug  4 01:24:17 miraculix kernel: [21230.786869] usbcore: registered new
interface driver usbfs
Aug  4 01:24:17 miraculix kernel: [21230.786876] usbcore: registered new
interface driver hub
Aug  4 01:24:17 miraculix kernel: [21230.786886] usbcore: registered new de=
vice
driver usb
Aug  4 01:24:17 miraculix kernel: [21230.799890] xhci_hcd 0000:00:14.0: xHCI
Host Controller
Aug  4 01:24:17 miraculix kernel: [21230.799899] xhci_hcd 0000:00:14.0: new=
 USB
bus registered, assigned bus number 1
Aug  4 01:24:27 miraculix kernel: [21240.800799] xhci_hcd 0000:00:14.0: can=
't
setup: -110
Aug  4 01:24:27 miraculix kernel: [21240.800815] xhci_hcd 0000:00:14.0: USB=
 bus
1 deregistered
Aug  4 01:24:27 miraculix kernel: [21240.800968] xhci_hcd 0000:00:14.0: init
0000:00:14.0 fail, -110
Aug  4 01:24:27 miraculix kernel: [21240.801008] xhci_hcd: probe of
0000:00:14.0 failed with error -110
Aug  4 01:26:25 miraculix kernel: [21358.881499] pci 0000:00:14.0: Removing
from iommu group 4
Aug  4 01:27:14 miraculix kernel: [21408.264723] pci 0000:00:14.0: [8086:9d=
2f]
type 00 class 0x0c0330
Aug  4 01:27:14 miraculix kernel: [21408.264775] pci 0000:00:14.0: reg 0x10:
[mem 0xe1320000-0xe132ffff 64bit]
Aug  4 01:27:14 miraculix kernel: [21408.264956] pci 0000:00:14.0: PME#
supported from D3hot D3cold
Aug  4 01:27:14 miraculix kernel: [21408.265882] pci 0000:00:14.0: Adding to
iommu group 4
Aug  4 01:27:14 miraculix kernel: [21408.266313] pci 0000:00:14.0: BAR 0:
assigned [mem 0xbc800000-0xbc80ffff 64bit]
Aug  4 01:27:14 miraculix kernel: [21408.267948] xhci_hcd 0000:00:14.0: xHCI
Host Controller
Aug  4 01:27:14 miraculix kernel: [21408.267981] xhci_hcd 0000:00:14.0: new=
 USB
bus registered, assigned bus number 1
Aug  4 01:27:24 miraculix kernel: [21418.268892] xhci_hcd 0000:00:14.0: can=
't
setup: -110
Aug  4 01:27:24 miraculix kernel: [21418.268909] xhci_hcd 0000:00:14.0: USB=
 bus
1 deregistered
Aug  4 01:27:24 miraculix kernel: [21418.269039] xhci_hcd 0000:00:14.0: init
0000:00:14.0 fail, -110
Aug  4 01:27:24 miraculix kernel: [21418.269055] xhci_hcd: probe of
0000:00:14.0 failed with error -110
Aug  4 01:32:14 miraculix kernel: [21708.108060] usbcore: deregistering dev=
ice
driver usb
Aug  4 01:32:14 miraculix kernel: [21708.108133] usbcore: deregistering
interface driver usbfs
Aug  4 01:32:14 miraculix kernel: [21708.108182] usbcore: deregistering
interface driver hub
Aug  4 01:32:14 miraculix kernel: [21708.108229] ACPI: bus type USB
unregistered
Aug  4 01:32:18 miraculix kernel: [21712.318741] ACPI: bus type USB registe=
red
Aug  4 01:32:18 miraculix kernel: [21712.318811] usbcore: registered new
interface driver usbfs
Aug  4 01:32:18 miraculix kernel: [21712.318820] usbcore: registered new
interface driver hub
Aug  4 01:32:18 miraculix kernel: [21712.318832] usbcore: registered new de=
vice
driver usb
Aug  4 01:32:18 miraculix kernel: [21712.332851] xhci_hcd 0000:00:14.0: xHCI
Host Controller
Aug  4 01:32:18 miraculix kernel: [21712.332857] xhci_hcd 0000:00:14.0: new=
 USB
bus registered, assigned bus number 1
Aug  4 01:32:28 miraculix kernel: [21722.333756] xhci_hcd 0000:00:14.0: can=
't
setup: -110
Aug  4 01:32:28 miraculix kernel: [21722.333774] xhci_hcd 0000:00:14.0: USB=
 bus
1 deregistered
Aug  4 01:32:28 miraculix kernel: [21722.333936] xhci_hcd 0000:00:14.0: init
0000:00:14.0 fail, -110
Aug  4 01:32:28 miraculix kernel: [21722.333950] xhci_hcd: probe of
0000:00:14.0 failed with error -110


The reboot after the BIOS update was at Aug  3 19:30:30, so it took at
few hours before the problem appeared.  It was still close enough that I
assume there might be a relation, given that BIOS updates is a very rare
event for me...


So I took the generic advise I never follow: Reloading BIOS default
settings.

This might have solved the issue.  I have not seen it since.  But as you
see: It's only been a few days, so that could be just a co-incidence.

But pease try. This will give us more data either it helps or not.



Bj=C3=B8rn

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
