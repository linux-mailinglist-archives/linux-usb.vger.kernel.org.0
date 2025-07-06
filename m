Return-Path: <linux-usb+bounces-25398-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D66AF12A7
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 12:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E81BE7B132F
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 10:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C011B25D1FE;
	Wed,  2 Jul 2025 10:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="N2+PRhfs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AFE24A07A
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 10:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453668; cv=none; b=YbA3uames4VAhg+7BQ0OeTBAfI5Wh6QqHJVWYl0D//AXEgxBsJ2fEbo0Yo8zzRIfYYY5XGGwmfOqbgUtCSBz1whYHYkfDKBE/ggL3tDvw5AxtoiYAYh4IqorvemuKj6+OPKPE6IbxoT3Xn2tdJcCV0mRYk2fu5v+vakWchbPkYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453668; c=relaxed/simple;
	bh=DWeR+/uQQSYMmH/LvahmZ0RIw9E1q0WXOgj4Vn2Kq3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bMiQFT6FOQZsy5IrHbRGk+MfrzotSpSdnXMXeR2aXcDdgr9rWkQ8NREGvb4ra3gH2AwYIuOJw2uuLupYTma6ihDI/AjHCd3JUrGSZrALNMFQsNJD5D43OyaFi+WEh6ih9EZLBT6yZu+SIVAJvbQb3p3K+g447t86YuGRsnZ+1sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=N2+PRhfs; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4538bc1cffdso40906165e9.0
        for <linux-usb@vger.kernel.org>; Wed, 02 Jul 2025 03:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751453664; x=1752058464; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Jg9h1VCLy4qgpopj8IiT7Jm8iMsC+mvB1PgrDfbBVE=;
        b=N2+PRhfscD0orJLHMjTS5mMyjsrnqnShvdO0j55Hvw2Ix+mMm0+yiKGtnMsidce9db
         k5X2PZWu2GEwuOmHVf+M8Zn8T8rGQ8xtZvVC/33j7mYNgtrMSYZcovZNTjxjloWqgMpp
         CqAlGhXVDA9VauMbUq7fTMSkExaFaIHd+RhUTnoSfUyNHM9NSzMA2tlWYkC/MpztWfvc
         5jh2DVm03v9WzJZlRCJmqS+p3z1ZQEV3cyEaI6wdsaA+uk3nybOKub/z0nIYtjabUKh0
         OFf5ZW77JrBjQl5m6WEf5jPO4+qsPYt73E00g9QT7sLO0k4YenAekQZYVVmru6sHYidR
         muWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453664; x=1752058464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Jg9h1VCLy4qgpopj8IiT7Jm8iMsC+mvB1PgrDfbBVE=;
        b=SS0Nrdx60YfofudDjEqNR76VG1PKvYLR0C2ngNH4fxRSkKFNquCsR8YObuiZ0qwqwH
         ZQlS1rmY2ODh14PpYblX0368qYguO56VZ/D5or0bTuE0QNW9wKLL7n5Z/gRH4iwy41SN
         G2n4YyXaC6wdPW/HpxhTyCkz7rnUQ7LZ19NS7bAYVTWmzPUyOLhC2RUtKY4Z2YSdJW+w
         F5htXoaU8NiMTV4MfFqkw2v4hs90WUPSySLLG2PnH4ObI4y0V3TDDPoCiNZJP+aaNbrH
         UoHJUQ1wInBVt6IB+GxGbw2qcL85xJ0ZCyrfq8bPMs+75fH1E8s/Oj8Wvk2KI2eW88d1
         5aOA==
X-Forwarded-Encrypted: i=1; AJvYcCVWIA37YHi4xw8beel3g+GDefb3Hvd15fufjJjGqwmgEN53P38u0cw4iGfbdc0A1A9VFxJki+5W12E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzckY4FPKqFtOn/cneV5xJKMAnaVfcubPhxfJnpfpiuPkhHTlii
	XhqKFce8rmUD/wgwJCciL5lKWouyihb2M/pkxo5UlyG9y6fy30tHoNOJZLfxoF/qSLU=
X-Gm-Gg: ASbGncvntKGvlSJ0IXYpUtbHs+7pfL52ASX5YkYwYuOaPaHxsZW3LN0urGqHTcE//To
	IQPsk7WDsJYF7hhjgjPgny/5Nsnhj7j14Ta9Jo0os2VDV9fb21Ln91cUxZgf+wsvcxDhfHvla5l
	UyvKFnTfi7YZl+XXf8xoNu6SMCdH3RjW41Uk8y9Wr0rYdudKvhKsoy3ylH79CDAbrfvg85fGQ+d
	ytuaOpAQiq9X7PzYRKegDCSyOqRBEQfjgSPvCJaTR3m2XcLXeslTZHVcrqQKRxHVwZKe/7cLQSP
	2pt/q6xIslAnIy7v7DRMu8obNQ/BLHlOjjWIyYyBsUlEJ7r00d8UN7VNWK3Ki9vsOXiT2Jt8X2i
	pc3KT2yuL/8IxKfb8xfKuiSjhCqhK
X-Google-Smtp-Source: AGHT+IGAIK/G/I8tdPVOI217bep69ojNDn163oQvep1EwZXnaYnHz492awG91UUkdfrnfI0nWERljQ==
X-Received: by 2002:a05:600c:3b24:b0:442:f12f:bd9f with SMTP id 5b1f17b1804b1-454a371d3eemr24456755e9.27.1751453664299;
        Wed, 02 Jul 2025 03:54:24 -0700 (PDT)
Received: from ?IPV6:2001:a61:13c3:8601:acfb:599e:12fa:d72a? ([2001:a61:13c3:8601:acfb:599e:12fa:d72a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e6f74sm15728135f8f.3.2025.07.02.03.54.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 03:54:24 -0700 (PDT)
Message-ID: <560fa48a-7e0b-4b50-bebb-b3600efaadd3@suse.com>
Date: Wed, 2 Jul 2025 12:54:23 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: usb: usbnet: fix use-after-free in race on workqueue
To: Jakub Kicinski <kuba@kernel.org>, Oliver Neukum <oneukum@suse.com>
Cc: Paolo Abeni <pabeni@redhat.com>, "Peter GJ. Park"
 <gyujoon.park@samsung.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ming Lei <ming.lei@canonical.com>
References: <CGME20250625093354epcas1p1c9817df6e1d1599e8b4eb16c5715a6fd@epcas1p1.samsung.com>
 <20250625-usbnet-uaf-fix-v1-1-421eb05ae6ea@samsung.com>
 <87a7f8a6-71b1-4b90-abc7-0a680f2a99cf@redhat.com>
 <ebd0bb9b-8e66-4119-b011-c1a737749fb2@suse.com>
 <20250701182617.07d6e437@kernel.org>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250701182617.07d6e437@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.07.25 03:26, Jakub Kicinski wrote:
> On Tue, 1 Jul 2025 15:22:54 +0200 Oliver Neukum wrote:

>> That is indeed a core question, which we really need an answer to.
>> Do I interpret dev_close_many() correctly, if I state that the
>> ndo_stop() method will _not_ be called if the device has never been
>> opened?
> 
> Correct, open and close are paired. Most drivers would crash if we
> tried to close them before they ever got opened.

Thank you for clarifying that.

>> I am sorry to be a stickler here, but if that turns out to be true,
>> usbnet is not the only driver that has this bug.
> 
> Shooting from the hip slightly, but its unusual for a driver to start
> link monitoring before open. After all there can be no packets on a
> device that's closed. Why not something like:

It turns out that user space wants to know whether there is carrier
even before it uses an interface because it uses that information
to decide whether to use the link.

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=444043

However, it looks to me like the issue is specifically
queuing work for kevent. That would call for reverting
0162c55463057 ("usbnet: apply usbnet_link_change")
[taking author into CC]

	Regards
		Oliver


