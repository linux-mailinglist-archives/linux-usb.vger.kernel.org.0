Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5ED497A4B
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 15:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728633AbfHUNE4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 09:04:56 -0400
Received: from mx01-fr.bfs.de ([193.174.231.67]:64696 "EHLO mx01-fr.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728509AbfHUNE4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Aug 2019 09:04:56 -0400
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
        by mx01-fr.bfs.de (Postfix) with ESMTPS id 3820D202E6;
        Wed, 21 Aug 2019 15:04:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1566392689; h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IZg4dxJniRKHI4Sl8AW0R5FTbQC3UH3XoGhLbsdEDCM=;
        b=QjmzPvD+fuLr9RErqEbvHBdwpRtF9F0SrnzwWHTfM/bvQoP2RyzlsHTGCTCTgSRIuCjlHE
        INLxuU4uOUeNY0bExpeC6seHCJUzBuZezL98AX12PIUteFhojT+QOJXc8LPU87ldhrDMVW
        lSMkg18mFdoMuzqqHyfnjkVcprGTA3gMjeZalW4uMgBdycW55+DBl/PsSrOi8193xqZ1/R
        14AH5mmi1Be2exd10CAI3azJVOOJM378IrCsyP2TNXRyV5fp2IdenDOBV45b2EklPmSE4F
        RxSGypUf9FJSptycBXQWMIP9Fm/FlDZBPWLKR28w8qMUDxF7X+o74meAph1EJg==
Received: from [134.92.181.33] (unknown [134.92.181.33])
        by mail-fr.bfs.de (Postfix) with ESMTPS id 10501BEEBD;
        Wed, 21 Aug 2019 15:04:49 +0200 (CEST)
Message-ID: <5D5D4170.4070001@bfs.de>
Date:   Wed, 21 Aug 2019 15:04:48 +0200
From:   walter harms <wharms@bfs.de>
Reply-To: wharms@bfs.de
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de; rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Schmid, Carsten" <Carsten_Schmid@mentor.com>
Subject: Re: problems with Edgeport/416
References: <5D5D1C8C.9080000@bfs.de> <20190821112009.GA5228@kroah.com> <5D5D2F9E.7050805@bfs.de> <20190821122028.GA19107@kroah.com>
In-Reply-To: <20190821122028.GA19107@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.10
Authentication-Results: mx01-fr.bfs.de
X-Spamd-Result: default: False [-3.10 / 7.00];
         ARC_NA(0.00)[];
         TO_DN_EQ_ADDR_SOME(0.00)[];
         HAS_REPLYTO(0.00)[wharms@bfs.de];
         FROM_HAS_DN(0.00)[];
         RCPT_COUNT_THREE(0.00)[3];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         REPLYTO_ADDR_EQ_FROM(0.00)[];
         BAYES_HAM(-3.00)[100.00%];
         DKIM_SIGNED(0.00)[];
         NEURAL_HAM(-0.00)[-0.998,0];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         RCVD_TLS_ALL(0.00)[]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Am 21.08.2019 14:20, schrieb Greg KH:
> On Wed, Aug 21, 2019 at 01:48:46PM +0200, walter harms wrote:
>>
>>
>> Am 21.08.2019 13:20, schrieb Greg KH:
>>> On Wed, Aug 21, 2019 at 12:27:24PM +0200, walter harms wrote:
>>>> Hello List,
>>>> does some use linux with an Edgeport/416 ?
>>>>
>>>> I have a strange problem. the device is resetting soon
>>>> after i started using it (but not immediately).
>>>> I do not see a kernel OOPS but a common pattern is:
>>>>
>>>> 2019-08-20T15:19:39.825812+00:00 omnfrmo10 kernel: [683270.658623] usb 7-1.1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>>>> 2019-08-20T15:19:39.825818+00:00 omnfrmo10 kernel: [683270.658626] usb 7-1.1.2: Product: Edgeport/416
>>>> 2019-08-20T15:19:39.825821+00:00 omnfrmo10 kernel: [683270.658628] usb 7-1.1.2: Manufacturer: Digi International
>>>> 2019-08-20T15:19:39.825823+00:00 omnfrmo10 kernel: [683270.658630] usb 7-1.1.2: SerialNumber: E63966100-1
>>>> 2019-08-20T15:19:39.985571+00:00 omnfrmo10 kernel: [683270.817909] usb 7-1.1.2: Edgeport TI 2 port adapter converter now attached to ttyUSB4
>>>> 2019-08-20T15:19:39.985594+00:00 omnfrmo10 kernel: [683270.818132] usb 7-1.1.2: Edgeport TI 2 port adapter converter now attached to ttyUSB5
>>>> 2019-08-20T15:19:40.007943+00:00 omnfrmo10 mtp-probe: checking bus 7, device 88: "/sys/devices/pci0000:00/0000:00:1d.1/usb7/7-1/7-1.1/7-1.1.2"
>>>> 2019-08-20T15:19:40.053750+00:00 omnfrmo10 kernel: [683270.885626] usb 7-1.2.2: New USB device found, idVendor=1608, idProduct=0247
>>>> 2019-08-20T15:19:40.053791+00:00 omnfrmo10 kernel: [683270.885630] usb 7-1.2.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>>>> 2019-08-20T15:19:40.053797+00:00 omnfrmo10 kernel: [683270.885633] usb 7-1.2.2: Product: Edgeport/416
>>>> 2019-08-20T15:19:40.053800+00:00 omnfrmo10 kernel: [683270.885635] usb 7-1.2.2: Manufacturer: Digi International
>>>> 2019-08-20T15:19:40.053803+00:00 omnfrmo10 kernel: [683270.885637] usb 7-1.2.2: SerialNumber: E63966100-5
>>>> 2019-08-20T15:19:40.065569+00:00 omnfrmo10 kernel: [683270.897406] usb 7-1.1.3: new full-speed USB device number 90 using uhci_hcd
>>>> 2019-08-20T15:19:40.213569+00:00 omnfrmo10 kernel: [683271.046316] usb 7-1.2.2: Edgeport TI 2 port adapter converter now attached to ttyUSB6
>>>> 2019-08-20T15:19:40.213594+00:00 omnfrmo10 kernel: [683271.046782] usb 7-1.2.2: Edgeport TI 2 port adapter converter now attached to ttyUSB7
>>>> 2019-08-20T15:19:40.242034+00:00 omnfrmo10 mtp-probe: checking bus 7, device 89: "/sys/devices/pci0000:00/0000:00:1d.1/usb7/7-1/7-1.2/7-1.2.2"
>>>> 2019-08-20T15:19:40.301578+00:00 omnfrmo10 kernel: [683271.133380] usb 7-1.2.3: new full-speed USB device number 91 using uhci_hcd
>>>> 2019-08-20T15:19:40.357559+00:00 omnfrmo10 kernel: [683271.192815] usb 7-1.1.3: New USB device found, idVendor=1608, idProduct=0247
>>>> 2019-08-20T15:19:40.357584+00:00 omnfrmo10 kernel: [683271.192820] usb 7-1.1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>>>> 2019-08-20T15:19:40.357588+00:00 omnfrmo10 kernel: [683271.192822] usb 7-1.1.3: Product: Edgeport/416
>>>> 2019-08-20T15:19:40.357591+00:00 omnfrmo10 kernel: [683271.192825] usb 7-1.1.3: Manufacturer: Digi International
>>>> 2019-08-20T15:19:40.357593+00:00 omnfrmo10 kernel: [683271.192827] usb 7-1.1.3: SerialNumber: E63966100-2
>>>> 2019-08-20T15:19:40.513702+00:00 omnfrmo10 kernel: [683271.349103] usb 7-1.1.3: Edgeport TI 2 port adapter converter now attached to ttyUSB8
>>>> 2019-08-20T15:19:40.513725+00:00 omnfrmo10 kernel: [683271.349311] usb 7-1.1.3: Edgeport TI 2 port adapter converter now attached to ttyUSB9
>>>> 2019-08-20T15:19:40.537138+00:00 omnfrmo10 mtp-probe: checking bus 7, device 90: "/sys/devices/pci0000:00/0000:00:1d.1/usb7/7-1/7-1.1/7-1.1.3"
>>>> 2019-08-20T15:19:40.601754+00:00 omnfrmo10 kernel: [683271.433389] usb 7-1.1.4: new full-speed USB device number 92 using uhci_hcd
>>>> 2019-08-20T15:19:40.601794+00:00 omnfrmo10 kernel: [683271.433631] usb 7-1.2.3: New USB device found, idVendor=1608, idProduct=0247
>>>> 2019-08-20T15:19:40.601798+00:00 omnfrmo10 kernel: [683271.433634] usb 7-1.2.3: New USB device strings: Mfr=1, Produc
>>>
>>> I don't see any errors there.  What is the problem with the device?
>>>
>> You use it, it resets (ports gone etc) and appears again.
>> I suspected that the device is broken but i test today with windows
>> (and a different computer) showed it works fine.
> 
> Different computer?  Did you try windows on the same exact machine with
> same exact cable?  This sounds like a hardware program, if the device
> disconnects,there's nothing the software can do about that, it's a
> hardware / electrical thing.
> 

Different computer but same cables i guess the device is ok.

NTL I found that little gem:
https://www.fclose.com/linux-kernels/594677/usb-io_ti-add-heartbeat-to-keep-idle-ep-416-ports-from-disconnecting-linux-4-3/

The behavior would fit (any way to check that the heartbeat is active ?).

Casten Schmidt ask me to look into /sys/kernel/debug/dynamic_debug/control before i start to
debug the whole usb part, is that below expected behavior ? (i tried to find what version of edgeport the driver suspects).

drivers/usb/serial/io_ti.c:1507 [io_ti]do_boot_mode =_ "%s - STAYING IN BOOT MODE\012"
drivers/usb/serial/io_ti.c:1500 [io_ti]do_boot_mode =_ "%s - Download successful -- Device rebooting...\012"
drivers/usb/serial/io_ti.c:1493 [io_ti]do_boot_mode =_ "%s - Error downloading operational code image\012"
drivers/usb/serial/io_ti.c:1487 [io_ti]do_boot_mode =_ "%s - Downloading operational code image version %d.%d (TI UMP)\012"
drivers/usb/serial/io_ti.c:1440 [io_ti]do_boot_mode =_ "%s - Wrong CPU Rev %d (Must be 2)\012"
drivers/usb/serial/io_ti.c:1403 [io_ti]do_boot_mode =_ "%s - VID = 0x%x\012"
drivers/usb/serial/io_ti.c:1393 [io_ti]do_boot_mode =_ "%s - RUNNING IN BOOT MODE\012"
drivers/usb/serial/io_ti.c:1367 [io_ti]do_download_mode =_ "%s - Update complete 0x%x\012"
drivers/usb/serial/io_ti.c:1358 [io_ti]do_download_mode =_ "%s - Start firmware update\012"
drivers/usb/serial/io_ti.c:1347 [io_ti]do_download_mode =_ "%s - write download record failed\012"
drivers/usb/serial/io_ti.c:1338 [io_ti]do_download_mode =_ "%s - can't read header back\012"
drivers/usb/serial/io_ti.c:1291 [io_ti]do_download_mode =_ "%s - Found Type BLANK FIRMWARE (Type F2) record\012"
drivers/usb/serial/io_ti.c:1252 [io_ti]do_download_mode =_ "%s - HARDWARE RESET return %d\012"
drivers/usb/serial/io_ti.c:1243 [io_ti]do_download_mode =_ "%s - HARDWARE RESET\012"
drivers/usb/serial/io_ti.c:1178 [io_ti]do_download_mode =_ "%s - Update I2C dld from %d.%d to %d.%d\012"
drivers/usb/serial/io_ti.c:1166 [io_ti]do_download_mode =_ "%s - >> FW Versions Device %d.%d  Driver %d.%d\012"
drivers/usb/serial/io_ti.c:1129 [io_ti]do_download_mode =_ "%s - Found Type FIRMWARE (Type 2) record\012"
drivers/usb/serial/io_ti.c:1110 [io_ti]do_download_mode =_ "%s - Wrong CPU Rev %d (Must be 2)\012"
drivers/usb/serial/io_ti.c:1089 [io_ti]do_download_mode =_ "%s - DOWNLOAD MODE -- BAD I2C\012"
drivers/usb/serial/io_ti.c:1085 [io_ti]do_download_mode =_ "%s - RUNNING IN DOWNLOAD MODE\012"
drivers/usb/serial/io_ti.c:906 [io_ti]i2c_type_bootmode =_ "%s - Unknown\012"
drivers/usb/serial/io_ti.c:901 [io_ti]i2c_type_bootmode =_ "%s - ROM_TYPE_III\012"
drivers/usb/serial/io_ti.c:899 [io_ti]i2c_type_bootmode =_ "%s - read 2 data = 0x%x\012"
drivers/usb/serial/io_ti.c:897 [io_ti]i2c_type_bootmode =_ "%s - read 3 status error = %d\012"
drivers/usb/serial/io_ti.c:888 [io_ti]i2c_type_bootmode =_ "%s - ROM_TYPE_II\012"
drivers/usb/serial/io_ti.c:886 [io_ti]i2c_type_bootmode =_ "%s - read 2 data = 0x%x\012"
drivers/usb/serial/io_ti.c:884 [io_ti]i2c_type_bootmode =_ "%s - read 2 status error = %d\012"

re,
 wh
