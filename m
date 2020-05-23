Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF1A1DF814
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2020 17:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726868AbgEWPsT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 May 2020 11:48:19 -0400
Received: from netrider.rowland.org ([192.131.102.5]:42023 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726832AbgEWPsS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 23 May 2020 11:48:18 -0400
Received: (qmail 7978 invoked by uid 1000); 23 May 2020 11:48:17 -0400
Date:   Sat, 23 May 2020 11:48:17 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Till =?iso-8859-1?Q?D=F6rges?= <doerges@pre-sense.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Ext. HDDs not working under Linux via USB 3.0 but under Windows
Message-ID: <20200523154817.GA7091@rowland.harvard.edu>
References: <512118bc-e639-2387-e608-56b7e30fc3b2@pre-sense.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <512118bc-e639-2387-e608-56b7e30fc3b2@pre-sense.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, May 23, 2020 at 04:57:50PM +0200, Till Dörges wrote:
> Hello all,
> 
> I'm trying to get external HDDs from Sony to work under Linux with USB 3.0.
> 
> They do work OK under Windows (USB 2.0 and 3.0).
> 
> They also work OK under Linux for USB 2.0.
> 
> 
> The drives are from the PSZ-HA
> (https://pro.sony/en_AU/products/portable-storage/psz-ha-series) and PSZ-HC
> (https://pro.sony/ue_US/products/portable-storage/psz-hc-series) series.
> 
> I know those are both discontinued, but there still seem to be quite a few of those
> around.
> 
> The drives I'm looking at have these vendor and product IDs:
> 
>  - PSZ-HA2T: idVendor=054c, idProduct=087d
>  - PSZ-HA1T: idVendor=054c, idProduct=087d
>  - PSZ-HA50: idVendor=054c, idProduct=087d
>  - PSZ-HC1T: idVendor=054c, idProduct=0c4f
> 
> 
> I've tried several Linux Kernels (4.4.x and 5.3.x) and several USB 3.0 host
> controllers, e.g.
>  - Intel Corporation 100 Series/C230 Series Chipset Family USB 3.0 xHCI
>  - Renesas Technology Corp. uPD720202 USB 3.0 Host Controller
>  - NEC Corporation uPD720200 USB 3.0 Host Controller
> 
> 
> I've also tried several of the quirk settings
> (https://github.com/torvalds/linux/blob/ead751507de86d90fa250431e9990a8b881f713c/drivers/usb/storage/usb.c#L527).

Unfortunately, the uas driver ignores those settings.

> Unfortunately the problem (drives won't work under Linux when attached via USB 3.0)
> persists.
> 
> 
> For example, when attaching a PSZ-HA2T via USB 3.0 with Kernel 5.3.18 (from upcoming
> openSUSE Leap 15.2) I get this in dmesg:
> 
> --- snip ---
> [  767.481938] usb 6-1: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
> [  767.505381] usb 6-1: New USB device found, idVendor=054c, idProduct=087d,
> bcdDevice= 0.0a
> [  767.505385] usb 6-1: New USB device strings: Mfr=10, Product=11, SerialNumber=3
> [  767.505387] usb 6-1: Product: Portable Storage
> [  767.505388] usb 6-1: Manufacturer: Sony
> [  767.505389] usb 6-1: SerialNumber: 230877290443
> [  767.522588] scsi host5: uas
> [  771.524123] scsi 5:0:0:0: Direct-Access     Sony     PSZ-H            320: PQ: 0
> ANSI: 6
> [  777.526863] sd 5:0:0:0: Attached scsi generic sg7 type 0
> [  777.527091] sd 5:0:0:0: [sdf] Spinning up disk...
> [  778.537372]
> ..................................................................................................not
> responding...
> [  885.868786] sd 5:0:0:0: [sdf] 281474976710656 512-byte logical blocks: (144 PB/128
> PiB)
> [  885.868789] sd 5:0:0:0: [sdf] 4096-byte physical blocks
> [  887.869495] sd 5:0:0:0: [sdf] Write Protect is off
> [  887.869498] sd 5:0:0:0: [sdf] Mode Sense: 67 00 10 08
> [  891.870798] sd 5:0:0:0: [sdf] Write cache: enabled, read cache: enabled, supports
> DPO and FUA
> [  922.741387] sd 5:0:0:0: tag#11 uas_eh_abort_handler 0 uas-tag 1 inflight: IN
> [  922.741393] sd 5:0:0:0: tag#11 CDB: Report supported operation codes a3 0c 01 12
> 00 00 00 00 02 00 00 00
> [  922.757393] scsi host5: uas_eh_device_reset_handler start
> [  922.887214] usb 6-1: reset SuperSpeed Gen 1 USB device number 2 using xhci_hcd
> [  922.917578] scsi host5: uas_eh_device_reset_handler success
> [  953.465374] scsi host5: uas_eh_device_reset_handler start
> [  953.465837] sd 5:0:0:0: tag#11 uas_zap_pending 0 uas-tag 1 inflight:
> [  953.465842] sd 5:0:0:0: tag#11 CDB: Report supported operation codes a3 0c 01 12
> 00 00 00 00 02 00 00 00
> [  953.595235] usb 6-1: reset SuperSpeed Gen 1 USB device number 2 using xhci_hcd
> --- snap ---

It looks like the device needs the USB_FL_NO_REPORT_OPCODES flag.

> So, when I blacklist UAS for the drive:
> --- snip ---
> $  cat /sys/module/usb_storage/parameters/quirks
> 054c:087d:u,054c:0c4f:u
> --- snap ---
> 
> 
> dmesg shows this when attaching the PSZ-HA2T:
> --- snip ---
> [87130.955521] usb 4-2: new SuperSpeed Gen 1 USB device number 13 using xhci_hcd
> [87130.979047] usb 4-2: New USB device found, idVendor=054c, idProduct=087d,
> bcdDevice= 0.0a
> [87130.979051] usb 4-2: New USB device strings: Mfr=10, Product=11, SerialNumber=3
> [87130.979052] usb 4-2: Product: Portable Storage
> [87130.979053] usb 4-2: Manufacturer: Sony
> [87130.979054] usb 4-2: SerialNumber: 230877290443
> [87130.983677] usb 4-2: UAS is blacklisted for this device, using usb-storage instead
> [87130.983679] usb-storage 4-2:1.0: USB Mass Storage device detected
> [87130.983753] usb-storage 4-2:1.0: Quirks match for vid 054c pid 087d: 800000
> [87130.983770] scsi host5: usb-storage 4-2:1.0
> [87134.003728] scsi 5:0:0:0: Direct-Access     Sony     PSZ-H            320: PQ: 0
> ANSI: 6
> [87134.003936] sd 5:0:0:0: Attached scsi generic sg7 type 0
> [87140.006762] sd 5:0:0:0: [sdf] Spinning up disk...
> [87143.042934] ................not responding...
> [87254.168509] sd 5:0:0:0: [sdf] Read Capacity(10) failed: Result: hostbyte=DID_OK
> driverbyte=DRIVER_SENSE
> [87254.168513] sd 5:0:0:0: [sdf] Sense Key : Not Ready [current]
> [87254.168515] sd 5:0:0:0: [sdf] Add. Sense: Logical unit is in process of becoming ready
> [87254.168518] sd 5:0:0:0: [sdf] 0 512-byte logical blocks: (0 B/0 B)
> [87254.168519] sd 5:0:0:0: [sdf] 0-byte physical blocks
> [87256.170408] sd 5:0:0:0: [sdf] Test WP failed, assume Write Enabled
> [87258.172158] sd 5:0:0:0: [sdf] Asking for cache data failed
> [87258.172172] sd 5:0:0:0: [sdf] Assuming drive cache: write through
> [87268.192507] sd 5:0:0:0: [sdf] Spinning up disk...
> --- snap ---

It's hard to tell from this what went wrong.  The device seems to be 
acting as though it takes more than 110 seconds to spin up, which is 
obviously ridiculous.

> So UAS might not be the problem after all. Particularly because when attaching the
> drive in Windows 10 I notice some popup saying something about "UAS".
> 
> 
> Since the drives do work under Windows with USB 3.0 I'm still guessing that the
> drives fail to correctly implement parts of USB 3.0.

No, the drive implements USB 3.0 just fine.  But it doesn't implement 
the SCSI protocol properly, in particular, the REPORT OPCODES 
subcommand.

> Is there any way to pinpoint the problem(s)? Or do I have to try all possible quirk
> combinations and hope I find the one that's working?

Try adding an entry to the unusual_uas.h file for the device, specifying 
the USB_FL_NO_REPORT_OPCODES flag.

Alan Stern
