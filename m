Return-Path: <linux-usb+bounces-33656-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wL+5FrCnnWnDQwQAu9opvQ
	(envelope-from <linux-usb+bounces-33656-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 14:29:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8075187AE1
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 14:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E1A73091CBC
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 13:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D6537AA9E;
	Tue, 24 Feb 2026 13:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXNME3gS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0812339B4A2
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 13:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939619; cv=none; b=RdTvk4AfLii6xxR+LK9Jj8QrmE3Jv77DWyuE3A1a/eetwFUTFU5GIbwlTf3fWEhbWmYgCIeozi7sUfvfYgrrMUzcqpREBoMn5gafyBuby8iVHrAcN+zApvhNJeuXqYuI+vxDdowRUuVg/a/7v9sAcy+2Qh6BzYFLYZC1VGKHwSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939619; c=relaxed/simple;
	bh=1+VktEHjhEzBWZIfIGMMs9nExudiXlrpIxMlNVbsxj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o1cLWFHydtwpFUT3QSp31CNNQsaGUpl1NBlGJmMb8YjO61bw8X+HNDCbpzFx32sFDQN8e7TkKVtRAWSRsSeErKfK/4tdOU+Rt0DUaKuPopPoKkhKycnpnn3a9vqKC2Wu+vDeAXLDE+cBBm9p0pYHygsnZBgjjv2Uf0EKlOIbNko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXNME3gS; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a79ded11a2so37743315ad.3
        for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 05:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771939617; x=1772544417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xCO3Ogmxq2y04MykS8IhStihhyv5MO+vrYW/wEjEqHQ=;
        b=BXNME3gSZv0RexTvq8ZBxhfsOjab2SBu68deFakRBThmpRe+9zlqMn6UsxC19NtB0p
         QDj+Efj/mGtgfwgfTPTP0YYNXKiq/7Jj7B4ht/vv348SUE/1CeQzxTBgR4PyIBSOtm1m
         QVjoXMf+nGDjdBOysjZTqDUrYanHhOgTFI5fvzaMskiekQXG5GpcEYqJltYPnWavaPQG
         Kh+0Zt/ojSK6jvs3iX6kdbMFhc1zi2FclL+mO/9A+IpOJieo6rcZCXLS3AdbHPBxnqd7
         5F5oUtaPmPddSSlUSoAh8TCcyx9YlFHoF/rLoxMWkwSM1aD6M5merCkMNfFS8whkgfz8
         g4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771939617; x=1772544417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCO3Ogmxq2y04MykS8IhStihhyv5MO+vrYW/wEjEqHQ=;
        b=Yf3LM56nPf0VfinK+eyUoWIuT1BiaX8Qi7OXmsv7jUU2AXd00renShJ2y1kcYMVJbr
         FmCmL3vNKIrLr1uNqNgEozr1S9hWaG8qm0/tTqjSQ0h1R4k56ccyglaJYxGXyfVQIi7G
         qL+mOIIHxmGvgxjXHisr5MUM4gSLVgEU0Cl+1WbWNkH9M+Xiy05JZgHVe0nzwWiDCz4F
         kJ1zxhLobc9LzB3JEGWIFnJvvglxgJhk7nukcNa43wp7Dxaurkk3ZrcPmhX9W7mJV08R
         7y7Anhhn8DLeE0TPunxC9W8TZ6k8gJJJjtUqgxpuQ1SdGVZnsIOuniw1cueRtr2fSKxw
         FxDg==
X-Forwarded-Encrypted: i=1; AJvYcCXQSG+PvhlMc8dPJhcRFdX6QIN9wjD+sI0eOhHLgmsxxpEhYYWcWjnXca0KX9HExAWkXjJy1cy39wU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuJMtYKK3U7V7U+zooYI6HEpfgXSv8dc4X4OueL8C6kCiURxgd
	+qSlnxIAm17uqBKl7BAOXRTfytM/S8SR3sfFRzVgHyYDInZk0SxEvSLU
X-Gm-Gg: ATEYQzxVfMWKY+3PDoX2k/JyFtZ6ziNXRuYZstQPPhIog8mnkkkS7eXd1Z4usXrT0MK
	n/mVZQrtS76wshKRK+f956/czkWVSkWoxmz/0x6OjRx09u2vLAHBIS2PYOpB4zfSAEpQDO5feVL
	pmsVjWmzYoxqQhOZd6E833L+ZJU+VT4/YFL9/Mrw8FsZEAFjjIif5howfARlk6V+AVSvliB55Fo
	MaDOExgWhul00gkiFolexs6bbz7Mft3VPEJRyD7biubCBgwBcNX8IDnUCWxBbJcHfdibtW8PCsA
	p2vcj+cPNqgRhdmuUsh4jRC6xebLQYK0goXgfnFjC37bHLAkW+2T613EOHnIYAsxgQDPnUzED1X
	8tEuFShejkt5W7xcFfU3Hayi5cYq6tWIPyQuqG9DwUUwP7BaHhSnRdv+2t6PDLHPhPac+plr1sK
	0P51qPprqXcVhRM6qUcTZVYJPc35OjJtcLGinn1pH5034=
X-Received: by 2002:a17:902:db02:b0:2a5:8c1c:744f with SMTP id d9443c01a7336-2ad74525046mr127745145ad.40.1771939617251;
        Tue, 24 Feb 2026 05:26:57 -0800 (PST)
Received: from [192.168.1.4] ([27.7.171.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503d406sm103267245ad.75.2026.02.24.05.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 05:26:56 -0800 (PST)
Message-ID: <03e6257f-91a0-43e8-8759-47e8c79c3449@gmail.com>
Date: Tue, 24 Feb 2026 18:56:51 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: st,st-ohci-300x: convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260217-st-usb-v1-1-ba347f30d0e0@gmail.com>
 <20260218-loose-rose-anteater-01abef@quoll>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260218-loose-rose-anteater-01abef@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33656-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charanpedumuru@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B8075187AE1
X-Rspamd-Action: no action



On 18-02-2026 13:12, Krzysztof Kozlowski wrote:
> On Tue, Feb 17, 2026 at 02:55:34PM +0000, Charan Pedumuru wrote:
>> +description:
>> +  The STMicroelectronics USB Open Host Controller Interface (OHCI)
>> +  compliant USB host controller found in ST platforms. The controller
>> +  provides full- and low-speed USB host functionality and interfaces
>> +  with an external USB PHY. It requires dedicated clock, reset, and
>> +  interrupt resources for proper operation.
>> +
>> +allOf:
>> +  - $ref: /schemas/usb/usb.yaml#
> 
> You should reference rather usb-hcd.yaml

Sure.

> 
>> +
>> +properties:
>> +  compatible:
>> +    const: st,st-ohci-300x
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 2
> 
> Drop

Okay.

> 
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: ic
>> +      - const: clk48
>> +
>> +  phys:
>> +    maxItems: 1
>> +
>> +  phy-names:
>> +    items:
>> +      - const: usb
>> +
>> +  resets:
>> +    minItems: 2
> 
> Drop

Okay.

> 
>> +    maxItems: 2
> 
> Best regards,
> Krzysztof
> 

-- 
Best Regards,
Charan.


