Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0351C263E
	for <lists+linux-usb@lfdr.de>; Sat,  2 May 2020 16:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbgEBOjH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 2 May 2020 10:39:07 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:5645 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728025AbgEBOjG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 May 2020 10:39:06 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ead85c50000>; Sat, 02 May 2020 07:37:57 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sat, 02 May 2020 07:39:05 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sat, 02 May 2020 07:39:05 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 2 May
 2020 14:39:05 +0000
Received: from [10.19.100.12] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 2 May 2020
 14:39:02 +0000
Subject: Re: [PATCH 1/1] usb: storage: Add quirk for Samsung Fit flash
To:     Atanas Dinev <atanasd@gmail.com>, <stern@rowland.harvard.edu>,
        <linux-usb@vger.kernel.org>
CC:     <usb-storage@lists.one-eyed-alien.net>
References: <1583158895-31342-1-git-send-email-jilin@nvidia.com>
 <bb4db5cf-60bc-9c0f-e1dc-3047542d2b42@gmail.com>
From:   Jim Lin <jilin@nvidia.com>
Message-ID: <095677b6-5b6c-1b35-fe9e-00dcedd0a11f@nvidia.com>
Date:   Sat, 2 May 2020 22:38:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <bb4db5cf-60bc-9c0f-e1dc-3047542d2b42@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588430277; bh=WJWe42077RpjHfQ/CpX5k50QCVIvt8rFljDJstapEXI=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=EtPyzlcR2vhJAp//s0F3BlkE9jGW2s8hw6fO629xM2Ts6+Kc9X61Veymjqr37Quk1
         ulRWDiO7sST2T7aQrRaF3yFsrvcpTvK+nnUi2At/cRXTJ8pwzGOEJ+mG38KqvU1ukq
         yjs8DzKFPVqk4nty5nRstA94yr6nJlJe1ICpZ2IzUYY3NMiY5LtLHBsjd7taNwCL4W
         1qwUb6stsAqSY7JBJDu+ooJWZKb983LayXszap66Tton+qeM5B210g0bAif0olYpHz
         5TE+KbPNPzXzPtyYOKCfe6FaRksnfXZ4PCwqUaBU36a6P1iZP+ggbxnkiwZK3QbwAZ
         8efCiUIsYplzQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In my case device will be in hung state even issuing port reset if=20
without this patch.

jim

On 2020/5/2 =E4=B8=8B=E5=8D=889:56, Atanas Dinev wrote:
> External email: Use caution opening links or attachments
>
>
> Hello,
>
> Jim Lin wrote on 02.03.20 15:21:
>> Current driver has 240 (USB2.0) and 2048 (USB3.0) as max_sectors,
>> e.g., /sys/bus/scsi/devices/0:0:0:0/max_sectors
>>
>> If data access times out, driver error handling will issue a port
>> reset.
>> Sometimes Samsung Fit (090C:1000) flash disk will not respond to
>> later Set Address or Get Descriptor command.
>>
>> Adding this quirk to limit max_sectors to 64 sectors to avoid issue
>> occurring.
>>
> This may need revisiting as it appears to be a performance killer (3-4=20
> times slower seq reads) for otherwise perfectly working sticks.
> Going down from 2048 to 64 seems to cause a pretty significant speed=20
> degradation.
> Here are a few examples:
>
> # lsusb
> Bus 002 Device 012: ID 090c:1000 Silicon Motion, Inc. - Taiwan=20
> (formerly Feiya Technology Corp.) Flash Drive
> # lsusb -t
> /:=C2=A0 Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/6p, 50=
00M
> =C2=A0=C2=A0=C2=A0 |__ Port 3: Dev 12, If 0, Class=3DMass Storage, Driver=
=3Dusb-storage,=20
> 5000M
>
> # dmesg
> [23153.493726] usb 2-3: Product: Flash Drive FIT
> [23153.493729] usb 2-3: Manufacturer: Samsung
> [23153.493731] usb 2-3: SerialNumber: 0375119090033353
> [23153.575386] usb-storage 2-3:1.0: USB Mass Storage device detected
> [23153.575514] usb-storage 2-3:1.0: Quirks match for vid 090c pid=20
> 1000: 400
> [23153.575559] scsi host2: usb-storage 2-3:1.0
> [23153.576529] usbcore: registered new interface driver usb-storage
> [23153.578645] usbcore: registered new interface driver uas
>
> # cat /proc/scsi/usb-storage/*
> =C2=A0=C2=A0 Host scsi2: usb-storage
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Vendor: Samsung
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Product: Flash Drive FIT
> Serial Number: 0375119090033353
> =C2=A0=C2=A0=C2=A0=C2=A0 Protocol: Transparent SCSI
> =C2=A0=C2=A0=C2=A0 Transport: Bulk
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Quirks: MAX_SECTORS_64 SANE_SENSE
>
> # hdparm -t /dev/sdb
> =C2=A0Timing buffered disk reads: 132 MB in=C2=A0 3.03 seconds =3D 43.62 =
MB/sec
> # dd if=3D/dev/sdb of=3D/dev/null bs=3D1M count=3D1000
> 1048576000 bytes (1,0 GB, 1000 MiB) copied, 22,3564 s, 46,9 MB/s
>
> # rmmod uas usb_storage
> # modprobe usb_storage quirks=3D090c:1000:
>
> # hdparm -t /dev/sdb
> =C2=A0Timing buffered disk reads: 452 MB in=C2=A0 3.01 seconds =3D 150.33=
 MB/sec
> # dd if=3D/dev/sdb of=3D/dev/null bs=3D1M count=3D1000
> 1048576000 bytes (1,0 GB, 1000 MiB) copied, 6,51492 s, 161 MB/s
>
>
> [23612.690798] usb 2-3: Product: Intenso High Speed Line
> [23612.690799] usb 2-3: Manufacturer: SMI
> [23612.690801] usb 2-3: SerialNumber: 19112500000332
> [23612.780771] usb-storage 2-3:1.0: USB Mass Storage device detected
> [23612.780895] usb-storage 2-3:1.0: Quirks match for vid 090c pid=20
> 1000: 400
> [23612.780940] scsi host2: usb-storage 2-3:1.0
> [23612.781093] usbcore: registered new interface driver usb-storage
> [23612.783226] usbcore: registered new interface driver uas
>
> # cat /proc/scsi/usb-storage/*
> =C2=A0=C2=A0 Host scsi2: usb-storage
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Vendor: SMI
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Product: Intenso High Speed Line
> Serial Number: 19112500000332
> =C2=A0=C2=A0=C2=A0=C2=A0 Protocol: Transparent SCSI
> =C2=A0=C2=A0=C2=A0 Transport: Bulk
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Quirks: MAX_SECTORS_64 SANE_SENSE
>
> # hdparm -t /dev/sdb
> =C2=A0Timing buffered disk reads: 220 MB in=C2=A0 3.00 seconds =3D 73.22 =
MB/sec
> # dd if=3D/dev/sdb of=3D/dev/null bs=3D1M count=3D1000
> 1048576000 bytes (1,0 GB, 1000 MiB) copied, 11,5469 s, 90,8 MB/s
>
> # rmmod uas usb_storage
> # modprobe usb_storage quirks=3D090c:1000:
> # hdparm -t /dev/sdb
> Timing buffered disk reads: 1016 MB in=C2=A0 3.00 seconds =3D 338.51 MB/s=
ec
> # dd if=3D/dev/sdb of=3D/dev/null bs=3D1M count=3D1000
> 1048576000 bytes (1,0 GB, 1000 MiB) copied, 3,31022 s, 317 MB/s
>
>
> I'm using both sticks as a bootable/emergency media (Debian stable,=20
> kernel 4.19/no-quirks with X, XFCE, web browser, etc) and haven't had=20
> any issues with timeouts, unresponsiveness or whatsoever.
>
> When tested with recent kernels (e.g. Debian testing/5.5, Ubuntu 20.04=20
> LTS/5.4) it's slow.
>
> Setting "options usb_storage quirks=3D090c:1000:" in /etc/modprobe.d as=20
> a workaround for now.
>
>> Signed-off-by: Jim Lin <jilin@nvidia.com>
>> ---
>> =C2=A0 drivers/usb/storage/unusual_devs.h | 6 ++++++
>> =C2=A0 1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/usb/storage/unusual_devs.h=20
>> b/drivers/usb/storage/unusual_devs.h
>> index 1cd9b6305b06..1880f3e13f57 100644
>> --- a/drivers/usb/storage/unusual_devs.h
>> +++ b/drivers/usb/storage/unusual_devs.h
>> @@ -1258,6 +1258,12 @@ UNUSUAL_DEV( 0x090a, 0x1200, 0x0000, 0x9999,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 USB_SC_RBC, USB_PR_BULK, NULL,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0 ),
>>
>> +UNUSUAL_DEV(0x090c, 0x1000, 0x1100, 0x1100,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "Samsung",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "Flash Drive FIT",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 US_FL_MAX_SECTORS_64),
>> +
>> =C2=A0 /* aeb */
>> =C2=A0 UNUSUAL_DEV( 0x090c, 0x1132, 0x0000, 0xffff,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "Feiya",
>>
--nvpublic
