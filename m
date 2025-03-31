Return-Path: <linux-usb+bounces-22322-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FB3A7613C
	for <lists+linux-usb@lfdr.de>; Mon, 31 Mar 2025 10:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C31547A3191
	for <lists+linux-usb@lfdr.de>; Mon, 31 Mar 2025 08:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940D31D7E57;
	Mon, 31 Mar 2025 08:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="R/tYSF44"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3F41D63F5
	for <linux-usb@vger.kernel.org>; Mon, 31 Mar 2025 08:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409117; cv=none; b=m4TGQefVlCAbtssgpMb7dG0GJFODCCJ2qI0TUbeYxAplbUQ/Qfrdt4Oa5XSta/E49J2SA9d6OIx1sBvhooTKYCmIcE5Zm95/lZWgNTCtBONervueZRzhqSiSV6MkPvXMdQqsbphQuo0PQsoU0ZOG7WMN2ayYq27+weGPmIZtK4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409117; c=relaxed/simple;
	bh=Z1PPfPXt4uNGc6PW1vFPF81PG610w4n+XBgV9dbQv/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tPeV2dGrRsfLQOGPmuBcLql3igIfsiaesvhbVbZt/+PxjJqVSTXjDknCwve6N2cQ22x4hjtHbVBUD/DvNC7dyekyodwhYqtYCzUCrm15/WIQP9nfpvWmUtdWIOjff9U2vXtQdyfIPq8exqqXitXB68fq8VJMBJElUlJqMj8bnko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=R/tYSF44; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-301cda78d48so7461319a91.0
        for <linux-usb@vger.kernel.org>; Mon, 31 Mar 2025 01:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743409114; x=1744013914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=li7UPGjjFvWsbeTcfcGF1TQfP1eIqX20din/Lx4SS5I=;
        b=R/tYSF44t3F03KOvuRuym88RtLPgKzJB2NyHPpHTz2mSLjB0nqQ+gxqWHCyknOrvj4
         lxqZYz93tjXKEN8Y3Y6LIuvXeRSZf4G0nJRbeO8Ybr+mwa9ZD0t6a/fsPMEl2JSqa9HQ
         15iFIzmR4OVbiT7mv9V4DeaZ3rstdxNVRi+BlenY7hW69nT6vgvx7uWY0fTEe4RPH11Q
         raAPpTigMJ9FHFZ3CDumP+ZjZdAQCwC9Sp070cTc56b3BEE+WpB1t6Ycc8z7XzCbeNhE
         T3dhaReFdlqyvJZfjA+GwwWuwpT8ZNl6bVYW77jTAJ8Y6Y3JNYUS6xH3DWJzG1etXdm9
         dNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743409114; x=1744013914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=li7UPGjjFvWsbeTcfcGF1TQfP1eIqX20din/Lx4SS5I=;
        b=PX2Y88BMOqwleZ335U27z/1CMEQ/HiqjymK3JI+cbYDxRdG+3lX1GioynnkfnR9cDW
         x2/PRFxufIU5pQPfJx6IVhIrwbgIwlDL6vh7V3Vz68RR5UjiZsMIDgoYoVBLrHfWqVaG
         V1qwZbH0PzMuDddykul/o2fpqmyVk0gG8H0nDUzkIX17fReUlUVqYJZEVha9I2oQvFww
         ikeQHpkAnWtQyW0i+/9gHrwFGGWMwVwf/cbKqzz8JVFSCFfZEEa9a1PnDVxbyPCuRJ5y
         r7yGPiy0VX/iRVoHfZ7we1BVfaobpClcGbVY0/S8sTZk+vype0Q4/YMhxirA2X7tIGKl
         eCjA==
X-Gm-Message-State: AOJu0YxtfMOBeSafhATAJHNjr2muTB5yoIzVxHA9pjrqwE5++8vUKMX7
	5AjWfqCXKh3wJc/wANsN3EOcr6z6rI3xNT+SXisYrQmQbHiwKCfAVarCTSqLgKwO0NMeSTr+uqt
	9
X-Gm-Gg: ASbGncuVXv5w6mM3ofNsTUxc0RO5U9HBlMzoaR5Wlo1u5ktQGEyb2PQP6lrdrQ7Xsnb
	Mf6QY2kwSFvCRTDggNEt77JY56biIkNIxAJVTmHXNwy5rhchpna5i1areOLx0QxN+NA+arap/Oo
	8hJ1GDl81SBYER4TUzM+sfu7oObsPgKnS7HXXsUfXXzKHLgrTU49NFHpNK28hAdjJzEHsl3ZDf9
	NsncxdMF4yjDvwLxf+QSCCT3gcSfrkpHUb+Ik6YRzQGoNiAVKa26sFif4ZURelHIxKKF8fqdzNb
	ZFCF8G32eeJDC24q87Mt6Mhf1VG4uRsTD8A0QfSRY6AAX1fCGttMqStDcw==
X-Google-Smtp-Source: AGHT+IHlKiqo7rkF3Jx9NVCRx7gHNVHllmzN+IbsUAatI8nf8ffhZOBU011JNzufHnN0t7Na86WKZA==
X-Received: by 2002:a17:90b:264e:b0:2fa:137f:5c61 with SMTP id 98e67ed59e1d1-30531fa4e78mr14902998a91.12.1743409113624;
        Mon, 31 Mar 2025 01:18:33 -0700 (PDT)
Received: from ?IPV6:2620:10d:c085:21c1::1051? ([2620:10d:c090:400::5:ac76])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039dff0c76sm9013409a91.20.2025.03.31.01.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 01:18:33 -0700 (PDT)
Message-ID: <bc6749c7-9169-4e1b-a1f5-3fe645ddb230@baylibre.com>
Date: Mon, 31 Mar 2025 10:18:29 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: f_fs: Invalidate io_data when USB request is
 dequeued or completed
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Thinh.Nguyen@synopsys.com,
 Frode Isaksen <frode@meta.com>
References: <20250328161823.2240125-1-fisaksen@baylibre.com>
 <2025032835-sixtieth-unable-1548@gregkh>
Content-Language: en-US
From: Frode Isaksen <fisaksen@baylibre.com>
In-Reply-To: <2025032835-sixtieth-unable-1548@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/28/25 10:02 PM, Greg KH wrote:
> On Fri, Mar 28, 2025 at 05:17:15PM +0100, Frode Isaksen wrote:
>> From: Frode Isaksen <frode@meta.com>
>>
>> Invalidate io_data by setting context to NULL when USB request is
>> dequeued or completed, and check for NULL io_data in epfile_io_complete().
>> The invalidation of io_data in req->context is done when exiting
>> epfile_io(), since then io_data will become invalid as it is allocated
>> on the stack.
>> The epfile_io_complete() may be called after ffs_epfile_io() returns
>> in case the wait_for_completion_interruptible() is interrupted.
>> This fixes a use-after-free error with the following call stack:
>>
>> Unable to handle kernel paging request at virtual address ffffffc02f7bbcc0
>> pc : ffs_epfile_io_complete+0x30/0x48
>> lr : usb_gadget_giveback_request+0x30/0xf8
>> Call trace:
>> ffs_epfile_io_complete+0x30/0x48
>> usb_gadget_giveback_request+0x30/0xf8
>> dwc3_remove_requests+0x264/0x2e8
>> dwc3_gadget_pullup+0x1d0/0x250
>> kretprobe_trampoline+0x0/0xc4
>> usb_gadget_remove_driver+0x40/0xf4
>> usb_gadget_unregister_driver+0xdc/0x178
>> unregister_gadget_item+0x40/0x6c
>> ffs_closed+0xd4/0x10c
>> ffs_data_clear+0x2c/0xf0
>> ffs_data_closed+0x178/0x1ec
>> ffs_ep0_release+0x24/0x38
>> __fput+0xe8/0x27c
>>
>> Signed-off-by: Frode Isaksen <frode@meta.com>
>> ---
>> This bug was discovered, tested and fixed (no more crashes seen) on Meta Quest 3 device.
>> Also tested on T.I. AM62x board.
> What commit id does this fix?  Should it go to stable?

This has always been there, so the is no specific commit when this was 
added.

Will add the Cc tag to stable in v2.

>
>>   drivers/usb/gadget/function/f_fs.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
>> index 2dea9e42a0f8..f1be0a5c0bd0 100644
>> --- a/drivers/usb/gadget/function/f_fs.c
>> +++ b/drivers/usb/gadget/function/f_fs.c
>> @@ -738,6 +738,9 @@ static void ffs_epfile_io_complete(struct usb_ep *_ep, struct usb_request *req)
>>   {
>>   	struct ffs_io_data *io_data = req->context;
>>   
>> +	if (WARN_ON(io_data == NULL))
>> +		return;
> If this happens you just crashed the box (remember about panic-on-warn,
> which is still set in a few billion Linux systems these days...)
>
> Just handle the issue properly, no need to dump the stack and crash a
> device.
OK, removing the WARN_ON for v2.
>
> But, what keeps io_data from changing after you have checked it?  Where
> is the lock here?

There is no lock here, as I didn't want to introduce extra complexity 
(and bugs...). But this code has been running without a crash on 
millions of devices for more than a year.

Thanks,

Frode

>
> thanks,
>
> greg k-h



