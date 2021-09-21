Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9617D413710
	for <lists+linux-usb@lfdr.de>; Tue, 21 Sep 2021 18:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233795AbhIUQRu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 21 Sep 2021 12:17:50 -0400
Received: from smtp1.math.uni-bielefeld.de ([129.70.45.10]:37404 "EHLO
        smtp1.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232400AbhIUQRt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Sep 2021 12:17:49 -0400
X-Greylist: delayed 572 seconds by postgrey-1.27 at vger.kernel.org; Tue, 21 Sep 2021 12:17:49 EDT
Received: from [192.168.1.97] (ip5f5afd21.dynamic.kabel-deutschland.de [95.90.253.33])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by smtp1.math.uni-bielefeld.de (Postfix) with ESMTPSA id B8E066025C;
        Tue, 21 Sep 2021 18:06:45 +0200 (CEST)
To:     Alan Stern <stern@rowland.harvard.edu>,
        Tobias Jakobi <cubic2k@gmail.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
References: <20210921101752.4679-1-tjakobi@math.uni-bielefeld.de>
 <20210921151323.GA170347@rowland.harvard.edu>
From:   Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH] usb: storage: add quirks for VIA VL817 USB3-SATA bridge
Message-ID: <cfb2d4e4-0e6a-69d5-01ac-dc1ab4d9d319@math.uni-bielefeld.de>
Date:   Tue, 21 Sep 2021 18:06:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921151323.GA170347@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

sorry but your analysis of the log is wrong. Nothing was disconnected or 
unplugged when the device behaves this way. The enclosure is connected 
to the power the entire time, and the same applies to the physical USB 
connection to my system.

To make things very clear: This happens in under five minutes after 
having powered up the enclosure and starting a file transfer to the 
installed RAID. After blacklisting UASP the enclosure works perfectly 
fine for hours. I hope this clears things up.

With best wishes,
Tobias

On 9/21/21 5:13 PM, Alan Stern wrote:
> On Tue, Sep 21, 2021 at 12:17:52PM +0200, Tobias Jakobi wrote:
>> The VL817 is used in the RaidSonic Icy Box IB-3740-C31 enclosure. The enclosure
>> is advertised as having UASP support, but appears to have problems with 4Kn
>> drives (test was done with two Seagate Exos X, 12TB).
>>
>> Disable UAS for the VL817 as it behaves highly unstable:
>>
>> [Aug14 16:31] usb 2-1.2: USB disconnect, device number 4
> So first the drive was unplugged or disconnected...
>
>> [  +0.007701] sd 4:0:0:0: [sdb] tag#4 uas_zap_pending 0 uas-tag 1 inflight: CMD
>> [  +0.000004] sd 4:0:0:0: [sdb] tag#4 CDB: opcode=0x2a 2a 00 00 37 63 da 00 00 80 00
>> [  +0.000022] sd 4:0:0:0: [sdb] tag#4 UNKNOWN(0x2003) Result: hostbyte=0x01 driverbyte=0x00 cmd_age=19s
>> [  +0.000001] sd 4:0:0:0: [sdb] tag#4 CDB: opcode=0x2a 2a 00 00 37 63 da 00 00 80 00
>> [  +0.000001] blk_update_request: I/O error, dev sdb, sector 29040336 op 0x1:(WRITE) flags 0x0 phys_seg 128 prio class 0
>> [  +0.000028] blk_update_request: I/O error, dev sdb, sector 29041360 op 0x1:(WRITE) flags 0x0 phys_seg 128 prio class 0
>> [  +0.000000] blk_update_request: I/O error, dev sdb, sector 16 op 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
>> [  +0.000005] md: super_written gets error=-5
>> [  +0.000002] md/raid1:md126: Disk failure on sdb, disabling device.
>>                md/raid1:md126: Operation continuing on 1 devices.
>> [  +0.000024] blk_update_request: I/O error, dev sdb, sector 29042384 op 0x1:(WRITE) flags 0x0 phys_seg 128 prio class 0
>> [  +0.000222] sd 4:0:0:0: [sdb] Synchronizing SCSI cache
>> [  +0.078154] blk_update_request: I/O error, dev sdb, sector 29040336 op 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
>> [  +0.000025] blk_update_request: I/O error, dev sdb, sector 29040344 op 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
>> [  +0.007520] blk_update_request: I/O error, dev sdb, sector 29040352 op 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
>> [  +0.000021] blk_update_request: I/O error, dev sdb, sector 29040360 op 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
>> [  +0.000015] blk_update_request: I/O error, dev sdb, sector 29040368 op 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
>> [  +0.000009] blk_update_request: I/O error, dev sdb, sector 29040376 op 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
>> [  +0.023299] sd 4:0:0:0: [sdb] Synchronize Cache(10) failed: Result: hostbyte=0x07 driverbyte=0x00
> Then there was a bunch of errors, which is to be expected when a drive
> is suddenly disconnected...
>
>> [  +1.893439] usb 2-1.2: new SuperSpeed Plus Gen 2x1 USB device number 7 using xhci_hcd
>> [  +0.024064] scsi host7: uas
>> [ +16.365880] scsi 7:0:0:0: Direct-Access     ST12000N M001G-2MV103     SB2D PQ: 0 ANSI: 6
>> [  +0.001192] sd 7:0:0:0: Attached scsi generic sg1 type 0
>> [  +0.000940] sd 7:0:0:0: [sde] 2929721344 4096-byte logical blocks: (12.0 TB/10.9 TiB)
>> [  +0.000130] sd 7:0:0:0: [sde] Write Protect is off
>> [  +0.000001] sd 7:0:0:0: [sde] Mode Sense: 2f 00 00 00
>> [  +0.000265] sd 7:0:0:0: [sde] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
>> [  +0.000399] sd 7:0:0:0: [sde] Optimal transfer size 268431360 bytes
>> [  +0.120240] sd 7:0:0:0: [sde] Attached SCSI disk
> And then the drive reconnected, this time successfully.  How does this
> show that UAS was the reason for the problem?  Indeed, how does this
> show there was any problem at all?
>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> ---
>>   drivers/usb/storage/unusual_uas.h | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
>> index bda0f2cdf093..7d83ecf835c6 100644
>> --- a/drivers/usb/storage/unusual_uas.h
>> +++ b/drivers/usb/storage/unusual_uas.h
>> @@ -125,6 +125,13 @@ UNUSUAL_DEV(0x2109, 0x0711, 0x0000, 0x9999,
>>   		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>>   		US_FL_NO_ATA_1X),
>>   
>> +/* Reported-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de> */
>> +UNUSUAL_DEV(0x2109, 0x0715, 0x0000, 0x9999,
>> +		"VIA",
>> +		"VL817",
>> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>> +		US_FL_IGNORE_UAS),
>> +
>>   /* Reported-by: Icenowy Zheng <icenowy@aosc.io> */
>>   UNUSUAL_DEV(0x2537, 0x1068, 0x0000, 0x9999,
>>   		"Norelsys",
> Instead of IGNORE_UAS, have you tried the NO_ATA_1X flag, which seems to
> help in the preceding entry (a different device from the same vendor)?
>
> Alan Stern

