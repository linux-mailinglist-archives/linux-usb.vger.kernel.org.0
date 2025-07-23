Return-Path: <linux-usb+bounces-26104-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DFBB0EF27
	for <lists+linux-usb@lfdr.de>; Wed, 23 Jul 2025 12:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CF8E1C8635D
	for <lists+linux-usb@lfdr.de>; Wed, 23 Jul 2025 10:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7442628C5B0;
	Wed, 23 Jul 2025 10:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EktbJzhf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33ED286D4C
	for <linux-usb@vger.kernel.org>; Wed, 23 Jul 2025 10:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753264992; cv=none; b=OlkKU6mwbX1/MsmV7dtq/UoX98N9nLBgPMP15E5TThjwibI0+6YuBNL/byz757wxx3RJwup+pnFFroeCZUJMlybi+wH5iGX/kHUML0uFQTclQyXQgJslRDGmiS+YHzItieBNBL+nBX60FQJIHEefYtDCdT+vzzO5bqUsMNogwS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753264992; c=relaxed/simple;
	bh=FRb1qiH3o0lBrK696PgM2GZRUTuGEcb/TysNiZWRTjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GhX+phE+Q1BGtVQh7en6T2iptULaI7Ndo1UI5HEUbK+M1H4q0Xc8zQcgQwvVajVs/yttxVCOxWWCUoxjthb/6gHOISIqLlJAPRvdEfpav4n+wdbBjXg2IEIk/S68hivBpc9Bnmy/mYowrYOISqoXpsUhW8sSO38trzPv+fK6+Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EktbJzhf; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae6fa02d8feso942442566b.0
        for <linux-usb@vger.kernel.org>; Wed, 23 Jul 2025 03:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753264988; x=1753869788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nM1jVIuamez5M+6HVwApfA2A4Uhe2e5VzTRsWi7W/gQ=;
        b=EktbJzhfucvM0krtabXvgfc80xq9eDf8l/eN3xz/1Nzh0+5Zm+mU+B+oJrqnGPk8b2
         tum54brUGd+VXs0PnXDQGNrw3mfZNWWmvWCCzSCHN0XJ4dRhy+D3roWwJUoKsuLdassn
         hfzCtsYyngpOFOZf/6U7Nx0EBWcBBE/SiDX7RwRFzXgMB5RUVy7VZDpJlQTEGL7A2T6j
         w1rzDYpR0IF9QqzUDkQB891E1giKEfPpw2gQJBCpTON5H5ZBTfW754ExipJo2gPX95Ys
         T2O79TOC0/Pbci80qb+owp2EWPDj518BDWlndT8p3I0/1fISg7nxu+qRnKVl4CUybM0S
         WUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753264988; x=1753869788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nM1jVIuamez5M+6HVwApfA2A4Uhe2e5VzTRsWi7W/gQ=;
        b=GZEoQPu1n3NgcpSUhOs68n8kWo9N25Bxu4WEut9nx3MSEeDaBOYX0VFlBYMjeAf/9B
         AYHcnnNP5oXR+fF9vIOVUvLkZC5SwHUOtEusdK8GjZVGL08S3aCS79grpTVYmbPfHUYk
         6Lv8Xbd9rbUBmNY/jF/Kvachb+hNzaJaZg1S3ftFocWipbCMH1WChsBjtjwzAqxZrAcm
         8i3Gw+TVPJwPpVbLS/egFRgZLbDTkDAYemZVgkZiFOpx/6KcEW0gBLVOXt6cTVkYNepp
         VD4S0Uu6mN5g9gyG0co4+RUILIudeYmH/Ab8HUHAbkKj3fzYNg3ZOcLkJA5SM1t+f8px
         b9pA==
X-Forwarded-Encrypted: i=1; AJvYcCVXrpCbXhRsJWSWHDCHX/OUdxWYCVEjv2dYdMia5PCziS8/kM9oeQbgdsOHRyI/i4fLMchBYb0PZs4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhxMZiSoWslmtp9qda9nO3ovvclakYLOiJ0QtJe4/JpuSz6yVz
	WPdejUaTlpnJNLdvdU06dsE0ROuqqOk8/78udPMUP6WOS1GYsm6FYJ58laMPlcT5LrE=
X-Gm-Gg: ASbGncsvwpbq5pIhneyMRyTTrfle8PkoTxqUANylBlU5mW9x9uVINQOGzDNBV4+XIoB
	srgzcweGy1k00oZMD+2ZJ7oH2NYebRbLzc68YR4ksWPpRxwu42GfQrC9uKqvXL1lZcVfPC66X22
	IUwU32WkquOH2AabOR9kyvqHCv1zR+dbl5X7BxSucsT2pdH635H4CELQDPKlwQGcAUYIBmjP1Ti
	mr9AfE4A+dC4RZTwWMeZgcV3oVhDqpPpcCKZ66WmQfObteQj5Jp/p3kv2SaKsi7PCLnXXXBtMHV
	kFL4AB3/B1O7Mq7yuG4/RsP2g3FbI0SFgCoFMcIUqT6a25gM3B84W+xNBQs16GJ8+xQFG6FoahH
	93/Wa1NN7Xp9CGYnT9oRF4sue0y5o4lAzugnMct5MGbhDKuRO6FakpvFoQUSbhs/E
X-Google-Smtp-Source: AGHT+IHfkzSwbGur1NwDeKeURLOKGW+DVfaaRz59/h5ZYqfN8olyIRuFnqm0vC4m7ZjmRZpOt3tqYA==
X-Received: by 2002:a17:907:2da8:b0:ae9:b800:2283 with SMTP id a640c23a62f3a-af2f6c0a946mr224628566b.15.1753264988234;
        Wed, 23 Jul 2025 03:03:08 -0700 (PDT)
Received: from ?IPV6:2001:a61:1375:cb01:9949:2e73:6e1:36f7? ([2001:a61:1375:cb01:9949:2e73:6e1:36f7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c9071069sm8158777a12.50.2025.07.23.03.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 03:03:07 -0700 (PDT)
Message-ID: <77738f53-591f-4cfa-b65b-9789911ca4b3@suse.com>
Date: Wed, 23 Jul 2025 12:03:06 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbnet: Set duplex status to unknown in the absence of
 MII
To: yicongsrfy@163.com, oneukum@suse.com
Cc: andrew+netdev@lunn.ch, andrew@lunn.ch, davem@davemloft.net,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org, yicong@kylinos.cn
References: <6373678e-d827-4cf7-a98f-e66bda238315@suse.com>
 <20250723084456.1507563-1-yicongsrfy@163.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250723084456.1507563-1-yicongsrfy@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23.07.25 10:44, yicongsrfy@163.com wrote:
> On Wed, 23 Jul 2025 09:17:02 +0200 Oliver <oneukum@suse.com> wrote:
>>
>> On 23.07.25 03:29, yicongsrfy@163.com wrote:
>>
>>>   From these two tests, we can conclude that both full-duplex
>>> and half-duplex modes are supported — the problem is simply
>>> that the duplex status cannot be retrieved in the absence of
>>> MII support.
>>
>> Sort of. You are asking a generic driver to apply a concept
>> from ethernet. It cannot. Ethernet even if it is half-duplex
>> is very much symmetrical in speed. Cable modems do not, just
>> to give an example.
>>
>> I think we need to centralize the reaction to stuff that is not ethernet.
> 
> Thanks!
> 
> I think I understand what you mean now.
> You're suggesting to create a unified interface or
> framework to retrieve the duplex status of all CDC
> protocol-supported devices?

Well no. We have to understand that the difference in duplex
status apply only to a subset of devices. In a way the network
layer is deficient in only having an unknown status rather than
an unknown and an inapplicable status.

If we are to retain a single status for simplicity, then
I'd say that the default being half duplex rather than
unknown is wrong.

> This seems like a rather big undertaking, and one of the key
> reasons is that the CDC protocol itself does not define anything
> related to duplex status — unlike the 802.3 standard, which
> clearly defines how to obtain this information via MDIO.

CDC is not a network protocol. CDC is a protocol for talking
to network devices. CDC can define a way to transmit duplex
information. If the protocol under CDC does not have the notion,
this will be of no use.

> Coming back to the issue described in this patch,
> usbnet_get_link_ksettings_internal is currently only used in
> cdc_ether.c and cdc_ncm.c as a callback for ethtool.
> Can we assume that this part only concerns Ethernet devices
> (and that, at least for now, none of the existing devices can
> retrieve the duplex status through this interface)?

Yes. It is not really that important. But strictly speaking the
network layer is using the wrong default.

	Regards
		Oliver


