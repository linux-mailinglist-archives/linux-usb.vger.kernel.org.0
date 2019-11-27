Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEA0010AF10
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2019 12:54:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfK0Lyg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Nov 2019 06:54:36 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41585 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbfK0Lyf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Nov 2019 06:54:35 -0500
Received: by mail-oi1-f193.google.com with SMTP id e9so19834073oif.8
        for <linux-usb@vger.kernel.org>; Wed, 27 Nov 2019 03:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=AFS2VN7Af+/qYqe1SYOcJvD3i0CRNktr7ur96fjeC7k=;
        b=C9iq9OEjW2VEo2cSK5doe6syDFkNq4yQcjUQpM5E5MdO8b8HJA7h9M6PE7rDX5lWtA
         3SQjEpcdVtFUyjsWasUQfbKSiYCLKdCy/9VFDrkEDlRAgC+5jVf3cKe07A4MgqdJ0z1i
         S9L7meOOmyLNlU/9r0zGTRVZNexI3dBDuNv8qwTWVBHHlEEl5oxPWnJMdbtTMUv1Y7lL
         zevyzzgLuFeqf7yERJd8KnCWMbwI/cBFycEreBjtzSrcniI+iNVmjAy9P9Q/rK7stSCk
         ZE3Ksl1GyJoQ2qAEfP2a23qRDbD66syeUJR8DHdydA4EtSHZ5VIREORLdVghVMiyN8EA
         BnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=AFS2VN7Af+/qYqe1SYOcJvD3i0CRNktr7ur96fjeC7k=;
        b=Y4D8ka0HRzZpfAjJ2NxOFb2QY7qlvkoXpmcfk8JW01/Zxn3Y0Djy72JZ+GxH0TNUwT
         nz+4HXngEZOEY2pOgoQpYV74gdejp+xsp2W/CQCu8d4xpnTyoW7tZR/XopzZBZYU63t0
         sGWA5sMvBN6CDqdWewFeu9WtrXq08EtLAgC8rxbizNf6bo52WIbSr976EZk3aLCLxco+
         NsQqdsccmtXhhCWdYq+tGT95jWY/qRHjKDsWM6qt1MLMRi0gZowF56SCloSTyGCscgJo
         4wy5rLAWT/T2bDJeOKhiYiuHg+jkMmgAIBgvNe/e8xhFf8zAowFaKpsBblBhBzkcK/6p
         X+1g==
X-Gm-Message-State: APjAAAU7IFZtQvhG7Rd6g51NlnRhMko02yztApi7pXfWHof3HZL+Q1yS
        WK2lGChGapQhQFqhdg1EeP/rE418mHlq/JkR3clJObgkmubr
X-Google-Smtp-Source: APXvYqzfXxbyO07qn7OUDtBrOWjrzFUYGNkrIJXuzAF5xEoIsUunV0R5SyF46uKlmAe5ca01FJgxa5NA9PEr2SPRNoE=
X-Received: by 2002:a05:6808:906:: with SMTP id w6mr3536396oih.122.1574855672732;
 Wed, 27 Nov 2019 03:54:32 -0800 (PST)
MIME-Version: 1.0
References: <CAHG43MvgR1E18A-2znZsL2scfACQvy-9FrNcd+ZPq1ZzKcntJw@mail.gmail.com>
In-Reply-To: <CAHG43MvgR1E18A-2znZsL2scfACQvy-9FrNcd+ZPq1ZzKcntJw@mail.gmail.com>
From:   Pacho Ramos <pachoramos@gmail.com>
Date:   Wed, 27 Nov 2019 12:54:21 +0100
Message-ID: <CAHG43MtjJkdbtek5L4RUK2p5+hRftuQ=ShqLFfWJdkPthhFtiA@mail.gmail.com>
Subject: Re: ID 174c:55aa ASMedia Technology issues with UAS driver
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As I read in drivers/usb/storage/uas-detect.h it seems that these
problems can hit some 174c:55aa devices and not others as it seems
they are difficult to detect

According to lsusb -v output, my MaxPower is 0mA... that would point
to a ASM1153 - with working uas support... but it's not really working
:/

I have tried on some different systems, and it seems it fails on
laptops (two Dell with Gentoo and kernel 5.3.11 and  5.2.8 and one
Asus with Windows10 (!)). While it seems to work fine with a
non-laptop systems like an Optiplex 7050 (with Gentoo and kernel
5.3.11).

I then tried to see if it was working on another non-laptop system (a
Precision 7920 running Ubuntu 18.10 with their 5.0.0-36 kernel)... but
it fails there too with errors like:
[ 7027.520636] scsi 11:0:0:0: Direct-Access     USB      3.0
   0    PQ: 0 ANSI: 6
[ 7027.521160] sd 11:0:0:0: Attached scsi generic sg7 type 0
[ 7027.521599] sd 11:0:0:0: [sdg] 976773168 512-byte logical blocks:
(500 GB/466 GiB)
[ 7027.521708] sd 11:0:0:0: [sdg] Write Protect is off
[ 7027.521710] sd 11:0:0:0: [sdg] Mode Sense: 43 00 00 00
[ 7027.521872] sd 11:0:0:0: [sdg] Write cache: enabled, read cache:
enabled, doesn't support DPO or FUA
[ 7027.522069] sd 11:0:0:0: [sdg] Optimal transfer size 33553920 bytes
[ 7027.544118]  sdg: sdg1
[ 7027.545533] sd 11:0:0:0: [sdg] Attached SCSI disk
[ 7124.329288] sd 11:0:0:0: [sdg] tag#17 uas_eh_abort_handler 0
uas-tag 1 inflight: CMD IN
[ 7124.329292] sd 11:0:0:0: [sdg] tag#17 CDB: Read(10) 28 00 39 7c 24
c0 00 01 00 00
[ 7124.332005] sd 11:0:0:0: [sdg] tag#16 uas_eh_abort_handler 0
uas-tag 2 inflight: CMD IN
[ 7124.332006] sd 11:0:0:0: [sdg] tag#16 CDB: Read(10) 28 00 39 7c 23
c0 00 01 00 00
[ 7124.389294] scsi host11: uas_eh_device_reset_handler start
[ 7124.517883] usb 2-6: reset SuperSpeed Gen 1 USB device number 6
using xhci_hcd
[ 7124.541470] scsi host11: uas_eh_device_reset_handler success
[ 7157.097289] sd 11:0:0:0: [sdg] tag#9 uas_eh_abort_handler 0 uas-tag
1 inflight: CMD IN
[ 7157.097294] sd 11:0:0:0: [sdg] tag#9 CDB: Read(10) 28 00 39 7e 86
c0 00 01 00 00
[ 7157.097537] sd 11:0:0:0: [sdg] tag#8 uas_eh_abort_handler 0 uas-tag
2 inflight: CMD IN
[ 7157.097538] sd 11:0:0:0: [sdg] tag#8 CDB: Read(10) 28 00 39 7e 85
c0 00 01 00 00
[ 7157.173290] scsi host11: uas_eh_device_reset_handler start
[ 7157.301822] usb 2-6: reset SuperSpeed Gen 1 USB device number 6
using xhci_hcd
[ 7157.325396] scsi host11: uas_eh_device_reset_handler success
[ 7191.913297] sd 11:0:0:0: [sdg] tag#13 uas_eh_abort_handler 0
uas-tag 1 inflight: CMD IN
[ 7191.913301] sd 11:0:0:0: [sdg] tag#13 CDB: Read(10) 28 00 39 81 ba
c0 00 01 00 00
[ 7191.915558] sd 11:0:0:0: [sdg] tag#12 uas_eh_abort_handler 0
uas-tag 2 inflight: CMD IN
[ 7191.915560] sd 11:0:0:0: [sdg] tag#12 CDB: Read(10) 28 00 39 81 b9
c0 00 01 00 00
[ 7191.981287] scsi host11: uas_eh_device_reset_handler start
[ 7192.109849] usb 2-6: reset SuperSpeed Gen 1 USB device number 6
using xhci_hcd
[ 7192.133493] scsi host11: uas_eh_device_reset_handler success

I am a bit lost then.. maybe it's an issue with the power of the USB
ports? :/ For example in the Ubuntu system, I have just tried to force
it to use usb-storage and it also fails... but going back to the
Optiplex system... it still works fine, like being a completely normal
device. But I don't see what could show my the difference between the
working system and the rest. In any case, I also post here how dmesg
output looks in the system that works fine when I connect the device
to see if maybe you see a difference
[1016267.790343] usb 2-1: new SuperSpeed Gen 1 USB device number 5
using xhci_hcd
[1016267.802969] usb 2-1: New USB device found, idVendor=3D174c,
idProduct=3D55aa, bcdDevice=3D 1.00
[1016267.802970] usb 2-1: New USB device strings: Mfr=3D2, Product=3D3,
SerialNumber=3D1
[1016267.802971] usb 2-1: Product: 3.0
[1016267.802971] usb 2-1: Manufacturer: USB
[1016267.802972] usb 2-1: SerialNumber: 000000000001
[1016267.808691] scsi host4: uas
[1016267.809680] scsi 4:0:0:0: Direct-Access     USB      3.0
    0    PQ: 0 ANSI: 6
[1016267.810080] sd 4:0:0:0: Attached scsi generic sg2 type 0
[1016267.810744] sd 4:0:0:0: [sdb] 976773168 512-byte logical blocks:
(500 GB/466 GiB)
[1016267.810871] sd 4:0:0:0: [sdb] Write Protect is off
[1016267.810872] sd 4:0:0:0: [sdb] Mode Sense: 43 00 00 00
[1016267.811022] sd 4:0:0:0: [sdb] Write cache: enabled, read cache:
enabled, doesn't support DPO or FUA
[1016267.811199] sd 4:0:0:0: [sdb] Optimal transfer size 33553920 bytes
[1016267.833485]  sdb: sdb1
[1016267.835000] sd 4:0:0:0: [sdb] Attached SCSI disk

Thanks a lot

El dom., 24 nov. 2019 a las 20:49, Pacho Ramos
(<pachoramos@gmail.com>) escribi=C3=B3:
>
> Hello,
>
> I was reviewing a problem I was hitting with one of my boxes to
> connect external drives. The hard disk was working fine when it was
> under the original laptop that it belonged to and also works fine if I
> move it to a different usb box.
>
> I think it's an issue with this box and it seems a common issue as
> reported in other places:
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1742318
> https://unix.stackexchange.com/questions/441668/debian-usb3-hdd-uas-i-o-e=
rrors
> https://www.raspberrypi.org/forums/viewtopic.php?t=3D245931
> https://www.raspberrypi.org/forums/viewtopic.php?t=3D237829
> https://forum.manjaro.org/t/usb-disk-not-working-in-a-usb3-0-port/50736
>
> In summary, the disk works fine at the start but, after leaving it
> idle some minutes, it reports and I/O error and gets remounted because
> of that.
>
> Errors are like:
> [243037.109604] Buffer I/O error on dev sdc1, logical block 15262021,
> async page read
> [243038.045009] Buffer I/O error on dev sdc1, logical block 15262021,
> async page read
> [243038.750870] Buffer I/O error on dev sdc1, logical block 15262021,
> async page read
>
> or also:
> [243416.635232] Buffer I/O error on dev sdd1, logical block 15262021,
> async page read
>
> [243172.126230] scsi 2:0:0:0: Direct-Access     USB      3.0
>    0    PQ: 0 ANSI: 6
> [243172.126564] sd 2:0:0:0: Attached scsi generic sg2 type 0
> [243172.127195] sd 2:0:0:0: [sdc] 976773168 512-byte logical blocks:
> (500 GB/466 GiB)
> [243172.127332] sd 2:0:0:0: [sdc] Write Protect is off
> [243172.127333] sd 2:0:0:0: [sdc] Mode Sense: 43 00 00 00
> [243172.127494] sd 2:0:0:0: [sdc] Write cache: enabled, read cache:
> enabled, doesn't support DPO or FUA
> [243172.127732] sd 2:0:0:0: [sdc] Optimal transfer size 33553920 bytes
> [243172.166800]  sdc: sdc1
> [243172.185089] sd 2:0:0:0: [sdc] Attached SCSI disk
> [243416.635232] Buffer I/O error on dev sdd1, logical block 15262021,
> async page read
> [243616.891249] usb 2-3: USB disconnect, device number 6
> [243616.893787] sd 2:0:0:0: [sdc] Synchronizing SCSI cache
> [243617.013118] sd 2:0:0:0: [sdc] Synchronize Cache(10) failed:
> Result: hostbyte=3DDID_ERROR driverbyte=3DDRIVER_OK
> [243617.268239] usb 2-3: new SuperSpeed Gen 1 USB device number 7 using x=
hci_hcd
> [243617.281559] usb 2-3: New USB device found, idVendor=3D174c,
> idProduct=3D55aa, bcdDevice=3D 1.00
> [243617.281560] usb 2-3: New USB device strings: Mfr=3D2, Product=3D3,
> SerialNumber=3D1
> [243617.281561] usb 2-3: Product: 3.0
> [243617.281562] usb 2-3: Manufacturer: USB
> [243617.281562] usb 2-3: SerialNumber: 000000000001
> [243617.285598] scsi host2: uas
> [243617.285946] scsi 2:0:0:0: Direct-Access     USB      3.0
>    0    PQ: 0 ANSI: 6
> [243617.286547] sd 2:0:0:0: Attached scsi generic sg2 type 0
> [243617.287053] sd 2:0:0:0: [sdc] 976773168 512-byte logical blocks:
> (500 GB/466 GiB)
> [243617.287171] sd 2:0:0:0: [sdc] Write Protect is off
> [243617.287172] sd 2:0:0:0: [sdc] Mode Sense: 43 00 00 00
> [243617.287332] sd 2:0:0:0: [sdc] Write cache: enabled, read cache:
> enabled, doesn't support DPO or FUA
> [243617.287522] sd 2:0:0:0: [sdc] Optimal transfer size 33553920 bytes
> [243619.819009]  sdc: sdc1
> [243619.835850] sd 2:0:0:0: [sdc] Attached SCSI disk
>
> I am running kernel 5.3.11 on Gentoo and I attach the lsusb -v output
> for this device. What could I do to contribute to get this problem
> solved? Any concrete test? I would like to get this solved as, sadly,
> it seems that many hard disk boxes include this chipset and cause this
> issues.
>
> Thanks a lot
