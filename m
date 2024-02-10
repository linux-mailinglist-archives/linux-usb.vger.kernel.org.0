Return-Path: <linux-usb+bounces-6197-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27552850482
	for <lists+linux-usb@lfdr.de>; Sat, 10 Feb 2024 14:25:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98B9C1F22A0B
	for <lists+linux-usb@lfdr.de>; Sat, 10 Feb 2024 13:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EECB9535D2;
	Sat, 10 Feb 2024 13:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=devnull.tasossah.com header.i=@devnull.tasossah.com header.b="aaqb2hy+"
X-Original-To: linux-usb@vger.kernel.org
Received: from devnull.tasossah.com (devnull.tasossah.com [91.121.165.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B5147F4B
	for <linux-usb@vger.kernel.org>; Sat, 10 Feb 2024 13:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.121.165.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707571493; cv=none; b=hmlw5JI7Wmp6bSC36NLGliNsupvpaPD3E57Cog0kwiXrKvltSLmvwvRDJK4mQSRM6kdpdwjOjzEioJK7ZocYJJSrdLgWlX6FpwKCH83fXhhutBllZEA86b5Ol5hWhHaR4eY+dKofV2gMR8me/AktgjWstQ+cndsCPbtSFKBATMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707571493; c=relaxed/simple;
	bh=Sgpe9xex6jUrLTnHTIWeAz9LB3GeYZUzZP3NyBUZHuo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ct7gll0mp8n+VGA0398KJbWZsFJoZvRce7zGngtfsuly/dpR1gGtfvvjQT7WKr7HwgLbP31JJU3FDVCZiztW8H1zZyWW12G+2iDi9EOvHBTJuhHsXIvxEkImD2siIqQq+ymjtYw6Qhjh9Zik9hOkOpZCgJXF2heMnEWR4kNbD8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com; spf=pass smtp.mailfrom=tasossah.com; dkim=pass (1024-bit key) header.d=devnull.tasossah.com header.i=@devnull.tasossah.com header.b=aaqb2hy+; arc=none smtp.client-ip=91.121.165.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tasossah.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=devnull.tasossah.com; s=vps; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Y0qojT6XmN/yVbTwYYFei2ZQYmlX5R7eRJP7EatrBZM=; b=aaqb2hy+WiakCYWNi72ZYpM6TQ
	0eksR5Q+W4Banum3v444coaWSTz2zkzXP7QwgBcSK9GS0+rJrc6xxzfNvVKMKqUo2QiSqATqY0SFJ
	9wh6lnRRcZAL4yYbEo95bzYFj3RxABYqnTYUIrTy3lD1o4pruWsSoPekcfuDXjJ5e7zw=;
Received: from [2a02:587:6a0e:de00::d54]
	by devnull.tasossah.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <tasos@tasossah.com>)
	id 1rYnLc-007ZcK-Da; Sat, 10 Feb 2024 15:24:48 +0200
Message-ID: <2978efa3-e83f-4ef5-907d-8232e4b692a5@tasossah.com>
Date: Sat, 10 Feb 2024 15:24:45 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Tasos Sahanidis <tasos@tasossah.com>
Subject: Re: [PATCH] usb-storage: Ignore UAS for LaCie Rugged FW USB3
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
References: <20240209151121.1004985-1-tasos@tasossah.com>
 <b16e72ad-3f2d-46a8-8361-2641088694df@rowland.harvard.edu>
Content-Language: el-GR, en-GB
Autocrypt: addr=tasos@tasossah.com; keydata=
 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
In-Reply-To: <b16e72ad-3f2d-46a8-8361-2641088694df@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-02-09 17:31, Alan Stern wrote:
> On Fri, Feb 09, 2024 at 05:11:21PM +0200, Tasos Sahanidis wrote:
>> This external HDD fails when plugged in to a USB 3 port. Ignoring UAS and
>> falling back to mass storage resolves this issue.
> 
> What happens when it is plugged into a USB-2 port?

It works without any quirks over USB 2.0 with uas, however asking for
cache data fails gracefully.

[  520.829840] scsi host4: uas
[  521.024643] scsi 4:0:0:0: Direct-Access     LaCie    Rugged FW USB3   1081 PQ: 0 ANSI: 4
[  521.026370] sd 4:0:0:0: Attached scsi generic sg2 type 0
[  521.030096] sd 4:0:0:0: [sdc] 976773153 512-byte logical blocks: (500 GB/466 GiB)
[  521.030369] sd 4:0:0:0: [sdc] Write Protect is off
[  521.030373] sd 4:0:0:0: [sdc] Mode Sense: 47 00 10 08
[  521.030507] sd 4:0:0:0: [sdc] Asking for cache data failed
[  521.030512] sd 4:0:0:0: [sdc] Assuming drive cache: write through
[  521.065916]  sdc: sdc1
[  521.067783] sd 4:0:0:0: [sdc] Attached SCSI disk
[  521.699380] EXT4-fs (sdc1): recovery complete
[  521.699388] EXT4-fs (sdc1): mounted filesystem with ordered data mode. Opts: errors=remount-ro. Quota mode: none.

> Have you checked to see if any of the quirk flags can prevent this 
> problem?  It looks like the only issue might be that one Mode Sense(6) 
> command.

I have tried various combinations of all the available quirks and I
couldn't get it to not hang. Without any quirks it keeps retrying Mode
Sense(6) constantly.

I tested US_FL_ALWAYS_SYNC as it sets sdev->skip_ms_page_8 (both with
and without US_FL_NO_REPORT_OPCODES | US_FL_NO_SAME), and it hung at an
ATA passthrough command; presumably the next step afterwards.

30 seconds and one USB reset later, the disk is recognised, but I
do not know if it is reliable.

[  329.161316] scsi 4:0:0:0: Direct-Access     LaCie    Rugged FW USB3   1081 PQ: 0 ANSI: 4
[  329.162228] sd 4:0:0:0: Attached scsi generic sg2 type 0
[  329.166650] sd 4:0:0:0: [sdc] 976773153 512-byte logical blocks: (500 GB/466 GiB)
[  329.166654] sd 4:0:0:0: [sdc] Assuming Write Enabled
[  329.166655] sd 4:0:0:0: [sdc] Assuming drive cache: write back
[  329.197983]  sdc: sdc1
[  329.198521] sd 4:0:0:0: [sdc] Attached SCSI disk
[  359.553806] sd 4:0:0:0: [sdc] tag#3 uas_eh_abort_handler 0 uas-tag 1 inflight: IN
[  359.553816] sd 4:0:0:0: [sdc] tag#3 CDB: ATA command pass through(12)/Blank a1 08 2e 00 01 00 00 00 00 ec 00 00
[  359.573771] scsi host4: uas_eh_device_reset_handler start
[  359.702116] usb 3-1: reset SuperSpeed USB device number 3 using xhci_hcd
[  359.722068] usb 3-1: LPM exit latency is zeroed, disabling LPM.
[  359.724348] scsi host4: uas_eh_device_reset_handler success
[  360.582975] EXT4-fs (sdc1): recovery complete
[  360.633098] EXT4-fs (sdc1): mounted filesystem with ordered data mode. Opts: errors=remount-ro. Quota mode: none.

My assumption is that something goes wrong during init and that makes it
hang in general. Perhaps the Mode Sense(6) is broken in addition to
whatever else is misbehaving. I don't believe the XHCI controller is at
fault.

> Falling back from uas to usb-storage could reduce the throughput 
> considerably.  We would like to avoid doing this if possible.

Absolutely, but at the same time I am not sure how much it matters for
an old mechanical hard disk. Granted, someone can use the same enclosure
and install an SSD internally, so perhaps that makes it worth it.

Thanks

--
Tasos


