Return-Path: <linux-usb+bounces-30552-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63208C62F9D
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 09:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56BD33B138A
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 08:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4763731D39F;
	Mon, 17 Nov 2025 08:51:41 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688A231B829;
	Mon, 17 Nov 2025 08:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763369499; cv=none; b=nruOFS4fdBr8BZ5NEfDbbpnv7oj9+/xbyLYyQ31qkU7UqCy1wZoHmA+keCi6xlgU9I6O1/5G/eEkB8tA62phgE53AtLjr3axP8Q5cCL0bfngOILCoGNeJVjHThXWFPe9mr2Cs8J3Rdw32Yv3uNO2qvzwEyYOZHt9wybL/ESp/YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763369499; c=relaxed/simple;
	bh=dOf/o9+v7uc/WkR/i52+4gzAd5n7JrX9xRq84XqaFyA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YfGmGjfbte80ddXCJpyDbG9ei3BvSR4qHPB7geHYc6iKh/He637Pmunfqt/jJJjn49pqBVM/fiv6gBYZri0jrz9JqUFg//FHFhSJCzw7pc2f0O0kqaoMwCLEpvmvyw743f28HmTdmJFe690qOdjlwLL2gaWSSkTt7WQbddnL4lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 985480eac39211f0a38c85956e01ac42-20251117
X-CID-CACHE: Type:Local,Time:202511171639+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:dfb59e2d-5e56-4d73-8cc6-9a5f920dd18f,IP:0,UR
	L:0,TC:0,Content:21,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:21
X-CID-META: VersionHash:a9d874c,CLOUDID:76b30c4686e12f385703232ffbc5ac44,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|83|102|850,TC:nil,Content:3|15|50,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 985480eac39211f0a38c85956e01ac42-20251117
X-User: dengjie03@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <dengjie03@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1386138567; Mon, 17 Nov 2025 16:51:23 +0800
From: Jie Deng <dengjie03@kylinos.cn>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com,
	sakari.ailus@linux.intel.com,
	stern@rowland.harvard.edu
Subject: Re: [PATCH] usb: core: fix NULL dereference in usb_ifnum_to_if() during device removal
Date: Mon, 17 Nov 2025 16:50:58 +0800
Message-Id: <20251117085058.1677226-1-dengjie03@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2025111342-chummy-preppy-e3e6@gregkh>
References: <2025111342-chummy-preppy-e3e6@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry for replying late.
I'm not sure why, but I didn't receive your email in my mailbox.

>> is set to NULL.At this point, outside the kernel, usb_ifnum_to_if()
>> is called through usb_set_interface(), and usb_ifnum_to_if() continues
>> to access interface[i]->altsetting[i], triggering a null pointer.
>
>I do not understand, sorry.  What do you mean by "outside the kernel"?
Sorry, I wasn't accurate in my expression. What I want to express is 
the system application program.

>
>> kernel log:
>> [ 9518.779148][ 1] [ T4650] pc : usb_ifnum_to_if+0x34/0x50
>> [ 9518.784360][ 1] [ T4650] lr : usb_hcd_alloc_bandwidth+0x260/0x348
>
>What is the [TXXX] stuff?
Superfluous information. I will delete it later.


>> --- a/drivers/usb/core/usb.c
>> +++ b/drivers/usb/core/usb.c
>> @@ -355,7 +355,7 @@ struct usb_interface *usb_ifnum_to_if(const struct usb_device *dev,
>>  	if (!config)
>>  		return NULL;
>>  	for (i = 0; i < config->desc.bNumInterfaces; i++)
>> -		if (config->interface[i]->altsetting[0]
>> +		if (config->interface[i] && config->interface[i]->altsetting[0]
>
>Are you sure this is not just papering over a race?  What prevents this
>from changing right after you check it?
>
>And what is causing this to happen now?  What commit broke this to
>require this change?
As you said, such a repair method cannot eliminate race behavior.

Next, I will attempt to eliminate this competitive factor from the 
uvc driver side.

Thanks,
Jie Deng

