Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66CCC1DFADF
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2020 22:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387843AbgEWUGc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 May 2020 16:06:32 -0400
Received: from blockout.pre-sense.de ([213.238.39.74]:53997 "EHLO
        mail.pre-sense.de" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728319AbgEWUGc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 23 May 2020 16:06:32 -0400
Received: from smtp.pre-sense.de (tetris_b.pre-sense.de [10.9.0.76])
        by mail.pre-sense.de (Postfix) with ESMTP id 3F5D25E0F0;
        Sat, 23 May 2020 22:06:29 +0200 (CEST)
Received: from atlan.none (unknown [212.12.60.67])
        by smtp.pre-sense.de (Postfix) with ESMTPS id 4F89915D8;
        Sat, 23 May 2020 22:05:24 +0200 (CEST)
Subject: Re: Ext. HDDs not working under Linux via USB 3.0 but under Windows
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
References: <512118bc-e639-2387-e608-56b7e30fc3b2@pre-sense.de>
 <20200523154817.GA7091@rowland.harvard.edu>
From:   =?UTF-8?Q?Till_D=c3=b6rges?= <doerges@pre-sense.de>
Autocrypt: addr=doerges@pre-sense.de; prefer-encrypt=mutual; keydata=
 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
Organization: PRESENSE Technologies GmbH
Message-ID: <34933b01-e4b0-10da-c935-9e6a9a6ae427@pre-sense.de>
Date:   Sat, 23 May 2020 22:05:48 +0200
User-Agent: Thunderbird
MIME-Version: 1.0
In-Reply-To: <20200523154817.GA7091@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

thanks for the really quick response!

Am 23.05.20 um 17:48 schrieb Alan Stern:

>> I'm trying to get external HDDs from Sony to work under Linux with USB 3.0.
[...]
>>  - PSZ-HA2T: idVendor=054c, idProduct=087d
>>  - PSZ-HA1T: idVendor=054c, idProduct=087d
>>  - PSZ-HA50: idVendor=054c, idProduct=087d
>>  - PSZ-HC1T: idVendor=054c, idProduct=0c4f
[...]
>> I've also tried several of the quirk settings
>> (https://github.com/torvalds/linux/blob/ead751507de86d90fa250431e9990a8b881f713c/drivers/usb/storage/usb.c#L527).
> 
> Unfortunately, the uas driver ignores those settings.
[...]
> Try adding an entry to the unusual_uas.h file for the device, specifying 
> the USB_FL_NO_REPORT_OPCODES flag.

I'm not sure I understand correctly. Do I have to compile the uas Kernel module
myself if I want to test a flag?

Because with setting the f flag (via options usb-storage quirks=054c:087d:f) the
PSZ-HA*1*T starts behaving nicely.

--- snip ---
$ cat /sys/module/usb_storage/parameters/quirks
054c:087d:f,054c:0c4f:f
--- snip ---


The PSZ-HA*2*T, however, still doesn't work with that.

dmesg shows:
--- snip ---
[613960.192066] scsi host5: uas
[613960.192179] usbcore: registered new interface driver uas
[613960.195028] usb 6-2: cmd cmplt err -71
[613980.764509] scsi 5:0:0:0: tag#12 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD IN
[613980.764513] scsi 5:0:0:0: tag#12 CDB: Inquiry 12 00 00 00 24 00
[613980.780506] scsi host5: uas_eh_device_reset_handler start
[613980.910565] usb 6-2: reset SuperSpeed Gen 1 USB device number 3 using xhci_hcd
[613980.940879] scsi host5: uas_eh_device_reset_handler success
[613984.957905] scsi 5:0:0:0: Direct-Access     Sony     PSZ-H            320: PQ: 0
ANSI: 6
[613990.960817] sd 5:0:0:0: Attached scsi generic sg3 type 0
[613990.961028] sd 5:0:0:0: [sdb] Spinning up disk...
[613991.984560] .ready
[613999.987984] sd 5:0:0:0: [sdb] 281474976710656 512-byte logical blocks: (144
PB/128 PiB)
[613999.987988] sd 5:0:0:0: [sdb] 4096-byte physical blocks
[614001.988698] sd 5:0:0:0: [sdb] Write Protect is off
[614001.988702] sd 5:0:0:0: [sdb] Mode Sense: 67 00 10 08
[614005.989956] sd 5:0:0:0: [sdb] Write cache: enabled, read cache: enabled, supports
DPO and FUA
[614007.990627] sd 5:0:0:0: [sdb] Optimal transfer size 524287 logical blocks > sd
driver limit (65535 logical blocks)
[614008.004886] sd 5:0:0:0: [sdb] Spinning up disk...
[614009.040540] .ready
[614056.540501] sd 5:0:0:0: [sdb] tag#13 uas_eh_abort_handler 0 uas-tag 1 inflight:
CMD IN
[614056.540507] sd 5:0:0:0: [sdb] tag#13 CDB: Read(16) 88 00 00 00 00 00 00 00 00 00
00 00 00 08 00 00
[614056.556501] scsi host5: uas_eh_device_reset_handler start
[614056.686376] usb 6-2: reset SuperSpeed Gen 1 USB device number 3 using xhci_hcd
[614056.716509] scsi host5: uas_eh_device_reset_handler success
[614066.768485] sd 5:0:0:0: [sdb] tag#13 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD
[614066.768490] sd 5:0:0:0: [sdb] tag#13 CDB: Test Unit Ready 00 00 00 00 00 00
[614066.768493] scsi host5: uas_eh_device_reset_handler start
[614072.144648] xhci_hcd 0000:06:00.0: Timeout while waiting for setup device command
[614072.353271] usb 6-2: Device not responding to setup address.
[614072.354062] debugfs: Directory '01' with parent 'devices' already present!
[614072.560471] usb 6-2: device not accepting address 3, error -71
[614078.032657] xhci_hcd 0000:06:00.0: Timeout while waiting for setup device command
[614078.240963] usb 6-2: Device not responding to setup address.
[614078.241423] debugfs: Directory '01' with parent 'devices' already present!
[614078.448469] usb 6-2: device not accepting address 3, error -71
[614083.920631] xhci_hcd 0000:06:00.0: Timeout while waiting for setup device command
[614084.128937] usb 6-2: Device not responding to setup address.
[614084.129413] debugfs: Directory '01' with parent 'devices' already present!
[614084.336459] usb 6-2: device not accepting address 3, error -71
[614089.808656] xhci_hcd 0000:06:00.0: Timeout while waiting for setup device command
[614090.017000] usb 6-2: Device not responding to setup address.
[614090.017527] debugfs: Directory '01' with parent 'devices' already present!
[614090.224459] usb 6-2: device not accepting address 3, error -71
[614090.280517] scsi host5: uas_eh_device_reset_handler FAILED err -19
[614090.280522] sd 5:0:0:0: Device offlined - not ready after error recovery
[614090.280529] sd 5:0:0:0: [sdb] tag#13 FAILED Result: hostbyte=DID_OK
driverbyte=DRIVER_TIMEOUT
[614090.280531] sd 5:0:0:0: [sdb] tag#13 CDB: Read(16) 88 00 00 00 00 00 00 00 00 00
00 00 00 08 00 00
[614090.280533] print_req_error: 1 callbacks suppressed
[614090.280534] blk_update_request: I/O error, dev sdb, sector 0 op 0x0:(READ) flags
0x0 phys_seg 1 prio class 0
[614090.280537] buffer_io_error: 1 callbacks suppressed
[614090.280538] Buffer I/O error on dev sdb, logical block 0, async page read
[614090.280567] usb 6-2: USB disconnect, device number 3
[614090.280571] sd 5:0:0:0: rejecting I/O to offline device
[614090.280574] blk_update_request: I/O error, dev sdb, sector 0 op 0x0:(READ) flags
0x0 phys_seg 1 prio class 0
[614090.280576] Buffer I/O error on dev sdb, logical block 0, async page read
[614090.280597] blk_update_request: I/O error, dev sdb, sector 0 op 0x0:(READ) flags
0x0 phys_seg 1 prio class 0
[614090.280598] Buffer I/O error on dev sdb, logical block 0, async page read
[614090.280601] ldm_validate_partition_table(): Disk read failed.
[614090.280607] blk_update_request: I/O error, dev sdb, sector 0 op 0x0:(READ) flags
0x0 phys_seg 1 prio class 0
[614090.280608] Buffer I/O error on dev sdb, logical block 0, async page read
[614090.280615] blk_update_request: I/O error, dev sdb, sector 0 op 0x0:(READ) flags
0x0 phys_seg 1 prio class 0
[614090.280616] Buffer I/O error on dev sdb, logical block 0, async page read
[614090.280624] blk_update_request: I/O error, dev sdb, sector 0 op 0x0:(READ) flags
0x0 phys_seg 1 prio class 0
[614090.280625] Buffer I/O error on dev sdb, logical block 0, async page read
[614090.280632] blk_update_request: I/O error, dev sdb, sector 0 op 0x0:(READ) flags
0x0 phys_seg 1 prio class 0
[614090.280633] Buffer I/O error on dev sdb, logical block 0, async page read
[614090.280640] blk_update_request: I/O error, dev sdb, sector 0 op 0x0:(READ) flags
0x0 phys_seg 1 prio class 0
[614090.280642] Buffer I/O error on dev sdb, logical block 0, async page read
[614090.280655] blk_update_request: I/O error, dev sdb, sector 24 op 0x0:(READ) flags
0x0 phys_seg 1 prio class 0
[614090.280657] Buffer I/O error on dev sdb, logical block 3, async page read
[614090.280664] blk_update_request: I/O error, dev sdb, sector 0 op 0x0:(READ) flags
0x0 phys_seg 1 prio class 0
[614090.280665] Buffer I/O error on dev sdb, logical block 0, async page read
[614090.280674]  sdb: unable to read partition table
[614090.604487] sd 5:0:0:0: [sdb] Read Capacity(16) failed: Result:
hostbyte=DID_ERROR driverbyte=DRIVER_OK
[614090.604491] sd 5:0:0:0: [sdb] Sense not available.
[614090.844483] sd 5:0:0:0: [sdb] Read Capacity(10) failed: Result:
hostbyte=DID_ERROR driverbyte=DRIVER_OK
[614090.844487] sd 5:0:0:0: [sdb] Sense not available.
[614090.940485] sd 5:0:0:0: [sdb] 0 512-byte logical blocks: (0 B/0 B)
[614090.940488] sd 5:0:0:0: [sdb] 4096-byte physical blocks
[614091.020504] sd 5:0:0:0: [sdb] Write Protect is on
[614091.020507] sd 5:0:0:0: [sdb] Mode Sense: 27 40 bb f7
[614091.228484] sd 5:0:0:0: [sdb] Attached SCSI disk
[614091.285557] debugfs: Directory '01' with parent 'devices' already present!
[614096.720608] xhci_hcd 0000:06:00.0: Timeout while waiting for setup device command
[614096.928929] usb 6-2: Device not responding to setup address.
[614096.929337] debugfs: Directory '01' with parent 'devices' already present!
[614097.136449] usb 6-2: device not accepting address 4, error -71
--- snap ---


Do you have any idea what to try there?


Thanks and regards -- Till
-- 
Dipl.-Inform. Till Dörges                  doerges@pre-sense.de
PRESENSE Technologies GmbH             Nagelsweg 41, D-20097 HH
Geschäftsführer/Managing Directors       AG Hamburg, HRB 107844
Till Dörges, Jürgen Sander               USt-IdNr.: DE263765024
