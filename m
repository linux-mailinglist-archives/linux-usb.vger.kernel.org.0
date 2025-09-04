Return-Path: <linux-usb+bounces-27541-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF75B4349C
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 09:52:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FD6C17C9AE
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 07:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E3C82BE020;
	Thu,  4 Sep 2025 07:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GbqFS1YM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F20C29DB88
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 07:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756972328; cv=none; b=AmXv3CDXcUmU4lcQ5RIUGIg7A780WfPh5UmD7PQEH8Oa2L5Pzs/ZMSom6dxi5XGqir9bgPebJP6j8oJdw6Hmat63We+6e++okv3o9wIZ6dE8nFP6K7O9sVan1QeJaJt8n+/rm4O5OMhD+c1jcsSDv40woFBOVA3hGrbKiJSWY4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756972328; c=relaxed/simple;
	bh=QviSrVrxETHht7JJw/IhRoKKYggVSL09AR6USkbnVMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Neflx0H+fW5+tEYrmHyCWhxRuIOx4Tq8Wacjw2MOYxOXCOTtDm7R92bibZwMZ0RxsdVkrIYHnHkSgQdP/Op3lpDvoExMZMQ7cBo+xuXD5lDnwFsfBFCViwmFf/L7Rprb2b7GDOmoobSup+4gVUlGpnmFAa9IIOppKJjLrb8TIa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GbqFS1YM; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b02c719a117so129845266b.1
        for <linux-usb@vger.kernel.org>; Thu, 04 Sep 2025 00:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756972325; x=1757577125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bWRNFXHeRSpnlxKXSwDHA/Hv0MlPLNMzI+84KFHKbrE=;
        b=GbqFS1YM343huFa9FqlFEWnBakdFe3TDD6najYGbrExlu0KM+6UInABZSfqi4mzMN0
         JpI5JqgghicGORHd0/qmsK/sJBRUg+wKBchObQAoBl6khy/TV1N1CpAMjVX9DpOybouA
         UF9oCr8yzclz2iXJdTw1OFI7fKGswUhCw+WgKZTB7r0k75sEihO1kFxfZAG4QfyVKooR
         zIifluzd5L9XD23NWafFCXFt8iiJxs4pTlICjwC45ZfL0/MuifAXruygPFndbLeDku6i
         sNhVzOPwDIWy4ZX9+oEcYMxU22wzGAIetBFzBx0jjUD+6Sc4sRY4rvF95TTjoKo4AMoL
         SUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756972325; x=1757577125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bWRNFXHeRSpnlxKXSwDHA/Hv0MlPLNMzI+84KFHKbrE=;
        b=R52OE+Q1vxR9ON/A4MWCdtqwnDeAfwbjTdTul7TJIwpu8I83h0GT13U/gGlWSGeds0
         Dok6cY9KAQRsYG3tzNStXyZD6iUkJd/NuTxqBQkOn3oaAihQaPv8y0P650YPVRfKxznX
         G6utkJL1kZYPCKlxpNgffsRmwvnlDASC6ctDNZx6pEpC+ePkoKK1wfsuhAZPK6iwrKTq
         ybbT8htbXpQ0XODUhJ9IhKx41bQXlXVxCf2Ti6TEUGUPYPKdenA7rhRooABCq89Lp8k+
         RUMpTsx93FTJ55Jkt5sfT2NkOq0vDyUzpDRdDS7htL1JFX5vFWX2wybZj3QMgZhtJQ4X
         Aapw==
X-Forwarded-Encrypted: i=1; AJvYcCWNeQAYKwoL560XTOVlxJsKwq00qa94faXPYKvzL17pdWst39bvuoW4Y4z2gQuHUruTK6wcAIXonAo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8d28a8JxLSD2uWMKbhvSaDuFD4Pc6iWuUYRUnOoGtrSIZ8nHz
	YqFmfZ572MEk6npvmW01Z8UscBOEu0RP5d2AoA+kHWuVppGPuwn65ATy691m+zy0TZk=
X-Gm-Gg: ASbGnctjQblDLgh8KsTQuQ97XCwm3fe+/H9C59aWaF6Uz2/8GZjsJT3Ge+xph+c5ND4
	iDrtKAHQRFcXszn2E0XlKAKx05zQoGLC9VJpu+Q1Tf1AbVi44BYWhOPTeg9UD/AgdVNQAbGCvJt
	jaigyrnGK+Bt8lWkPIRJ7Bgu0Z2p1KpqC0/b0cPmLFqvuIcSgHvh+2BgAmUI4qoV+bHsyKhb3lc
	OaBDjRExtadYsWLIJ3QiqDLbQrrfyteVmO7kDpnconIv8I/vnqNkBypWez8+L3Tg3PfC/sCU5Qz
	UPZvPamRZEXN1jy5o5nHWLWdwpCXFCqh3em7TftOYYrNCBaA7Dy9fgbuL9mjfCmXlu7Bwgo9o6S
	YJzYwpfdQAi7Y3fL2re2NLIW5rqncxTv7FBnucGfG5TFBw4rtbLPAzWKm0okZQvn2s3uQ/gA+FH
	K84w==
X-Google-Smtp-Source: AGHT+IFz8/s9RU6uLx7pNVkdcxeMAszRCrGtrk5LnHQVCVYMW0GhdVfKmyVuAlC8x0iEfVxQ4lT24Q==
X-Received: by 2002:a17:907:3c8d:b0:b04:6338:c94d with SMTP id a640c23a62f3a-b04633912b1mr602235266b.12.1756972324708;
        Thu, 04 Sep 2025 00:52:04 -0700 (PDT)
Received: from ?IPV6:2001:a61:13cd:9f01:a217:cdfc:46ed:41bc? ([2001:a61:13cd:9f01:a217:cdfc:46ed:41bc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b046e6c630fsm292433766b.55.2025.09.04.00.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 00:52:04 -0700 (PDT)
Message-ID: <4bca61b8-71a0-4a8b-b02a-a8e6f5a620de@suse.com>
Date: Thu, 4 Sep 2025 09:52:03 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: usbnet: skip info->stop() callback if suspend_count
 is not 0
To: Xu Yang <xu.yang_2@nxp.com>, Oliver Neukum <oneukum@suse.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org
References: <20250818075722.2575543-1-xu.yang_2@nxp.com>
 <663e2978-8e89-4af4-bc1f-ebbcb2c57b1c@suse.com>
 <ajje6wfqyyqocpx2nm6nmw3quubmg5l3zhuxv7ds2444hykgy5@xbi7uttxghv2>
 <ttbjrqjhnwlwlhvsmmwdtzcvpfogxvyih2fovw7nl5bk7hfqkv@4cfkfuuj6vwr>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ttbjrqjhnwlwlhvsmmwdtzcvpfogxvyih2fovw7nl5bk7hfqkv@4cfkfuuj6vwr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/4/25 09:26, Xu Yang wrote:
>>>    	/* allow minidriver to stop correctly (wireless devices to turn off
>>>    	 * radio etc) */
>>> -	if (info->stop) {
>>> +	if (info->stop && !dev->suspend_count) {
>> ... for !dev->suspend_count to be false
> The suspend_count won't go to 0 because there is no chance to call
> usbnet_resume() if the USB device is physically disconnected from the
> USB port during system suspend.

Sorry for the delay.

While you are correct that a physical disconnect
will make the PM call fail, you cannot assume that
a physical disconnect is the only reason disconnect()
would be called.
It would also be called if

- the module is unloaded
- usbfs is used to disconnect the driver from the device

Hence it seems to me that using suspend_count is false.
You need to use the return of the PM operation.

	Regards
		Oliver



