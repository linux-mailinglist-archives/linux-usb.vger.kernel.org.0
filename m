Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06FE14ECDA9
	for <lists+linux-usb@lfdr.de>; Wed, 30 Mar 2022 22:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbiC3UDA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Mar 2022 16:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350842AbiC3UC7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Mar 2022 16:02:59 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id A145A3B3C0
        for <linux-usb@vger.kernel.org>; Wed, 30 Mar 2022 13:01:13 -0700 (PDT)
Received: (qmail 424386 invoked by uid 1000); 30 Mar 2022 16:01:12 -0400
Date:   Wed, 30 Mar 2022 16:01:12 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Vladimir Nikishkin <lockywolf@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [xhci] usb 4-1: reset SuperSpeed Gen 1 USB device number 2 using
 xhci_hcd
Message-ID: <YkS3CE7smJA2DnbO@rowland.harvard.edu>
References: <87sfr0okqm.fsf@laptop.lockywolf.net>
 <87r16knnw4.fsf@laptop.lockywolf.net>
 <87y20r3bny.fsf@laptop.lockywolf.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y20r3bny.fsf@laptop.lockywolf.net>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 30, 2022 at 07:46:57PM +0800, Vladimir Nikishkin wrote:
> 
> Vladimir Nikishkin <lockywolf@gmail.com> writes:
> 
> > Vladimir Nikishkin <lockywolf@gmail.com> writes:
> >
> > I seem to be having a problem similar to the one Sedat Dilek had.
> > My usb 3.0 'ASMedia Technology Inc. ASM1051E SATA 6Gb/s bridge, ASM1053E
> > SATA 6Gb/s bridge, ASM1153 SATA 3Gb/s bridge, ASM1153E SATA 6Gb/s
> > bridge' is getting reset under load.
> > I tried adding the 't' flag, but the drives is still getting reset with
> > the following message in dmesg:
> > ```
> > [  +0.004767] scsi host6: uas_eh_device_reset_handler start
> > [  +0.066198] usb 2-2.4.2: reset SuperSpeed USB device number 91 using xhci_hcd
> > [  +0.014680] scsi host6: uas_eh_device_reset_handler success
> > [Mar29 23:01] sd 6:0:0:0: [sde] tag#18 uas_eh_abort_handler 0 uas-tag 11 inflight: CMD OUT 
> > [  +0.000007] sd 6:0:0:0: [sde] tag#18 CDB: opcode=0x8a 8a 00 00 00 00 01 97 1d e4 08 00 00 04 00 00 00
> > [  +0.000042] sd 6:0:0:0: [sde] tag#17 uas_eh_abort_handler 0 uas-tag 10 inflight: CMD OUT 
> > [  +0.000004] sd 6:0:0:0: [sde] tag#17 CDB: opcode=0x8a 8a 00 00 00 00 01 97 1d e0 08 00 00 04 00 00 00
> > [  +0.000071] sd 6:0:0:0: [sde] tag#16 uas_eh_abort_handler 0 uas-tag 9 inflight: CMD OUT 
> > [  +0.000004] sd 6:0:0:0: [sde] tag#16 CDB: opcode=0x8a 8a 00 00 00 00 01 97 1d e0 00 00 00 00 08 00 00
> > [  +0.000027] sd 6:0:0:0: [sde] tag#15 uas_eh_abort_handler 0 uas-tag 8 inflight: CMD OUT 
> > [  +0.000004] sd 6:0:0:0: [sde] tag#15 CDB: opcode=0x8a 8a 00 00 00 00 01 97 1d dc 00 00 00 04 00 00 00
> > [  +0.005166] scsi host6: uas_eh_device_reset_handler start
> > [  +0.065988] usb 2-2.4.2: reset SuperSpeed USB device number 91 using xhci_hcd
> > [  +0.014673] scsi host6: uas_eh_device_reset_handler success
> > ```
> >
> > I have also attached the usbmon log:
> >
> > I have seen reports that firmware needs to be updated in those chips in
> > order to support large drives
> > (https://www.computerbase.de/forum/threads/asmedia-aktuelle-externe-gehaeuse-chip-firmware-fuer-8tb.1473501/page-2)
> > Googling for ASM1153+Raspberryp Pi returns quite a lot of difficulties
> > with using those chips. (Although I am not using it with Raspberry Pi)
> > Maybe it is not on only the ATA command that is leading to a reset?
> > In my case the device is getting reset after ~30 Gb transferred via
> > rsync.
> > Any debugging suggestions welcome. (I will try to rebuild the kernel
> > with the sysctl debug patch.)
> 
> So I have rebuilt the kernel with the "SCSI ioctl error" reports, and I
> do not see any reports when the disk gets reset.
> 
> Just in case it might be more useful, here is the usbmon dump:
> 
> http://public.lockywolf.net/pub/usbmon-dump.bus2-without-smart-udisks-with-tquirk.txt.gz

The usbmon trace merely shows that at one point the bridge stopped 
responding.  After 30 seconds with no data transferred, the kernel reset 
the bridge and then it started working again.

There was nothing special going on when the bridge stopped responding; 
it was in the midst of carrying out a bunch of write commands, just like 
thousands of others that were successful.

I suppose in theory it's possible that the bridge was working normally 
and the fault was in the computer (it didn't receive the data that the 
bridge was sending).  But that seems highly unlikely.  Most likely the 
ASM1153 USB-SATA bridge has an intermittent failure mode that triggers 
under load.  For instance, there could be a momentary voltage drop 
messing it up.

Alan Stern
