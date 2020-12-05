Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4932CFF20
	for <lists+linux-usb@lfdr.de>; Sat,  5 Dec 2020 22:16:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727355AbgLEVPc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Dec 2020 16:15:32 -0500
Received: from mailrelay2-2.pub.mailoutpod1-cph3.one.com ([46.30.212.1]:43139
        "EHLO mailrelay2-2.pub.mailoutpod1-cph3.one.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726298AbgLEVPb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Dec 2020 16:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nipatriknilsson.com; s=20191106;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
         message-id:from:references:cc:to:subject:from;
        bh=duFJY9KKEUEdlyyGNlQnCcv8vumi0dcXgUTGYVk/9qw=;
        b=F0L9EkOcafy5WwDiZJrTjIkKLbAjQaOyHbXrnr0M1BXRVbIcYWeSVESoRFwEsFpeOy7dtyttD8OyH
         +rpyK2E78mnAwW7eiV9PpIFKkFisnO+tpEcJ+S8TrPlfmWHmcQGOV/q+qyII/cz+DX4ykzAEv8kSnY
         eJAmP7YgY8fPrVKYkq1cuw8zz5IK9tAgIGcDR1poOYpidCxbFOd/neLVGM2odvDddANc1IiTuReJcs
         HDN/nSnLzLHW8LOGgTA0qEC5ViVbQHErMkFUwwvyqPxNhLo8co7R/jFhWi9Hfv+YzsO0LoAoZ3Zll5
         TMn5i4DKI9xxir52O9/keG4ijEFOlKg==
X-HalOne-Cookie: c81000944347808a297792ae2ccd8e23738f066d
X-HalOne-ID: f87da366-36ef-11eb-b548-d0431ea8a290
Received: from [10.10.0.8] (unknown [185.65.135.178])
        by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id f87da366-36ef-11eb-b548-d0431ea8a290;
        Sat, 05 Dec 2020 11:49:46 +0000 (UTC)
Subject: Re: high speed data to usb disk makes the kernel think that is has
 been unmounted
To:     Alan Stern <stern@rowland.harvard.edu>,
        Patrik Nilsson <nipatriknilsson@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <20200811175655.GB828356@kroah.com>
 <47a5804c-835a-f1a2-abce-50b3531f2556@gmail.com>
 <20200811193150.GA344152@rowland.harvard.edu>
 <ef2937d6-f8a8-fbc6-decd-eeb4af94e863@gmail.com>
 <20200812061451.GE1299081@kroah.com>
 <95be674d-ee98-b904-6856-2f662ac7838f@gmail.com>
 <20200818085502.GB28036@kroah.com>
 <83a5be3e-9f93-e601-5161-cbb5d1957c5a@gmail.com>
 <20200818183420.GB152667@rowland.harvard.edu>
 <0975cb43-5520-543c-987c-57de5e7b258b@gmail.com>
 <20200915182414.GB1010655@rowland.harvard.edu>
From:   Patrik Nilsson <lists@nipatriknilsson.com>
Message-ID: <114ee1e1-c30e-45cf-1086-1d9258df9389@nipatriknilsson.com>
Date:   Sat, 5 Dec 2020 12:49:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200915182414.GB1010655@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear Alan,

After long time testing it seems that changing the TIMEOUT values did 
help somewhat, but not completely.

I tested two SSD and wrote to them at the same time:

# dd if=/dev/zero of=/dev/sdd bs=$((10*1024*1024))

# dd if=/dev/zero of=/dev/sdg bs=$((10*1024*1024)) # different bash terminal

The synchronize write gives a lot of errors as the log below (1) shows

Running big with blocks in synchronized mode gives the same kind of error:

# dd if=/dev/zero of=/dev/sdi bs=$((10*1024*1024)) oflag=dsync # this is 
another SSD bought for this test
dd: error writing '/dev/sdi': Input/output error
9+0 records in
8+0 records out
83886080 bytes (84 MB, 80 MiB) copied, 185.585 s, 452 kB/s

When synchronized data transfer is done to sdi and sdg in a small block 
size everything works out as it should, but takes a long time.

# dd if=/dev/zero of=/dev/sdg bs=1024 oflag=dsync
56897100+0 records in
56897100+0 records out
58262630400 bytes (58 GB, 54 GiB) copied, 74235.8 s, 785 kB/s
[...]
dd: error writing '/dev/sdg': No space left on device
488386585+0 records in
488386584+0 records out
500107862016 bytes (500 GB, 466 GiB) copied, 702184 s, 712 kB/s

I have been unable to catch this kind of error leading to a crash.

The shutdown of the test computer did show the same kind of errors as 
the below log. It couldn't write asynchronous data.

Best regards,
Patrik


(1) Log:

[73918.351448] sd 9:0:0:0: [sdg] tag#19 CDB: Write(10) 2a 00 1d 6d 9d c0 
00 04 00 00
[73918.351449] blk_update_request: I/O error, dev sdg, sector 493723072 
op 0x1:(WRITE) flags 0x104000 phys_seg 128 prio class 0
[73918.351552] sd 9:0:0:0: [sdg] tag#20 FAILED Result: 
hostbyte=DID_RESET driverbyte=DRIVER_OK
[73918.351554] sd 9:0:0:0: [sdg] tag#20 CDB: Write(10) 2a 00 1d 6d 91 c0 
00 04 00 00
[73918.351555] blk_update_request: I/O error, dev sdg, sector 493720000 
op 0x1:(WRITE) flags 0x104000 phys_seg 128 prio class 0
[73918.351668] sd 9:0:0:0: [sdg] tag#21 FAILED Result: 
hostbyte=DID_RESET driverbyte=DRIVER_OK
[73918.351669] sd 9:0:0:0: [sdg] tag#21 CDB: Write(10) 2a 00 1d 6d 7d c0 
00 04 00 00
[73918.351670] blk_update_request: I/O error, dev sdg, sector 493714880 
op 0x1:(WRITE) flags 0x104000 phys_seg 128 prio class 0
[73918.351776] sd 9:0:0:0: [sdg] tag#22 FAILED Result: 
hostbyte=DID_RESET driverbyte=DRIVER_OK
[73918.351777] sd 9:0:0:0: [sdg] tag#22 CDB: Write(10) 2a 00 1d 6d 81 c0 
00 04 00 00
[73918.351778] blk_update_request: I/O error, dev sdg, sector 493715904 
op 0x1:(WRITE) flags 0x104000 phys_seg 128 prio class 0
[73918.351880] sd 9:0:0:0: [sdg] tag#23 FAILED Result: 
hostbyte=DID_RESET driverbyte=DRIVER_OK
[73918.351881] sd 9:0:0:0: [sdg] tag#23 CDB: Write(10) 2a 00 1d 6d 8d c0 
00 04 00 00
[73918.351882] blk_update_request: I/O error, dev sdg, sector 493718976 
op 0x1:(WRITE) flags 0x104000 phys_seg 128 prio class 0
[73918.351991] sd 9:0:0:0: [sdg] tag#24 FAILED Result: 
hostbyte=DID_RESET driverbyte=DRIVER_OK
[73918.351993] sd 9:0:0:0: [sdg] tag#24 CDB: Write(10) 2a 00 1d 6d 85 c0 
00 04 00 00
[73918.351994] blk_update_request: I/O error, dev sdg, sector 493716928 
op 0x1:(WRITE) flags 0x104000 phys_seg 128 prio class 0
[73918.352095] sd 9:0:0:0: [sdg] tag#25 FAILED Result: 
hostbyte=DID_RESET driverbyte=DRIVER_OK
[73918.352097] sd 9:0:0:0: [sdg] tag#25 CDB: Write(10) 2a 00 1d 6d 89 c0 
00 04 00 00
[73918.352098] blk_update_request: I/O error, dev sdg, sector 493717952 
op 0x1:(WRITE) flags 0x104000 phys_seg 128 prio class 0
[73918.353609] sd 9:0:0:0: [sdg] tag#26 data cmplt err -71 uas-tag 1 
inflight: CMD
[73918.353619] sd 9:0:0:0: [sdg] tag#26 CDB: Write(10) 2a 00 1d 6d d9 c0 
00 04 00 00
[73948.916831] sd 9:0:0:0: [sdg] tag#27 uas_eh_abort_handler 0 uas-tag 2 
inflight: CMD OUT

Here is more errors with /dev/sdg, not with dd.

[1971052.229416] blk_update_request: I/O error, dev sdg, sector 
686779192 op 0x1:(WRITE) flags 0x104000 phys_seg 128 prio class 0
[1971052.229422] buffer_io_error: 2806 callbacks suppressed
[1971052.229424] Buffer I/O error on dev sdg, logical block 85847399, 
lost async page write
[1971052.229432] Buffer I/O error on dev sdg, logical block 85847400, 
lost async page write
[1971052.229435] Buffer I/O error on dev sdg, logical block 85847401, 
lost async page write
[1971052.229438] Buffer I/O error on dev sdg, logical block 85847402, 
lost async page write
[1971052.229441] Buffer I/O error on dev sdg, logical block 85847403, 
lost async page write
[1971052.229444] Buffer I/O error on dev sdg, logical block 85847404, 
lost async page write
[1971052.229446] Buffer I/O error on dev sdg, logical block 85847405, 
lost async page write
[1971052.229449] Buffer I/O error on dev sdg, logical block 85847406, 
lost async page write
[1971052.229452] Buffer I/O error on dev sdg, logical block 85847407, 
lost async page write
[1971052.229454] Buffer I/O error on dev sdg, logical block 85847408, 
lost async page write
[1971052.229644] sd 9:0:0:0: [sdg] tag#1 FAILED Result: 
hostbyte=DID_RESET driverbyte=DRIVER_OK
[1971052.229647] sd 9:0:0:0: [sdg] tag#1 CDB: Write(10) 2a 00 28 ef 6f 
38 00 04 00 00
[1971052.229650] blk_update_request: I/O error, dev sdg, sector 
686780216 op 0x1:(WRITE) flags 0x104000 phys_seg 128 prio class 0
[1971052.229800] sd 9:0:0:0: [sdg] tag#2 FAILED Result: 
hostbyte=DID_RESET driverbyte=DRIVER_OK
[1971052.229802] sd 9:0:0:0: [sdg] tag#2 CDB: Write(10) 2a 00 28 ef 73 
38 00 04 00 00
[1971052.229804] blk_update_request: I/O error, dev sdg, sector 
686781240 op 0x1:(WRITE) flags 0x104000 phys_seg 128 prio class 0
[1971052.229953] sd 9:0:0:0: [sdg] tag#3 FAILED Result: 
hostbyte=DID_RESET driverbyte=DRIVER_OK
[1971052.229955] sd 9:0:0:0: [sdg] tag#3 CDB: Write(10) 2a 00 28 ef 7b 
38 00 04 00 00
[1971052.229957] blk_update_request: I/O error, dev sdg, sector 
686783288 op 0x1:(WRITE) flags 0x104000 phys_seg 128 prio class 0
[1971052.230107] sd 9:0:0:0: [sdg] tag#4 FAILED Result: 
hostbyte=DID_RESET driverbyte=DRIVER_OK
[1971052.230109] sd 9:0:0:0: [sdg] tag#4 CDB: Write(10) 2a 00 28 ef 7f 
38 00 04 00 00
[1971052.230111] blk_update_request: I/O error, dev sdg, sector 
686784312 op 0x1:(WRITE) flags 0x104000 phys_seg 128 prio class 0
[1971052.230255] sd 9:0:0:0: [sdg] tag#5 FAILED Result: 
hostbyte=DID_RESET driverbyte=DRIVER_OK
[1971052.230258] sd 9:0:0:0: [sdg] tag#5 CDB: Write(10) 2a 00 28 ef 83 
38 00 04 00 00
[1971052.230260] blk_update_request: I/O error, dev sdg, sector 
686785336 op 0x1:(WRITE) flags 0x104000 phys_seg 128 prio class 0
[1971052.230404] sd 9:0:0:0: [sdg] tag#6 FAILED Result: 
hostbyte=DID_RESET driverbyte=DRIVER_OK
[1971052.230406] sd 9:0:0:0: [sdg] tag#6 CDB: Write(10) 2a 00 28 ef 87 
38 00 04 00 00
[1971052.230408] blk_update_request: I/O error, dev sdg, sector 
686786360 op 0x1:(WRITE) flags 0x104000 phys_seg 128 prio class 0
[1971052.230559] sd 9:0:0:0: [sdg] tag#7 FAILED Result: 
hostbyte=DID_RESET driverbyte=DRIVER_OK
[1971052.230561] sd 9:0:0:0: [sdg] tag#7 CDB: Write(10) 2a 00 28 ef 8b 
38 00 04 00 00
[1971052.230563] blk_update_request: I/O error, dev sdg, sector 
686787384 op 0x1:(WRITE) flags 0x104000 phys_seg 128 prio class 0
[1971052.230710] sd 9:0:0:0: [sdg] tag#8 FAILED Result: 
hostbyte=DID_RESET driverbyte=DRIVER_OK
[1971052.230712] sd 9:0:0:0: [sdg] tag#8 CDB: Write(10) 2a 00 28 ef 8f 
38 00 04 00 00
[1971052.230714] blk_update_request: I/O error, dev sdg, sector 
686788408 op 0x1:(WRITE) flags 0x104000 phys_seg 128 prio class 0
[1971052.230855] sd 9:0:0:0: [sdg] tag#9 FAILED Result: 
hostbyte=DID_RESET driverbyte=DRIVER_OK
[1971052.230857] sd 9:0:0:0: [sdg] tag#9 CDB: Write(10) 2a 00 28 ef 4f 
38 00 04 00 00
[1971052.230859] blk_update_request: I/O error, dev sdg, sector 
686772024 op 0x1:(WRITE) flags 0x104000 phys_seg 128 prio class 0
[1971052.233748] sd 9:0:0:0: [sdg] tag#21 data cmplt err -71 uas-tag 1 
inflight: CMD
[1971052.233754] sd 9:0:0:0: [sdg] tag#21 CDB: Write(10) 2a 00 28 ef 93 
38 00 04 00 00
[1971082.763230] sd 9:0:0:0: [sdg] tag#29 uas_eh_abort_handler 0 uas-tag 
7 inflight: CMD OUT
[1971082.763239] sd 9:0:0:0: [sdg] tag#29 CDB: Write(10) 2a 00 28 ef ab 
38 00 04 00 00
[1971082.764519] sd 9:0:0:0: [sdg] tag#28 uas_eh_abort_handler 0 uas-tag 
6 inflight: CMD OUT
[1971082.764526] sd 9:0:0:0: [sdg] tag#28 CDB: Write(10) 2a 00 28 ef a7 
38 00 04 00 00
[1971082.767991] sd 9:0:0:0: [sdg] tag#24 uas_eh_abort_handler 0 uas-tag 
5 inflight: CMD OUT
[1971082.768000] sd 9:0:0:0: [sdg] tag#24 CDB: Write(10) 2a 00 28 ef a3 
38 00 04 00 00
[1971082.771461] sd 9:0:0:0: [sdg] tag#23 uas_eh_abort_handler 0 uas-tag 
3 inflight: CMD OUT
[1971082.771467] sd 9:0:0:0: [sdg] tag#23 CDB: Write(10) 2a 00 28 ef 9b 
38 00 04 00 00
[1971082.774960] sd 9:0:0:0: [sdg] tag#22 uas_eh_abort_handler 0 uas-tag 
2 inflight: CMD OUT
[1971082.774965] sd 9:0:0:0: [sdg] tag#22 CDB: Write(10) 2a 00 28 ef 97 
38 00 04 00 00
[1971082.778462] sd 9:0:0:0: [sdg] tag#21 uas_eh_abort_handler 0 uas-tag 
1 inflight: CMD
[1971082.778467] sd 9:0:0:0: [sdg] tag#21 CDB: Write(10) 2a 00 28 ef 93 
38 00 04 00 00
[1971082.778473] sd 9:0:0:0: [sdg] tag#20 uas_eh_abort_handler 0 uas-tag 
4 inflight: CMD OUT
[1971082.778477] sd 9:0:0:0: [sdg] tag#20 CDB: Write(10) 2a 00 28 ef 9f 
38 00 04 00 00
[1971082.781959] sd 9:0:0:0: [sdg] tag#15 uas_eh_abort_handler 0 uas-tag 
22 inflight: CMD OUT
[1971082.781965] sd 9:0:0:0: [sdg] tag#15 CDB: Write(10) 2a 00 28 ef e7 
38 00 04 00 00
[1971082.785456] sd 9:0:0:0: [sdg] tag#14 uas_eh_abort_handler 0 uas-tag 
21 inflight: CMD OUT
[1971082.785469] sd 9:0:0:0: [sdg] tag#14 CDB: Write(10) 2a 00 28 ef e3 
38 00 04 00 00
[1971082.788922] sd 9:0:0:0: [sdg] tag#13 uas_eh_abort_handler 0 uas-tag 
20 inflight: CMD OUT
[1971082.788924] sd 9:0:0:0: [sdg] tag#13 CDB: Write(10) 2a 00 28 ef df 
38 00 04 00 00
[1971082.792452] sd 9:0:0:0: [sdg] tag#11 uas_eh_abort_handler 0 uas-tag 
19 inflight: CMD OUT
[1971082.792454] sd 9:0:0:0: [sdg] tag#11 CDB: Write(10) 2a 00 28 ef db 
38 00 04 00 00
[1971082.795975] sd 9:0:0:0: [sdg] tag#10 uas_eh_abort_handler 0 uas-tag 
18 inflight: CMD OUT
[1971082.795979] sd 9:0:0:0: [sdg] tag#10 CDB: Write(10) 2a 00 28 ef d7 
38 00 04 00 00
[1971082.799429] sd 9:0:0:0: [sdg] tag#9 uas_eh_abort_handler 0 uas-tag 
17 inflight: CMD OUT
[1971082.799433] sd 9:0:0:0: [sdg] tag#9 CDB: Write(10) 2a 00 28 ef d3 
38 00 04 00 00
[1971082.802920] sd 9:0:0:0: [sdg] tag#8 uas_eh_abort_handler 0 uas-tag 
16 inflight: CMD OUT
[1971082.802923] sd 9:0:0:0: [sdg] tag#8 CDB: Write(10) 2a 00 28 ef cf 
38 00 04 00 00
[1971082.806430] sd 9:0:0:0: [sdg] tag#7 uas_eh_abort_handler 0 uas-tag 
15 inflight: CMD OUT
[1971082.806433] sd 9:0:0:0: [sdg] tag#7 CDB: Write(10) 2a 00 28 ef cb 
38 00 04 00 00
[1971082.809929] sd 9:0:0:0: [sdg] tag#6 uas_eh_abort_handler 0 uas-tag 
14 inflight: CMD OUT
[1971082.809933] sd 9:0:0:0: [sdg] tag#6 CDB: Write(10) 2a 00 28 ef c7 
38 00 04 00 00
[1971082.813446] sd 9:0:0:0: [sdg] tag#5 uas_eh_abort_handler 0 uas-tag 
13 inflight: CMD OUT
[1971082.813451] sd 9:0:0:0: [sdg] tag#5 CDB: Write(10) 2a 00 28 ef c3 
38 00 04 00 00
[1971082.816988] sd 9:0:0:0: [sdg] tag#4 uas_eh_abort_handler 0 uas-tag 
12 inflight: CMD OUT
[1971082.816993] sd 9:0:0:0: [sdg] tag#4 CDB: Write(10) 2a 00 28 ef bf 
38 00 04 00 00
[1971082.820461] sd 9:0:0:0: [sdg] tag#3 uas_eh_abort_handler 0 uas-tag 
11 inflight: CMD OUT
[1971082.820465] sd 9:0:0:0: [sdg] tag#3 CDB: Write(10) 2a 00 28 ef bb 
38 00 04 00 00
[1971082.823946] sd 9:0:0:0: [sdg] tag#2 uas_eh_abort_handler 0 uas-tag 
10 inflight: CMD OUT
[1971082.823952] sd 9:0:0:0: [sdg] tag#2 CDB: Write(10) 2a 00 28 ef b7 
38 00 04 00 00
[1971082.827474] sd 9:0:0:0: [sdg] tag#1 uas_eh_abort_handler 0 uas-tag 
9 inflight: CMD OUT
[1971082.827479] sd 9:0:0:0: [sdg] tag#1 CDB: Write(10) 2a 00 28 ef b3 
38 00 04 00 00
[1971082.830945] sd 9:0:0:0: [sdg] tag#0 uas_eh_abort_handler 0 uas-tag 
8 inflight: CMD OUT
[1971082.830951] sd 9:0:0:0: [sdg] tag#0 CDB: Write(10) 2a 00 28 ef af 
38 00 04 00 00
[1971082.851236] scsi host9: uas_eh_device_reset_handler start
[1971082.931767] usb 2-4.4.4.4.3: reset SuperSpeed Gen 1 USB device 
number 9 using xhci_hcd
[1971082.961643] scsi host9: uas_eh_device_reset_handler success
[1971082.980120] sd 9:0:0:0: [sdg] tag#20 data cmplt err -71 uas-tag 1 
inflight: CMD
[1971082.980128] sd 9:0:0:0: [sdg] tag#20 CDB: Write(10) 2a 00 28 ef af 
38 00 04 00 00
[1971113.494570] scsi host9: uas_eh_device_reset_handler start
[1971113.568509] sd 9:0:0:0: [sdg] tag#20 uas_zap_pending 0 uas-tag 1 
inflight: CMD
[1971113.568518] sd 9:0:0:0: [sdg] tag#20 CDB: Write(10) 2a 00 28 ef af 
38 00 04 00 00
[1971113.568524] sd 9:0:0:0: [sdg] tag#21 uas_zap_pending 0 uas-tag 2 
inflight: CMD
[1971113.568528] sd 9:0:0:0: [sdg] tag#21 CDB: Write(10) 2a 00 28 ef b3 
38 00 04 00 00
[1971113.568533] sd 9:0:0:0: [sdg] tag#22 uas_zap_pending 0 uas-tag 3 
inflight: CMD
[1971113.568537] sd 9:0:0:0: [sdg] tag#22 CDB: Write(10) 2a 00 28 ef b7 
38 00 04 00 00
[1971113.568542] sd 9:0:0:0: [sdg] tag#23 uas_zap_pending 0 uas-tag 4 
inflight: CMD
[1971113.568545] sd 9:0:0:0: [sdg] tag#23 CDB: Write(10) 2a 00 28 ef bb 
38 00 04 00 00
[1971113.568550] sd 9:0:0:0: [sdg] tag#25 uas_zap_pending 0 uas-tag 5 
inflight: CMD
[1971113.568554] sd 9:0:0:0: [sdg] tag#25 CDB: Write(10) 2a 00 28 ef bf 
38 00 04 00 00
[1971113.568559] sd 9:0:0:0: [sdg] tag#26 uas_zap_pending 0 uas-tag 6 
inflight: CMD
[1971113.568563] sd 9:0:0:0: [sdg] tag#26 CDB: Write(10) 2a 00 28 ef c3 
38 00 04 00 00
[1971113.568567] sd 9:0:0:0: [sdg] tag#27 uas_zap_pending 0 uas-tag 7 
inflight: CMD
[1971113.568571] sd 9:0:0:0: [sdg] tag#27 CDB: Write(10) 2a 00 28 ef c7 
38 00 04 00 00
[1971113.568576] sd 9:0:0:0: [sdg] tag#24 uas_zap_pending 0 uas-tag 8 
inflight: CMD
[1971113.568579] sd 9:0:0:0: [sdg] tag#24 CDB: Write(10) 2a 00 28 ef cb 
38 00 04 00 00
[1971113.568584] sd 9:0:0:0: [sdg] tag#28 uas_zap_pending 0 uas-tag 9 
inflight: CMD
[1971113.568587] sd 9:0:0:0: [sdg] tag#28 CDB: Write(10) 2a 00 28 ef cf 
38 00 04 00 00
[1971113.568592] sd 9:0:0:0: [sdg] tag#29 uas_zap_pending 0 uas-tag 10 
inflight: CMD
[1971113.568596] sd 9:0:0:0: [sdg] tag#29 CDB: Write(10) 2a 00 28 ef d3 
38 00 04 00 00
[1971113.568601] sd 9:0:0:0: [sdg] tag#0 uas_zap_pending 0 uas-tag 11 
inflight: CMD
[1971113.568604] sd 9:0:0:0: [sdg] tag#0 CDB: Write(10) 2a 00 28 ef d7 
38 00 04 00 00
[1971113.568609] sd 9:0:0:0: [sdg] tag#1 uas_zap_pending 0 uas-tag 12 
inflight: CMD
[1971113.568613] sd 9:0:0:0: [sdg] tag#1 CDB: Write(10) 2a 00 28 ef db 
38 00 04 00 00
[1971113.568618] sd 9:0:0:0: [sdg] tag#2 uas_zap_pending 0 uas-tag 13 
inflight: CMD
[1971113.568621] sd 9:0:0:0: [sdg] tag#2 CDB: Write(10) 2a 00 28 ef df 
38 00 04 00 00
[1971113.568626] sd 9:0:0:0: [sdg] tag#3 uas_zap_pending 0 uas-tag 14 
inflight: CMD
[1971113.568630] sd 9:0:0:0: [sdg] tag#3 CDB: Write(10) 2a 00 28 ef e3 
38 00 04 00 00
[1971113.568635] sd 9:0:0:0: [sdg] tag#4 uas_zap_pending 0 uas-tag 15 
inflight: CMD
[1971113.568638] sd 9:0:0:0: [sdg] tag#4 CDB: Write(10) 2a 00 28 ef e7 
38 00 04 00 00
[1971113.568643] sd 9:0:0:0: [sdg] tag#5 uas_zap_pending 0 uas-tag 16 
inflight: CMD
[1971113.568647] sd 9:0:0:0: [sdg] tag#5 CDB: Write(10) 2a 00 28 ef 9f 
38 00 04 00 00
[1971113.568651] sd 9:0:0:0: [sdg] tag#6 uas_zap_pending 0 uas-tag 17 
inflight: CMD
[1971113.568655] sd 9:0:0:0: [sdg] tag#6 CDB: Write(10) 2a 00 28 ef 93 
38 00 04 00 00
[1971113.568660] sd 9:0:0:0: [sdg] tag#7 uas_zap_pending 0 uas-tag 18 
inflight: CMD
[1971113.568663] sd 9:0:0:0: [sdg] tag#7 CDB: Write(10) 2a 00 28 ef 97 
38 00 04 00 00
[1971113.568668] sd 9:0:0:0: [sdg] tag#8 uas_zap_pending 0 uas-tag 19 
inflight: CMD
[1971113.568671] sd 9:0:0:0: [sdg] tag#8 CDB: Write(10) 2a 00 28 ef 9b 
38 00 04 00 00
[1971113.568676] sd 9:0:0:0: [sdg] tag#9 uas_zap_pending 0 uas-tag 20 
inflight: CMD
[1971113.568680] sd 9:0:0:0: [sdg] tag#9 CDB: Write(10) 2a 00 28 ef a3 
38 00 04 00 00
[1971113.568684] sd 9:0:0:0: [sdg] tag#10 uas_zap_pending 0 uas-tag 21 
inflight: CMD
[1971113.568688] sd 9:0:0:0: [sdg] tag#10 CDB: Write(10) 2a 00 28 ef a7 
38 00 04 00 00
[1971113.568692] sd 9:0:0:0: [sdg] tag#11 uas_zap_pending 0 uas-tag 22 
inflight: CMD
[1971113.568696] sd 9:0:0:0: [sdg] tag#11 CDB: Write(10) 2a 00 28 ef ab 
38 00 04 00 00
[1971113.651031] usb 2-4.4.4.4.3: reset SuperSpeed Gen 1 USB device 
number 9 using xhci_hcd
[1971113.681609] scsi host9: uas_eh_device_reset_handler success
[1971113.695693] sd 9:0:0:0: [sdg] tag#24 data cmplt err -71 uas-tag 1 
inflight: CMD
[1971113.695702] sd 9:0:0:0: [sdg] tag#24 CDB: Write(10) 2a 00 28 ef d3 
38 00 04 00 00
[1971144.205921] scsi host9: uas_eh_device_reset_handler start
[1971144.278930] sd 9:0:0:0: [sdg] tag#24 uas_zap_pending 0 uas-tag 1 
inflight: CMD
[1971144.278940] sd 9:0:0:0: [sdg] tag#24 CDB: Write(10) 2a 00 28 ef d3 
38 00 04 00 00
[1971144.278946] sd 9:0:0:0: [sdg] tag#25 uas_zap_pending 0 uas-tag 2 
inflight: CMD
[1971144.278951] sd 9:0:0:0: [sdg] tag#25 CDB: Write(10) 2a 00 28 ef cf 
38 00 04 00 00
[1971144.278956] sd 9:0:0:0: [sdg] tag#26 uas_zap_pending 0 uas-tag 3 
inflight: CMD
[1971144.278960] sd 9:0:0:0: [sdg] tag#26 CDB: Write(10) 2a 00 28 ef c7 
38 00 04 00 00
[1971144.278965] sd 9:0:0:0: [sdg] tag#27 uas_zap_pending 0 uas-tag 4 
inflight: CMD
[1971144.278969] sd 9:0:0:0: [sdg] tag#27 CDB: Write(10) 2a 00 28 ef c3 
38 00 04 00 00
[1971144.278974] sd 9:0:0:0: [sdg] tag#28 uas_zap_pending 0 uas-tag 5 
inflight: CMD
[1971144.278978] sd 9:0:0:0: [sdg] tag#28 CDB: Write(10) 2a 00 28 ef bf 
38 00 04 00 00
[1971144.278983] sd 9:0:0:0: [sdg] tag#0 uas_zap_pending 0 uas-tag 6 
inflight: CMD
[1971144.278987] sd 9:0:0:0: [sdg] tag#0 CDB: Write(10) 2a 00 28 ef cb 
38 00 04 00 00
[1971144.278992] sd 9:0:0:0: [sdg] tag#1 uas_zap_pending 0 uas-tag 7 
inflight: CMD
[1971144.278996] sd 9:0:0:0: [sdg] tag#1 CDB: Write(10) 2a 00 28 ef bb 
38 00 04 00 00
[1971144.279000] sd 9:0:0:0: [sdg] tag#2 uas_zap_pending 0 uas-tag 8 
inflight: CMD
[1971144.279004] sd 9:0:0:0: [sdg] tag#2 CDB: Write(10) 2a 00 28 ef b7 
38 00 04 00 00
[1971144.279009] sd 9:0:0:0: [sdg] tag#3 uas_zap_pending 0 uas-tag 9 
inflight: CMD
[1971144.279012] sd 9:0:0:0: [sdg] tag#3 CDB: Write(10) 2a 00 28 ef b3 
38 00 04 00 00
[1971144.279017] sd 9:0:0:0: [sdg] tag#4 uas_zap_pending 0 uas-tag 10 
inflight: CMD
[1971144.279021] sd 9:0:0:0: [sdg] tag#4 CDB: Write(10) 2a 00 28 ef af 
38 00 04 00 00
[1971144.279025] sd 9:0:0:0: [sdg] tag#5 uas_zap_pending 0 uas-tag 11 
inflight: CMD
[1971144.279029] sd 9:0:0:0: [sdg] tag#5 CDB: Write(10) 2a 00 28 ef ab 
38 00 04 00 00
[1971144.279033] sd 9:0:0:0: [sdg] tag#6 uas_zap_pending 0 uas-tag 12 
inflight: CMD
[1971144.279037] sd 9:0:0:0: [sdg] tag#6 CDB: Write(10) 2a 00 28 ef a7 
38 00 04 00 00
[1971144.279041] sd 9:0:0:0: [sdg] tag#7 uas_zap_pending 0 uas-tag 13 
inflight: CMD
[1971144.279045] sd 9:0:0:0: [sdg] tag#7 CDB: Write(10) 2a 00 28 ef a3 
38 00 04 00 00
[1971144.279050] sd 9:0:0:0: [sdg] tag#8 uas_zap_pending 0 uas-tag 14 
inflight: CMD
[1971144.279054] sd 9:0:0:0: [sdg] tag#8 CDB: Write(10) 2a 00 28 ef 9b 
38 00 04 00 00
[1971144.279058] sd 9:0:0:0: [sdg] tag#9 uas_zap_pending 0 uas-tag 15 
inflight: CMD
[1971144.279062] sd 9:0:0:0: [sdg] tag#9 CDB: Write(10) 2a 00 28 ef 97 
38 00 04 00 00
[1971144.279067] sd 9:0:0:0: [sdg] tag#10 uas_zap_pending 0 uas-tag 16 
inflight: CMD
[1971144.279071] sd 9:0:0:0: [sdg] tag#10 CDB: Write(10) 2a 00 28 ef 93 
38 00 04 00 00
[1971144.279075] sd 9:0:0:0: [sdg] tag#11 uas_zap_pending 0 uas-tag 17 
inflight: CMD
[1971144.279079] sd 9:0:0:0: [sdg] tag#11 CDB: Write(10) 2a 00 28 ef 9f 
38 00 04 00 00
[1971144.279084] sd 9:0:0:0: [sdg] tag#12 uas_zap_pending 0 uas-tag 18 
inflight: CMD
[1971144.279088] sd 9:0:0:0: [sdg] tag#12 CDB: Write(10) 2a 00 28 ef e7 
38 00 04 00 00
[1971144.279092] sd 9:0:0:0: [sdg] tag#13 uas_zap_pending 0 uas-tag 19 
inflight: CMD
[1971144.279096] sd 9:0:0:0: [sdg] tag#13 CDB: Write(10) 2a 00 28 ef e3 
38 00 04 00 00
[1971144.279101] sd 9:0:0:0: [sdg] tag#14 uas_zap_pending 0 uas-tag 20 
inflight: CMD
[1971144.279104] sd 9:0:0:0: [sdg] tag#14 CDB: Write(10) 2a 00 28 ef df 
38 00 04 00 00
[1971144.279109] sd 9:0:0:0: [sdg] tag#15 uas_zap_pending 0 uas-tag 21 
inflight: CMD
[1971144.279112] sd 9:0:0:0: [sdg] tag#15 CDB: Write(10) 2a 00 28 ef db 
38 00 04 00 00
[1971144.279117] sd 9:0:0:0: [sdg] tag#17 uas_zap_pending 0 uas-tag 22 
inflight: CMD
[1971144.279120] sd 9:0:0:0: [sdg] tag#17 CDB: Write(10) 2a 00 28 ef d7 
38 00 04 00 00
[1971144.358097] usb 2-4.4.4.4.3: reset SuperSpeed Gen 1 USB device 
number 9 using xhci_hcd
[1971144.386970] scsi host9: uas_eh_device_reset_handler success
[1971144.406452] sd 9:0:0:0: [sdg] tag#20 data cmplt err -71 uas-tag 1 
inflight: CMD
[1971144.406457] sd 9:0:0:0: [sdg] tag#20 CDB: Write(10) 2a 00 28 ef bf 
38 00 04 00 00



On 15/09/2020 20:24, Alan Stern wrote:
> On Tue, Sep 15, 2020 at 06:43:49PM +0200, Patrik Nilsson wrote:
>> Hi Alan,
>>
>> Unfortunately the options you suggested didn't help.
>>
>> The patch below works and is tested with Ubuntu kernel 5.4.0.47.50.
>>
>> I have stress tested the usb system. To the USB is now seven mechanical hard
>> disks and two ssd disks connected. Six processes are at the same time
>> writing random data to the disks. One of them is to the ssd disk I couldn't
>> write data to before without it failed. Also the other usb-ssd disk is my
>> root partition.
>>
>> Before I applied the patch, my root partition sometimes failed to be kept
>> mounted. Now I have not had any crashes.
>>
>> This is a quick fix for hard disks, but working. It continued to work when I
>> started three virtualbox guests and let them also do work. The guests' hard
>> disks is on my usb-root partition.
>>
>> It doesn't work if I also use my usb2ethernet adapter (ID 2001:4a00 D-Link
>> Corp.), although my root partition and two randomize tests survived. Maybe a
>> much larger timeout in this case will help? But this I don't find as a good
>> solution.
>>
>> The behavior is the same on the other (much slower) computer with a
>> different usb hub. I have also tested it with exactly the same setup as
>> earlier, with no mechanical hard disks, and it works with the patch and not
>> without it.
> Is there any way you can capture a usbmon trace that shows the problem?
>
>> Any suggestion on how to solve this? In a good way.
>>
>> Best regards,
>> Patrik
>>
>> ---start of diff---
>> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
>> index 5b768b80d1ee..3c550934815c 100644
>> --- a/drivers/usb/core/hub.c
>> +++ b/drivers/usb/core/hub.c
>> @@ -105,7 +105,7 @@ MODULE_PARM_DESC(use_both_schemes,
>>   DECLARE_RWSEM(ehci_cf_port_reset_rwsem);
>>   EXPORT_SYMBOL_GPL(ehci_cf_port_reset_rwsem);
>>
>> -#define HUB_DEBOUNCE_TIMEOUT    2000
>> +#define HUB_DEBOUNCE_TIMEOUT    10000
>>   #define HUB_DEBOUNCE_STEP      25
>>   #define HUB_DEBOUNCE_STABLE     100
>>
>> diff --git a/include/linux/usb.h b/include/linux/usb.h
>> index 20c555db4621..e64d441bb78f 100644
>> --- a/include/linux/usb.h
>> +++ b/include/linux/usb.h
>> @@ -1841,8 +1841,8 @@ extern int usb_set_configuration(struct usb_device
>> *dev, int configuration);
>>    * USB identifies 5 second timeouts, maybe more in a few cases, and a few
>>    * slow devices (like some MGE Ellipse UPSes) actually push that limit.
>>    */
>> -#define USB_CTRL_GET_TIMEOUT    5000
>> -#define USB_CTRL_SET_TIMEOUT    5000
>> +#define USB_CTRL_GET_TIMEOUT    10000
>> +#define USB_CTRL_SET_TIMEOUT    10000
> What happens if you leave these two lines unchanged and increase only
> the HUB_DEBOUNCE_TIMEOUT value?
>
> Alan Stern
