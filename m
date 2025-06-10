Return-Path: <linux-usb+bounces-24645-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3699AD32CD
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 11:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68A903B88DC
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 09:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E264D28B7C3;
	Tue, 10 Jun 2025 09:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Pkud2SEv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5702528B401
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 09:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549201; cv=none; b=l0hz0numCA6NigXthPxGWyt4PHMgysC2+sHc0IR3br6Lnpwsz3I+gGoQC4FFRpdWx6FAv20czuP0wnrf74hCVewSCW4kd1EUy8WvzzJlWNz6+qvLm06InFUgGJtYZUxVW/xEXzJHji6UK21X0oqtwawBdm8JNfwFNh2nfxK4Y2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549201; c=relaxed/simple;
	bh=lf/Q0CP0+3JGF8skn4vJN8mCuS9rEjV0RqPQBwzodGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hXVIKC4/23wDUkMnDskz8BbNu2kJimZh6bh4MCwUmdTzxWDizwjYIDa4cnwK17B1WxsYvB/kakVSDpKqK4Hsc1X2fngMhyv4dg2Czns7FGHdyTlWfCkTWUaggMiQDh8eiDGNIMlCOtafF8VI7YTZRE/EzZnEXMzcaTYU21972JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Pkud2SEv; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45024721cbdso45425035e9.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 02:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749549198; x=1750153998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9IEkGDFBIs7IrBtufGEQ1UvIq45B77cgWp5iZKKgIpk=;
        b=Pkud2SEv4d5Zd8qEFxIsJJyS650FzgonHEnjoeteyOCLnwMNXSRVlxKjWX785MUMpd
         ISwCy07c2Xyt+xs2SKBEEBUXnSVsPFYI7QMzwMvP1hoDyWgDIDTSTXsgvj2vHiKkzleE
         6NYiFsKvp8XmTcSDh8RII1yggx0PS0yJ9tSlfOI1dmHE6UhO7VCYQ5yB72CJZZmQ/BFx
         dwi7ZZOtTRTNU5P8XdKAXRDPJvJEb8vnlPmLoTvj2TXv07o2BA+i/q1VQ2fvYVid3loJ
         exsJETJ1B+e6wctTjXtPfHGUv6Gm9NiTOe97p8WaLIBFxBvaGaQgABKn+nRHz71tgGdf
         N2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549198; x=1750153998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9IEkGDFBIs7IrBtufGEQ1UvIq45B77cgWp5iZKKgIpk=;
        b=WpDVEGW2RQU6qFH9g+OU2qgFxKsR5Yl8cCreVTLa2lhCe6LZBzc6iP1i5hHayMiAsy
         /1GJu60vowGmo8b6kREDrqRp0rCu8LimqMyKAwHHg9tgxc7MqLVSdeUwViTCtH4mXGkI
         9YUBmick69MOSlK3UMElUqxGUODv4i6luerEgeptiIBZ5unVAs9hbn4wboDjYEzrkIKV
         Uiuynl4YtwZCphoYNaiqGpZE1uDzqGxnFOIR1NcpvL3Dz04h50jeQKNiprdsvaEyQRyX
         h5KTj3OzKE1Szp2cGrwafbHB/DkO20Sc40f8TK/D6MrSWY0PDb7lJ4sKHVOrOyqRsYDE
         FO8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvnMfxiKkj0YElPauNuIbLpLDBw/Q5RBlBWDyOzdWpRaPiviS5A61nnV2YG/Bm6Ied1HupoCYUjq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdxdizZbATJub93BWoQSnTd9BbjEnwNV4ESzEV51p9gFHGU9Iu
	eSgdQyFaSXncptCZXdU96I+hlJJqLeSAlcE4EI2VvS1tqvu3sdl19RjSA0svEoq9RZ8=
X-Gm-Gg: ASbGnctkRhcaqzwMZYcZtSsMubFyhwsrAnO754xVvVNh7YpYazC3cxMnj5zkE+LfQTm
	oF02fEIDzgKxWsZKj9651h0zPybFQrfypT41fK8W8oKy/1W637O7LY9Wdvds6vkcs7tOQtSJtfs
	0Mk+kWE9DOoUHoxXn2/XGS30G7n19AY03Aj+fNDfwmvckjCzLukG5CGzcL41sc5IpldHMRp0+MY
	Vca9DJyF6fEU/zevVTtTkm0ATb0ZM2xkK4fj8bILCPGavAVyo9RD41DH4+Kp3tQPvFzE2fkp8mM
	mkw0OdobWb+BRlC6PZG/nynOKm8eiYUEBHbQfwFiirPBgHQ17z3aPEoMXgBbJ3mRhZRM1sNRBIz
	4JP7yvCkMdML2j98Dd+C0aWdOJv3b
X-Google-Smtp-Source: AGHT+IF43HoF+ckI+JNZf8sM8mBLEsIZIzrQldZAYBnhq+ZWk+6w2oq6oTjq3frqJQUO14CjjL46AQ==
X-Received: by 2002:a05:6000:40c7:b0:3a4:f430:2547 with SMTP id ffacd0b85a97d-3a55226cd6amr1466032f8f.6.1749549197729;
        Tue, 10 Jun 2025 02:53:17 -0700 (PDT)
Received: from ?IPV6:2001:a61:1316:3301:be75:b4b4:7520:e2e4? ([2001:a61:1316:3301:be75:b4b4:7520:e2e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532131df6sm11612214f8f.0.2025.06.10.02.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 02:53:17 -0700 (PDT)
Message-ID: <dc4e3500-b5fb-4aa1-b74c-c37708146c3c@suse.com>
Date: Tue, 10 Jun 2025 11:53:15 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: usb: Convert tasklet API to new bottom half
 workqueue mechanism
To: "Miao, Jun" <jun.miao@intel.com>, Subbaraya Sundeep <sbhatta@marvell.com>
Cc: "oneukum@suse.com" <oneukum@suse.com>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250609072610.2024729-1-jun.miao@intel.com>
 <aEajxQxP_aWhqHHB@82bae11342dd>
 <PH7PR11MB84552A6D3723B68D5B83E4BE9A6BA@PH7PR11MB8455.namprd11.prod.outlook.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <PH7PR11MB84552A6D3723B68D5B83E4BE9A6BA@PH7PR11MB8455.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.06.25 11:53, Miao, Jun wrote:

>> You can change it to GFP_KERNEL since this is not atomic context now.
>>
> 
> Thanks,  the usbnet_bh() function only be called by usbnet_bh_workqueue which is sleepable.

Yes, but it can be waited on in usbnet_stop(), which in turn can
be called for a device reset. Hence this must be GFP_NOIO, not
GFP_KERNEL.

	Regards
		Oliver


