Return-Path: <linux-usb+bounces-12691-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC52942A05
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 11:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7954E284F2F
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 09:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC40D1AAE35;
	Wed, 31 Jul 2024 09:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KDCHm3PX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF8618CC19
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 09:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722417334; cv=none; b=p6bCYtLSUlAj6IiwL5B5MO6BD4hr0LmUMIwHUg3chOyqUmrmTFVOnzYl9jRDm7OjEWLMBp9l8Id7hOPkMN20IT6tl0SUpMyo5+tf9KBVr1BR9Cd25tVpvDmLgTQ/8V/qJOFtFbLtAaP6SfFqvR/Eh0gjzZFdY5TdU9T58dMV/68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722417334; c=relaxed/simple;
	bh=83W9xNyEhrhj9qUBBB3tEuegHbX2AuriMDdh+0vXiuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iE6IrOlmGxagXRvw+RfujdTj7o54ZFSSqaaVMa4Rp9nE+kW3+7HhA/BRtkfSGVzwrs619hMBGI02uAyRmEqNPw9kPt2qzNDwJH1CqoIofG/H/ZwGGXnf4ZpHMNpkB2kzvti5TFmk6Uu130tWi/ehy5R77MYlGVzfxmdif1HGN6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KDCHm3PX; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f029e9c9cfso86581221fa.2
        for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 02:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722417330; x=1723022130; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GSGg8nbzE43rNqdiDkmvX9VXw5/3C+7aRCNi7MLm7Wg=;
        b=KDCHm3PX9vovyS1B2HOeIwAoC2fmlWK/tJcRHQCXaZZKE6w1su0LwfHVu+a8D13DSU
         qLl5Z4KmwwpRX2Tr6mdHoaWH4c04gDN9PveBngC+GedGQ8c8GJytSGxuiT73S5LHL8dO
         jZMP2Pf17hSp6fveutYqbuX4h38xvM3CDbKfsCxIZ/OeD65DPDqT0LI3fC2ci80u3DKm
         76liWPdcflVc6JuGcHm0BMydc4hLNz20rwPdRWYbfKy4sH4qkZjHBSdV9CL9pAurmGq8
         456YNgJocCXQScibG2XE41tq1RgLihz+vFe/kQJRRUn+d2eROfzirG1d/cO2TKY3qGKd
         RaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722417330; x=1723022130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GSGg8nbzE43rNqdiDkmvX9VXw5/3C+7aRCNi7MLm7Wg=;
        b=BKVl8pIVz9gZF9YeEIab+Mz1V1bGFF1D99/t8FKZsr44FfB8y2jGMJDuMcUe09iMp/
         fMiahTdWUYuXO88UVBgxhHy8Yg8VEb0WnoU9ypb6iuPT84T6RkfYa6l/a9LykhQoZVbQ
         E6gNl6+55b7J4Oru8hNEhYHZcHi8ksF4zAyS6QeMK/Lsh45eB2zv61q/O3ln/2BsbWNY
         0nQDAiHNslkR72ahvVaq+7Mvav6lFposzw/ljf3m1c6oHKyIdSH6SJQISenH5AyMELQ5
         RRwEyv4qFJPApculCEFWHK6+OQBqeMR93m7BmVNwKAEAK6s4PVhwrOAknkKWx62a+SZw
         OP1w==
X-Forwarded-Encrypted: i=1; AJvYcCXuJZQOuigTltYSUfoR2r2gG2VyqujD6KBq9kwussCnToCBGn+eF5HmMi9/nLYlRWHkKQJceDrsA0uHPBLGzPXWYdTGSQofg3Hm
X-Gm-Message-State: AOJu0Yw60ze1jxy7hVaO1koukqA2DslL0POBMo/k1Cu7TiqGYcBEg/as
	hn13rymQdvdKpf4G0fIrDPKWp9jv6pUcAClt9mjGjyQcQL5M9j/PFvwEbAWzvfw=
X-Google-Smtp-Source: AGHT+IEQ44GksC7yt9tVPJqo9jRk2fLB26LDnjNmJ4RZUywVQidrbsVIjFt6auqVfRzB22Hd0YCyhQ==
X-Received: by 2002:a2e:880c:0:b0:2ef:c8a1:ff4 with SMTP id 38308e7fff4ca-2f12edfef3amr117885781fa.7.1722417329932;
        Wed, 31 Jul 2024 02:15:29 -0700 (PDT)
Received: from ?IPV6:2001:a61:137b:5001:be5a:c750:b487:ff1b? ([2001:a61:137b:5001:be5a:c750:b487:ff1b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad4aaa3sm748177766b.138.2024.07.31.02.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 02:15:29 -0700 (PDT)
Message-ID: <5d7870b0-6b63-430b-8885-2509b33dc78a@suse.com>
Date: Wed, 31 Jul 2024 11:15:28 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: storage: ene_ub6250: Fix right shift warnings
To: Abhishek Tamboli <abhishektamboli9@gmail.com>,
 Oliver Neukum <oneukum@suse.com>
Cc: stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
 usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
 skhan@linuxfoundation.org, dan.carpenter@linaro.org, rbmarliere@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20240729182348.451436-1-abhishektamboli9@gmail.com>
 <e72cc56a-3066-4cb8-848d-bfe27a48c095@suse.com>
 <ZqkpOQIjcBSAg8rC@embed-PC.myguest.virtualbox.org>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ZqkpOQIjcBSAg8rC@embed-PC.myguest.virtualbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30.07.24 19:56, Abhishek Tamboli wrote:
> On Tue, Jul 30, 2024 at 09:09:05AM +0200, Oliver Neukum wrote:

>> 1. use a constant, where a constant is used
> I think you are suggesting that I should replace hard-coded values like the
> buffer size with named constants. For example:
> 
> #define BUF_SIZE 8
> unsigned char buf[BUF_SIZE];

Yes, but the constant we need to look at here is bl_len.
This is a variable needlessly.

>> 2. use the macros for converting endianness
> Can I use macros like cpu_to_le32 for converting the bl_num and bl_len values.
> Should I replace all instances of manual bitwise shifts with these macros?

Yes.

> For example:
> 
>      u32 bl_len = 0x200;
>      buf[0] = cpu_to_le32(bl_num) >> 24;
>      buf[4] = cpu_to_le32(bl_len) >> 24;
> 
> Is using cpu_to_le32 appropriate for the data format required by this
> device?

Well, the format is big endian. So, cpu_to_be32() will be required.

	Regards
		Oliver


