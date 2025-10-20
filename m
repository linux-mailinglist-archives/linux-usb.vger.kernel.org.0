Return-Path: <linux-usb+bounces-29454-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB66BF05A7
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 11:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A44CE3B2C4D
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 09:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12D12F60B3;
	Mon, 20 Oct 2025 09:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dTu5efRN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C272F5A0B
	for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 09:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954351; cv=none; b=SPf+xnY1ekqeS1pucCg9Jmj3jcs+Bg4b2MehrVGws8XGf2VORGfCJyvRNS4oxBY4EMgC9M25f/Ld4qP6iZMna5JvSVsguNRXriGmrmSeP9dpddQHkIZQMWwT+A6MBrsB14E58htV3zmxUejeeZ7E6rxrH9T4fBU6mHs+cPHiAms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954351; c=relaxed/simple;
	bh=ZSDbv8UlMSHFAFD+gGT2cT7LwU/FgU1QX/eiSXzzvFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DXUrWqshhpGgd6ZdsFhr6T2ygsw5dimcja5rTf5hJ8S8OsGUlCFWiENWvexGxNQyiX5/SPGEtak51d4BfMklL8bm7a0vVbeGoZT16f+iu5TT06rbVrhzVpXXz+8Q6wT0BwubgUZIm2TOvdDs8Kj52OwDra/CvrrhILR+XOeJr3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dTu5efRN; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so2317918f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 02:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760954348; x=1761559148; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W5WwbPJy3dr09yj6fDu2QPGisWoiFmbonzsrinPO0AM=;
        b=dTu5efRNfpOcXQ/wrwncAUVQX3FXQyrn0P4LLY0cz+tI1if+fI4fm/RG/9YMU5dlCO
         M+7OCYS6fifxFfFmjShEizpIMVPiJhpQ+K1NE31F/kHyiwCMUieImVPKAYaa4ZH+DY98
         Nqz3FOlonBHSnLk6eKqvDU6aC8Ud6/4Dyp0h7urKcK+TTbElUQ2dtM69MbHBjuGAjwkc
         ATzLehfkMMl6mjpcugLgVleJm2pF1LteYGj3Vj1qB25t9xf5+9oKxmiYjpqSJDPVPvZr
         EjC9/FqbZRIjR/sQH/VnWe3ExVvMSrH1tRh3Dk0X84U6yPC00zEx4sLzCevKtLWQopnL
         AT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760954348; x=1761559148;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W5WwbPJy3dr09yj6fDu2QPGisWoiFmbonzsrinPO0AM=;
        b=o0wMJazujO5ZOopt4qOOyGje4+jK31u8HayxfvfOg14fvfZntA00yUeu2s0lqT3d0r
         kLcKxDfUAHDj5qSLZozkvRqznOfei8407t+OkByQixAAQKpDhMFpPw9Qn7QNf65BWmMB
         t+lbyibnDMjYAUSepzBm+r+F8wlXnO3WP4m0bymv9CmsAGtBYPCFdo9nLBMI5IknYdtc
         2dXNHumKEo9CEU/knIAXXIFeuRuHfZEFyeyaisGxVY1hz00UQQmNAygcBlO55CikTz28
         t1vFrlpltyw0zMTxIntlHSw4RASYzK3qpj0SSofX5lED8EoxPHmYtnA9rFTaM2JOcNko
         XmGg==
X-Forwarded-Encrypted: i=1; AJvYcCViZ96CVI5DkhL69Qhu64hh9rM76k90EAE62elHO9eI4uc2bgSz39OMJdaU0pYpzQBl1OnZh4RxHos=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqOatTbZYh/lMk77Z89lUndJ/iAp5KgVu16INcL392NsXPnsjR
	lCI7+nV3rxkN6H8S9jWiF0EAAuTa5co5JxvGkSdBo2+O6giMRGqxGrAxusNad76kHAk=
X-Gm-Gg: ASbGncsush4GSiaNtt9mSLZqX2/DmRMKJMzAQBF6Lxv8sexHPTg2eSIkKj9RHiD6Dun
	RR61XPe91snlfjcXG01ArcUzH8EIev3gFU3j+/cIyFY/qesPC0KKVFJfasBL/Qs1D+8zqJHPN49
	Ra3qr7ebzM63jY/leG9NvFIW8m/xFy3JIFmFoi8D/JGfn6cNH+93dl9MTQclvKC2WHMqBklRBpa
	qDkGRYrXmIc0FiPe/obmx9ZxNe2r5TDq00HW0wGrfPbkgCdw2M5/q8qmKSY5YzSZz8/y9fkb+07
	6bOza5J18JpNVT6yTceyrJBbtrX6+3ugNf2le3CWGZ1o0msTaKz1NZOIyNp1ddIVRzH3nDZPQy4
	rsgKholV41gK6Aaqaby7yYM3SA+BGZcI7VAyzT/PNrkxTmv9kF60KvGAegvWa1xelXv4Wrq3Sl+
	vtIng1kfiVkQzYWnbRkzNIharm7lbOfXmLrYj0mPMK5RNunnjrXmod3Q==
X-Google-Smtp-Source: AGHT+IE3ui301egTRkS1EBW9zfJFFPQqZ7wTD2FcKQUH0Z4fvTMGlnxqlMPF1f5QM98LsZBZJDZalw==
X-Received: by 2002:adf:e18d:0:b0:427:6c6:4e31 with SMTP id ffacd0b85a97d-42706c64e42mr8688313f8f.22.1760954347660;
        Mon, 20 Oct 2025 02:59:07 -0700 (PDT)
Received: from ?IPV6:2001:a61:135e:6601:24e0:f40b:1a23:7445? ([2001:a61:135e:6601:24e0:f40b:1a23:7445])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00b9fa8sm14659135f8f.38.2025.10.20.02.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 02:59:07 -0700 (PDT)
Message-ID: <2fae9966-5e3a-488b-8ab5-51d46488e097@suse.com>
Date: Mon, 20 Oct 2025 11:59:06 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v5 2/3] net: usb: ax88179_178a: add USB device driver
 for config selection
To: Michal Pecio <michal.pecio@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>
Cc: yicongsrfy@163.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, oliver@neukum.org, pabeni@redhat.com
References: <20251013110753.0f640774.michal.pecio@gmail.com>
 <20251017024229.1959295-1-yicongsrfy@163.com>
 <db3db4c6-d019-49d0-92ad-96427341589c@rowland.harvard.edu>
 <20251017191511.6dd841e9.michal.pecio@gmail.com>
 <bda50568-a05d-4241-adbe-18efb2251d6e@rowland.harvard.edu>
 <20251018172156.69e93897.michal.pecio@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20251018172156.69e93897.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.10.25 17:21, Michal Pecio wrote:

> index e85105939af8..1d2c5ebc81ab 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -1202,6 +1202,8 @@ extern ssize_t usb_show_dynids(struct usb_dynids *dynids, char *buf);
>    * @post_reset: Called by usb_reset_device() after the device
>    *	has been reset
>    * @shutdown: Called at shut-down time to quiesce the device.
> + * @preferred: Check if this driver is preferred over generic class drivers
> + *	applicable to the device. May probe device with control transfers.
>    * @id_table: USB drivers use ID table to support hotplugging.
>    *	Export this with MODULE_DEVICE_TABLE(usb,...).  This must be set
>    *	or your driver's probe function will never get called.
> @@ -1255,6 +1257,8 @@ struct usb_driver {
>   
>   	void (*shutdown)(struct usb_interface *intf);
>   
> +	bool (*preferred)(struct usb_device *udev);

I am sorry, but this is a bit clunky. If you really want to
introduce such a method, why not just return the preferred configuration?

	Regards
		Oliver


