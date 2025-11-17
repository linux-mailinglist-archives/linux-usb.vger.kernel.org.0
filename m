Return-Path: <linux-usb+bounces-30543-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CF6C6268A
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 06:34:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4B4454E5443
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 05:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D20330ACF8;
	Mon, 17 Nov 2025 05:34:19 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C44F9E8;
	Mon, 17 Nov 2025 05:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763357659; cv=none; b=gpxeF+2EMHvEBivOiLmujh3TmGF/Y3nVFpeRpj8stW8HRS2fBwlq1SyzNi40oeUphTAGTGzou6spWURwJKjqqgfLiGGK72n5NFlO24Gr/mlm0/JyuR/8tRgHzxJtpjDVH9imiALskRR+P2sDidhTRenHX813xiAWVTlNgrp403o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763357659; c=relaxed/simple;
	bh=nlGr6dlQXiEhcy+kxmKrjfH2QmXNCvwy+mwN3Bv59hw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aNfv2rMamSWclzSOaU+m3fncqLKm4wEdPfrp8ewGRKzq7Eo/i0rYvMYyd7s+lJB52sZ5Z8PtJ4YotywDa65Pv+s+fms+nFI9nyDEKDFV11EfW99Lyvo8rTSazVNq40kFLxBGde51Dv/sOHjkjgTJmZLO0wk9T/LpxshtgGbPgZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 08641fecc37711f0a38c85956e01ac42-20251117
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:67094aca-c71f-4d8f-b971-15e8cf0e216d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:922cc0b0a749cfe4b2913a058edd7957,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|15|52,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 08641fecc37711f0a38c85956e01ac42-20251117
X-User: dengjie03@kylinos.cn
Received: from [10.42.12.246] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <dengjie03@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 266194165; Mon, 17 Nov 2025 13:34:05 +0800
Message-ID: <8844b682-88c3-44b0-9f15-4d4d1b5da068@kylinos.cn>
Date: Mon, 17 Nov 2025 13:33:27 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: core: fix NULL dereference in usb_ifnum_to_if()
 during device removal
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com,
 sakari.ailus@linux.intel.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251113114411.1410343-1-dengjie03@kylinos.cn>
 <0bec2aa5-cb3e-49c2-ab40-39a9ebceb2ad@rowland.harvard.edu>
From: Jie Deng <dengjie03@kylinos.cn>
In-Reply-To: <0bec2aa5-cb3e-49c2-ab40-39a9ebceb2ad@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2025/11/13 22:50, Alan Stern 写道:
> On Thu, Nov 13, 2025 at 07:44:11PM +0800, Jie Deng wrote:
>> During USB device hot-unplug, in the time window between when
>> usb_disconnect() calls usb_disable_device() to set
>> dev->actconfig->interface[i] to NULL but before dev->actconfig
>> is set to NULL.At this point, outside the kernel, usb_ifnum_to_if()
>> is called through usb_set_interface(), and usb_ifnum_to_if() continues
>> to access interface[i]->altsetting[i], triggering a null pointer.
>> [ 9518.891254][ 1] [ T4650] Call trace:
>> [ 9518.894817][ 1] [ T4650]  usb_ifnum_to_if+0x34/0x50
>> [ 9518.899681][ 1] [ T4650]  usb_set_interface+0x108/0x3c8
>> [ 9518.904898][ 1] [ T4650]  uvc_video_stop_streaming+0x3c/0x90 [uvcvideo]
>> [ 9518.911500][ 1] [ T4650]  uvc_stop_streaming+0x24/0x90 [uvcvideo]
>> [ 9518.917583][ 1] [ T4650]  __vb2_queue_cancel+0x44/0x458 [videobuf2_common]
>> [ 9518.924444][ 1] [ T4650]  vb2_core_streamoff+0x20/0xb8 [videobuf2_common]
>> [ 9518.931221][ 1] [ T4650]  vb2_streamoff+0x18/0x60 [videobuf2_v4l2]
>> [ 9518.937390][ 1] [ T4650]  uvc_queue_streamoff+0x30/0x50 [uvcvideo]
>> [ 9518.943557][ 1] [ T4650]  uvc_ioctl_streamoff+0x40/0x68 [uvcvideo]
>> [ 9518.949724][ 1] [ T4650]  v4l_streamoff+0x20/0x28
>> [ 9518.954415][ 1] [ T4650]  __video_do_ioctl+0x17c/0x3e0
>> [ 9518.959540][ 1] [ T4650]  video_usercopy+0x1d8/0x558
>> [ 9518.964490][ 1] [ T4650]  video_ioctl2+0x14/0x1c
>> [ 9518.969094][ 1] [ T4650]  v4l2_ioctl+0x3c/0x58
>> [ 9518.973526][ 1] [ T4650]  do_vfs_ioctl+0x374/0x7b0
>> [ 9518.978304][ 1] [ T4650]  ksys_ioctl+0x78/0xa8
>> [ 9518.982734][ 1] [ T4650]  sys_ioctl+0xc/0x18
>> [ 9518.986991][ 1] [ T4650]  __sys_trace_return+0x0/0x4
>> [ 9518.991943][ 1] [ T4650] Code: eb04005f 54000100 f9400040 91002042 (f9400003)
>> [ 9518.999153][ 1] [ T4650] ---[ end trace f7c7d3236806d9a4 ]---
> This looks like a bug in the uvc driver.  usb_disable_device() unbinds
> ther interface's driver before it sets dev->actconfig->interface[i] to
> NULL, and the uvc driver shouldn't call usb_set_interface() after it has
> been unbound.
Thank you for your correction.
>
>> To resolve this issue, a null pointer check for config->interface[i]
>> can be added in the usb_ifnum_to_if() function.
> That won't fix the real bug.  You need to change the uvc driver.

I will fix this issue from the uvc driver and submit a patch.

>
> Alan Stern

