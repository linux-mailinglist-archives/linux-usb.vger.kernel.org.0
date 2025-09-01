Return-Path: <linux-usb+bounces-27414-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5668B3DC02
	for <lists+linux-usb@lfdr.de>; Mon,  1 Sep 2025 10:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4D4B188B5CB
	for <lists+linux-usb@lfdr.de>; Mon,  1 Sep 2025 08:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79FFE21771B;
	Mon,  1 Sep 2025 08:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PX++ZFI4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043E02EE60A
	for <linux-usb@vger.kernel.org>; Mon,  1 Sep 2025 08:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756714214; cv=none; b=B/WZ16sczcTUZkYkauzpTVxiZsH7g+b+c3KLEnhQowTWUBGtiGvlB+/4rzuGhV7RrHzFGu4ks+NYPxQTMdtRkurEfw405zU4LuY2L6AMXMdC/9J/Uhk5BtqgGBVvVOl98um1fE6M3dpjOBxOFDSXSM1EMQBw4ae9lieZMaOqGKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756714214; c=relaxed/simple;
	bh=GOCVLxhdyYB7KaTBpnGohfzlE7MskSwBmBSwBfVdmPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FquuVoFFLC/gX/oh2d5AofyKmYbdt5oyel/Z9/4ZXBk+o1kEn5aFANwsk9+Nr4AUGJ3o57ELFCF1jx7QHVYv749XTHAe4cWGM5pSd2Iftt8Ab1vzT4jIZnXQyXaiYM0S+q+04/2pp0tOFg+0uI1AHo44KhT44JfzCBvAumEZp+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PX++ZFI4; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b8b25296fso6123255e9.2
        for <linux-usb@vger.kernel.org>; Mon, 01 Sep 2025 01:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756714210; x=1757319010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ld30nTWYMhblb7gZbUBZiYF7nWKNCb3Ye8OVN8o1oUM=;
        b=PX++ZFI4dwx27P7vBf1qaNN+xcqCj3MdpvkIX+x4JFS75Ea7qIpqx/BzMHpQIG6jmc
         FgPsE8LGtQalEoILuBH2Rdd9ikd04NCC8ozDqwCNs39WeHSiiwDdsLlWvaW2Dr4aXbMW
         TX0Ez/8NSCVyzTQSsXStp0xIvP1tH7qXgAdiwJAVSHGjhjHRudRiNfRpYYDlOamfJpJe
         vqAFpsInIA75Ev/tbgokwqPg3IJ9vwmoJzWv7AU9nMZT+y/VXnnFEj4JC8NLcBoNU9Rb
         snpwWKp5GAv/gVnp18cBm5iAuP/WiYdJCrSLiPMZQdD4h8Rqx0ollAQO1fvLg+Y3PNWv
         gLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756714210; x=1757319010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ld30nTWYMhblb7gZbUBZiYF7nWKNCb3Ye8OVN8o1oUM=;
        b=X+dlBFGBJBd7Xc/uBEv2vT5+5lr2Yy/gprEZ5x1ptwDgx01Hi64rCq7Xb4DuV5yhqn
         ff/VBothgzdFUfkg0DM28W3gAO/RDttZtGvPtgVrgoeyHRpmLBmY/7wkZcBYfgJbUEAd
         3cBE+fK3r1Se0UWnsdl2NvpIoM9vVpSOm/5oUn9FkJMkDrj42ynKf4IzlgJNXCPttBS4
         WuOnwa99a/nZXj6R7R3nUSDg5NoT4yFDnA8WWTxIAnqYjsBaR3+DLtKtIz4mLkrLVp6p
         t0AmN/Hw1Gy8Xl3cKGqCmXwEBy5ndlueCsQmfkL05cBhDqHhWGgaM8TPIuNW818oqzXn
         kc1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWN5e/v1OxJnARMFl8S//HDTrH7BbCAb6EPzbz7e/3gXKXeEn/hsbah7gW6Kl+v9bauuX8Oa5mZtBM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yztpz8ArT8BFr8qBcSF1LWhP71vKLcun4DASL5eFRJCwuGoNvh5
	77BI+DKEWbbXa1ng0IC7yMLeuHmlMKmFd/vH1SV+MWOJfipfKjaRsl8fSx99N7TRe+GjySxYrij
	AMJ+g
X-Gm-Gg: ASbGnctDM17XbT/vbQLK/Mdnt+FI4pCLAjsSruSrTQeOF1lAx+O8Yf3y+FMBjQK2qtU
	K3egRr7EgYOSz/V3zhkzoQ7aRHREIWMtND71Q/C9MLEVioUqDiG5kz8UgWmSeYYS/NYLwUG1p1L
	NB068hENu77F0lw0nUP5YXEv+/tXEm7tE9ruNzp5XcD9SqcoF+vfec1eWVjjRyw+2xtDguZnMXg
	aj+JEuc9w5Y1EBJx3ECPoj0o7EC6UnVwCaM9grnRac1hcOuAe1SORGGH11mSE4g52ypbErFv3JU
	5FH5LqeTwO2rIm2pkFU9tXIMa8A3ktED2CN/S7eBkqbczihjNfj87oIxXdgIabFzy6XA35wawSR
	JHQrF56HCjZhz+TMJyw+maSnCb0Co8lmYrTQ0mokmf3BZaFw7F8Q+hTaRxsp77Y5RfPbIGaUgOg
	4UVneoR3GGAvV0
X-Google-Smtp-Source: AGHT+IFigpnG6jSn9yL+4Jz61ciZdSSt/rFedQBnVnmzRAOzSoonxIGGForgO4rBsT1YENgNggKTkw==
X-Received: by 2002:a05:600c:350a:b0:45b:8b21:ea9c with SMTP id 5b1f17b1804b1-45b8b21edc2mr34394895e9.36.1756714210317;
        Mon, 01 Sep 2025 01:10:10 -0700 (PDT)
Received: from ?IPV6:2a02:3033:26c:df97:bc62:c66c:7bc3:9ad5? ([2a02:3033:26c:df97:bc62:c66c:7bc3:9ad5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7fec07sm142484965e9.10.2025.09.01.01.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 01:10:10 -0700 (PDT)
Message-ID: <86eeee11-38c1-4754-b72f-7606b137d426@suse.com>
Date: Mon, 1 Sep 2025 10:10:07 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] usb: storage: sddr09: move write buffers into info
 struct
To: Alex Tran <alex.t.tran@gmail.com>, stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
References: <20250831192247.1120619-1-alex.t.tran@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250831192247.1120619-1-alex.t.tran@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 8/31/25 21:22, Alex Tran wrote:
> +static int sddr09_init_card_buffers(struct us_data *us)
> +{
> +	struct sddr09_card_info *info = (struct sddr09_card_info *)us->extra;
> +	unsigned int pagelen, blocklen, len;
> +
> +	/*
> +	 * blockbuffer is used for reading in the old data, overwriting
> +	 * with the new data, and performing ECC calculations
> +	 */
> +	pagelen = (1 << info->pageshift) + (1 << CONTROL_SHIFT);
> +	blocklen = (pagelen << info->blockshift);
> +	info->blockbuffer = kmalloc(blocklen, GFP_NOIO);

there is no reason for GFP_NOIO under these circumstances. Please
use GFP_KERNEL.

	Regards
		Oliver


