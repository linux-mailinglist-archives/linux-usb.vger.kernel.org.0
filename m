Return-Path: <linux-usb+bounces-29537-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2673BFD611
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 18:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 293EC3BDFE2
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 16:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA7028725B;
	Wed, 22 Oct 2025 16:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBn/j+yU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D768272E6E
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 16:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761150906; cv=none; b=OpXPeI41bGNQZvdzKJMCDD9H/NcEyYFE1jpF8KuAvJizDu+3XO2ZN7KVjPvw6YnnMqRHjyEXXFc00A4LhEUMShmv1UIx2Qz1lI47H91vyAl8GR+nHdwMFmWl09ocLMC+bLWVH1wIDSfuqJJfxre/KZk4/YiRKAl4zR4R+MfnfMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761150906; c=relaxed/simple;
	bh=bu6E7Oxg8mLlZTsBzHKwsuu04htIXpzGycwmuHexhac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VOLIzH+BL3aRIbF17mlfMVYEyM+2LM8iRyhEa5ANKpbbbKbqes4qvb9bta3u2A0bHbijDpzUmXXOojCm6yA9/bT6K/+lgew3JVa7LI8I+lesQtjRWyXPyObKvDqa0dko9jrgLRMxkdrIgGSa49/b2rIDKCY2+nG4yvU9dqw2cd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBn/j+yU; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b3b27b50090so1318849466b.0
        for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 09:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761150903; x=1761755703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P4434xLJIRRdAjreI4PQg5TkaqKVqBo/Ow5EWXxwHpI=;
        b=GBn/j+yUhs9GQaHAsCCFV62khctbLWY/hbc/1XILL3qcT3+MJYRRneSWsiid5yPCtq
         0Fma4EmAjjeeM4R/+FDzY4m58/5hwkv73zUNxyOtD+2EQYRcPLfElhbFQUQl0pUc0Wr/
         kydLFDV4N9ZvQ4gwFgG7ti7B0JBZeGQSR4EXUKA5bN1dPTIggBp8Of8DZV21FHee8U4l
         5lNSGHh9U5gYmHrPEhP91TaWRa7lbI/TKbO5VaG1ci+kLLAkytCQv/qlYPQQ6janO/90
         alGwj8uMtVC97psKCLuvAjpE8DIonBA4BCixWh7zUMJ9uak1tKsESBACDHfqWV2NBhAs
         anpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761150903; x=1761755703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P4434xLJIRRdAjreI4PQg5TkaqKVqBo/Ow5EWXxwHpI=;
        b=uqWEBp2m0Ll0cSKdyRN7t4mwltOOlhAqK+IQHmYrYKS2yYUUdId5+PLGGYXd2uIFpp
         BAc7PqtPOxcNFlSHBfJnAOxpn+9bYBhyDumZPbVieEHFXO88s/GS5y1uItuk6mtbkApC
         w+Nxwao7h5frplBWf/kKXmrsG/lYkR/pD63X0rWb08MpuDoH32xMJdFAWK5SEn7MvdQS
         OGPREzgtTERY747Nn3amvgVv61HClz53ojGTAOG8D7bOHEMRC0rqKtZrzkcONIdzL7hV
         Xa60TjQOVlZkPjUf3Gqx00+tzGF/F5CXBTfFrKp5WrKroovOqmRblOoou0PlwnDHTwvs
         jj7A==
X-Gm-Message-State: AOJu0YwWvGYy2Vnr03xbp1aEloAoQop3nvMSDpbsv0qXuYbKUf7rOZnP
	h5yoH0JokfoQz1YaaV41b63B4eo4fmlTKK4x+7Glc3cLc0MjS/XAnmoClGJ1Qg==
X-Gm-Gg: ASbGnct0ygYw2EG1+RED0mO3AggK6Cz8bQoueJNaEfwsbJ61fFNIKoTnEBI9O5Hpl8f
	2TdQE1T4vd8V7PtiZ1udUFrCoWLSAzd0Pxl4FDe4ozbX95i3g3FKVSTMx6bYh0ICv/CZNX1Fd0z
	JV2PU3CBXeXlO9zZJxcRX0C38f2WW2AwvxGbDtGXl+issa7Qyh6o1vA1XAxvqqjpx5+j2KNr4CA
	Q0xlvuMvU/xCSNAEmU+qEQYWwN8b9Gd3zzFrQpI/dQ/2Ndn86uX9NwadQLnDU/roYl/povhluVn
	Mz6P61MUvoX8xqye1HsoyugGxhS340gYFCUP9SChXPG3VJoyLixWyy2RbPgw6EtRpnGf4lX3CIA
	3AK8rBGFPZsGdyR0WRoZe4Fbn/tIbYUiP/WTKNjiujNf7yeWqTYheEjLU7YEA2svU5zjHLcf/ee
	ceOC0iIIw9KaEizZh9tbOjS2IjfekQxCb/D2PYgj6r6A5qU2x6gKkh598=
X-Google-Smtp-Source: AGHT+IEzNPxQPMBYM8VooC+xfCSOZIw6Ob4DqfxaPiyETBU7rxxMYyqkMjtrbYo9AxFZpvOW2kKttw==
X-Received: by 2002:a17:907:844:b0:afe:cbee:7660 with SMTP id a640c23a62f3a-b6473244059mr2512510666b.21.1761150902330;
        Wed, 22 Oct 2025 09:35:02 -0700 (PDT)
Received: from ?IPV6:2a01:41e3:502f:e200:4a9:7423:73cd:3b4? ([2a01:41e3:502f:e200:4a9:7423:73cd:3b4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8971897sm1371648466b.37.2025.10.22.09.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 09:35:01 -0700 (PDT)
Message-ID: <efa1bc45-9782-455a-8ff4-26e081a5e5cb@gmail.com>
Date: Wed, 22 Oct 2025 18:35:00 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: USB A 3.0 port on Asus Zenbook not recognising the TipToi pen
To: Alan Stern <stern@rowland.harvard.edu>
Cc: USB list <linux-usb@vger.kernel.org>
References: <1393a6c5-3430-49cb-95e6-b18c0f5328b0@gmail.com>
 <cfc6d2ba-a820-4bd3-990e-7800bce171e2@rowland.harvard.edu>
 <967e7681-c9ff-4421-ba89-d83bb40f1af3@gmail.com>
 <4c6bbcd1-0ed2-496d-82c4-3fc9a1c2660e@rowland.harvard.edu>
 <1a960051-b1e8-49a5-bdea-1ddd719cd0ec@gmail.com>
 <38586fb0-a60b-44c6-a04c-70f19ec36c61@rowland.harvard.edu>
Content-Language: en-US
From: Julian Sikorski <belegdol@gmail.com>
In-Reply-To: <38586fb0-a60b-44c6-a04c-70f19ec36c61@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 22.10.25 um 15:59 schrieb Alan Stern:
> On Wed, Oct 22, 2025 at 03:25:59PM +0200, Julian Sikorski wrote:
>>
>>
>> Am 21.10.25 um 18:01 schrieb Alan Stern:
>>>>> Have you tried using the pens on a different computer?
>>>>>
>>>>> Alan Stern
>>>>
>>>> Hi,
>>>>
>>>> I did, I just tried again to be sure - with the allegedly broken cable. This
>>>> is on my ASRock Fatal1ty B450 Gaming-ITX/ac front panel USB:
>>>>
>>>> Okt 21 16:42:00 kernel: usb 1-3: new high-speed USB device number 4 using
>>>> xhci_hcd
>>>> Okt 21 16:42:00 kernel: usb 1-3: New USB device found, idVendor=04d6,
>>>> idProduct=e101, bcdDevice= 1.00
>>> ...
>>>
>>> That certainly indicates part of the problem is in the laptop.  What
>>> happens if you try connecting one of the pens to the laptop through a
>>> USB hub?
>>>
>>> Alan Stern
>>
>> Through a hub (Dell Monitor) the pen works as well:
>>
>> Okt 22 15:19:57 kernel: usb 3-2.4.2: new high-speed USB device number 10
>> using xhci_hcd
>> Okt 22 15:19:57 kernel: usb 3-2.4.2: New USB device found, idVendor=04d6,
>> idProduct=e101, bcdDevice= 1.00
>> Okt 22 15:19:57 kernel: usb 3-2.4.2: New USB device strings: Mfr=1,
>> Product=2, SerialNumber=3
>> Okt 22 15:19:57 kernel: usb 3-2.4.2: Product: usbdisk
>> Okt 22 15:19:57 kernel: usb 3-2.4.2: Manufacturer: anyka
>> Okt 22 15:19:57 kernel: usb 3-2.4.2: SerialNumber: xxxx
>> Okt 22 15:19:57 kernel: usb-storage 3-2.4.2:1.0: USB Mass Storage device
>> detected
>> Okt 22 15:19:57 kernel: scsi host2: usb-storage 3-2.4.2:1.0
>> Okt 22 15:19:58 kernel: scsi 2:0:0:0: Direct-Access     Tiptoi   ZC3203L
>> 1.00 PQ: 0 ANSI: 2
>> Okt 22 15:19:58 kernel: sd 2:0:0:0: Attached scsi generic sg0 type 0
>> Okt 22 15:19:58 kernel: sd 2:0:0:0: [sda] 7013632 512-byte logical blocks:
>> (3.59 GB/3.34 GiB)
>> Okt 22 15:19:58 kernel: sd 2:0:0:0: [sda] Write Protect is off
>> Okt 22 15:19:58 kernel: sd 2:0:0:0: [sda] Mode Sense: 03 00 00 00
>> Okt 22 15:19:58 kernel: sd 2:0:0:0: [sda] No Caching mode page found
>> Okt 22 15:19:58 kernel: sd 2:0:0:0: [sda] Assuming drive cache: write
>> through
>> Okt 22 15:19:59 kernel:  sda:
>> Okt 22 15:19:59 kernel: sd 2:0:0:0: [sda] Attached SCSI removable disk
> 
> Then I guess you have your answer.  Something's slightly off in the
> laptop's USB controller or connector.
> 
> If you still think it's a software issue rather than hardware, you can
> try posting a usbmon trace showing what happens when the device is
> plugged in.  I suspect it won't reveal much, but you never know.
> 
> Alan Stern
> 
> Alan Stern

Here is the usbmon output:

420a8780 0.869369 S Ci:3:001:0 s a3 00 0000 0001 0004 4 <
420a8780 0.869393 C Ci:3:001:0 0 4 =
     00010000
420a8780 0.869404 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
420a8780 0.869411 C Ci:3:001:0 0 4 =
     01010100
420a8780 0.869418 S Co:3:001:0 s 23 01 0010 0002 0000 0
420a8780 0.869425 C Co:3:001:0 0 0
420a8780 0.869431 S Ci:3:001:0 s a3 00 0000 0003 0004 4 <
420a8780 0.869437 C Ci:3:001:0 0 4 =
     00010000
420a8780 0.869442 S Ci:3:001:0 s a3 00 0000 0004 0004 4 <
420a8780 0.869448 C Ci:3:001:0 0 4 =
     00010000
412663c0 0.975195 S Ii:3:001:1 -:2048 4 <
420a8780 0.975231 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
420a8780 0.975247 C Ci:3:001:0 0 4 =
     01010000
420a8780 0.975373 S Co:3:001:0 s 23 03 0004 0002 0000 0
420a8780 0.975395 C Co:3:001:0 0 0
420a8780 1.037181 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
420a8780 1.037200 C Ci:3:001:0 0 4 =
     01011100
420a8780 1.037210 S Co:3:001:0 s 23 01 0010 0002 0000 0
420a8780 1.037218 C Co:3:001:0 0 0
420a8780 1.037222 S Co:3:001:0 s 23 03 0004 0002 0000 0
420a8780 1.037229 C Co:3:001:0 0 0
412663c0 1.190218 C Ii:3:001:1 0:2048 1 =
     04
412663c0 1.190231 S Ii:3:001:1 -:2048 4 <
420a8780 1.238195 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
420a8780 1.238216 C Ci:3:001:0 0 4 =
     01011100
420a8780 1.238227 S Co:3:001:0 s 23 01 0010 0002 0000 0
420a8780 1.238233 C Co:3:001:0 0 0
420a8780 1.238239 S Co:3:001:0 s 23 03 0004 0002 0000 0
420a8780 1.238245 C Co:3:001:0 0 0
412663c0 1.438228 C Ii:3:001:1 0:2048 1 =
     04
412663c0 1.438240 S Ii:3:001:1 -:2048 4 <
420a8780 1.446329 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
420a8780 1.446378 C Ci:3:001:0 0 4 =
     01011100
420a8780 1.446534 S Co:3:001:0 s 23 01 0010 0002 0000 0
420a8780 1.446550 C Co:3:001:0 0 0
420a8780 1.446557 S Co:3:001:0 s 23 03 0004 0002 0000 0
420a8780 1.446566 C Co:3:001:0 0 0
420a8780 1.654211 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
420a8780 1.654232 C Ci:3:001:0 0 4 =
     01011100
420a8780 1.654245 S Co:3:001:0 s 23 01 0010 0002 0000 0
420a8780 1.654253 C Co:3:001:0 0 0
420a8780 1.654258 S Co:3:001:0 s 23 03 0004 0002 0000 0
420a8780 1.654266 C Co:3:001:0 0 0
420a8780 1.862190 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
420a8780 1.862214 C Ci:3:001:0 0 4 =
     01011100
420a8780 1.862226 S Co:3:001:0 s 23 01 0010 0002 0000 0
420a8780 1.862234 C Co:3:001:0 0 0
420a8780 1.862261 S Co:3:001:0 s 23 01 0001 0002 0000 0
420a8780 1.862282 C Co:3:001:0 0 0
420a8780 1.862521 S Co:3:001:0 s 23 03 0004 0002 0000 0
420a8780 1.862542 C Co:3:001:0 0 0
412663c0 1.912818 C Ii:3:001:1 0:2048 1 =
     04
412663c0 1.912827 S Ii:3:001:1 -:2048 4 <
420a8780 1.923192 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
420a8780 1.923215 C Ci:3:001:0 0 4 =
     01011100
420a8780 1.923228 S Co:3:001:0 s 23 01 0010 0002 0000 0
420a8780 1.923236 C Co:3:001:0 0 0
420a8780 1.923241 S Co:3:001:0 s 23 03 0004 0002 0000 0
420a8780 1.923250 C Co:3:001:0 0 0
420a8780 2.127212 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
420a8780 2.127234 C Ci:3:001:0 0 4 =
     01011100
420a8780 2.127246 S Co:3:001:0 s 23 01 0010 0002 0000 0
420a8780 2.127255 C Co:3:001:0 0 0
420a8780 2.127260 S Co:3:001:0 s 23 03 0004 0002 0000 0
420a8780 2.127268 C Co:3:001:0 0 0
412663c0 2.190202 C Ii:3:001:1 0:2048 1 =
     04
412663c0 2.190217 S Ii:3:001:1 -:2048 4 <
420a8780 2.334184 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
420a8780 2.334201 C Ci:3:001:0 0 4 =
     01011100
420a8780 2.334211 S Co:3:001:0 s 23 01 0010 0002 0000 0
420a8780 2.334218 C Co:3:001:0 0 0
420a8780 2.334223 S Co:3:001:0 s 23 03 0004 0002 0000 0
420a8780 2.334230 C Co:3:001:0 0 0
412663c0 2.439185 C Ii:3:001:1 0:2048 1 =
     04
412663c0 2.439191 S Ii:3:001:1 -:2048 4 <
420a8780 2.542197 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
420a8780 2.542225 C Ci:3:001:0 0 4 =
     01011100
420a8780 2.542315 S Co:3:001:0 s 23 01 0010 0002 0000 0
420a8780 2.542327 C Co:3:001:0 0 0
420a8780 2.542333 S Co:3:001:0 s 23 03 0004 0002 0000 0
420a8780 2.542340 C Co:3:001:0 0 0
412663c0 2.694201 C Ii:3:001:1 0:2048 1 =
     04
412663c0 2.694213 S Ii:3:001:1 -:2048 4 <
420a8780 2.750208 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
420a8780 2.750228 C Ci:3:001:0 0 4 =
     01011100
420a8780 2.750238 S Co:3:001:0 s 23 01 0010 0002 0000 0
420a8780 2.750245 C Co:3:001:0 0 0
420a8780 2.750267 S Co:3:001:0 s 23 01 0001 0002 0000 0
420a8780 2.750277 C Co:3:001:0 0 0
420a8780 2.750369 S Co:3:001:0 s 23 01 0008 0002 0000 0
420a8780 2.750379 C Co:3:001:0 0 0
420a8780 2.791220 S Co:3:001:0 s 23 03 0008 0002 0000 0
420a8780 2.791247 C Co:3:001:0 0 0
412663c0 2.791295 C Ii:3:001:1 0:2048 1 =
     04
412663c0 2.791298 S Ii:3:001:1 -:2048 4 <
420a8780 2.812270 S Co:3:001:0 s 23 03 0004 0002 0000 0
420a8780 2.812290 C Co:3:001:0 0 0
420a8780 2.873238 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
420a8780 2.873259 C Ci:3:001:0 0 4 =
     01011100
420a8780 2.873269 S Co:3:001:0 s 23 01 0010 0002 0000 0
420a8780 2.873276 C Co:3:001:0 0 0
420a8780 2.873282 S Co:3:001:0 s 23 03 0004 0002 0000 0
420a8780 2.873288 C Co:3:001:0 0 0
412663c0 2.942196 C Ii:3:001:1 0:2048 1 =
     04
412663c0 2.942202 S Ii:3:001:1 -:2048 4 <
420a8780 3.078486 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
420a8780 3.078519 C Ci:3:001:0 0 4 =
     01011100
420a8780 3.078540 S Co:3:001:0 s 23 01 0010 0002 0000 0
420a8780 3.078547 C Co:3:001:0 0 0
420a8780 3.078554 S Co:3:001:0 s 23 03 0004 0002 0000 0
420a8780 3.078562 C Co:3:001:0 0 0
412663c0 3.191184 C Ii:3:001:1 0:2048 1 =
     04
412663c0 3.191193 S Ii:3:001:1 -:2048 4 <
420a8780 3.286222 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
420a8780 3.286247 C Ci:3:001:0 0 4 =
     01011100
420a8780 3.286258 S Co:3:001:0 s 23 01 0010 0002 0000 0
420a8780 3.286266 C Co:3:001:0 0 0
420a8780 3.286271 S Co:3:001:0 s 23 03 0004 0002 0000 0
420a8780 3.286279 C Co:3:001:0 0 0
412663c0 3.438207 C Ii:3:001:1 0:2048 1 =
     04
412663c0 3.438216 S Ii:3:001:1 -:2048 4 <
420a8780 3.495197 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
420a8780 3.495230 C Ci:3:001:0 0 4 =
     01011100
420a8780 3.495243 S Co:3:001:0 s 23 01 0010 0002 0000 0
420a8780 3.495251 C Co:3:001:0 0 0
420a8780 3.495258 S Co:3:001:0 s 23 03 0004 0002 0000 0
420a8780 3.495266 C Co:3:001:0 0 0
412663c0 3.694178 C Ii:3:001:1 0:2048 1 =
     04
412663c0 3.694190 S Ii:3:001:1 -:2048 4 <
420a8780 3.702189 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
420a8780 3.702207 C Ci:3:001:0 0 4 =
     01011100
420a8780 3.702217 S Co:3:001:0 s 23 01 0010 0002 0000 0
420a8780 3.702224 C Co:3:001:0 0 0
420a8780 3.702243 S Co:3:001:0 s 23 01 0001 0002 0000 0
420a8780 3.702253 C Co:3:001:0 0 0
420a8780 3.702394 S Co:3:001:0 s 23 03 0004 0002 0000 0
420a8780 3.702405 C Co:3:001:0 0 0
420a8780 3.764199 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
420a8780 3.764215 C Ci:3:001:0 0 4 =
     01011100
420a8780 3.764226 S Co:3:001:0 s 23 01 0010 0002 0000 0
420a8780 3.764232 C Co:3:001:0 0 0
420a8780 3.764238 S Co:3:001:0 s 23 03 0004 0002 0000 0
420a8780 3.764246 C Co:3:001:0 0 0
412663c0 3.942187 C Ii:3:001:1 0:2048 1 =
     04
412663c0 3.942193 S Ii:3:001:1 -:2048 4 <
420a8780 3.966187 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
420a8780 3.966203 C Ci:3:001:0 0 4 =
     01011100
420a8780 3.966212 S Co:3:001:0 s 23 01 0010 0002 0000 0
420a8780 3.966218 C Co:3:001:0 0 0
420a8780 3.966222 S Co:3:001:0 s 23 03 0004 0002 0000 0
420a8780 3.966228 C Co:3:001:0 0 0
420a8780 4.174187 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
420a8780 4.174206 C Ci:3:001:0 0 4 =
     01011100
420a8780 4.174216 S Co:3:001:0 s 23 01 0010 0002 0000 0
420a8780 4.174223 C Co:3:001:0 0 0
420a8780 4.174229 S Co:3:001:0 s 23 03 0004 0002 0000 0
420a8780 4.174237 C Co:3:001:0 0 0
420a8780 4.382187 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
420a8780 4.382204 C Ci:3:001:0 0 4 =
     01011100
420a8780 4.382214 S Co:3:001:0 s 23 01 0010 0002 0000 0
420a8780 4.382221 C Co:3:001:0 0 0
420a8780 4.382226 S Co:3:001:0 s 23 03 0004 0002 0000 0
420a8780 4.382235 C Co:3:001:0 0 0
412663c0 4.438201 C Ii:3:001:1 0:2048 1 =
     04
412663c0 4.438207 S Ii:3:001:1 -:2048 4 <
420a8780 4.591214 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
420a8780 4.591236 C Ci:3:001:0 0 4 =
     01011100
420a8780 4.591246 S Co:3:001:0 s 23 01 0010 0002 0000 0
420a8780 4.591253 C Co:3:001:0 0 0
420a8780 4.591275 S Co:3:001:0 s 23 01 0001 0002 0000 0
420a8780 4.591285 C Co:3:001:0 0 0
420a8780 4.591365 S Co:3:001:0 s 23 01 0001 0002 0000 0
420a8780 4.591381 C Co:3:001:0 0 0
420a8780 4.591395 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
420a8780 4.591401 C Ci:3:001:0 0 4 =
     01010000
412663c0 4.591424 C Ii:3:001:1 -2:2048 0

Best regards,
Julian

