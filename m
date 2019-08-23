Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED4F9B0F8
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2019 15:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405547AbfHWNbo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Aug 2019 09:31:44 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:41282 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404581AbfHWNbo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Aug 2019 09:31:44 -0400
Received: by mail-wr1-f47.google.com with SMTP id j16so8643520wrr.8
        for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2019 06:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:openpgp:autocrypt:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=bXxPM7QtACJDU+UjFzUSJCaqrdaSAQBmrZ/SP86Gkb0=;
        b=T6DFwzCls0XukfYxOqZjLQifXks31kSFk4jbM9T02uQAHDqDvqOuP24oMemdfVP+tR
         FcGbhHpabZrwJNPoIHxK0Ec2JA7hW8KZNSRiqpoLg7SfgmEY1NhVdHGeykBTPAJRCBn1
         WDThBx4D+Qmts4YCRH9sYCMDipBi7rk5xCLJIpaK6rOaRkgcC/L2XR5tAu8gxoQODigN
         8tj+s1cj/GvdBZ/VZlJ/+0BWsJ47QRaaZDYlsgCYspe3ZcAKuOVnd0dtwQ4jt3BTBrap
         PyuRdRo4Cwebue1pNJ+BZdVAFTjEYu9r4euthRVwI2ZKuf4KzjhkgehIoi6z4UmHURFA
         O/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:content-language
         :content-transfer-encoding;
        bh=bXxPM7QtACJDU+UjFzUSJCaqrdaSAQBmrZ/SP86Gkb0=;
        b=hYy3bCuFGFS20X+CTJvVnWbn1PLysd0maUyftc6c/1gFB1b0DrAI+IGyvrDqQ6jYkE
         cc3Cc9KWd/01rzHPLLsnpn8tZy70TztuVDWXmEoF5BHJSiRmrfGgIqDvS5bhhd1sIbHH
         I+j/uGQ8DPJ0HpMBT1Kvu9lZHBQSjebE+3cRttaLJ62LxybnnPx5BYO5AcvomBUD7t2j
         klOdFLaBGVe86LX5wNsraesLfTOv16QGEa21kIbmj0S67F00+ZFa9sGJ/ItKLxfixoC7
         hw4UlCLA9KOK1f32bq9JC+B6+q8h/ipVVA61UVrBr3+Z+OSuX9Dg8tUx7+mI0P2z0UAK
         xV9g==
X-Gm-Message-State: APjAAAU0AfYhBvjq1uCLCF8Lfru+vqYK81yqgmYc79CABJviszPgJ9UL
        jDD1dzXzRINez0cfxx1HitnvMRlB
X-Google-Smtp-Source: APXvYqz0VYV2tQ8n4TLwqn2SVOpDBTzfl7ElFkT8tCVqKeRcZZ+0Jkgzbm4OuK6rKVRWRqUDXaIpnw==
X-Received: by 2002:a5d:4589:: with SMTP id p9mr5086419wrq.276.1566567099899;
        Fri, 23 Aug 2019 06:31:39 -0700 (PDT)
Received: from ?IPv6:2a02:908:1964:6740:aee1:2beb:2fd0:abbc? ([2a02:908:1964:6740:aee1:2beb:2fd0:abbc])
        by smtp.googlemail.com with ESMTPSA id r123sm4599174wme.7.2019.08.23.06.31.38
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2019 06:31:39 -0700 (PDT)
To:     linux-usb@vger.kernel.org
From:   Julian Sikorski <belegdol@gmail.com>
Subject: Lacie Rugged USB3-FW does not work with UAS
Openpgp: preference=signencrypt
Autocrypt: addr=belegdol@gmail.com; prefer-encrypt=mutual; keydata=
 mQENBE40CmIBCACj+gI1pIMD0VGrZD4ugde8f3usLc0OE0OnPDXjqelxsC3B/x9BFoQrzfnP
 qJEtcB6F4V5MuEYutnteeuFsIkLHx6UIe9vr1Ze01XtN7Emsya/AKXaEcXYzUUjVmWn1NjJF
 ZlX0ML3mIQPERBDEY/aXAj7cVDGvkFVeKWIWE5KRqQWV2rYo0nizZTRYGB0z6KpMninG4hqF
 KvvpzhDS5ZnxijEYs0YAx0QllI4LjLTH3xLuYMnSbHzFRBh9zUsMttMnZdCudLZC6ZllkjtM
 ov/kIO35P5ygFJ9xlLyxMFkhXsARDWe3qwJCEHfJgtcblQD/LHuY200fTmrbwTK9Q4uNABEB
 AAG0JEp1bGlhbiBTaWtvcnNraSA8YmVsZWdkb2xAZ21haWwuY29tPokBOAQTAQIAIgUCTjQK
 YgIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQLdUZIcIlWSuFYwf+J5lKOXWz+FJW
 Vn4b8Q237R/SOlZVwVfT9u/EjxGkploecihuzRadwXDMu030zdgo0m4lwEubOD5eMvzpBSYu
 Dc3fDPT/T5/O7avybt2w83hptPuwU4O0EmNrkgr6pHql1nxEvBpeB8KkJnexJww95Kl1YmBX
 c1kdRrAShNxiVQDpPnskGtnfK2eTqyuyhECApIVLxMIX5IsqGCpslRUR6e90iHd591iJgRT+
 Ji74QjkCQzJJVcKbX5T7HzbUd6mmkZjNbtog3g6WEPkI4Qdw+ZeDlSViN/SKPS2ptMMzxCOT
 neVuw3c6qM/VUo6AUTPSl+1c1rO2X7ZY5/Z9dCMP9rkBDQRONApiAQgAmurakWU/VVEKiPcM
 o5IsActeWERRTxgUXmliSp02YtBLYwOBQ6WUmJyhywOR8s3Wh93cHEPgEPI/n+cfytNxvpol
 liSXp3PZGJAmBSIq13d1lDYJBzDzNjUz6dj9YMV56zcsWbYF25grXbPY4acy/5RQXHWjQ4R9
 dtGCMd48dhMH6O0DvsiriRxJQrcXz0mgLSi79KVns4VgIuUuPCwPyF1zNUBs/srbgTuL+On0
 GjbK40GnJq/Zw2LhEGeicp0npoc4jshgVTtUXRQrGo04plJNpNg9Tl1UIbsHrjA1qz9yo8GR
 4MLgXzcyfM6h+wz6qC8eI7jx4VEZxMhXtalvywARAQABiQEfBBgBAgAJBQJONApiAhsMAAoJ
 EC3VGSHCJVkrpl0IAJJd8qETlL0XzNZsguk8LwXi0c++iTTbotw/zn1f7CgGsZErm58KqNhR
 UltAZvK+lOclNPbZRsGzoEdg4TIvSymWVLN6jyblhcqH4G9mxmf6QOLvYR5I02UQiIbKvTvv
 mFA8bgr2vXPFc8rBmFXrwyC3DOjfrnz23kGattsFWbRA2OBq7bp/05JVoMb4QRA2TIbbvsyQ
 g0MMs9VldhdVfZcFqU2qKwQs8fBr8BD+OfPeiYndJV4GnfYhK692viMjv/+dgOvYcEgtlFaJ
 TLeiWvwUUxJ7ai45p+gCHXUYPGwrH4Dm2HAw61vUDkbT5pVOeGlFsvtOVEajnQX+MOV93l4=
Message-ID: <ffe7a644-bd56-3f3e-4673-f69f21f4132b@gmail.com>
Date:   Fri, 23 Aug 2019 15:31:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear list,

it appears that lacie rugged usb3-fw is not compatible with UAS.
I have just connected my few years old Lacie Rugged USB3-FW to my new
desktop PC to see if the backups I have been creating on the laptop can
actually be restored. I have then noticed that the drive does not work
in the default configuration and the following is written to dmesg
(tested with 5.2.9-200.fc30.x86_64):



[15737.797937] usb 6-3.4.2: new SuperSpeed Gen 1 USB device number 4
using xhci_hcd

[15737.810713] usb 6-3.4.2: New USB device found, idVendor=059f,
idProduct=1061, bcdDevice= 0.01

[15737.810716] usb 6-3.4.2: New USB device strings: Mfr=2, Product=3,
SerialNumber=1

[15737.810718] usb 6-3.4.2: Product: Rugged USB3-FW

[15737.810720] usb 6-3.4.2: Manufacturer: LaCie

[15737.810722] usb 6-3.4.2: SerialNumber: 00000000157f928920fa

[15737.814775] scsi host12: uas

[15737.815237] scsi 12:0:0:0: Direct-Access     LaCie    Rugged FW USB3
 051E PQ: 0 ANSI: 6

[15737.815879] sd 12:0:0:0: Attached scsi generic sg1 type 0

[15737.824985] sd 12:0:0:0: [sdb] 1953525168 512-byte logical blocks:
(1.00 TB/932 GiB)

[15737.825098] sd 12:0:0:0: [sdb] Write Protect is off

[15737.825101] sd 12:0:0:0: [sdb] Mode Sense: 43 00 00 00

[15737.825259] sd 12:0:0:0: [sdb] Write cache: enabled, read cache:
enabled, doesn't support DPO or FUA

[15767.920938] sd 12:0:0:0: tag#24 uas_eh_abort_handler 0 uas-tag 1
inflight: IN

[15767.920942] sd 12:0:0:0: tag#24 CDB: Report supported operation codes
a3 0c 01 12 00 00 00 00 02 00 00 00

[15767.926963] scsi host12: uas_eh_device_reset_handler start

[15767.991093] usb 6-3.4.2: reset SuperSpeed Gen 1 USB device number 4
using xhci_hcd

[15768.004434] scsi host12: uas_eh_device_reset_handler success

[15798.123965] scsi host12: uas_eh_device_reset_handler start

[15798.123996] sd 12:0:0:0: tag#4 uas_zap_pending 0 uas-tag 1 inflight:

[15798.124000] sd 12:0:0:0: tag#4 CDB: Report supported operation codes
a3 0c 01 12 00 00 00 00 02 00 00 00

[15798.188039] usb 6-3.4.2: reset SuperSpeed Gen 1 USB device number 4
using xhci_hcd

[15798.201126] scsi host12: uas_eh_device_reset_handler success

[15828.333035] scsi host12: uas_eh_device_reset_handler start

[15828.333081] sd 12:0:0:0: tag#5 uas_zap_pending 0 uas-tag 1 inflight:

[15828.333085] sd 12:0:0:0: tag#5 CDB: Report supported operation codes
a3 0c 01 12 00 00 00 00 02 00 00 00

[15828.397330] usb 6-3.4.2: reset SuperSpeed Gen 1 USB device number 4
using xhci_hcd

[15828.410190] scsi host12: uas_eh_device_reset_handler success

[15858.542068] scsi host12: uas_eh_device_reset_handler start

[15858.542145] sd 12:0:0:0: tag#6 uas_zap_pending 0 uas-tag 1 inflight:

[15858.542149] sd 12:0:0:0: tag#6 CDB: Report supported operation codes
a3 0c 01 12 00 00 00 00 02 00 00 00

[15858.606350] usb 6-3.4.2: reset SuperSpeed Gen 1 USB device number 4
using xhci_hcd

[15858.619513] scsi host12: uas_eh_device_reset_handler success

[15888.753114] sd 12:0:0:0: tag#7 uas_eh_abort_handler 0 uas-tag 1
inflight: IN

[15888.753120] sd 12:0:0:0: tag#7 CDB: Report supported operation codes
a3 0c 01 93 00 00 00 00 02 00 00 00

[15888.759101] scsi host12: uas_eh_device_reset_handler start

[15888.823237] usb 6-3.4.2: reset SuperSpeed Gen 1 USB device number 4
using xhci_hcd

[15888.836526] scsi host12: uas_eh_device_reset_handler success

[15918.956115] scsi host12: uas_eh_device_reset_handler start

[15918.956160] sd 12:0:0:0: tag#8 uas_zap_pending 0 uas-tag 1 inflight:

[15918.956164] sd 12:0:0:0: tag#8 CDB: Report supported operation codes
a3 0c 01 93 00 00 00 00 02 00 00 00

[15919.021247] usb 6-3.4.2: reset SuperSpeed Gen 1 USB device number 4
using xhci_hcd

[15919.038474] scsi host12: uas_eh_device_reset_handler success

[15949.170156] scsi host12: uas_eh_device_reset_handler start

[15949.170198] sd 12:0:0:0: tag#9 uas_zap_pending 0 uas-tag 1 inflight:

[15949.170203] sd 12:0:0:0: tag#9 CDB: Report supported operation codes
a3 0c 01 93 00 00 00 00 02 00 00 00

[15949.234229] usb 6-3.4.2: reset SuperSpeed Gen 1 USB device number 4
using xhci_hcd

[15949.247353] scsi host12: uas_eh_device_reset_handler success

[15979.371204] scsi host12: uas_eh_device_reset_handler start

[15979.371248] sd 12:0:0:0: tag#10 uas_zap_pending 0 uas-tag 1 inflight:

[15979.371252] sd 12:0:0:0: tag#10 CDB: Report supported operation codes
a3 0c 01 93 00 00 00 00 02 00 00 00

[15979.435356] usb 6-3.4.2: reset SuperSpeed Gen 1 USB device number 4
using xhci_hcd

[15979.448616] scsi host12: uas_eh_device_reset_handler success

[16009.585216] sd 12:0:0:0: tag#11 uas_eh_abort_handler 0 uas-tag 1
inflight: IN

[16009.585221] sd 12:0:0:0: tag#11 CDB: Report supported operation codes
a3 0c 01 41 00 00 00 00 02 00 00 00

[16009.591243] scsi host12: uas_eh_device_reset_handler start

[16009.655518] usb 6-3.4.2: reset SuperSpeed Gen 1 USB device number 4
using xhci_hcd

[16009.668915] scsi host12: uas_eh_device_reset_handler success

[16039.788257] scsi host12: uas_eh_device_reset_handler start

[16039.788310] sd 12:0:0:0: tag#18 uas_zap_pending 0 uas-tag 1 inflight:

[16039.788314] sd 12:0:0:0: tag#18 CDB: Report supported operation codes
a3 0c 01 41 00 00 00 00 02 00 00 00

[16039.852343] usb 6-3.4.2: reset SuperSpeed Gen 1 USB device number 4
using xhci_hcd

[16039.865416] scsi host12: uas_eh_device_reset_handler success

[16069.996177] scsi host12: uas_eh_device_reset_handler start

[16069.996377] sd 12:0:0:0: tag#19 uas_zap_pending 0 uas-tag 1 inflight:

[16069.996383] sd 12:0:0:0: tag#19 CDB: Report supported operation codes
a3 0c 01 41 00 00 00 00 02 00 00 00

[16070.060474] usb 6-3.4.2: reset SuperSpeed Gen 1 USB device number 4
using xhci_hcd

[16070.073580] scsi host12: uas_eh_device_reset_handler success

[16100.204124] scsi host12: uas_eh_device_reset_handler start

[16100.204194] sd 12:0:0:0: tag#0 uas_zap_pending 0 uas-tag 1 inflight:

[16100.204198] sd 12:0:0:0: tag#0 CDB: Report supported operation codes
a3 0c 01 41 00 00 00 00 02 00 00 00

[16100.268426] usb 6-3.4.2: reset SuperSpeed Gen 1 USB device number 4
using xhci_hcd

[16100.281565] scsi host12: uas_eh_device_reset_handler success

[16100.281680] sd 12:0:0:0: [sdb] Optimal transfer size 33553920 bytes

[16130.417121] sd 12:0:0:0: tag#4 uas_eh_abort_handler 0 uas-tag 1
inflight: IN

[16130.417126] sd 12:0:0:0: tag#4 CDB: Report supported operation codes
a3 0c 01 12 00 00 00 00 02 00 00 00

[16130.423122] scsi host12: uas_eh_device_reset_handler start

[16130.488247] usb 6-3.4.2: reset SuperSpeed Gen 1 USB device number 4
using xhci_hcd

[16130.501550] scsi host12: uas_eh_device_reset_handler success

[16160.624027] scsi host12: uas_eh_device_reset_handler start

[16160.624073] sd 12:0:0:0: tag#5 uas_zap_pending 0 uas-tag 1 inflight:

[16160.624077] sd 12:0:0:0: tag#5 CDB: Report supported operation codes
a3 0c 01 12 00 00 00 00 02 00 00 00

[16160.688329] usb 6-3.4.2: reset SuperSpeed Gen 1 USB device number 4
using xhci_hcd

[16160.701498] scsi host12: uas_eh_device_reset_handler success

[16190.827973] scsi host12: uas_eh_device_reset_handler start

[16190.828050] sd 12:0:0:0: tag#6 uas_zap_pending 0 uas-tag 1 inflight:

[16190.828054] sd 12:0:0:0: tag#6 CDB: Report supported operation codes
a3 0c 01 12 00 00 00 00 02 00 00 00

[16190.892234] usb 6-3.4.2: reset SuperSpeed Gen 1 USB device number 4
using xhci_hcd

[16190.905298] scsi host12: uas_eh_device_reset_handler success

[16216.299763] usb 6-3.4.2: USB disconnect, device number 4

[16216.350027] print_req_error: I/O error, dev sdb, sector 0 flags 0

[16216.350031] Buffer I/O error on dev sdb, logical block 0, async page read

[16216.350066] print_req_error: I/O error, dev sdb, sector 0 flags 0

[16216.350073] Buffer I/O error on dev sdb, logical block 0, async page read

[16216.350093] print_req_error: I/O error, dev sdb, sector 0 flags 0

[16216.350095] Buffer I/O error on dev sdb, logical block 0, async page read

[16216.350103] ldm_validate_partition_table(): Disk read failed.

[16216.350121] print_req_error: I/O error, dev sdb, sector 0 flags 0

[16216.350123] Buffer I/O error on dev sdb, logical block 0, async page read

[16216.350143] print_req_error: I/O error, dev sdb, sector 0 flags 0

[16216.350145] Buffer I/O error on dev sdb, logical block 0, async page read

[16216.350167] print_req_error: I/O error, dev sdb, sector 0 flags 0

[16216.350169] Buffer I/O error on dev sdb, logical block 0, async page read

[16216.350189] print_req_error: I/O error, dev sdb, sector 0 flags 0

[16216.350191] Buffer I/O error on dev sdb, logical block 0, async page read

[16216.350199] Dev sdb: unable to read RDB block 0

[16216.350215] print_req_error: I/O error, dev sdb, sector 0 flags 0

[16216.350217] Buffer I/O error on dev sdb, logical block 0, async page read

[16216.350231] print_req_error: I/O error, dev sdb, sector 0 flags 0

[16216.350233] Buffer I/O error on dev sdb, logical block 0, async page read

[16216.350239]  sdb: unable to read partition table

[16216.514973] sd 12:0:0:0: [sdb] Read Capacity(16) failed: Result:
hostbyte=DID_ERROR driverbyte=DRIVER_OK

[16216.514977] sd 12:0:0:0: [sdb] Sense not available.

[16216.634949] sd 12:0:0:0: [sdb] Read Capacity(10) failed: Result:
hostbyte=DID_ERROR driverbyte=DRIVER_OK

[16216.634952] sd 12:0:0:0: [sdb] Sense not available.

[16216.682978] sd 12:0:0:0: [sdb] 0 512-byte logical blocks: (0 B/0 B)

[16216.835113] sd 12:0:0:0: [sdb] Attached SCSI disk



After some quick digging I have noticed that I have added the following
quirk to my laptop's /etc/modprobe.d back in the day:



options usb-storage quirks=059f:1061:u



Adding the same quirk to the desktop has allowed the drive to work.
Strangely enough it was only needed for USB3, connecting via USB2 cable
worked without the quirk.

There are several other reports of this drive not working with uas:

https://www.reddit.com/r/archlinux/comments/bzm443/external_hdd_not_getting_recognised_on_relatively/
https://bbs.archlinux.org/viewtopic.php?id=211523

Hopefully UAS can be fixed for this USB drive, otherwise maybe the quirk
could be integrated upstream for others to benefit from.
