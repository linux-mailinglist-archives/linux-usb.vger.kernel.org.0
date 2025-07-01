Return-Path: <linux-usb+bounces-25360-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CA5AEFA79
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 15:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3ECB486F99
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 13:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE54E277CBB;
	Tue,  1 Jul 2025 13:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="crrWlB+H"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B31277CB2
	for <linux-usb@vger.kernel.org>; Tue,  1 Jul 2025 13:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376180; cv=none; b=l9WQprDt4p5BQEMd+49d2ipkFSa3lnXe7UmPApW1VfqN6EbdTh6PMc/+cOI5r1z9Qx9Tth3g0gEb2R1jfEKH2nZLvBCwVRdy1fK/kUbAGpN+wgn6LTg1Y12h9GpCMF3h6hazKwkC8CeL+OemkoxfVD/uD/b51uH1A/Eq5RWRwz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376180; c=relaxed/simple;
	bh=M2TOy5psDFxo7ZBmqD/2Phn31Srm6PKEbj9e6rTEogM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RI8Qjwnb2JQQyJY9+Sc2Wc9oPbKFl0/qSmW1yFO8TrXLBo81Y/DjWggz779QpUF24KCwXS71vcrDmE4yIUaF0CVwm4V3iLc6yJ1K4AdRGTSz3W5wUEY+Ry3tS1sfT5gm2IvhznrchJ67UK6iLBrNTqek6w9//OONBdUcN/mHgHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=crrWlB+H; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60c51860bf5so9600470a12.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Jul 2025 06:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751376176; x=1751980976; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=azprNnXK+qMmn0stkjujoWcCe9uzMbdfT07On0LmLBM=;
        b=crrWlB+H+qGqCf0QV6fU9RZHVidUcKUOuF2TfbdusmcR141hO3rr9JNDqnBkgW28c1
         OFNndq68ZknfNJbayO0Cgf5/1lkB12vLr8jLmEsnWK28z9aWYP0q5fsNRKS2kcTdPV4t
         WsbEpQ1rxfr/C2xH99kWHH5g//8f3hk9cBPdirtbGgf2FcJ6gGo0qwVSs4sK+gUaxoWH
         3xHJ4kKkR8XQHToSdFo6YCTxSuLbtz4k0ctcfgoLH7CqD/n+LcEMfClN59RKntFez+6S
         GVjcwapBFAO68SpU1Z/pFXCMoQmQvdxq2+wVCXczqhvC0wMdY7KCKKfuKSHG4efkkbaR
         IKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751376176; x=1751980976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=azprNnXK+qMmn0stkjujoWcCe9uzMbdfT07On0LmLBM=;
        b=a7UJIm1WXVgGjmW7JOIUCL8GGpy0i7YpfBd8jXxjDfn+QRJGMcw8pNnsY+QsygGBgU
         RlCiAfxj2/1zzLHFDCvJcsRbYRaHXuxS7x64q9e5lgBRFbTjkgeK+t8ccm3XlVIHNwDa
         52PYvqa4zDVYujXygFEqdNhChHxHlU5DFz2Fgjdfpb1pmtPZxNo03h+MSNswJXkyrnw1
         wndWg1uy5iKQsYeWzRd0cdBv86DAXREVxLI4nMOEft0SCv3LetdJvTyYqZ2FrTQr0uvk
         pcKzhgJtFMTAOG98NTZA8QIn20I//oCYymo2OqTIEzbTwRL8p/zoDSDLHBHW9wtgD1mL
         rsMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmQeAUT9MSyHra43alSOXTJTgtN8GwS9mLLloyKA0BXAcDGf3bV0wQaqpa/Hn9tzWH8V8Dh3kis3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIAqmvbBRMiMC5ebOzitE7y/0yKAffKH6mqW3IA9uk5OgUAOOj
	vrL02gDSbNUur6ApJEgdNxFl9WmdGF2j4OklHYYzUnefP/7mSZ/Zs37vQLHEwMwwN3A=
X-Gm-Gg: ASbGncvydO7Mvh4jxs0kaNUnkrA/v5wUBmaHknaLcpVqJt/ELHqlVejUdUEoSI7/SRF
	DjCFhww4KamWPWzOc8uZM2CR7GEcK1oW48WehjvYKj/BGSUv9hb/uQk10rrXjLWaWfO3rsS1WDK
	jhr9J3pXjz31o9DLln+9y3TKxyTWgHINI38fAkBXV29/+cl5BBiAhI5mv64aCQAuYSVTKp0t/3Z
	La896+WlU4JKuKwfe1x7dxpu5HFC4nz6f6Hb+ppzHL0lIci3zsQBBo0ZvTwG8Cj5mZzPfme9DXx
	Hqe95Jd9Iw8jDiEEXnWUaqXueHvwsIZeUSH1PC9Gtv1I/atbL6s5VGmpln8TPHH38lDVpXeBB22
	52fRAiHX+45a1Ih4fbOp9Zujs4g3E
X-Google-Smtp-Source: AGHT+IFdlcq4Z1/1ZJmJ8k0tRF9kAcq1ga6wtmW543q51nxSjyxVLxkksVhic/2JaL3ZDFS+rayJKA==
X-Received: by 2002:a17:907:97cc:b0:ad5:74cd:1824 with SMTP id a640c23a62f3a-ae3500f27abmr1787598666b.38.1751376176429;
        Tue, 01 Jul 2025 06:22:56 -0700 (PDT)
Received: from ?IPV6:2a02:3033:264:3f6c:c824:546f:eed:ab8a? ([2a02:3033:264:3f6c:c824:546f:eed:ab8a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca201asm871356066b.150.2025.07.01.06.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 06:22:56 -0700 (PDT)
Message-ID: <ebd0bb9b-8e66-4119-b011-c1a737749fb2@suse.com>
Date: Tue, 1 Jul 2025 15:22:54 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: usb: usbnet: fix use-after-free in race on workqueue
To: Paolo Abeni <pabeni@redhat.com>, "Peter GJ. Park"
 <gyujoon.park@samsung.com>, Oliver Neukum <oneukum@suse.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <CGME20250625093354epcas1p1c9817df6e1d1599e8b4eb16c5715a6fd@epcas1p1.samsung.com>
 <20250625-usbnet-uaf-fix-v1-1-421eb05ae6ea@samsung.com>
 <87a7f8a6-71b1-4b90-abc7-0a680f2a99cf@redhat.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <87a7f8a6-71b1-4b90-abc7-0a680f2a99cf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26.06.25 11:21, Paolo Abeni wrote:
>>   drivers/net/usb/usbnet.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
>> index c04e715a4c2ade3bc5587b0df71643a25cf88c55..3c5d9ba7fa6660273137c80106746103f84f5a37 100644
>> --- a/drivers/net/usb/usbnet.c
>> +++ b/drivers/net/usb/usbnet.c
>> @@ -1660,6 +1660,9 @@ void usbnet_disconnect (struct usb_interface *intf)
>>   	usb_free_urb(dev->interrupt);
>>   	kfree(dev->padding_pkt);
>>   
>> +	timer_delete_sync(&dev->delay);
>> +	tasklet_kill(&dev->bh);
>> +	cancel_work_sync(&dev->kevent);
>>   	free_netdev(net);
> This happens after unregister_netdev(), which calls usbnet_stop() that
> already performs the above cleanup. How the race is supposed to take place?

That is indeed a core question, which we really need an answer to.
Do I interpret dev_close_many() correctly, if I state that the
ndo_stop() method will _not_ be called if the device has never been
opened?

I am sorry to be a stickler here, but if that turns out to be true,
usbnet is not the only driver that has this bug.

	TIA
		Oliver


