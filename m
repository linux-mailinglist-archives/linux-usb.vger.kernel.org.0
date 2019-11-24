Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8A41084CD
	for <lists+linux-usb@lfdr.de>; Sun, 24 Nov 2019 20:49:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbfKXTtc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 Nov 2019 14:49:32 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42971 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbfKXTtc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 Nov 2019 14:49:32 -0500
Received: by mail-ot1-f65.google.com with SMTP id 66so4605094otd.9
        for <linux-usb@vger.kernel.org>; Sun, 24 Nov 2019 11:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=EqACbYyhsoKDUGLCuVLvSFyddVudrnKErlAOLzTt0RY=;
        b=GWvwr1851GmPqYD3Peiw2nKZ5LOdxbczNyk7cvKY44gqmkujy6Za2LNpcftujm1JUF
         75/Xp2XvoqYVCRki3KxEP30j/YLSN73nmuNLz1l8F11hQmm+FPkucNQm6p7aYrJ1XObB
         I7wRs63SKsGwjbzHCbInbjSljNW1sKXIURfCbdnU/IFxIteMjmLA5QFVyKMtA9DJ8bTg
         kJYAfCH7pthEUTC2ql23MVG2p/ovINFqB3bWFYPEKx7FNHlBl0nBkiaIxRyMudWVsGKA
         oMJokxSnYmtvu389YGhel+I2ffZfH8LDqyE1U6SLcianT9L6PPB32qzPd6wX34WUgAY9
         x8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=EqACbYyhsoKDUGLCuVLvSFyddVudrnKErlAOLzTt0RY=;
        b=StZDdFPQRedxctPjSSqUcD7sMz7G8gNbzF0vewFQsog1CkDsn6vjS3yigEUGkcZuto
         UdlLPH+hyz4VIzMRx6LaD3np24eXQQ7Ql7KbKsXk+sDMm2ws9SjQtuni6VGgKt0hR1J+
         sOq3ilsBKj51nw+aVCRo/Wq2OfgcKwveiX3ugXIkspbb+jw2sCIuUox/hGTAytf+5oQ0
         HDC0ZVHl9BqorLduCv7juhMisimL0GQpSTWDI+Dj6gpVp4bERIbQK0biSKF4oZt+ONP8
         Bht/m1yb7Le8N8Mc3NjCg1P9yQvJfFFWpaQ6zFklMRGOocmGDsT971xcjkuUR1YfWJRl
         ebIA==
X-Gm-Message-State: APjAAAVjhWoZcqQ+Fc6BEPJyzR5eJnZqSX0dfoszEfozPfWSJfybchNi
        w2m2OfvFc84gA5ezaPJ72WM46JIbjw2Q7PQ74dBw+Ta8pw==
X-Google-Smtp-Source: APXvYqxkYR1YMBtfWUK7E6YF1rhs29AXIa+5Nb+eLAeNkV4zjJcsp0uN2Oy0JugeSR6Z66mAdBVETa6TnsEqTSYZlXA=
X-Received: by 2002:a9d:71cc:: with SMTP id z12mr17057375otj.124.1574624970368;
 Sun, 24 Nov 2019 11:49:30 -0800 (PST)
MIME-Version: 1.0
From:   Pacho Ramos <pachoramos@gmail.com>
Date:   Sun, 24 Nov 2019 20:49:19 +0100
Message-ID: <CAHG43MvgR1E18A-2znZsL2scfACQvy-9FrNcd+ZPq1ZzKcntJw@mail.gmail.com>
Subject: ID 174c:55aa ASMedia Technology issues with UAS driver
To:     linux-usb@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000003965605981cf212"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--00000000000003965605981cf212
Content-Type: text/plain; charset="UTF-8"

Hello,

I was reviewing a problem I was hitting with one of my boxes to
connect external drives. The hard disk was working fine when it was
under the original laptop that it belonged to and also works fine if I
move it to a different usb box.

I think it's an issue with this box and it seems a common issue as
reported in other places:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1742318
https://unix.stackexchange.com/questions/441668/debian-usb3-hdd-uas-i-o-errors
https://www.raspberrypi.org/forums/viewtopic.php?t=245931
https://www.raspberrypi.org/forums/viewtopic.php?t=237829
https://forum.manjaro.org/t/usb-disk-not-working-in-a-usb3-0-port/50736

In summary, the disk works fine at the start but, after leaving it
idle some minutes, it reports and I/O error and gets remounted because
of that.

Errors are like:
[243037.109604] Buffer I/O error on dev sdc1, logical block 15262021,
async page read
[243038.045009] Buffer I/O error on dev sdc1, logical block 15262021,
async page read
[243038.750870] Buffer I/O error on dev sdc1, logical block 15262021,
async page read

or also:
[243416.635232] Buffer I/O error on dev sdd1, logical block 15262021,
async page read

[243172.126230] scsi 2:0:0:0: Direct-Access     USB      3.0
   0    PQ: 0 ANSI: 6
[243172.126564] sd 2:0:0:0: Attached scsi generic sg2 type 0
[243172.127195] sd 2:0:0:0: [sdc] 976773168 512-byte logical blocks:
(500 GB/466 GiB)
[243172.127332] sd 2:0:0:0: [sdc] Write Protect is off
[243172.127333] sd 2:0:0:0: [sdc] Mode Sense: 43 00 00 00
[243172.127494] sd 2:0:0:0: [sdc] Write cache: enabled, read cache:
enabled, doesn't support DPO or FUA
[243172.127732] sd 2:0:0:0: [sdc] Optimal transfer size 33553920 bytes
[243172.166800]  sdc: sdc1
[243172.185089] sd 2:0:0:0: [sdc] Attached SCSI disk
[243416.635232] Buffer I/O error on dev sdd1, logical block 15262021,
async page read
[243616.891249] usb 2-3: USB disconnect, device number 6
[243616.893787] sd 2:0:0:0: [sdc] Synchronizing SCSI cache
[243617.013118] sd 2:0:0:0: [sdc] Synchronize Cache(10) failed:
Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK
[243617.268239] usb 2-3: new SuperSpeed Gen 1 USB device number 7 using xhci_hcd
[243617.281559] usb 2-3: New USB device found, idVendor=174c,
idProduct=55aa, bcdDevice= 1.00
[243617.281560] usb 2-3: New USB device strings: Mfr=2, Product=3,
SerialNumber=1
[243617.281561] usb 2-3: Product: 3.0
[243617.281562] usb 2-3: Manufacturer: USB
[243617.281562] usb 2-3: SerialNumber: 000000000001
[243617.285598] scsi host2: uas
[243617.285946] scsi 2:0:0:0: Direct-Access     USB      3.0
   0    PQ: 0 ANSI: 6
[243617.286547] sd 2:0:0:0: Attached scsi generic sg2 type 0
[243617.287053] sd 2:0:0:0: [sdc] 976773168 512-byte logical blocks:
(500 GB/466 GiB)
[243617.287171] sd 2:0:0:0: [sdc] Write Protect is off
[243617.287172] sd 2:0:0:0: [sdc] Mode Sense: 43 00 00 00
[243617.287332] sd 2:0:0:0: [sdc] Write cache: enabled, read cache:
enabled, doesn't support DPO or FUA
[243617.287522] sd 2:0:0:0: [sdc] Optimal transfer size 33553920 bytes
[243619.819009]  sdc: sdc1
[243619.835850] sd 2:0:0:0: [sdc] Attached SCSI disk

I am running kernel 5.3.11 on Gentoo and I attach the lsusb -v output
for this device. What could I do to contribute to get this problem
solved? Any concrete test? I would like to get this solved as, sadly,
it seems that many hard disk boxes include this chipset and cause this
issues.

Thanks a lot

--00000000000003965605981cf212
Content-Type: application/octet-stream; name=1
Content-Disposition: attachment; filename=1
Content-Transfer-Encoding: base64
Content-ID: <f_k3df1j9e0>
X-Attachment-Id: f_k3df1j9e0

CkJ1cyAwMDIgRGV2aWNlIDAxMDogSUQgMTc0Yzo1NWFhIEFTTWVkaWEgVGVjaG5vbG9neSBJbmMu
IE5hbWU6IEFTTTEwNTFFIFNBVEEgNkdiL3MgYnJpZGdlLCBBU00xMDUzRSBTQVRBIDZHYi9zIGJy
aWRnZSwgQVNNMTE1MyBTQVRBIDNHYi9zIGJyaWRnZSwgQVNNMTE1M0UgU0FUQSA2R2IvcyBicmlk
Z2UKRGV2aWNlIERlc2NyaXB0b3I6CiAgYkxlbmd0aCAgICAgICAgICAgICAgICAxOAogIGJEZXNj
cmlwdG9yVHlwZSAgICAgICAgIDEKICBiY2RVU0IgICAgICAgICAgICAgICAzLjAwCiAgYkRldmlj
ZUNsYXNzICAgICAgICAgICAgMCAKICBiRGV2aWNlU3ViQ2xhc3MgICAgICAgICAwIAogIGJEZXZp
Y2VQcm90b2NvbCAgICAgICAgIDAgCiAgYk1heFBhY2tldFNpemUwICAgICAgICAgOQogIGlkVmVu
ZG9yICAgICAgICAgICAweDE3NGMgQVNNZWRpYSBUZWNobm9sb2d5IEluYy4KICBpZFByb2R1Y3Qg
ICAgICAgICAgMHg1NWFhIE5hbWU6IEFTTTEwNTFFIFNBVEEgNkdiL3MgYnJpZGdlLCBBU00xMDUz
RSBTQVRBIDZHYi9zIGJyaWRnZSwgQVNNMTE1MyBTQVRBIDNHYi9zIGJyaWRnZSwgQVNNMTE1M0Ug
U0FUQSA2R2IvcyBicmlkZ2UKICBiY2REZXZpY2UgICAgICAgICAgICAxLjAwCiAgaU1hbnVmYWN0
dXJlciAgICAgICAgICAgMiBVU0IKICBpUHJvZHVjdCAgICAgICAgICAgICAgICAzIDMuMAogIGlT
ZXJpYWwgICAgICAgICAgICAgICAgIDEgMDAwMDAwMDAwMDAxCiAgYk51bUNvbmZpZ3VyYXRpb25z
ICAgICAgMQogIENvbmZpZ3VyYXRpb24gRGVzY3JpcHRvcjoKICAgIGJMZW5ndGggICAgICAgICAg
ICAgICAgIDkKICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDIKICAgIHdUb3RhbExlbmd0aCAg
ICAgICAweDAwNzkKICAgIGJOdW1JbnRlcmZhY2VzICAgICAgICAgIDEKICAgIGJDb25maWd1cmF0
aW9uVmFsdWUgICAgIDEKICAgIGlDb25maWd1cmF0aW9uICAgICAgICAgIDAgCiAgICBibUF0dHJp
YnV0ZXMgICAgICAgICAweGMwCiAgICAgIFNlbGYgUG93ZXJlZAogICAgTWF4UG93ZXIgICAgICAg
ICAgICAgICAgMG1BCiAgICBJbnRlcmZhY2UgRGVzY3JpcHRvcjoKICAgICAgYkxlbmd0aCAgICAg
ICAgICAgICAgICAgOQogICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA0CiAgICAgIGJJbnRl
cmZhY2VOdW1iZXIgICAgICAgIDAKICAgICAgYkFsdGVybmF0ZVNldHRpbmcgICAgICAgMAogICAg
ICBiTnVtRW5kcG9pbnRzICAgICAgICAgICAyCiAgICAgIGJJbnRlcmZhY2VDbGFzcyAgICAgICAg
IDggTWFzcyBTdG9yYWdlCiAgICAgIGJJbnRlcmZhY2VTdWJDbGFzcyAgICAgIDYgU0NTSQogICAg
ICBiSW50ZXJmYWNlUHJvdG9jb2wgICAgIDgwIEJ1bGstT25seQogICAgICBpSW50ZXJmYWNlICAg
ICAgICAgICAgICAwIAogICAgICBFbmRwb2ludCBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5ndGgg
ICAgICAgICAgICAgICAgIDcKICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA1CiAgICAg
ICAgYkVuZHBvaW50QWRkcmVzcyAgICAgMHg4MSAgRVAgMSBJTgogICAgICAgIGJtQXR0cmlidXRl
cyAgICAgICAgICAgIDIKICAgICAgICAgIFRyYW5zZmVyIFR5cGUgICAgICAgICAgICBCdWxrCiAg
ICAgICAgICBTeW5jaCBUeXBlICAgICAgICAgICAgICAgTm9uZQogICAgICAgICAgVXNhZ2UgVHlw
ZSAgICAgICAgICAgICAgIERhdGEKICAgICAgICB3TWF4UGFja2V0U2l6ZSAgICAgMHgwNDAwICAx
eCAxMDI0IGJ5dGVzCiAgICAgICAgYkludGVydmFsICAgICAgICAgICAgICAgMAogICAgICAgIGJN
YXhCdXJzdCAgICAgICAgICAgICAgMTUKICAgICAgRW5kcG9pbnQgRGVzY3JpcHRvcjoKICAgICAg
ICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3CiAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAg
ICAgNQogICAgICAgIGJFbmRwb2ludEFkZHJlc3MgICAgIDB4MDIgIEVQIDIgT1VUCiAgICAgICAg
Ym1BdHRyaWJ1dGVzICAgICAgICAgICAgMgogICAgICAgICAgVHJhbnNmZXIgVHlwZSAgICAgICAg
ICAgIEJ1bGsKICAgICAgICAgIFN5bmNoIFR5cGUgICAgICAgICAgICAgICBOb25lCiAgICAgICAg
ICBVc2FnZSBUeXBlICAgICAgICAgICAgICAgRGF0YQogICAgICAgIHdNYXhQYWNrZXRTaXplICAg
ICAweDA0MDAgIDF4IDEwMjQgYnl0ZXMKICAgICAgICBiSW50ZXJ2YWwgICAgICAgICAgICAgICAw
CiAgICAgICAgYk1heEJ1cnN0ICAgICAgICAgICAgICAxNQogICAgSW50ZXJmYWNlIERlc2NyaXB0
b3I6CiAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDkKICAgICAgYkRlc2NyaXB0b3JUeXBl
ICAgICAgICAgNAogICAgICBiSW50ZXJmYWNlTnVtYmVyICAgICAgICAwCiAgICAgIGJBbHRlcm5h
dGVTZXR0aW5nICAgICAgIDEKICAgICAgYk51bUVuZHBvaW50cyAgICAgICAgICAgNAogICAgICBi
SW50ZXJmYWNlQ2xhc3MgICAgICAgICA4IE1hc3MgU3RvcmFnZQogICAgICBiSW50ZXJmYWNlU3Vi
Q2xhc3MgICAgICA2IFNDU0kKICAgICAgYkludGVyZmFjZVByb3RvY29sICAgICA5OCAKICAgICAg
aUludGVyZmFjZSAgICAgICAgICAgICAgMCAKICAgICAgRW5kcG9pbnQgRGVzY3JpcHRvcjoKICAg
ICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3CiAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAg
ICAgICAgNQogICAgICAgIGJFbmRwb2ludEFkZHJlc3MgICAgIDB4ODEgIEVQIDEgSU4KICAgICAg
ICBibUF0dHJpYnV0ZXMgICAgICAgICAgICAyCiAgICAgICAgICBUcmFuc2ZlciBUeXBlICAgICAg
ICAgICAgQnVsawogICAgICAgICAgU3luY2ggVHlwZSAgICAgICAgICAgICAgIE5vbmUKICAgICAg
ICAgIFVzYWdlIFR5cGUgICAgICAgICAgICAgICBEYXRhCiAgICAgICAgd01heFBhY2tldFNpemUg
ICAgIDB4MDQwMCAgMXggMTAyNCBieXRlcwogICAgICAgIGJJbnRlcnZhbCAgICAgICAgICAgICAg
IDAKICAgICAgICBiTWF4QnVyc3QgICAgICAgICAgICAgIDE1CiAgICAgICAgTWF4U3RyZWFtcyAg
ICAgICAgICAgICAzMgogICAgICAgIERhdGEtaW4gcGlwZSAoMHgwMykKICAgICAgRW5kcG9pbnQg
RGVzY3JpcHRvcjoKICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3CiAgICAgICAgYkRl
c2NyaXB0b3JUeXBlICAgICAgICAgNQogICAgICAgIGJFbmRwb2ludEFkZHJlc3MgICAgIDB4MDIg
IEVQIDIgT1VUCiAgICAgICAgYm1BdHRyaWJ1dGVzICAgICAgICAgICAgMgogICAgICAgICAgVHJh
bnNmZXIgVHlwZSAgICAgICAgICAgIEJ1bGsKICAgICAgICAgIFN5bmNoIFR5cGUgICAgICAgICAg
ICAgICBOb25lCiAgICAgICAgICBVc2FnZSBUeXBlICAgICAgICAgICAgICAgRGF0YQogICAgICAg
IHdNYXhQYWNrZXRTaXplICAgICAweDA0MDAgIDF4IDEwMjQgYnl0ZXMKICAgICAgICBiSW50ZXJ2
YWwgICAgICAgICAgICAgICAwCiAgICAgICAgYk1heEJ1cnN0ICAgICAgICAgICAgICAxNQogICAg
ICAgIE1heFN0cmVhbXMgICAgICAgICAgICAgMzIKICAgICAgICBEYXRhLW91dCBwaXBlICgweDA0
KQogICAgICBFbmRwb2ludCBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5ndGggICAgICAgICAgICAg
ICAgIDcKICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA1CiAgICAgICAgYkVuZHBvaW50
QWRkcmVzcyAgICAgMHg4MyAgRVAgMyBJTgogICAgICAgIGJtQXR0cmlidXRlcyAgICAgICAgICAg
IDIKICAgICAgICAgIFRyYW5zZmVyIFR5cGUgICAgICAgICAgICBCdWxrCiAgICAgICAgICBTeW5j
aCBUeXBlICAgICAgICAgICAgICAgTm9uZQogICAgICAgICAgVXNhZ2UgVHlwZSAgICAgICAgICAg
ICAgIERhdGEKICAgICAgICB3TWF4UGFja2V0U2l6ZSAgICAgMHgwNDAwICAxeCAxMDI0IGJ5dGVz
CiAgICAgICAgYkludGVydmFsICAgICAgICAgICAgICAgMAogICAgICAgIGJNYXhCdXJzdCAgICAg
ICAgICAgICAgMTUKICAgICAgICBNYXhTdHJlYW1zICAgICAgICAgICAgIDMyCiAgICAgICAgU3Rh
dHVzIHBpcGUgKDB4MDIpCiAgICAgIEVuZHBvaW50IERlc2NyaXB0b3I6CiAgICAgICAgYkxlbmd0
aCAgICAgICAgICAgICAgICAgNwogICAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDUKICAg
ICAgICBiRW5kcG9pbnRBZGRyZXNzICAgICAweDA0ICBFUCA0IE9VVAogICAgICAgIGJtQXR0cmli
dXRlcyAgICAgICAgICAgIDIKICAgICAgICAgIFRyYW5zZmVyIFR5cGUgICAgICAgICAgICBCdWxr
CiAgICAgICAgICBTeW5jaCBUeXBlICAgICAgICAgICAgICAgTm9uZQogICAgICAgICAgVXNhZ2Ug
VHlwZSAgICAgICAgICAgICAgIERhdGEKICAgICAgICB3TWF4UGFja2V0U2l6ZSAgICAgMHgwNDAw
ICAxeCAxMDI0IGJ5dGVzCiAgICAgICAgYkludGVydmFsICAgICAgICAgICAgICAgMAogICAgICAg
IGJNYXhCdXJzdCAgICAgICAgICAgICAgIDAKICAgICAgICBDb21tYW5kIHBpcGUgKDB4MDEpCkJp
bmFyeSBPYmplY3QgU3RvcmUgRGVzY3JpcHRvcjoKICBiTGVuZ3RoICAgICAgICAgICAgICAgICA1
CiAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAxNQogIHdUb3RhbExlbmd0aCAgICAgICAweDAwMTYK
ICBiTnVtRGV2aWNlQ2FwcyAgICAgICAgICAyCiAgVVNCIDIuMCBFeHRlbnNpb24gRGV2aWNlIENh
cGFiaWxpdHk6CiAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3CiAgICBiRGVzY3JpcHRvclR5
cGUgICAgICAgIDE2CiAgICBiRGV2Q2FwYWJpbGl0eVR5cGUgICAgICAyCiAgICBibUF0dHJpYnV0
ZXMgICAweDAwMDBmNDFlCiAgICAgIEJFU0wgTGluayBQb3dlciBNYW5hZ2VtZW50IChMUE0pIFN1
cHBvcnRlZAogICAgQkVTTCB2YWx1ZSAgICAgMTAyNCB1cyAKICAgIERlZXAgQkVTTCB2YWx1ZSAg
ICA2MTQ0MCB1cyAKICBTdXBlclNwZWVkIFVTQiBEZXZpY2UgQ2FwYWJpbGl0eToKICAgIGJMZW5n
dGggICAgICAgICAgICAgICAgMTAKICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgMTYKICAgIGJE
ZXZDYXBhYmlsaXR5VHlwZSAgICAgIDMKICAgIGJtQXR0cmlidXRlcyAgICAgICAgIDB4MDAKICAg
IHdTcGVlZHNTdXBwb3J0ZWQgICAweDAwMGUKICAgICAgRGV2aWNlIGNhbiBvcGVyYXRlIGF0IEZ1
bGwgU3BlZWQgKDEyTWJwcykKICAgICAgRGV2aWNlIGNhbiBvcGVyYXRlIGF0IEhpZ2ggU3BlZWQg
KDQ4ME1icHMpCiAgICAgIERldmljZSBjYW4gb3BlcmF0ZSBhdCBTdXBlclNwZWVkICg1R2JwcykK
ICAgIGJGdW5jdGlvbmFsaXR5U3VwcG9ydCAgIDEKICAgICAgTG93ZXN0IGZ1bGx5LWZ1bmN0aW9u
YWwgZGV2aWNlIHNwZWVkIGlzIEZ1bGwgU3BlZWQgKDEyTWJwcykKICAgIGJVMURldkV4aXRMYXQg
ICAgICAgICAgMTAgbWljcm8gc2Vjb25kcwogICAgYlUyRGV2RXhpdExhdCAgICAgICAgMjA0NyBt
aWNybyBzZWNvbmRzCkRldmljZSBTdGF0dXM6ICAgICAweDAwMGQKICBTZWxmIFBvd2VyZWQKICBV
MSBFbmFibGVkCiAgVTIgRW5hYmxlZAoKCg==
--00000000000003965605981cf212--
