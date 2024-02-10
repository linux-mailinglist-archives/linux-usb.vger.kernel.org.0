Return-Path: <linux-usb+bounces-6205-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D22C850682
	for <lists+linux-usb@lfdr.de>; Sat, 10 Feb 2024 22:43:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 982881C22165
	for <lists+linux-usb@lfdr.de>; Sat, 10 Feb 2024 21:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D7F5FBA2;
	Sat, 10 Feb 2024 21:43:12 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C3A3612E
	for <linux-usb@vger.kernel.org>; Sat, 10 Feb 2024 21:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.254.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707601392; cv=none; b=GDhBcZagS1ZfRd6v0fg9H17RN0phjrCbBSZey+7W0EnMzot9n5H+GDFmbd2S0cZgrLozWdPQ90MzS4XodJrn8zu6S6OtxVNQzj+PYtb0YOXgrX80IJxTA6bjPRcWX5qlR0W9RvnOiUbnaH9m/65sWtgIvkxT/bLN7XrigFeYiXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707601392; c=relaxed/simple;
	bh=6EsErfobpMh7EyCqHKTFI/mNRgQY2uiNNn9EGe4dDWU=;
	h=To:From:Subject:Date:Message-ID:References:Mime-Version:
	 Content-Type:Cc:In-Reply-To; b=r10Z/aKafJImkpc1kIo0mTarh4mavCWNRZYUwVP70FJsQke6dh+tJZEslsrdRoM/KO3Ij80tij3knxYjKqEv8tpHxXt3qAHBdqDWkZJ3yCnBqH/uxutG1LXr0dfftk2e6IFR8FUMGMdP14gjcn+Uakq7qyHrNskOC+ooRmZ3ohw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=m.gmane-mx.org; arc=none smtp.client-ip=116.202.254.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.gmane-mx.org
Received: from list by ciao.gmane.io with local (Exim 4.92)
	(envelope-from <glug-linux-usb@m.gmane-mx.org>)
	id 1rYv7s-0009Vp-6J
	for linux-usb@vger.kernel.org; Sat, 10 Feb 2024 22:43:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: linux-usb@vger.kernel.org
From: Julian Sikorski <belegdol@gmail.com>
Subject: Re: [PATCH] usb-storage: Ignore UAS for LaCie Rugged FW USB3
Date: Sat, 10 Feb 2024 22:43:00 +0100
Message-ID: <c21f9649-30be-462a-b9ec-f7c96ead30cf@gmail.com>
References: <20240209151121.1004985-1-tasos@tasossah.com>
 <b16e72ad-3f2d-46a8-8361-2641088694df@rowland.harvard.edu>
 <2978efa3-e83f-4ef5-907d-8232e4b692a5@tasossah.com>
 <6d4b1f55-09df-47e9-945d-fa38cd36588c@gmail.com>
 <b6dcf71b-f094-4664-8d43-7d8c0173f51f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla Thunderbird
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA-XMD5yJDbdMReXY1tMh2IBg-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org,
 gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r-XMD5yJDbdMReXY1tMh2IBg-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org
Content-Language: en-US
In-Reply-To: <b6dcf71b-f094-4664-8d43-7d8c0173f51f@gmail.com>

Am 10.02.24 um 22:35 schrieb Julian Sikorski:
> Am 10.02.24 um 15:21 schrieb Julian Sikorski:
>> Am 10.02.24 um 14:24 schrieb Tasos Sahanidis:
>>> On 2024-02-09 17:31, Alan Stern wrote:
>>>> On Fri, Feb 09, 2024 at 05:11:21PM +0200, Tasos Sahanidis wrote:
>>>>> This external HDD fails when plugged in to a USB 3 port. Ignoring 
>>>>> UAS and
>>>>> falling back to mass storage resolves this issue.
>>>>
>>>> What happens when it is plugged into a USB-2 port?
>>>
>>> It works without any quirks over USB 2.0 with uas, however asking for
>>> cache data fails gracefully.
>>>
>>> [  520.829840] scsi host4: uas
>>> [  521.024643] scsi 4:0:0:0: Direct-Access     LaCie    Rugged FW 
>>> USB3   1081 PQ: 0 ANSI: 4
>>> [  521.026370] sd 4:0:0:0: Attached scsi generic sg2 type 0
>>> [  521.030096] sd 4:0:0:0: [sdc] 976773153 512-byte logical blocks: 
>>> (500 GB/466 GiB)
>>> [  521.030369] sd 4:0:0:0: [sdc] Write Protect is off
>>> [  521.030373] sd 4:0:0:0: [sdc] Mode Sense: 47 00 10 08
>>> [  521.030507] sd 4:0:0:0: [sdc] Asking for cache data failed
>>> [  521.030512] sd 4:0:0:0: [sdc] Assuming drive cache: write through
>>> [  521.065916]  sdc: sdc1
>>> [  521.067783] sd 4:0:0:0: [sdc] Attached SCSI disk
>>> [  521.699380] EXT4-fs (sdc1): recovery complete
>>> [  521.699388] EXT4-fs (sdc1): mounted filesystem with ordered data 
>>> mode. Opts: errors=remount-ro. Quota mode: none.
>>>
>>>> Have you checked to see if any of the quirk flags can prevent this
>>>> problem?  It looks like the only issue might be that one Mode Sense(6)
>>>> command.
>>>
>>> I have tried various combinations of all the available quirks and I
>>> couldn't get it to not hang. Without any quirks it keeps retrying Mode
>>> Sense(6) constantly.
>>>
>>> I tested US_FL_ALWAYS_SYNC as it sets sdev->skip_ms_page_8 (both with
>>> and without US_FL_NO_REPORT_OPCODES | US_FL_NO_SAME), and it hung at an
>>> ATA passthrough command; presumably the next step afterwards.
>>>
>>> 30 seconds and one USB reset later, the disk is recognised, but I
>>> do not know if it is reliable.
>>>
>>> [  329.161316] scsi 4:0:0:0: Direct-Access     LaCie    Rugged FW 
>>> USB3   1081 PQ: 0 ANSI: 4
>>> [  329.162228] sd 4:0:0:0: Attached scsi generic sg2 type 0
>>> [  329.166650] sd 4:0:0:0: [sdc] 976773153 512-byte logical blocks: 
>>> (500 GB/466 GiB)
>>> [  329.166654] sd 4:0:0:0: [sdc] Assuming Write Enabled
>>> [  329.166655] sd 4:0:0:0: [sdc] Assuming drive cache: write back
>>> [  329.197983]  sdc: sdc1
>>> [  329.198521] sd 4:0:0:0: [sdc] Attached SCSI disk
>>> [  359.553806] sd 4:0:0:0: [sdc] tag#3 uas_eh_abort_handler 0 uas-tag 
>>> 1 inflight: IN
>>> [  359.553816] sd 4:0:0:0: [sdc] tag#3 CDB: ATA command pass 
>>> through(12)/Blank a1 08 2e 00 01 00 00 00 00 ec 00 00
>>> [  359.573771] scsi host4: uas_eh_device_reset_handler start
>>> [  359.702116] usb 3-1: reset SuperSpeed USB device number 3 using 
>>> xhci_hcd
>>> [  359.722068] usb 3-1: LPM exit latency is zeroed, disabling LPM.
>>> [  359.724348] scsi host4: uas_eh_device_reset_handler success
>>> [  360.582975] EXT4-fs (sdc1): recovery complete
>>> [  360.633098] EXT4-fs (sdc1): mounted filesystem with ordered data 
>>> mode. Opts: errors=remount-ro. Quota mode: none.
>>>
>>> My assumption is that something goes wrong during init and that makes it
>>> hang in general. Perhaps the Mode Sense(6) is broken in addition to
>>> whatever else is misbehaving. I don't believe the XHCI controller is at
>>> fault.
>>>
>>>> Falling back from uas to usb-storage could reduce the throughput
>>>> considerably.  We would like to avoid doing this if possible.
>>>
>>> Absolutely, but at the same time I am not sure how much it matters for
>>> an old mechanical hard disk. Granted, someone can use the same enclosure
>>> and install an SSD internally, so perhaps that makes it worth it.
>>>
>>> Thanks
>>>
>>> -- 
>>> Tasos
>>>
>>>
>>>
>> This seems to be similar to the issue I am facing with a similar LaCie 
>> Rugged USB3-FW 059f:1061. Initially we patched it to IGNORE_UAS but it 
>> then turned out to be working with US_FL_NO_REPORT_OPCODES and 
>> US_FL_NO_SAME. This was back in September 2021. In August 2023 I 
>> reported a similar issue as you, I am still seeing it in 6.7.3. The 
>> good news is that after initial problems it seems to be working fine 
>> once the USB connection is established.
> 
> I have now narrowed it down to having broken between 5.18.19 and 5.19.4 
> kernels. Tasos, if you are interested, you might want to check if you 
> can get the drive working with US_FL_NO_REPORT_OPCODES and
> US_FL_NO_SAME alone (fk) quirks alone on 36 live, which ships 
> 5.17.5 kernel. Exercise caution as it is an EOL system.
> I will see if I can narrow down the regression further.
> 
> Best regards,
> Julian
> 
Oddly enough, with 5.19.4 the device starts working after one reset 
instead of after four:

Feb 10 22:36:56 kernel: usb 2-4: new SuperSpeed USB device number 3 
using xhci_hcd
Feb 10 22:36:56 kernel: usb 2-4: New USB device found, idVendor=059f, 
idProduct=1061, bcdDevice= 0.01
Feb 10 22:36:56 kernel: usb 2-4: New USB device strings: Mfr=2, 
Product=3, SerialNumber=1
Feb 10 22:36:56 kernel: usb 2-4: Product: Rugged USB3-FW
Feb 10 22:36:56 kernel: usb 2-4: Manufacturer: LaCie
Feb 10 22:36:56 kernel: usb 2-4: SerialNumber: 00000000157f928920fa
Feb 10 22:36:56 kernel: scsi host6: uas
Feb 10 22:36:56 kernel: scsi 6:0:0:0: Direct-Access     LaCie    Rugged 
FW USB3   051E PQ: 0 ANSI: 6
Feb 10 22:36:56 kernel: sd 6:0:0:0: Attached scsi generic sg1 type 0
Feb 10 22:36:56 kernel: sd 6:0:0:0: [sda] 1953525168 512-byte logical 
blocks: (1.00 TB/932 GiB)
Feb 10 22:36:56 kernel: sd 6:0:0:0: [sda] Write Protect is off
Feb 10 22:36:56 kernel: sd 6:0:0:0: [sda] Mode Sense: 43 00 00 00
Feb 10 22:36:56 kernel: sd 6:0:0:0: [sda] Write cache: enabled, read 
cache: enabled, doesn't support DPO or FUA
Feb 10 22:36:56 kernel: sd 6:0:0:0: [sda] Preferred minimum I/O size 512 
bytes
Feb 10 22:36:56 kernel: sd 6:0:0:0: [sda] Optimal transfer size 33553920 
bytes
Feb 10 22:37:26 kernel: sd 6:0:0:0: [sda] tag#23 uas_eh_abort_handler 0 
uas-tag 1 inflight: IN
Feb 10 22:37:26 kernel: sd 6:0:0:0: [sda] tag#23 CDB: Inquiry 12 01 b9 
00 04 00
Feb 10 22:37:26 kernel: scsi host6: uas_eh_device_reset_handler start
Feb 10 22:37:26 kernel: usb 2-4: reset SuperSpeed USB device number 3 
using xhci_hcd
Feb 10 22:37:26 kernel: scsi host6: uas_eh_device_reset_handler success
Feb 10 22:37:26 kernel:  sda: sda1 sda2
Feb 10 22:37:26 kernel: sd 6:0:0:0: [sda] Attached SCSI disk

Further bisecting is going to be difficult as there are no built kernels 
left. I will see if the time effort is manageable.

Best regards,
Julian



