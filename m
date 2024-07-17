Return-Path: <linux-usb+bounces-12259-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8439343DB
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2024 23:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 267192865E9
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2024 21:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9C41891D6;
	Wed, 17 Jul 2024 21:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="INqyzV70"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE1B18A940
	for <linux-usb@vger.kernel.org>; Wed, 17 Jul 2024 21:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721251583; cv=none; b=lg/+3t7hliXSQuWpc8ccH0tZF8zk8zMGnsaJtJQ1Y1dRamBbUxD6TqnxNmv45G8j0SYvqg/sita1L39Obu8IIXQ3MVGo/e+GIFN+bUc0/1TxoS5ZWh4pnn3xY/scfUgDh4PG0AK9z0cwCarzeOMmTFkpI1ePObnBgKb1XN8gLpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721251583; c=relaxed/simple;
	bh=9fxWVtzJ3ODEIKrmh7iCRF+PFn4llxDvejjg/r0yxJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=E6uaBAtUnQBhof6maGHQdVe6eELDzgcKuxp4gPE+SYx5PVIzcp6Q/fqRQaxpqSVDpigCiCG7NRki3DVAOsqn4jTi/CRri0glNmTADHorlc2nsabph6vIhWLHpOALyz0WMx9PCikGO3BGxqZ4thD/YrlSlYMghJ6B06CFNuqLu4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=INqyzV70; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-805fc096a34so370139f.3
        for <linux-usb@vger.kernel.org>; Wed, 17 Jul 2024 14:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721251580; x=1721856380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NZr6xWhOKK/q88AyZim0bSF581aihRRUubGkqMeVNus=;
        b=INqyzV70zKQ0kSiQDngX3NqZ17uCu5MI/7qW/9DgfkElMy4ltjupOCBDomYxmDGSEK
         wFwfsPJkj1qh9WfsKz89P13GFLZzKGHfbczBwn5Dp9YfyZclb3XKV/4GtiaXSSXO7TcC
         o/PsrLnaYD4Os0NKoG7WLENrD2wTCdqB6UVZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721251580; x=1721856380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZr6xWhOKK/q88AyZim0bSF581aihRRUubGkqMeVNus=;
        b=pXF4X+9dc+IPctuXwUmNuQV1snbLTiCqU9v4iZidtcFecSrA4lHN56yVupsKaVpkts
         ldxDv8grEeXnu+lmoautItClX9HJluK7Dl67vyrl3bpBFvU0oAckiZjo+xxxbQxojBQA
         WUGM7VWJJ6hs79Tg1/qendFdvjbJZPlb4yrpQtCPqeEBpb/MRet0NBZByYZNp1AUSCYb
         vanJpx4rz8/0y8l/jArwqjpd0+ZwXJV/IkQoAKnQ7oJpiyoEHKPaU+sh58WYRGXSdETT
         JSHQKESdeEYWD/1orDNm9v2J5Wx1fWrd7mo5KxKqZmjEh74EdFoeALk9QJxDmPL1j6nW
         7Tqg==
X-Forwarded-Encrypted: i=1; AJvYcCWUrQ9riNd7QhYElHoSeANQGLog/AFMA/Ik7HZGw+HKdG6Haxy/KgAeiuCX6n8M0f0yTHyQyLJ0Y1xcI3kZmiRmXu0/yDpuwSga
X-Gm-Message-State: AOJu0YzljA11YFZQIE9GhEnNUmjnIpoPklIUrgrVSnRu3MLjTgaQmu6E
	givzQjI40w4S4qz3w1XBmn3P121ycKRdbKYcspvsLt5N6zNXplCzbtJVMy4mrJA=
X-Google-Smtp-Source: AGHT+IFQbguu0vWMP+32t6He81wUloYhz2aCg+/XbgEdLAT/VSzi0LYhdDZXoQ6Fs+Bgg8DwlDvfQw==
X-Received: by 2002:a6b:6603:0:b0:7f9:90c5:4107 with SMTP id ca18e2360f4ac-8171004303fmr226614239f.1.1721251579992;
        Wed, 17 Jul 2024 14:26:19 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-816c34e5d77sm89370339f.47.2024.07.17.14.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 14:26:19 -0700 (PDT)
Message-ID: <c930fd3d-67d7-464b-a3cd-3da4401723f9@linuxfoundation.org>
Date: Wed, 17 Jul 2024 15:26:19 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: vhci-hcd: Do not drop references before new
 references are gained
To: Oliver Neukum <oneukum@suse.com>, valentina.manea.m@gmail.com,
 shuah@kernel.org, i@zenithal.me, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20240709113851.14691-1-oneukum@suse.com>
 <e1b713a6-de8d-4df9-979e-12cb9876bf33@linuxfoundation.org>
 <f8b192bd-55e3-4b00-92b3-67ba99b5b86e@suse.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <f8b192bd-55e3-4b00-92b3-67ba99b5b86e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/16/24 08:33, Oliver Neukum wrote:
> 
> 
> On 09.07.24 21:38, Shuah Khan wrote:
>> On 7/9/24 05:38, Oliver Neukum wrote:
>>> At a few places the driver carries stale pointers
>>> to references that can still be used. Make sure that does not happen.
>>> This strictly speaking closes ZDI-CAN-22273, though there may be
>>> similar races in the driver.
>>>
>>> Signed-off-by: Oliver Neukum <oneukum@suse.com>
>>
>> Sorry I need a bit more explanation to follow the change you
>> are making. Also how did you find the problem?
> 
> Hi,
> 
> I looked at the initial report you wrote and it seemed to me that the issue
> was that vhci_device_reset() leaves a stale pointer around and vhci_urb_enqueue()
> in the special cases drops the old reference before it gets a new reference,
> which together causes the race condition you were hitting.
> 

Thank you.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah


