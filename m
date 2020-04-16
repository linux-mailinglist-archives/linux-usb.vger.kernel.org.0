Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37CD21AC6B5
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2020 16:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394533AbgDPOnd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Apr 2020 10:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2392629AbgDPOna (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Apr 2020 10:43:30 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64949C061A0C
        for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2020 07:43:30 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id b7so14170314oic.2
        for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2020 07:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fp+lTUvOpQoo1s3R9rKD76ZZZv3dltFjkNx52zVqV8Y=;
        b=MXHEj9whrbRBFmi+O3CGxV3KM2F3YeEiO/m6eVnd0rd9Cu8Ns718sofZDBiGOQWzI3
         zSxRe/U6RqRJQYO+OuGMJHZIowNkP6UsUmkD/f0qurTwuJ3YCbRFx8Zhn14EYPC+j9TW
         oGifVKPzKkJDmEPdsrSCywOc2BNin46M5o84ukZrUVnoDGy/hJDalRMfg9FUsbfhBcqQ
         RWRO4r1NoMVzCIk4POBknOB4y63SB9jUFfkTfxYRINPdCXTSsPaS+vjfdj0GPPjGn/vz
         j8IhF88rnqPiDCfGE4D/N/fudRxgWB3BOSwL3HzvgU7iUJvP7nnfRSp0fcoW1EhL1o3E
         YVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fp+lTUvOpQoo1s3R9rKD76ZZZv3dltFjkNx52zVqV8Y=;
        b=kD555fD2L4ptQ4HERcvojRJOiaZq6wFhDfEluDMqrhtRxINWaP3EZJMC0x+m5Igy8S
         eWlEYuwxbQ+AY8luhvLLfjHgwpqKsY/TzezBschDHi46l4Zkq7r/7PHyuDe49Go8ndX4
         kpDDQrCkrFxpr0xW/xa2st7R+PtTor3JMwHc8wnS6GWWGfeGv/lBRD+FIgVFXP2sV/x5
         qBIT6EuO/2UA2OF4GT8OoqhzdCnLOmMlASyIUv2+xh7WLBoRo1jse27TpD5j+3jjs36i
         nLH1xR7OO+KBmUwO9DzOQe5pqVUGg99dVllbi6dJ1LXy5wBiO+qtFm7p4KaxNuk6JEYA
         9ZLA==
X-Gm-Message-State: AGi0Pua9RLJfG3mf3FKHe+vEhnfULq/yzfUhAzTb/dSjAquQMut4SNn0
        okeHSbHQBMuMagzwh2LAGI5ew2g5ayi9GRCOZA==
X-Google-Smtp-Source: APiQypK6q4/pGSCbmwTHBpU4hFvXY2XYbaqj4403zQoa5/z16tRv+mrNQ2WD84H8FWaqn1tQe59gos7DmnQug/6chIA=
X-Received: by 2002:aca:cf48:: with SMTP id f69mr2842093oig.122.1587048209556;
 Thu, 16 Apr 2020 07:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200415205610.GA8665@Susan> <Pine.LNX.4.44L0.2004152107170.1353-100000@netrider.rowland.org>
 <CABLbxQ2Hoq8zt--w2FwuMa6FRCC72E5a-tvGRQOm=C0YF7bfqA@mail.gmail.com>
In-Reply-To: <CABLbxQ2Hoq8zt--w2FwuMa6FRCC72E5a-tvGRQOm=C0YF7bfqA@mail.gmail.com>
From:   Pacho Ramos <pachoramos@gmail.com>
Date:   Thu, 16 Apr 2020 16:43:18 +0200
Message-ID: <CAHG43Mtfm2fg_o0uhLR5Y0gLn+xiOpA789O0aRWhRa2XOR4Tag@mail.gmail.com>
Subject: Re: [BUG] Regression in Linux 5.4.17 for JMicron JMS566 enclosure
To:     Steven Ellis <sellis@redhat.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Cyril Roelandt <tipecaml@gmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Laura Abbott <labbott@fedoraproject.org>,
        Greg KH <gregkh@linuxfoundation.org>, javhera@gmx.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

At least with kernel 5.3 I was still needing the patch to not get my
disk failing after some time of inactivity. What output would you need
from it? lsusb -v? Maybe the blacklist is "too general" and should be
more restricted. In my case, with uas, it fails easily simply doing to
work on the disk, leaving it for some minutes (I don't know...maybe 15
mins...), and when you try to use it again, it fails. On the other
hand, with usb-storage it works perfectly.

Thanks

El jue., 16 abr. 2020 a las 3:49, Steven Ellis (<sellis@redhat.com>) escrib=
i=C3=B3:
>
> Afraid I don't have access to an enclosure for testing at present as it i=
s on extended loan to someone.
>
> Steven
>
> On Thu, 16 Apr 2020 at 13:28, Alan Stern <stern@rowland.harvard.edu> wrot=
e:
>>
>> On Wed, 15 Apr 2020, Cyril Roelandt wrote:
>>
>> > Hello,
>> >
>> > I own a WD Blue 1TB hard drive that I use in combination with an Icy B=
ox
>> > IB-273StU3-B enclosure in order to plug it to my laptop using USB. It
>> > worked fine with all the Linux versions I tried, up until 5.4.17.
>> >
>> >
>> > Using Linux 5.3
>> > ---------------
>> > Everything works as expected when I plug the drive, and I can mount th=
e
>> > partitions:
>> >
>> > # dmesg -T
>> > [Sun Mar 22 23:48:39 2020] usb 2-2: new SuperSpeed Gen 1 USB device nu=
mber 2 using xhci_hcd
>> > [Sun Mar 22 23:48:39 2020] usb 2-2: New USB device found, idVendor=3D3=
57d, idProduct=3D7788, bcdDevice=3D 1.14
>> > [Sun Mar 22 23:48:39 2020] usb 2-2: New USB device strings: Mfr=3D1, P=
roduct=3D2, SerialNumber=3D3
>> > [Sun Mar 22 23:48:39 2020] usb 2-2: Product: USB to ATA/ATAPI Bridge
>> > [Sun Mar 22 23:48:39 2020] usb 2-2: Manufacturer: JMicron
>> > [Sun Mar 22 23:48:39 2020] usb 2-2: SerialNumber: 74D7851513309E5
>> > [Sun Mar 22 23:48:39 2020] usbcore: registered new interface driver us=
b-storage
>> > [Sun Mar 22 23:48:39 2020] scsi host6: uas
>> > [Sun Mar 22 23:48:39 2020] usbcore: registered new interface driver ua=
s
>> > [Sun Mar 22 23:48:39 2020] scsi 6:0:0:0: Direct-Access     WDC WD10 JP=
VT-00A1YT0     0114 PQ: 0 ANSI: 6
>> > [Sun Mar 22 23:48:39 2020] sd 6:0:0:0: Attached scsi generic sg1 type =
0
>> > [Sun Mar 22 23:48:39 2020] sd 6:0:0:0: [sdb] Spinning up disk...
>> > [Sun Mar 22 23:48:40 2020] ..ready
>> > [Sun Mar 22 23:48:41 2020] sd 6:0:0:0: [sdb] 1953525168 512-byte logic=
al blocks: (1.00 TB/932 GiB)
>> > [Sun Mar 22 23:48:41 2020] sd 6:0:0:0: [sdb] 4096-byte physical blocks
>> > [Sun Mar 22 23:48:41 2020] sd 6:0:0:0: [sdb] Write Protect is off
>> > [Sun Mar 22 23:48:41 2020] sd 6:0:0:0: [sdb] Mode Sense: 53 00 10 08
>> > [Sun Mar 22 23:48:41 2020] sd 6:0:0:0: [sdb] Write cache: enabled, rea=
d cache: enabled, supports DPO and FUA
>> > [Sun Mar 22 23:48:41 2020] sd 6:0:0:0: [sdb] Optimal transfer size 335=
53920 bytes not a multiple of physical block size (4096 bytes)
>> > [Sun Mar 22 23:48:41 2020]  sdb: sdb1
>> > [Sun Mar 22 23:48:41 2020] sd 6:0:0:0: [sdb] Attached SCSI disk
>> >
>> >
>> > Using Linux 5.4
>> > ---------------
>> >
>> > # uname -a
>> > Linux Susan 5.4.0-4-amd64 #1 SMP Debian 5.4.19-1 (2020-02-13) x86_64 G=
NU/Linux
>> >
>> > # mkdir /tmp/mnt
>> >
>> > # mount /dev/sdb1 /tmp/mnt
>> > mount: /tmp/mnt: can't read superblock on /dev/sdb1.
>> >
>> > # fsck -y /dev/sdb1
>> > fsck from util-linux 2.34
>> > e2fsck 1.45.6 (20-Mar-2020)
>> > /dev/sdb1: clean, 2951657/61054976 files, 115035523/244190208 blocks
>> >
>> > # dmesg -T
>> > [Mon Mar 23 18:43:06 2020] usb 3-2: new SuperSpeed Gen 1 USB device nu=
mber 8 using xhci_hcd
>> > [Mon Mar 23 18:43:06 2020] usb 3-2: New USB device found, idVendor=3D3=
57d, idProduct=3D7788, bcdDevice=3D 1.14
>> > [Mon Mar 23 18:43:06 2020] usb 3-2: New USB device strings: Mfr=3D1, P=
roduct=3D2, SerialNumber=3D3
>> > [Mon Mar 23 18:43:06 2020] usb 3-2: Product: USB to ATA/ATAPI Bridge
>> > [Mon Mar 23 18:43:06 2020] usb 3-2: Manufacturer: JMicron
>> > [Mon Mar 23 18:43:06 2020] usb 3-2: SerialNumber: 74D7851513309E5
>> > [Mon Mar 23 18:43:06 2020] usb 3-2: UAS is blacklisted for this device=
, using usb-storage instead
>> > [Mon Mar 23 18:43:06 2020] usb-storage 3-2:1.0: USB Mass Storage devic=
e detected
>> > [Mon Mar 23 18:43:06 2020] usb-storage 3-2:1.0: Quirks match for vid 3=
57d pid 7788: 4800000
>> > [Mon Mar 23 18:43:06 2020] scsi host6: usb-storage 3-2:1.0
>> > [Mon Mar 23 18:43:07 2020] scsi 6:0:0:0: Direct-Access     WDC WD10 JP=
VT-00A1YT0     0114 PQ: 0 ANSI: 6
>> > [Mon Mar 23 18:43:07 2020] sd 6:0:0:0: Attached scsi generic sg1 type =
0
>> > [Mon Mar 23 18:43:07 2020] sd 6:0:0:0: [sdb] Spinning up disk...
>> > [Mon Mar 23 18:43:08 2020] ..ready
>> > [Mon Mar 23 18:43:09 2020] sd 6:0:0:0: [sdb] 1953525168 512-byte logic=
al blocks: (1.00 TB/932 GiB)
>> > [Mon Mar 23 18:43:09 2020] sd 6:0:0:0: [sdb] Write Protect is off
>> > [Mon Mar 23 18:43:09 2020] sd 6:0:0:0: [sdb] Mode Sense: 47 00 10 08
>> > [Mon Mar 23 18:43:09 2020] sd 6:0:0:0: [sdb] Write cache: enabled, rea=
d cache: enabled, supports DPO and FUA
>> > [Mon Mar 23 18:43:09 2020]  sdb: sdb1
>> > [Mon Mar 23 18:43:09 2020] sd 6:0:0:0: [sdb] Attached SCSI disk
>> > [Mon Mar 23 18:43:30 2020] sd 6:0:0:0: [sdb] tag#0 FAILED Result: host=
byte=3DDID_OK driverbyte=3DDRIVER_SENSE
>> > [Mon Mar 23 18:43:30 2020] sd 6:0:0:0: [sdb] tag#0 Sense Key : Illegal=
 Request [current]
>> > [Mon Mar 23 18:43:30 2020] sd 6:0:0:0: [sdb] tag#0 Add. Sense: Invalid=
 field in cdb
>> > [Mon Mar 23 18:43:30 2020] sd 6:0:0:0: [sdb] tag#0 CDB: Write(10) 2a 0=
8 00 00 08 00 00 00 08 00
>> > [Mon Mar 23 18:43:30 2020] blk_update_request: critical target error, =
dev sdb, sector 2048 op 0x1:(WRITE) flags 0x20800 phys_seg 1 prio class 0
>> > [Mon Mar 23 18:43:30 2020] Buffer I/O error on dev sdb1, logical block=
 0, lost sync page write
>> > [Mon Mar 23 18:43:30 2020] EXT4-fs (sdb1): I/O error while writing sup=
erblock
>> > [Mon Mar 23 18:43:30 2020] EXT4-fs (sdb1): mount failed
>> >
>> > # lsusb
>> > Bus 003 Device 008: ID 357d:7788 Sharkoon QuickPort XT
>> >
>> >
>> > Other considerations
>> > --------------------
>> > This enclosure works as expected with another drive: I tried with an o=
ld
>> > Fujitsu 250GB drive and was able to mount the partitions.
>> >
>> > The WD drive works with a similar enclosure: the Icy Box IB-268U3-B
>> > enclosure. It has the exact same vendor id and product id (357d:7788)
>> > but a different bcdDevice (2.03).
>> >
>> > Looking at the dmesg logs I pasted above, I see that the main differen=
ce
>> > is the driver used:
>> > - uas in Linux 5.3;
>> > - usb-storage in Linux 5.4, since uas is blacklisted.
>> >
>> >
>> > I believe the uas driver was blacklisted because of an old bug[1] in
>> > Fedora. In Linux, the commit that disabled uas is
>> > bc3bdb12bbb3492067c8719011576370e959a2e6.
>> >
>> > I do not really mind not being able to use uas, however I would like t=
o
>> > be able to mount my partitions using usb-storage.
>>
>> It's entirely possible that the blacklisting is not necessary any more.
>> After all, it was added four and a half years ago; the kernel has
>> improved since then.  I guess you're not in a position to test this,
>> but maybe Steve Ellis or Takeo Nakayama is...?
>>
>> Does 5.3 work if you add a similar blacklist entry?
>>
>> Can you collect usbmon traces showing what happens with both uas and
>> usb-storage?  Perhaps different sequences of commands get sent to the
>> drive with the two drivers.
>>
>> Alan Stern
>>
>
>
> --
>
> Steven Ellis
>
> TECHNICAL PORTFOLIO EVANGELIST - APAC
>
> APAC PRINCIPAL PRODUCT MANAGER - STORAGE & HCI
>
> Red Hat Asia Pacific - Auckland NZ
>
> E: sellis@redhat.com    M: +64 21 321 673
>
> @RedHat   Red Hat   Red Hat
>
>
