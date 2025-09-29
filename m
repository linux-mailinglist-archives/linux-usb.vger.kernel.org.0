Return-Path: <linux-usb+bounces-28777-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A90BA8FBA
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 13:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B9623A4B27
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 11:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9AB72FFF9B;
	Mon, 29 Sep 2025 11:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="O+1clHQS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408091373
	for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 11:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759144528; cv=none; b=QLaOOUJ1U3mlceQr+zPgu5AgIrZQgozBuMnBNSgj+U6Z1etIDwGxEdet8Wm1BfzYS7eIcBYHb0kQpWDxSUaS024a1j3GaJBq1iYHVwARccGWkeLv1TQL+6xWpCvxWcgu4DqxnVoZRj2LXECfsJGYkrCkmc0fZZCtqslAV+LFQ7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759144528; c=relaxed/simple;
	bh=h3/UTG4XkimSkzuTqoSelXZrRu9xdoi2NXZzzLD8Xs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n3OKWL5dEgr9awhFQUxyja3ixmTYJzo53ior6qYf1CjIjz73eENaCKAPmUGMa1hxXwIgCT2zvUkYFmlNg5Z5hlcFBQeBPykZjdoBkR3wgiTmE0gfh6m9ljE7Jd0k94wTv4EQb58idbhzXaeqvIlmzpJKJVPrrBWDTHlfQ3YGa+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=O+1clHQS; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-62fbc90e6f6so7888334a12.3
        for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 04:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759144524; x=1759749324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PifF24bdCajykuJnMbWaG4hKvbpCIsKH6sxZ8dNTu4w=;
        b=O+1clHQS/2tJrwWKhpfbykq0JK5b4dynaBEXQxWJtbUug90OrpThqp9d0AKacyI7Fg
         F6kTfmym8lEAf+bzcsuToj5sjIMrk0jJXPO3GakTYrIjlO4RqlBBwWTk5bJYBn3nRuj1
         L0JnjkJE71v2pvKr3DykclODxeWUHOcnhbvThAB0+kqTloTPAMRaKp0hIHWWb7CJlry3
         cCp41hpZxvSnpQJAiNTB0JMPuOqXmpzSX2KsOJZgYe8tgWDlqwlpgdpJo+PDxAcvVL2r
         eZTZGsqOGcF6oJ9ey3pIZF3B/OgppH4b2iAx4ZelESRkao1mECU7tB4+bIcYxv8FA4Q6
         6Y7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759144524; x=1759749324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PifF24bdCajykuJnMbWaG4hKvbpCIsKH6sxZ8dNTu4w=;
        b=IzEwyQjJnfV7bdCQWVhQO/tobor32SpWeq1uM9iFZQZm5jTKyhjDNfleEfGK9acpHM
         LlTHyrlatBD2Jw7jvWxVBbf4KMgxoK892Xi72UdVobh0hvez1gMZHsPMiH90RL8GcqYh
         u/F3KkGGh/IpAqTpBLEqmRC3YrEYIXGwiv9887du/tJw0qyHGVxWjEkjNdSkhuSJKz4s
         Ko4X7rGe8dTa2kNGkzsEDwnp20E+WcwP6aHA7dx49RmdPWDzhOSyFD8XB9Wk0ntHZ9Yd
         2XpLvUqiCmGxj6d/3HV5djN58huFHC/UiX8MOfdE3T21uVAK93FxuUAHq+X6JC6YXH1r
         Wf5g==
X-Forwarded-Encrypted: i=1; AJvYcCUekXkP69sK+dNsah8vLCrIj6v7/2nr5UiPFrwehidr3nuc+Byos/OI7a+O8SI7TM9cyRWSDjYcctQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTHJUgONf6+rzeoVLPTtlATHfli0mWTEbnQlEtPgM+7g1vxOxc
	kz1COXPd6AJspFW9tnO8yh34DPMlNYeWk6izBcLBACJABCRZw7w9RIq3O7xB+KIDPmnM6SuLFtB
	I/2aC
X-Gm-Gg: ASbGnctFcHYwTMcr8nzXIMyG0n8ptFs0FNteCLBOL6tiMVm18jG3Rvp2mcWC1S6rlGx
	2ge+lPz/ckdL5CEtt84di9TpePL5sady4+I22idoJlPQX0CRxvoj23ibk/BStraJ8j98dH1R8rd
	x7HMPTcODD3u0LPYe6wm1RCqxEbW1iwiVTWHz7mH+TWGSKcx487H9RPaxE3j7xb7a6jD2M76+wq
	Wkqifzb2tD9jrlu/HrRc9FadJhuVdVn5YQBLVBmwC718wkgiOoojY3/hE57IGoNm7RMuQQoqym7
	uV8g9EUTl9lNcl45Qlk2I79EUm7ny8bsR7DJ+hYczSZD4odJz7CJzvB5Oj8YA7+BjwxSzku8tCt
	cUvxUslSmhCB9MAYD6SO1UGLKKS7Nh10HsvOLG4U/PRMjVdwH8Q9XMD0C
X-Google-Smtp-Source: AGHT+IGKtfwVrcf/9LCpdhNG5Odr6DXnkk/naEi01kTwxS6i/QfpYsAQbOXGFIMNLYg9a7IpP8c8Dg==
X-Received: by 2002:a17:907:da9:b0:b0c:fdb7:4df5 with SMTP id a640c23a62f3a-b34b8b93d6emr1919146266b.18.1759144524527;
        Mon, 29 Sep 2025 04:15:24 -0700 (PDT)
Received: from ?IPV6:2001:a61:13a1:1:4136:3ce:cdaa:75d2? ([2001:a61:13a1:1:4136:3ce:cdaa:75d2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3c9ab5d70esm319990466b.21.2025.09.29.04.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 04:15:24 -0700 (PDT)
Message-ID: <cb280dca-b652-4fae-8a3e-d4c5a4e1d251@suse.com>
Date: Mon, 29 Sep 2025 13:15:23 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] Revert "net: usb: ax88179_178a: Bind only to
 vendor-specific interface"
To: yicongsrfy@163.com, michal.pecio@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org
Cc: marcan@marcan.st, pabeni@redhat.com, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, yicong@kylinos.cn
References: <20250929054246.3118527-1-yicongsrfy@163.com>
 <20250929075401.3143438-1-yicongsrfy@163.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250929075401.3143438-1-yicongsrfy@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 29.09.25 09:53, yicongsrfy@163.com wrote:
> From: Yi Cong <yicong@kylinos.cn>
> 
> This reverts commit c67cc4315a8e605ec875bd3a1210a549e3562ddc.
> 
> Currently, in the Linux kernel, USB NIC with ASIX chips use the cdc_ncm
> driver. However, this driver lacks functionality and performs worse than
> the vendor's proprietary driver. In my testing, I have identified the
> following issues:

True, so we prefer the vendor specific driver if it is available
for a certain number of devices. We accept that as a given. The
exact reasons for this preference do not matter.

Now , lets look at the change log of the patch you want to revert:

     Change all the ID matches to specifically match the vendor-specific
     interface. By default the device comes up in CDC mode and is bound by
     that driver (which works fine); users may switch it to the vendor
     interface using sysfs to set bConfigurationValue, at which point the
     device actually goes through a reconnect cycle and comes back as a
     vendor specific only device, and then this driver binds and works too.

This tells us that usbcore selects the wrong configuration for these
devices. Can we remedy this via udev? Not well, there would be a race
with the wrong driver triggering an unwanted network setup.
This would be better solved in usbcore with quirks.

	Regards
		Oliver


