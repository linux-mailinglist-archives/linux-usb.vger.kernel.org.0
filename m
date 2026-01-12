Return-Path: <linux-usb+bounces-32176-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3B4D1183C
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 10:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30DE9306CDB2
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 09:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD26267B92;
	Mon, 12 Jan 2026 09:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NHAdmWmK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C0825EFB6
	for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 09:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768210240; cv=none; b=GJ1kkZ0CYhxWfU82uCVKqwvcoFy9Fho7xM6hnmL8FwkjFCLdN/0ZE2UeajeEz9gA1pwFLaYYW1WQrcsh4wWGiMA4MU0Pe5Z2Gf8wGN20Z5xs8WvcV+LhNnz4Bf4vRBULG2UlF0Y+UYnPcjlV1ZD+qdNZPsLnusNrzbRse9GiNsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768210240; c=relaxed/simple;
	bh=PSbKdTLMyCtquMyZJrgCPLvDshAa8RMTDZw3tvgPuxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gWrBmPP7Lk1aB7zxulQJjD4UK8T/mVhfkQmDnZqIcuc0OzV7Hxmn0cuPlIV9M4dZVZWjqvcXnub/E6Iu59Cj8cJtLRj0fmb43Hio3jPPM1VZpCuwgcNzeREcWMdA0yYF3Pje4K79p51W8yuUJJ+92PKFki/Tgdz8wIH17yNn9jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NHAdmWmK; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so49106165e9.3
        for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 01:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768210237; x=1768815037; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qEFcTRLXFwMplkSR5+Yoz5xgx/H+9xW5RdQzqxN3H5E=;
        b=NHAdmWmKaKqbqOW/8tsUQvOXGOqshWTy8vqgIJeU3+XhY68l3GTWZltLV3a75zMpZc
         4shZdVb/5d7m4gCW9vfFeUXULFeUMZIyArNfiMnxhfMFytszVIWHYfB0GicDMsG+mvUM
         sV6HpDCrPRdGdRFBZq6th5lx+6ruVReArovYxcmK3Jvvvc3cGhEaB82BskjOV8Pa1beZ
         RFaGsxvzC9bGP7V4DF4fVjfTyTBVqTrjAYB8EJuwNvZfBSMbcgcOvGWSk0VWj/Mq5+Sw
         jae0s2D8WpilMlrzeaYqPEnEhADbvNZk2eAuLIgwYIOGoEg693evSQ+fJ3bWoCTwLaCi
         LZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768210237; x=1768815037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEFcTRLXFwMplkSR5+Yoz5xgx/H+9xW5RdQzqxN3H5E=;
        b=ZCprcSSDzJQOZpUYSlI4CzVtIWzWHf3xQwN/7RB3sHTOKtQenQrlI64pnRiq6Yd2UO
         JuUdYfCJ/aoGqZcQU40fBedxfNGNqsCE6FlCflrz7yxXoS4v6YtmMKYce2qaQV2a9Vw/
         VjKuv5eBeQz5J8ejNBANVZQpbOFKh1qmOMnjno0skfyEHYokkeU3T36bbDZfioqw3y4N
         t0CdQq7ICWGYTTXd+7n0eQlWpRlGK7kMUotRMywNgEJtFhZZuVhv2Py7wY1qUtwybYGl
         g1HLODp7RvAFMhd2aJ2+4sr61SdPtYEciubMxr06jImXunIfkJ302EHMOzW5bTpIRcnx
         PZng==
X-Forwarded-Encrypted: i=1; AJvYcCXwx/i4fjZLftsCq8UQ6LRpvp71euCRvfleFmCS0GrSFMz4yvIhHG7eu4QAlfluFLxW5itsq54+FTU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo5Khbxv5epZcxRzxBN4BHweHXa65muzYtAlM+vCrVKQyHPSsn
	++xj+5FzOXEcxARU2ay9sxymuhFwYOcsrcYDhY1q56DlgUcRM5JBh0+QBUwaLdqV6RT4lr5fpCP
	zLsgTzVg=
X-Gm-Gg: AY/fxX5nRR4KlQyggXeQPtHIL1Ymb7iuyeUm6FKghrOtQXvMs9zrV3WnHnUw9ZarNmz
	YjyQtwZc1rHDWYVhpl+4+lOHiYQztCMv+4Fj1Ght1ZXQb3xjIjGhwqld4240FOqoC5QiQt7E3UY
	dELqbna6HF94siK0ZohTy0DvvMnboOWKdbYZsvfP8eyAbu2oD0gNML1m6OPqcC5u8krfS3b1bBD
	FEjrPyoDsKxHS8JKtk/ZBPvHQyLvSke8O0UMjjvDOYeyMMLlpOLv8pSKGKX7lcxJtth134+9Tjb
	66LTMZ4IE5gbp6Yhsgv/GMsMhS6vm5KMqhmZvNNtffx+OQmmyqtzxi+Co1As2krLdha9c51Snqm
	nClnDoJzjM7Oyr1hLXUcT3rOWLtpEMGo867ZaEYpvGvnN1OImew1tZuEFCMeDBxRpoNiEVLigHm
	ULEWSsV1cFe9LTeG1I2JWjfrVLRyKEwNdv8SunF2CDAzTQtLHrks7lDvg=
X-Google-Smtp-Source: AGHT+IHgoUsbIdkr8s3Mkq/l9PMNWfx6ek+Z9CdeX/CgWMVEeyZjk7SHsxpHamrvF4GEXSDKgqpJhw==
X-Received: by 2002:a05:600c:8b43:b0:47d:264e:b37d with SMTP id 5b1f17b1804b1-47d84b36a01mr190442635e9.22.1768210236874;
        Mon, 12 Jan 2026 01:30:36 -0800 (PST)
Received: from ?IPV6:2001:a61:1384:5201:596d:baf2:9af9:9ecc? ([2001:a61:1384:5201:596d:baf2:9af9:9ecc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee893sm37156366f8f.37.2026.01.12.01.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 01:30:36 -0800 (PST)
Message-ID: <2fec569f-2329-47a7-b778-58f597476492@suse.com>
Date: Mon, 12 Jan 2026 10:30:36 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Trouble with drivers for Epson Moverio BT-40
To: Lars Melin <larsm17@gmail.com>, Oliver Neukum <oneukum@suse.com>,
 natalie roentgen connolly <natalie@natalieee.net>, linux-usb@vger.kernel.org
References: <9c4491aa-88d3-4c9a-843c-2f0d471263e0@natalieee.net>
 <ade89a9d-6034-43e6-ba74-778db2f8837c@suse.com>
 <ce3a8714-bce5-4cac-ba80-f3c64e6ff5e9@natalieee.net>
 <b0899011-78bb-4fdd-9e49-3dad6b11a9e6@suse.com>
 <5227fbeb-0338-4006-845e-37f00b09218d@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <5227fbeb-0338-4006-845e-37f00b09218d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17.12.25 02:43, Lars Melin wrote:
> On 2025-12-16 15:39, Oliver Neukum wrote:

Hi,

> your solution is more ugly than it has to be because it assigns fixed interface numbers to the cdc-acm interface pairs and won't work for
> devices with faulty union using pairs 2,3 or 3,4 and so on.
> Instead, when parsing the control interface then assign data interface number to next interface number.
we could do that. The issue is that this would assign the interface even if
it is something else. A device with such a union descriptor is incredibly
broken. Should we really assume that they are sane in other regards?

	Regards
		Oliver


