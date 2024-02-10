Return-Path: <linux-usb+bounces-6198-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 544FE8504B0
	for <lists+linux-usb@lfdr.de>; Sat, 10 Feb 2024 15:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2A211F22465
	for <lists+linux-usb@lfdr.de>; Sat, 10 Feb 2024 14:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD72753E3F;
	Sat, 10 Feb 2024 14:21:41 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E5F3B7A8
	for <linux-usb@vger.kernel.org>; Sat, 10 Feb 2024 14:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.254.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707574901; cv=none; b=feSNjWVbBZP8FlEqSEIAjjcyO3/hSViUP+0rqrgtcjS9YKbuKOA6grdUXdu/Xc0q2eefqs9fZvLj2FskiCTmB7WS+swvj1WIw0zMG5Nby5Ng/xDa6bmwDQhAAbwshKM49DWfYCsDzYqun9est6IY7fz/6zL1w4GlKuHkQT5Tlbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707574901; c=relaxed/simple;
	bh=3StAwYy2CwlU9RaKZ6rS7kpvIXiSQFDIipMoa8BSsMQ=;
	h=To:From:Subject:Date:Message-ID:References:Mime-Version:
	 Content-Type:Cc:In-Reply-To; b=Hr/PoRYiku7NMWDgeWfPARYZtGjB6UpEE9CD9U1g9UiJsjUjI/8FFkDFzK/JcCP+pa5S/5QdQ7nEpnvWTd43lhskAP6WeKiFeRLa92CFUll8dqI68RI1q707Zk7GUIrqyauUqnAh283k7abvVtISNGDsCG2qFJ5sPUFeYQdCrQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=m.gmane-mx.org; arc=none smtp.client-ip=116.202.254.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.gmane-mx.org
Received: from list by ciao.gmane.io with local (Exim 4.92)
	(envelope-from <glug-linux-usb@m.gmane-mx.org>)
	id 1rYoEQ-00073L-Sx
	for linux-usb@vger.kernel.org; Sat, 10 Feb 2024 15:21:26 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: linux-usb@vger.kernel.org
From: Julian Sikorski <belegdol@gmail.com>
Subject: Re: [PATCH] usb-storage: Ignore UAS for LaCie Rugged FW USB3
Date: Sat, 10 Feb 2024 15:21:21 +0100
Message-ID: <6d4b1f55-09df-47e9-945d-fa38cd36588c@gmail.com>
References: <20240209151121.1004985-1-tasos@tasossah.com>
 <b16e72ad-3f2d-46a8-8361-2641088694df@rowland.harvard.edu>
 <2978efa3-e83f-4ef5-907d-8232e4b692a5@tasossah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
User-Agent: Mozilla Thunderbird
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Content-Language: en-US
In-Reply-To: <2978efa3-e83f-4ef5-907d-8232e4b692a5@tasossah.com>

Am 10.02.24 um 14:24 schrieb Tasos Sahanidis:
> On 2024-02-09 17:31, Alan Stern wrote:
>> On Fri, Feb 09, 2024 at 05:11:21PM +0200, Tasos Sahanidis wrote:
>>> This external HDD fails when plugged in to a USB 3 port. Ignoring UAS and
>>> falling back to mass storage resolves this issue.
>>
>> What happens when it is plugged into a USB-2 port?
> 
> It works without any quirks over USB 2.0 with uas, however asking for
> cache data fails gracefully.
> 
> [  520.829840] scsi host4: uas
> [  521.024643] scsi 4:0:0:0: Direct-Access     LaCie    Rugged FW USB3   1081 PQ: 0 ANSI: 4
> [  521.026370] sd 4:0:0:0: Attached scsi generic sg2 type 0
> [  521.030096] sd 4:0:0:0: [sdc] 976773153 512-byte logical blocks: (500 GB/466 GiB)
> [  521.030369] sd 4:0:0:0: [sdc] Write Protect is off
> [  521.030373] sd 4:0:0:0: [sdc] Mode Sense: 47 00 10 08
> [  521.030507] sd 4:0:0:0: [sdc] Asking for cache data failed
> [  521.030512] sd 4:0:0:0: [sdc] Assuming drive cache: write through
> [  521.065916]  sdc: sdc1
> [  521.067783] sd 4:0:0:0: [sdc] Attached SCSI disk
> [  521.699380] EXT4-fs (sdc1): recovery complete
> [  521.699388] EXT4-fs (sdc1): mounted filesystem with ordered data mode. Opts: errors=remount-ro. Quota mode: none.
> 
>> Have you checked to see if any of the quirk flags can prevent this
>> problem?  It looks like the only issue might be that one Mode Sense(6)
>> command.
> 
> I have tried various combinations of all the available quirks and I
> couldn't get it to not hang. Without any quirks it keeps retrying Mode
> Sense(6) constantly.
> 
> I tested US_FL_ALWAYS_SYNC as it sets sdev->skip_ms_page_8 (both with
> and without US_FL_NO_REPORT_OPCODES | US_FL_NO_SAME), and it hung at an
> ATA passthrough command; presumably the next step afterwards.
> 
> 30 seconds and one USB reset later, the disk is recognised, but I
> do not know if it is reliable.
> 
> [  329.161316] scsi 4:0:0:0: Direct-Access     LaCie    Rugged FW USB3   1081 PQ: 0 ANSI: 4
> [  329.162228] sd 4:0:0:0: Attached scsi generic sg2 type 0
> [  329.166650] sd 4:0:0:0: [sdc] 976773153 512-byte logical blocks: (500 GB/466 GiB)
> [  329.166654] sd 4:0:0:0: [sdc] Assuming Write Enabled
> [  329.166655] sd 4:0:0:0: [sdc] Assuming drive cache: write back
> [  329.197983]  sdc: sdc1
> [  329.198521] sd 4:0:0:0: [sdc] Attached SCSI disk
> [  359.553806] sd 4:0:0:0: [sdc] tag#3 uas_eh_abort_handler 0 uas-tag 1 inflight: IN
> [  359.553816] sd 4:0:0:0: [sdc] tag#3 CDB: ATA command pass through(12)/Blank a1 08 2e 00 01 00 00 00 00 ec 00 00
> [  359.573771] scsi host4: uas_eh_device_reset_handler start
> [  359.702116] usb 3-1: reset SuperSpeed USB device number 3 using xhci_hcd
> [  359.722068] usb 3-1: LPM exit latency is zeroed, disabling LPM.
> [  359.724348] scsi host4: uas_eh_device_reset_handler success
> [  360.582975] EXT4-fs (sdc1): recovery complete
> [  360.633098] EXT4-fs (sdc1): mounted filesystem with ordered data mode. Opts: errors=remount-ro. Quota mode: none.
> 
> My assumption is that something goes wrong during init and that makes it
> hang in general. Perhaps the Mode Sense(6) is broken in addition to
> whatever else is misbehaving. I don't believe the XHCI controller is at
> fault.
> 
>> Falling back from uas to usb-storage could reduce the throughput
>> considerably.  We would like to avoid doing this if possible.
> 
> Absolutely, but at the same time I am not sure how much it matters for
> an old mechanical hard disk. Granted, someone can use the same enclosure
> and install an SSD internally, so perhaps that makes it worth it.
> 
> Thanks
> 
> --
> Tasos
> 
> 
> 
This seems to be similar to the issue I am facing with a similar LaCie 
Rugged USB3-FW 059f:1061. Initially we patched it to IGNORE_UAS but it 
then turned out to be working with US_FL_NO_REPORT_OPCODES and 
US_FL_NO_SAME. This was back in September 2021. In August 2023 I 
reported a similar issue as you, I am still seeing it in 6.7.3. The good 
news is that after initial problems it seems to be working fine once the 
USB connection is established.

Feb 10 15:02:35 kernel: usb 4-2: new SuperSpeed USB device number 3 
using xhci_hcd
Feb 10 15:02:35 kernel: usb 4-2: New USB device found, idVendor=059f, 
idProduct=1061, bcdDevice= 0.01
Feb 10 15:02:35 kernel: usb 4-2: New USB device strings: Mfr=2, 
Product=3, SerialNumber=1
Feb 10 15:02:35 kernel: usb 4-2: Product: Rugged USB3-FW
Feb 10 15:02:35 kernel: usb 4-2: Manufacturer: LaCie
Feb 10 15:02:35 kernel: usb 4-2: SerialNumber: 00000000157f928920fa
Feb 10 15:02:35 kernel: scsi host2: uas
Feb 10 15:02:35 kernel: scsi 2:0:0:0: Direct-Access     LaCie    Rugged 
FW USB3   051E PQ: 0 ANSI: 6
Feb 10 15:02:35 kernel: sd 2:0:0:0: Attached scsi generic sg0 type 0
Feb 10 15:02:35 kernel: sd 2:0:0:0: [sda] 1953525168 512-byte logical 
blocks: (1.00 TB/932 GiB)
Feb 10 15:02:35 kernel: sd 2:0:0:0: [sda] Write Protect is off
Feb 10 15:02:35 kernel: sd 2:0:0:0: [sda] Mode Sense: 43 00 00 00
Feb 10 15:02:35 kernel: sd 2:0:0:0: [sda] Write cache: enabled, read 
cache: enabled, doesn't support DPO or FUA
Feb 10 15:02:35 kernel: sd 2:0:0:0: [sda] Preferred minimum I/O size 512 
bytes
Feb 10 15:02:35 kernel: sd 2:0:0:0: [sda] Optimal transfer size 33553920 
bytes
Feb 10 15:03:05 kernel: sd 2:0:0:0: [sda] tag#9 uas_eh_abort_handler 0 
uas-tag 1 inflight: IN
Feb 10 15:03:05 kernel: sd 2:0:0:0: [sda] tag#9 CDB: Inquiry 12 01 b9 00 
04 00
Feb 10 15:03:05 kernel: scsi host2: uas_eh_device_reset_handler start
Feb 10 15:03:05 kernel: usb 4-2: reset SuperSpeed USB device number 3 
using xhci_hcd
Feb 10 15:03:05 kernel: scsi host2: uas_eh_device_reset_handler success
Feb 10 15:03:35 kernel: scsi host2: uas_eh_device_reset_handler start
Feb 10 15:03:35 kernel: sd 2:0:0:0: [sda] tag#10 uas_zap_pending 0 
uas-tag 1 inflight:
Feb 10 15:03:35 kernel: sd 2:0:0:0: [sda] tag#10 CDB: Inquiry 12 01 b9 
00 04 00
Feb 10 15:03:35 kernel: usb 4-2: reset SuperSpeed USB device number 3 
using xhci_hcd
Feb 10 15:03:35 kernel: scsi host2: uas_eh_device_reset_handler success
Feb 10 15:04:06 kernel: scsi host2: uas_eh_device_reset_handler start
Feb 10 15:04:06 kernel: sd 2:0:0:0: [sda] tag#11 uas_zap_pending 0 
uas-tag 1 inflight:
Feb 10 15:04:06 kernel: sd 2:0:0:0: [sda] tag#11 CDB: Inquiry 12 01 b9 
00 04 00
Feb 10 15:04:06 kernel: usb 4-2: reset SuperSpeed USB device number 3 
using xhci_hcd
Feb 10 15:04:06 kernel: scsi host2: uas_eh_device_reset_handler success
Feb 10 15:04:36 kernel: scsi host2: uas_eh_device_reset_handler start
Feb 10 15:04:36 kernel: sd 2:0:0:0: [sda] tag#26 uas_zap_pending 0 
uas-tag 1 inflight:
Feb 10 15:04:36 kernel: sd 2:0:0:0: [sda] tag#26 CDB: Inquiry 12 01 b9 
00 04 00
Feb 10 15:04:36 kernel: usb 4-2: reset SuperSpeed USB device number 3 
using xhci_hcd
Feb 10 15:04:36 kernel: scsi host2: uas_eh_device_reset_handler success
Feb 10 15:04:36 kernel:  sda: sda1 sda2
Feb 10 15:04:36 kernel: sd 2:0:0:0: [sda] Attached SCSI disk



