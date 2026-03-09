Return-Path: <linux-usb+bounces-34324-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFm8J1kOr2njNAIAu9opvQ
	(envelope-from <linux-usb+bounces-34324-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 19:15:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BBE23E728
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 19:15:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3112C301068B
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 18:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 680D8342C98;
	Mon,  9 Mar 2026 18:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OePKG/MM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF9C33D6F0
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 18:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773080143; cv=none; b=ap3cV3BpMAv7KkI988YfsA4o/Ys6lWZmrTDAwQeiO/OAK+C6Uczyjudlunh55y4CrOfUFlZJ4ppcTMltVfDUeQPGr13pZkkFPfwW90ybByNH7XQisVG0Vqp0uAXw8VcyM8MgXpbeHljBVbM/1rvxcM7nU83lwIO9F3xrVZmnuoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773080143; c=relaxed/simple;
	bh=DrnNhO9YiejBPR79fk6YWMRGSRi8LbzEUcT2iDql8qo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VwqwaRlby5FSHQq3GC+SYbR3EN0R08JQfBWUWvzkS85QCfAXLxagBHe3I28e7cEDPpcDfEBbwLp3s0hLmx7SvnNhwzrK1w1ygKQdhFz6ZDz+kdSFMEH3a1ZP4V/TRsankN7XQVnb0Y0ZBTB3ch0xL8zXUJX7MBdOlNrnVZlJjt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OePKG/MM; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2be27fa54feso9612422eec.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 11:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773080141; x=1773684941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5v05B0dL6f+blImA08sWACNd2Nsm0939zAh2hm+b4Zo=;
        b=OePKG/MMbOikwH5zyneGFvjfcjD40RR7QKnWriZajWj8x48zRx+h3lxLCmo3cuWosp
         qHupE10JCtD+AGbHqetBr0kGJgBKLm1eqver1R+NkoGjZIDy5LntWqrSkgGJH9VgR/w1
         FQF9vaz36hVUgaW3TI4R5Hf84NfF6uAToJbvyUeodqEkLcmZUDhdEuIcH/OVegONx0P5
         TBlCXsVH1VHVVe3hrydxE+lEcQjlRE1MdvyCRyKLmiWH0KCt2z7fI5ql7zpk7ehdQGLT
         IQrPEfCt2jCsBCLGl/V9zGNUYNVM7EFxDpr0j/ujwU5qT6U7q8UeRE6suhqnXI/LKA0u
         mkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773080141; x=1773684941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5v05B0dL6f+blImA08sWACNd2Nsm0939zAh2hm+b4Zo=;
        b=pn9KWlEpfaX4x0LpLNo/HWa94dHeDb9RUfa5Y2CE8tzlnXVO9F0rmP+erkFlxXgWdz
         wAHgtcLMF2PxD7Zef+SojvwaLXwBdoNvm4itZ2dmGLlcbl2uROS2M4E06Z5/rjMJH5H8
         PM4NGco4lUVZFGDW5qvULoOFI6PW6dIe/71JpnpbIbaB3M7rvzmy7ZMIC010DXEBQB+V
         8ngm1ec7A+u/vdp2nqxteOQUnE6Vj/VG0xZOmbXRTBUuFktUyyskCYrpL+b1zPTza/yd
         UTAIl7TDNyJQgrHMPQizlVRxB3rk4KGFw2W4JBRNb8T1MP47GFBD+xKx4lVxTx+/ElNq
         WKow==
X-Forwarded-Encrypted: i=1; AJvYcCX6fRpo5/gKR4LqUw0HCUDP1NfxuvH3FE3DBCl3fDQtTfzurkX4NBLqc60CKW55fncXe9CBjur4+Bg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkBtToZbBPhP+b0nHjbNAdaOLWyhCMujr2wCpgDlzuUtjyFk5P
	gA8Zs5OYQIIZGSDMEFNR9FwzWOWE9hAyuUq4gkiq3Gyv6ggxqFHphd2XRYGHcGKF3Q==
X-Gm-Gg: ATEYQzztWV6u3LDNGA+aWyf4g3RGhWOzyrjpJl/95F5cE3/myg/32O9qBC7WCDOO7Hq
	ykMzShVcJjODToaMII8hoWORGgmsaErOkhpGy4w30aXj+h3H3h8n/LgjGKUwcPAMpiWkZxw38+o
	glD6/qo6NpekVVapO1obtiaxKQcpWFdVyeRTRDu8tw+lMArvNkzb4Jj3wTJvk4hxX1FjBY8nYxP
	gZeCXVQcT25wIsmGn3OeUIYZhswkCgp64iGAIhmVnzr2BYkhLvGteVx1KqFff/H3XfrleLfDPQ3
	/wAp6IvPiDURcOU9offBCupbNrjxqTjSuSmmbUDx/4cVSYeLx8fbPzGEW0ATDwj+MZIL5VNAH6S
	E+WkIZIv8ORU1DgTGCqCjwnv1WdPzHBYLEd2Nbqr1dusLGyy9Nkh1i/zRTgDKDh9K6Bx6wrao+4
	rHhA2iiJzLDNc2nmpDGNxPEWOQz+GdHZASoMGLm8pafyqMhrilukq4lW8+f5axRfghRHPu0j9/F
	9LTPGqj40FIIVshz1EvRWvU4w==
X-Received: by 2002:a05:7300:6da2:b0:2ba:8018:cc62 with SMTP id 5a478bee46e88-2be4e0abd99mr5228221eec.38.1773080140424;
        Mon, 09 Mar 2026 11:15:40 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:8:237e:af03:2727:6f8c? ([2a00:79e0:2e7c:8:237e:af03:2727:6f8c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f82850fsm12031879eec.9.2026.03.09.11.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 11:15:39 -0700 (PDT)
Message-ID: <2034abb9-96b3-464f-af5a-d76b561c9b63@google.com>
Date: Mon, 9 Mar 2026 11:15:31 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/6] power: supply: max77759: add charger driver
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20260224-max77759-charger-v8-0-eb86bd570e9c@google.com>
 <20260224-max77759-charger-v8-5-eb86bd570e9c@google.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <20260224-max77759-charger-v8-5-eb86bd570e9c@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A4BBE23E728
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34324-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,linuxfoundation.org,google.com,linux.intel.com,samsung.com,gmail.com,linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amitsd@google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Sebastian,

On 2/23/26 5:45 PM, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>
> Add support for MAX77759 battery charger driver. This is a 4A 1-Cell
> Li+/LiPoly dual input switch mode charger. While the device can support
> USB & wireless charger inputs, this implementation only supports USB
> input. This implementation supports both buck and boost modes.
>
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> Reviewed-by: André Draszik <andre.draszik@linaro.org>
> ---
>
I hope you're doing well. I am sending a quick ping for this patch I 
emailed for a review :). I wanted to check if you need any further info 
or changes from my side.

Lore link for the patch:

https://lore.kernel.org/all/20260224-max77759-charger-v8-5-eb86bd570e9c@google.com/


Best Regards,

Amit


