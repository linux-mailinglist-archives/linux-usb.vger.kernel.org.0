Return-Path: <linux-usb+bounces-6204-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D70C0850680
	for <lists+linux-usb@lfdr.de>; Sat, 10 Feb 2024 22:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DD6B284839
	for <lists+linux-usb@lfdr.de>; Sat, 10 Feb 2024 21:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69EC85FDB0;
	Sat, 10 Feb 2024 21:35:28 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A095F47C
	for <linux-usb@vger.kernel.org>; Sat, 10 Feb 2024 21:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.254.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707600928; cv=none; b=GxpgGyqLtDcLFQ3zLhyZd4sCTNDq3ha9cmqrRklsBFPxu8x9pziAeOrJqFGZzdG9ruQtrL/WDyKX4oaOQKs7m3QGV8PfWL1PekES3m6m91I0Wbs1s95PGxoPgMvEVhz+MqKPzZbI8TYaClo5tiXDL9kXQ+5EVPd2/AvlSacsdnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707600928; c=relaxed/simple;
	bh=gbPK1vrM/eNWbA2ruy1g4YPqJGhXh146TwYNMQZnOuU=;
	h=To:From:Subject:Date:Message-ID:References:Mime-Version:
	 Content-Type:Cc:In-Reply-To; b=DOJ28+AtJrGbj8jpbSFB8dmSK6WufgpGlTvSet44oVQHRQt0PLnSR7RRq4Thgqz9QNaK6DmjCcxFq0Cq9ev4tOqEhMtUCrxeOFVJkzdgEnKsBqm/avuhP5IVqjWpyoQGeQ2qcjDLQA6K/sDZO9oGs9y1Zl7+seGOPafSC0IO458=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=m.gmane-mx.org; arc=none smtp.client-ip=116.202.254.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.gmane-mx.org
Received: from list by ciao.gmane.io with local (Exim 4.92)
	(envelope-from <glug-linux-usb@m.gmane-mx.org>)
	id 1rYv0M-000AYR-Hx
	for linux-usb@vger.kernel.org; Sat, 10 Feb 2024 22:35:22 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: linux-usb@vger.kernel.org
From: Julian Sikorski <belegdol@gmail.com>
Subject: Re: [PATCH] usb-storage: Ignore UAS for LaCie Rugged FW USB3
Date: Sat, 10 Feb 2024 22:35:17 +0100
Message-ID: <b6dcf71b-f094-4664-8d43-7d8c0173f51f@gmail.com>
References: <20240209151121.1004985-1-tasos@tasossah.com>
 <b16e72ad-3f2d-46a8-8361-2641088694df@rowland.harvard.edu>
 <2978efa3-e83f-4ef5-907d-8232e4b692a5@tasossah.com>
 <6d4b1f55-09df-47e9-945d-fa38cd36588c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla Thunderbird
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org,
 gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org
Content-Language: en-US
In-Reply-To: <6d4b1f55-09df-47e9-945d-fa38cd36588c@gmail.com>

Am 10.02.24 um 15:21 schrieb Julian Sikorski:
> Am 10.02.24 um 14:24 schrieb Tasos Sahanidis:
>> On 2024-02-09 17:31, Alan Stern wrote:
>>> On Fri, Feb 09, 2024 at 05:11:21PM +0200, Tasos Sahanidis wrote:
>>>> This external HDD fails when plugged in to a USB 3 port. Ignoring 
>>>> UAS and
>>>> falling back to mass storage resolves this issue.
>>>
>>> What happens when it is plugged into a USB-2 port?
>>
>> It works without any quirks over USB 2.0 with uas, however asking for
>> cache data fails gracefully.
>>
>> [  520.829840] scsi host4: uas
>> [  521.024643] scsi 4:0:0:0: Direct-Access     LaCie    Rugged FW 
>> USB3   1081 PQ: 0 ANSI: 4
>> [  521.026370] sd 4:0:0:0: Attached scsi generic sg2 type 0
>> [  521.030096] sd 4:0:0:0: [sdc] 976773153 512-byte logical blocks: 
>> (500 GB/466 GiB)
>> [  521.030369] sd 4:0:0:0: [sdc] Write Protect is off
>> [  521.030373] sd 4:0:0:0: [sdc] Mode Sense: 47 00 10 08
>> [  521.030507] sd 4:0:0:0: [sdc] Asking for cache data failed
>> [  521.030512] sd 4:0:0:0: [sdc] Assuming drive cache: write through
>> [  521.065916]  sdc: sdc1
>> [  521.067783] sd 4:0:0:0: [sdc] Attached SCSI disk
>> [  521.699380] EXT4-fs (sdc1): recovery complete
>> [  521.699388] EXT4-fs (sdc1): mounted filesystem with ordered data 
>> mode. Opts: errors=remount-ro. Quota mode: none.
>>
>>> Have you checked to see if any of the quirk flags can prevent this
>>> problem?  It looks like the only issue might be that one Mode Sense(6)
>>> command.
>>
>> I have tried various combinations of all the available quirks and I
>> couldn't get it to not hang. Without any quirks it keeps retrying Mode
>> Sense(6) constantly.
>>
>> I tested US_FL_ALWAYS_SYNC as it sets sdev->skip_ms_page_8 (both with
>> and without US_FL_NO_REPORT_OPCODES | US_FL_NO_SAME), and it hung at an
>> ATA passthrough command; presumably the next step afterwards.
>>
>> 30 seconds and one USB reset later, the disk is recognised, but I
>> do not know if it is reliable.
>>
>> [  329.161316] scsi 4:0:0:0: Direct-Access     LaCie    Rugged FW 
>> USB3   1081 PQ: 0 ANSI: 4
>> [  329.162228] sd 4:0:0:0: Attached scsi generic sg2 type 0
>> [  329.166650] sd 4:0:0:0: [sdc] 976773153 512-byte logical blocks: 
>> (500 GB/466 GiB)
>> [  329.166654] sd 4:0:0:0: [sdc] Assuming Write Enabled
>> [  329.166655] sd 4:0:0:0: [sdc] Assuming drive cache: write back
>> [  329.197983]  sdc: sdc1
>> [  329.198521] sd 4:0:0:0: [sdc] Attached SCSI disk
>> [  359.553806] sd 4:0:0:0: [sdc] tag#3 uas_eh_abort_handler 0 uas-tag 
>> 1 inflight: IN
>> [  359.553816] sd 4:0:0:0: [sdc] tag#3 CDB: ATA command pass 
>> through(12)/Blank a1 08 2e 00 01 00 00 00 00 ec 00 00
>> [  359.573771] scsi host4: uas_eh_device_reset_handler start
>> [  359.702116] usb 3-1: reset SuperSpeed USB device number 3 using 
>> xhci_hcd
>> [  359.722068] usb 3-1: LPM exit latency is zeroed, disabling LPM.
>> [  359.724348] scsi host4: uas_eh_device_reset_handler success
>> [  360.582975] EXT4-fs (sdc1): recovery complete
>> [  360.633098] EXT4-fs (sdc1): mounted filesystem with ordered data 
>> mode. Opts: errors=remount-ro. Quota mode: none.
>>
>> My assumption is that something goes wrong during init and that makes it
>> hang in general. Perhaps the Mode Sense(6) is broken in addition to
>> whatever else is misbehaving. I don't believe the XHCI controller is at
>> fault.
>>
>>> Falling back from uas to usb-storage could reduce the throughput
>>> considerably.  We would like to avoid doing this if possible.
>>
>> Absolutely, but at the same time I am not sure how much it matters for
>> an old mechanical hard disk. Granted, someone can use the same enclosure
>> and install an SSD internally, so perhaps that makes it worth it.
>>
>> Thanks
>>
>> -- 
>> Tasos
>>
>>
>>
> This seems to be similar to the issue I am facing with a similar LaCie 
> Rugged USB3-FW 059f:1061. Initially we patched it to IGNORE_UAS but it 
> then turned out to be working with US_FL_NO_REPORT_OPCODES and 
> US_FL_NO_SAME. This was back in September 2021. In August 2023 I 
> reported a similar issue as you, I am still seeing it in 6.7.3. The good 
> news is that after initial problems it seems to be working fine once the 
> USB connection is established.

I have now narrowed it down to having broken between 5.18.19 and 5.19.4 
kernels. Tasos, if you are interested, you might want to check if you 
can get the drive working with US_FL_NO_REPORT_OPCODES and
US_FL_NO_SAME alone (fk) quirks alone on Fedora 36 live, which ships 
5.17.5 kernel. Exercise caution as it is an EOL system.
I will see if I can narrow down the regression further.

Best regards,
Julian



