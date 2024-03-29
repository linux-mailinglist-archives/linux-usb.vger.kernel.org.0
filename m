Return-Path: <linux-usb+bounces-8655-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF668917F1
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 12:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AAB8B22E76
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 11:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6A16A348;
	Fri, 29 Mar 2024 11:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDsqKNoh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF74051C5E
	for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 11:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711712184; cv=none; b=REOK8bw8HNBtJ6QRge1EDZvnvDv8X6TljVytjpAMz0aaKMexstZZRqtj20StiJ1KTJfxkpgrE2FHNaP3WpBxOkullyVdu8CgsjNd3suHW1UvD8Osee5X0UGrqnIpqF2Z99SL6To9sgXPwyWxFLDtrDPBgUn6LFO1Q5R2oJtSqus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711712184; c=relaxed/simple;
	bh=cMpFeNAFr0kISGzGV+V4RtvQwrPdLeI37DBHbqZN69A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mkvbbDBsda/9ufM9iBVW0cLdMCvE3X1aP9IqKjH6bMHbb6pKAlU4amte6OSd4BK7zBZHyKzBlBEVpr0NjCU8frkEa6orjMYNn+9rvxrB3GQ4hJN7+4Rgws1beGVznTa0yL5nftwmyKbtJC36SGDkTn5VZ7b4l6tWTvjMGIE6FiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDsqKNoh; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5688eaf1165so2549632a12.1
        for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 04:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711712181; x=1712316981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZogD/LkYdQXn9xOUfiaLtnzomLf9NTA7PGCsd/QaPx8=;
        b=NDsqKNohgoerLVcz4Umo63XVp6hhsU0dNG2tfbJ7p87vz7N17eQQ4lxOxVWEu8dwMS
         j/eV/ll8C0mPnYHiiH4x3Y+sjUjHSLp0S8UQL/egJ8E5Y0Mwet8uF0utWaxRVVuWBbkP
         RuVx5AK+0Q9ks1lT2OwQ6/XcOYnWvydhTgAkPIRZz6O+kn0JUJzmMUGtDJVH1u5Vt8ca
         wouR1D1LknY5q/IoSSWfrMQ8jhWN5dl9HYxgGr9p0w5alcI9DtLkBblBQoPQKvVGmGfQ
         r8CBM4sVSXv1E8fOT55WVr0l4TePhV7zPV+8cV/aDopC4i1HDHa1qs++ON7PdRdr0iUY
         BDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711712181; x=1712316981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZogD/LkYdQXn9xOUfiaLtnzomLf9NTA7PGCsd/QaPx8=;
        b=YlOxH/biH8wvombkpurck0oTJM2y2sdqaSeYANDFJS0Tt8JXJn8/4t0DNA3dJzhPuI
         sjeZ3RqfjVvIjePcMkUXfznhYX8Shw7Tl/A0D4v2uzQHRWVa/nOTLhddnyvOqbkNbRcU
         mTYDrIeDTUZOBfSCv5NAqJcq6SIRRRdb5tndZu2tuYd7O9v1UVMLx/Ru/OFaZwOUo1wt
         axDxfmXpsaHF+tH9sUlFgVHLU0pA810TZT0OKkBJaYyGFOu4zuCq0Q+l2WzebRt+lzoi
         Pa1vsWBFEap3mv6AHIpc/Ikd1BYY41ehFg18jhW4VOze+DjUA9lNd+vSYPFs0mzuqz++
         Frrw==
X-Gm-Message-State: AOJu0YxJFQRsuLtV2MAKBKLp+wuYoRHl21fmRunCaVnxRaaZWTAGd7Gn
	HIPB7BuDnF7pjPiPzG4EcVwS3aM/iffVTiJjTQhVGxOKSbl1gCLg66Q2lopz
X-Google-Smtp-Source: AGHT+IE+Mgi54x7Z1F1yaRepkC1oIfhHPoA6pLLCd8XBaHsqLMlQwWO1ylCM2SdyZsjoykmsalp5Nw==
X-Received: by 2002:a17:907:a46:b0:a4e:38c3:e06b with SMTP id be6-20020a1709070a4600b00a4e38c3e06bmr1054664ejc.73.1711712180931;
        Fri, 29 Mar 2024 04:36:20 -0700 (PDT)
Received: from [192.168.1.50] ([79.119.240.188])
        by smtp.gmail.com with ESMTPSA id bj9-20020a17090736c900b00a4e28cacbddsm1331175ejc.57.2024.03.29.04.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 04:36:20 -0700 (PDT)
Message-ID: <77a2f290-2f63-42d8-a6d2-25840049beca@gmail.com>
Date: Fri, 29 Mar 2024 13:36:18 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Device with two interfaces - what is the probing order?
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
References: <f4df8e45-5dc5-4d81-a414-e19a83b71403@gmail.com>
 <8bc3a7ae-bf8a-486e-946b-ff75ef2ac727@rowland.harvard.edu>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <8bc3a7ae-bf8a-486e-946b-ff75ef2ac727@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/03/2024 22:05, Alan Stern wrote:
> On Thu, Mar 28, 2024 at 09:08:43PM +0200, Bitterblue Smith wrote:
>> Hi all,
>>
>> Given a USB Wifi device with two "identical" interfaces,
>> in what order are the interfaces probed? Is the order guaranteed?
> 
> They are probed in the order that they are listed in the 
> Get-Config-Descriptor output.  But this is not guaranteed.
> 
> Alan Stern

Is it guaranteed that they are probed one at a time, not in parallel?

Oh, and what about the disconnect function? Is that guaranteed to be called not in parallel?

