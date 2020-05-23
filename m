Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E78361DF7E3
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2020 17:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387869AbgEWPEq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 May 2020 11:04:46 -0400
Received: from blockout.pre-sense.de ([213.238.39.74]:41533 "EHLO
        mail.pre-sense.de" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387815AbgEWPEp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 23 May 2020 11:04:45 -0400
X-Greylist: delayed 411 seconds by postgrey-1.27 at vger.kernel.org; Sat, 23 May 2020 11:04:43 EDT
Received: from smtp.pre-sense.de (tetris_b.pre-sense.de [10.9.0.76])
        by mail.pre-sense.de (Postfix) with ESMTP id 850C15E0F0
        for <linux-usb@vger.kernel.org>; Sat, 23 May 2020 16:57:50 +0200 (CEST)
Received: from atlan.none (unknown [212.12.60.67])
        by smtp.pre-sense.de (Postfix) with ESMTPS id 80C7015D8
        for <linux-usb@vger.kernel.org>; Sat, 23 May 2020 16:56:50 +0200 (CEST)
From:   =?UTF-8?Q?Till_D=c3=b6rges?= <doerges@pre-sense.de>
Subject: Ext. HDDs not working under Linux via USB 3.0 but under Windows
To:     linux-usb@vger.kernel.org
Autocrypt: addr=doerges@pre-sense.de; prefer-encrypt=mutual; keydata=
 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
Organization: PRESENSE Technologies GmbH
Message-ID: <512118bc-e639-2387-e608-56b7e30fc3b2@pre-sense.de>
Date:   Sat, 23 May 2020 16:57:50 +0200
User-Agent: Thunderbird
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello all,

I'm trying to get external HDDs from Sony to work under Linux with USB 3.0.

They do work OK under Windows (USB 2.0 and 3.0).

They also work OK under Linux for USB 2.0.


The drives are from the PSZ-HA
(https://pro.sony/en_AU/products/portable-storage/psz-ha-series) and PSZ-HC
(https://pro.sony/ue_US/products/portable-storage/psz-hc-series) series.

I know those are both discontinued, but there still seem to be quite a few of those
around.

The drives I'm looking at have these vendor and product IDs:

 - PSZ-HA2T: idVendor=054c, idProduct=087d
 - PSZ-HA1T: idVendor=054c, idProduct=087d
 - PSZ-HA50: idVendor=054c, idProduct=087d
 - PSZ-HC1T: idVendor=054c, idProduct=0c4f


I've tried several Linux Kernels (4.4.x and 5.3.x) and several USB 3.0 host
controllers, e.g.
 - Intel Corporation 100 Series/C230 Series Chipset Family USB 3.0 xHCI
 - Renesas Technology Corp. uPD720202 USB 3.0 Host Controller
 - NEC Corporation uPD720200 USB 3.0 Host Controller


I've also tried several of the quirk settings
(https://github.com/torvalds/linux/blob/ead751507de86d90fa250431e9990a8b881f713c/drivers/usb/storage/usb.c#L527).


Unfortunately the problem (drives won't work under Linux when attached via USB 3.0)
persists.


For example, when attaching a PSZ-HA2T via USB 3.0 with Kernel 5.3.18 (from upcoming
openSUSE Leap 15.2) I get this in dmesg:

--- snip ---
[  767.481938] usb 6-1: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
[  767.505381] usb 6-1: New USB device found, idVendor=054c, idProduct=087d,
bcdDevice= 0.0a
[  767.505385] usb 6-1: New USB device strings: Mfr=10, Product=11, SerialNumber=3
[  767.505387] usb 6-1: Product: Portable Storage
[  767.505388] usb 6-1: Manufacturer: Sony
[  767.505389] usb 6-1: SerialNumber: 230877290443
[  767.522588] scsi host5: uas
[  771.524123] scsi 5:0:0:0: Direct-Access     Sony     PSZ-H            320: PQ: 0
ANSI: 6
[  777.526863] sd 5:0:0:0: Attached scsi generic sg7 type 0
[  777.527091] sd 5:0:0:0: [sdf] Spinning up disk...
[  778.537372]
..................................................................................................not
responding...
[  885.868786] sd 5:0:0:0: [sdf] 281474976710656 512-byte logical blocks: (144 PB/128
PiB)
[  885.868789] sd 5:0:0:0: [sdf] 4096-byte physical blocks
[  887.869495] sd 5:0:0:0: [sdf] Write Protect is off
[  887.869498] sd 5:0:0:0: [sdf] Mode Sense: 67 00 10 08
[  891.870798] sd 5:0:0:0: [sdf] Write cache: enabled, read cache: enabled, supports
DPO and FUA
[  922.741387] sd 5:0:0:0: tag#11 uas_eh_abort_handler 0 uas-tag 1 inflight: IN
[  922.741393] sd 5:0:0:0: tag#11 CDB: Report supported operation codes a3 0c 01 12
00 00 00 00 02 00 00 00
[  922.757393] scsi host5: uas_eh_device_reset_handler start
[  922.887214] usb 6-1: reset SuperSpeed Gen 1 USB device number 2 using xhci_hcd
[  922.917578] scsi host5: uas_eh_device_reset_handler success
[  953.465374] scsi host5: uas_eh_device_reset_handler start
[  953.465837] sd 5:0:0:0: tag#11 uas_zap_pending 0 uas-tag 1 inflight:
[  953.465842] sd 5:0:0:0: tag#11 CDB: Report supported operation codes a3 0c 01 12
00 00 00 00 02 00 00 00
[  953.595235] usb 6-1: reset SuperSpeed Gen 1 USB device number 2 using xhci_hcd
--- snap ---


So, when I blacklist UAS for the drive:
--- snip ---
$  cat /sys/module/usb_storage/parameters/quirks
054c:087d:u,054c:0c4f:u
--- snap ---


dmesg shows this when attaching the PSZ-HA2T:
--- snip ---
[87130.955521] usb 4-2: new SuperSpeed Gen 1 USB device number 13 using xhci_hcd
[87130.979047] usb 4-2: New USB device found, idVendor=054c, idProduct=087d,
bcdDevice= 0.0a
[87130.979051] usb 4-2: New USB device strings: Mfr=10, Product=11, SerialNumber=3
[87130.979052] usb 4-2: Product: Portable Storage
[87130.979053] usb 4-2: Manufacturer: Sony
[87130.979054] usb 4-2: SerialNumber: 230877290443
[87130.983677] usb 4-2: UAS is blacklisted for this device, using usb-storage instead
[87130.983679] usb-storage 4-2:1.0: USB Mass Storage device detected
[87130.983753] usb-storage 4-2:1.0: Quirks match for vid 054c pid 087d: 800000
[87130.983770] scsi host5: usb-storage 4-2:1.0
[87134.003728] scsi 5:0:0:0: Direct-Access     Sony     PSZ-H            320: PQ: 0
ANSI: 6
[87134.003936] sd 5:0:0:0: Attached scsi generic sg7 type 0
[87140.006762] sd 5:0:0:0: [sdf] Spinning up disk...
[87143.042934] ................not responding...
[87254.168509] sd 5:0:0:0: [sdf] Read Capacity(10) failed: Result: hostbyte=DID_OK
driverbyte=DRIVER_SENSE
[87254.168513] sd 5:0:0:0: [sdf] Sense Key : Not Ready [current]
[87254.168515] sd 5:0:0:0: [sdf] Add. Sense: Logical unit is in process of becoming ready
[87254.168518] sd 5:0:0:0: [sdf] 0 512-byte logical blocks: (0 B/0 B)
[87254.168519] sd 5:0:0:0: [sdf] 0-byte physical blocks
[87256.170408] sd 5:0:0:0: [sdf] Test WP failed, assume Write Enabled
[87258.172158] sd 5:0:0:0: [sdf] Asking for cache data failed
[87258.172172] sd 5:0:0:0: [sdf] Assuming drive cache: write through
[87268.192507] sd 5:0:0:0: [sdf] Spinning up disk...
--- snap ---


So UAS might not be the problem after all. Particularly because when attaching the
drive in Windows 10 I notice some popup saying something about "UAS".


Since the drives do work under Windows with USB 3.0 I'm still guessing that the
drives fail to correctly implement parts of USB 3.0.


Is there any way to pinpoint the problem(s)? Or do I have to try all possible quirk
combinations and hope I find the one that's working?


Any insights on this would greatly be appreciated!


Thanks and regards -- Till
-- 
Dipl.-Inform. Till Dörges                  doerges@pre-sense.de
PRESENSE Technologies GmbH             Nagelsweg 41, D-20097 HH
Geschäftsführer/Managing Directors       AG Hamburg, HRB 107844
Till Dörges, Jürgen Sander               USt-IdNr.: DE263765024
