Return-Path: <linux-usb+bounces-5151-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BB2830016
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 07:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 225EB1C22E3F
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 06:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F04B8BFC;
	Wed, 17 Jan 2024 06:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iA2kkQ5r"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A0D79E0
	for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 06:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705472728; cv=none; b=iKYt8tTc6SvdPooP3AhO0z4q278VCQiDWBBK+yNtqJVQ91xrDddxYvTcBX5COzb3xh64y+oXJNizYAPukwZyiKT4Aa/7rAdxwJxIrhGn1ZojB9D+4872YOIGko+IRE6SdBvS/k3kmKU08KfWwVhFWsWLWfxvkUrdRqcFv9RH2r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705472728; c=relaxed/simple;
	bh=AxY17N6tpXv7QL2h+mjO3AmpdEnxunzRaV43tlpyEK8=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=IEPsy4fct3v54uQjkbkSfiUECZmH16Ns5wCG9GT/SZQ8+jZDOV48MyNjVWHfFLOsXj5IawAFXACNRVgjDvXi14j5+JzdIhTMM+nY620/W0sXXhWVeb3lAcg7COUtMhSzXB7e9SHuB9wSWr0htuIE5doxR70yxYAL6tfpq/t/jdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iA2kkQ5r; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3bbbc6e51d0so6831615b6e.3
        for <linux-usb@vger.kernel.org>; Tue, 16 Jan 2024 22:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705472726; x=1706077526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q3vW7onYa07SHFAItoxFt+KVOV9PHt5Vl28tYSI1rM8=;
        b=iA2kkQ5rl12jQcNIxZHW9EA9nRXEMOaS8qbsou04R7Cp93uLN6CaJ3+7V0PZ2gynzH
         dPo5iVXR8i0J5ywjhyPJCZ08m27PvukKJsaUHvRq5gJ+omHhHa0KKDM4DE7GeXvqdtre
         6Pb42D4EShSGUmTH0KkzLJ5byFw5/KksAZD3WCq7MlWWtYY3MqUKJ9lymsOtiWiT4XUY
         DJZ9f2O+GLNFtVodtfM6HPvYnwf5Qfllzjp3xV6bT2ZDMzB9FM6Dtg2J74Nu/PbmNXeq
         CKgGaY01d1ojNR+rymS4A4RaHPypNNZ8w3F5GR/E7Li+bMSTJOTlZfSQFRCshQjqmldm
         4dyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705472726; x=1706077526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3vW7onYa07SHFAItoxFt+KVOV9PHt5Vl28tYSI1rM8=;
        b=WdflxtzLpk/V3pXczwXbhmotRPEqnRPxQve9VBnAiSJw1MeyNQk3TSMkLH6kDaizTg
         B2ANytWdPLdPDfS4vV9a2T3O1q0Ykops/UkvAjK5pE8VI7Ce0sgPzxFs53G96fPMO4Al
         ncn4WBAxUGEfAV4p97KnMMLG+AZFG2OMFGHbUYN8ujoNsb/neIVXQYXV49I+ufI4IO2e
         UR+E5s9SEDTpdJvU4n681owzPaNNdxzYIG2k9QHQ+hOlPEdiDN9Et6wCqrL0ApqYMnwG
         klGoUUGm4H3/yVsXzBSnqAoDzAy7M1isXcjIoM4jLVfXazrYe9d1xstU2+pnig8juZ6h
         80RA==
X-Gm-Message-State: AOJu0Yylhs/ubknDzKjpKOuXLvTMwp5FH6vt4MSJXdVnkwaJWfNi3P0w
	QoeiQLIaG7ZSm11rxX7cI7QQ0BEbuo7OXlZv7hWPKA==
X-Google-Smtp-Source: AGHT+IEy8+znIRzZPCrZWHEyl7rrZ715lLMweta7ZPGitbOq0E/crRGwFllVpjEIQIMS++YgFdfYTQ==
X-Received: by 2002:a05:6808:1526:b0:3bd:381c:18a5 with SMTP id u38-20020a056808152600b003bd381c18a5mr7017230oiw.110.1705472726549;
        Tue, 16 Jan 2024 22:25:26 -0800 (PST)
Received: from [192.168.1.7] ([110.78.142.72])
        by smtp.googlemail.com with ESMTPSA id h13-20020aa79f4d000000b006d92f081d9fsm607304pfr.31.2024.01.16.22.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 22:25:26 -0800 (PST)
Message-ID: <fc14c873-04ee-43cd-8328-b4e5b03e0230@gmail.com>
Date: Wed, 17 Jan 2024 13:25:21 +0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: "SilverStone TS16" external SSD enclosing needs an UAS quirk
To: Greg KH <gregkh@linuxfoundation.org>, Bruno Haible <bruno@clisp.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>,
 linux-usb@vger.kernel.org
References: <3750407.VQhiAETyHQ@nimes>
 <2024011630-convent-slouching-ce10@gregkh>
Content-Language: en-US
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <2024011630-convent-slouching-ce10@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-01-16 21:13, Greg KH wrote:
> On Tue, Jan 16, 2024 at 12:35:46AM +0100, Bruno Haible wrote:
>> TL;DR
>> -----
>> In my experience, the "SilverStone TS16" external SSD enclosing
>> needs an UAS quirk
>>    usb-storage.quirks=0bda:9210:u
>> as part of the kernel command line. I hope you can add it
>> to the file linux/drivers/usb/storage/unusual_uas.h .
> 
> Can you create a patch for this so that you get credit for the making
> the fix?
> 
> thanks,
> 
> greg k-h

Replying to this since I did not get the original post.
0bda:9210 is a Realtek USB 3 to pcie chip used by umpteen
enclosure manufacturers.
I have got one from Orico and it works ok under both linux and MSWin but 
it can be a bit finicky if it doesn't get enough power, it may for 
instance work well with an earlier (slower) type of NVME SSD but not 
with a later faster type unless you provide external power to it (usb 
hub + power adapter).

Slowing down all RTL9120 already in the market with this quirk is in my 
humble opinion not a realistic solutio.

tnx

/Lars


