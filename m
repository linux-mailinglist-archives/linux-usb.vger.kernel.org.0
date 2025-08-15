Return-Path: <linux-usb+bounces-26912-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B80B9B28351
	for <lists+linux-usb@lfdr.de>; Fri, 15 Aug 2025 17:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8F20172E80
	for <lists+linux-usb@lfdr.de>; Fri, 15 Aug 2025 15:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D8A304969;
	Fri, 15 Aug 2025 15:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b="uvjICBSH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.valdk.tel (mail.valdk.tel [185.177.150.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE58308F1C
	for <linux-usb@vger.kernel.org>; Fri, 15 Aug 2025 15:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.177.150.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755273225; cv=none; b=BFZ+b5ODrPzK5aAsElxKGMkbAyWcC+IKGzs5y/kjhw1O5B/PdGlj95qnOccZVTQF4dlk3KDyQM3YwKn4Kxh9Cd5TazrTGcF7jFnrzUlstatUQrb9/zC4bi9p1joiEkJWl9n2fYelKJvfXs8rAp/9QrCnei+BKbdlo3Qk/N0HQTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755273225; c=relaxed/simple;
	bh=OSZRIRtlMJh3pV4zP7v5p0lWQ6ulxOLE8WaZMyl4N1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EYPOy/Q2qoiuwJ00YkWFfesk2T+R//HOmn10teAWABTeLi0mLdzepj+gTxWuA13BMP0U231lx+wfPsDIwGysJ9QroABOWOfHeysRWxhZb7DWHnoXWOUyL0F5pA+rHJS/uT/CpTcP0hv2TR3hrA0+2CUe/d0ejM5iU/Bq8IzzWXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru; spf=pass smtp.mailfrom=valdikss.org.ru; dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b=uvjICBSH; arc=none smtp.client-ip=185.177.150.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valdikss.org.ru
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C8961BC4DBD;
	Fri, 15 Aug 2025 18:53:33 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valdikss.org.ru;
	s=msrv; t=1755273215;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
	bh=qaEd5W4ZstmsxCP0C5j8PunEj0BAH+4YvAbCzC5dVhc=;
	b=uvjICBSHXo2onuWN/VjT1MzpY/vKlEwx9YezAoNTw5mzpwUJKKXWSfws2whWL/JxT+o9/n
	vbp4X/9vGBZB/UaZhtnhPh9TdOTNhVlpJEA5P1yG8M2CNCMYGhH+hp2ClBwKOUhhHuVntK
	PRYYxq8tw3JA5H7P7vfyuO3SANjeLJFjwUFWRWT6NKqA7MQkdPHpgA40tBXV1fsMzBY8c7
	yFf59/ThmJJM+sTxUJ2FIq7LvDuIklTSoATOvpV11iXQTb6BaKaYvFUTfIjukAWQATJvH9
	DJlPtXI2U7x2UKT/ysU19411Bfh4YtVO98U3Y1EGKL/Q9iqvl9nL/MjZowPvuw==
Message-ID: <e5d73b85-9c7f-4c74-9a00-700b4b6e7d70@valdikss.org.ru>
Date: Fri, 15 Aug 2025 18:53:33 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: USB 1.1 Full Speed OHCI slow/high latency
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
References: <3fe845b9-1328-4b40-8b02-61a879bea6df@valdikss.org.ru>
 <6017298f-fc03-41c9-b0e3-a74180f4c9a1@rowland.harvard.edu>
 <f2c433ae-f9d0-4beb-a2c7-84d2fd68e02e@valdikss.org.ru>
 <d41d8488-9438-430a-88ab-f845df3655e1@rowland.harvard.edu>
 <2bf5c54e-7dac-4673-a696-e09eb8d459d5@valdikss.org.ru>
 <7bfaeea9-6eb1-4e49-af8a-77940fdb70fc@rowland.harvard.edu>
Content-Language: ru, en-US
From: ValdikSS <iam@valdikss.org.ru>
Autocrypt: addr=iam@valdikss.org.ru; keydata=
 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
 OEcVmRU/pw5/zoQyQg==
In-Reply-To: <7bfaeea9-6eb1-4e49-af8a-77940fdb70fc@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 15.08.2025 5:52 PM, Alan Stern wrote:
>> My guess it's OHCI to blame.
> 
> The OHCI pcap file shows that transfers take place at intervals of 2 ms,
> which is perhaps slower than expected.  (The EHCI transfers take place
> at intervals of 0.625 or 0.875 ms, which is reasonable.)
> 
> I think the reason the OHCI transfers need 2 ms rather than 1 ms is
> because of the way the driver unlinks empty Endpoint Descriptors.  Lines
> 1165-1168 of drivers/usb/host/ohci-q.c do this:
> 
> 	/* clean schedule:  unlink EDs that are no longer busy */
> 	if (list_empty(&ed->td_list)) {
> 		if (ed->state == ED_OPER)
> 			start_ed_unlink(ohci, ed);
> 
> As a result, each time a transfer finishes the ED is unlinked, and each
> time a new transfer starts the ED has to be linked again.  Presumably (I
> don't recall all the details about how OHCI works so this is just my
> guess) those steps each require 1 ms, accounting for the 2-ms time
> interval between transfers.
> 
> You could try deleting or commenting out the last two of those lines to
> see if it makes a difference.  (Note that this is not a permanent
> solution; without the call to start_ed_unlink(), the memory used by the
> ED will never be freed.  A better approach would be to unlink EDs after
> they have been idle for some minimum time rather than right away.)

Thanks Alan, this definitely makes things better

Before the patch:

Avg delta: 1.916 ms
Min: 1.443 ms
Max: 2.891 ms

After the patch:

Avg delta: 0.944 ms
Min: 0.722 ms
Max: 6.904 ms

However the printout is still not in full. Now the same picture prints 
about 4/5 of the page, but still not 100% (previously it failed on 1/3).

Would the .pcap of the printing process be useful?


