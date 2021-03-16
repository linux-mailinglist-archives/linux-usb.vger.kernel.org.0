Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3915A33E0BE
	for <lists+linux-usb@lfdr.de>; Tue, 16 Mar 2021 22:44:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhCPVoU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Mar 2021 17:44:20 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:51848 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229529AbhCPVnx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Mar 2021 17:43:53 -0400
X-Greylist: delayed 58637 seconds by postgrey-1.27 at vger.kernel.org; Tue, 16 Mar 2021 17:43:53 EDT
From:   Matthias Schwarzott <zzam@gentoo.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        hirofumi@mail.parknet.co.jp,
        Lennart Poettering <lennart@poettering.net>,
        systemd-devel@lists.freedesktop.org
References: <20210307155236.GB103559@rowland.harvard.edu>
 <9c3121a9-3d0c-60b3-ef17-993b7d2e9149@gentoo.org>
 <20210307165856.GA104554@rowland.harvard.edu>
 <268e646f-d4ea-3190-f1b9-8e69bfc1b019@gentoo.org>
 <20210309155046.GA176674@rowland.harvard.edu>
 <dfd2b281-3beb-9869-37b6-8bd48a6cf40f@gentoo.org>
 <20210310214648.GA236329@rowland.harvard.edu>
 <841a9a54-78ee-ffaa-fc3c-12defcf43b36@gentoo.org>
 <20210311143912.GA257360@rowland.harvard.edu>
 <f2acfeef-a81a-d7c0-90a8-b290a18cb742@gentoo.org>
 <20210316162650.GB448722@rowland.harvard.edu>
Subject: Re: [usb-storage] Re: Amazon Kindle disconnect after Synchronize
 Cache
Message-ID: <22850531-fee1-a679-53d6-a8d8691a9630@gentoo.org>
Date:   Tue, 16 Mar 2021 22:43:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316162650.GB448722@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am 16.03.21 um 17:26 schrieb Alan Stern:
> On Tue, Mar 16, 2021 at 06:26:30AM +0100, Matthias Schwarzott wrote:
>> I implemented solution 3b. This is the pullrequest for udev (systemd
>> repository):
>>
>> 	https://github.com/systemd/systemd/pull/19002
>>
>> Now Lennart asks if udev is the best place for such hacks/work-arounds?
>>
>> Well, I implemented it as suggested by Alan (see above). This was the
>> simplest of the considered alternatives. Different quirks in kernel has been
>> considered, but are more effort to be implemented.
> 
> Lennart probably isn't aware how the usb-storage driver works.  It does
> not create commands on its own; it merely sends the commands that it
> gets from higher SCSI layers.
> 
> It may be possible to modify the SCSI core, to make it send a TEST UNIT
> READY command immediately following any SYNCHRONIZE CACHE to a Kindle.
> 
> However, there may be an easier solution.  usb-storage does indeed send
> a command of its own, REQUEST SENSE, to get error data when a command
> fails.  The patch below will make it do the same thing whenever it sends
> a SYNCHRONIZE CACHE to a Kindle, failure or not.
> 
> The only question is whether the Kindle will regard REQUEST SENSE as a
> sufficient indication that it shouldn't do an eject.  The only way to
> find out is by testing the patch.
> 

The patch is a lot shorter than I expected it to be.

I tried it. The new udev-rule is commented, so polling interval is back 
at 2000 ms.

Testing it:
# cat /sys/block/sde/events_poll_msecs
-1
# cat /sys/module/block/parameters/events_dfl_poll_msecs
2000
# python -c "import time; import os; f = open('/dev/sde1', 'r+b'); 
os.fsync(f); time.sleep(4)"

This is wireshark output of the test:

85	4.701949	host	3.8.1	USBMS	95	SCSI: Test Unit Ready LUN: 0x00
86	4.701972	3.8.1	host	USB	64	URB_BULK out
87	4.701975	host	3.8.1	USB	64	URB_BULK in
88	4.702030	3.8.1	host	USBMS	77	SCSI: Response LUN: 0x00 (Test Unit 
Ready) (Good)
89	4.702043	host	3.8.1	USBMS	95	SCSI: Prevent/Allow Medium Removal LUN: 
0x00  PREVENT
90	4.702069	3.8.1	host	USB	64	URB_BULK out
91	4.702072	host	3.8.1	USB	64	URB_BULK in
92	4.703006	3.8.1	host	USBMS	77	SCSI: Response LUN: 0x00 (Prevent/Allow 
Medium Removal) (Good)

93	4.703052	host	3.8.1	USBMS	95	SCSI: Synchronize Cache(10) LUN: 0x00 
(LBA: 0x00000000, Len: 0)
94	4.703066	3.8.1	host	USB	64	URB_BULK out
95	4.703067	host	3.8.1	USB	64	URB_BULK in
96	4.704146	3.8.1	host	USBMS	77	SCSI: Response LUN: 0x00 (Synchronize 
Cache(10)) (Good)
97	4.704149	host	3.8.1	USBMS	95	SCSI: Request Sense LUN: 0x00
98	4.704177	3.8.1	host	USB	64	URB_BULK out
99	4.704179	host	3.8.1	USB	64	URB_BULK in
100	4.705032	3.8.1	host	USBMS	82	SCSI: Data In LUN: 0x00 (Request Sense 
Response Data)
101	4.705035	host	3.8.1	USB	64	URB_BULK in
102	4.705053	3.8.1	host	USBMS	77	SCSI: Response LUN: 0x00 (Request 
Sense) (Good)
105	6.740272	host	3.8.1	USBMS	95	SCSI: Test Unit Ready LUN: 0x00
106	6.740323	3.8.1	host	USB	64	URB_BULK out
107	6.740326	host	3.8.1	USB	64	URB_BULK in
108	6.740410	3.8.1	host	USBMS	77	SCSI: Response LUN: 0x00 (Test Unit 
Ready) (Good)
195	8.709417	host	3.8.1	USBMS	95	SCSI: Prevent/Allow Medium Removal LUN: 
0x00  ALLOW
196	8.709441	3.8.1	host	USB	64	URB_BULK out
197	8.709445	host	3.8.1	USB	64	URB_BULK in
198	8.709645	3.8.1	host	USBMS	77	SCSI: Response LUN: 0x00 (Prevent/Allow 
Medium Removal) (Good)

The patch indeed works. The kindle does not disconnect.
I also tried with a sync on a mounted filesystem. The effect is the 
same: No disconnect.

Calling "eject /dev/sde" still works as it should.

Tested-by: Matthias Schwarzott <zzam@gentoo.org>

Regards
Matthias
