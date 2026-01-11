Return-Path: <linux-usb+bounces-32155-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7D1D0F2C7
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 15:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3EAE23039ADA
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 14:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CDCA34A3DF;
	Sun, 11 Jan 2026 14:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="isTsJ1t8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795933491E8
	for <linux-usb@vger.kernel.org>; Sun, 11 Jan 2026 14:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768142661; cv=none; b=aiKxoVeqL14H4/W+xd3L6ibRbuN2F6wUq+nRQ3aP7h/uyEtLG3wf1EAX5Mo4pei1JtVW+7X7ZrhKE2oW7+m8pEKDp9jgnxTg21952MDaWt8DRDSvvS4AYRAJaYyu3DQOzD0FxXOfwLFWLM9v57eDsJQxS8AGiEtTdNCL23JJzbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768142661; c=relaxed/simple;
	bh=w4Acm3yPEzhNfgXHej8RhBm1qF1q4y2VgssP/5Zk1hM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZqMHefu0weqDd7xCRnRl0e+7m+fapiDdcRYoI5P4LE9JyVjO0Oq8hGSXAeguHLqbG2ww0BkotbKE6aer8yKIhmm7Ca7mTQoPtnUdUuP0kTwjAcWe5NcF4fw6htQpdwPG79Q1Av0t+5LIzAKNyvL2JqenHnOuXp+82v6ywBU7YZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=isTsJ1t8; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b72b495aa81so1072716866b.2
        for <linux-usb@vger.kernel.org>; Sun, 11 Jan 2026 06:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142657; x=1768747457; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vh0+NaFNSqUUr0lRvi0qh/0gFpaLfgRir9e/Vu9U7W4=;
        b=isTsJ1t8ThUdJlPcckoMxmOQN5p6f/iPi1Qz4+ymaOaMGg0HLRsEsqSZm3KEyOWwaR
         ZyJVvDBUIjMFYRKBQWAAqUA2E8lh2ITkmYgecHewN41dPFpOps4j1iduS0RDablFZa6b
         HpMQqEuK2qHm4wLB8ElCKvNNwpBajX3awNIIukUBvuu/LJEu1PULd34b1y6SP3deF3w/
         ntQWAuPAxbyU1xlmVWz0zMWNGEeFBHz89/gZfq4/2h+F0xF4+AreQNuoFSvgXYEv2bpu
         Oy7HVBxdxvC5W0dQ4KZbQxmbi94FjFBo9OMaPT1Trz8YzH8aDwWO3B6X+slFxjvyAKcG
         eCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142657; x=1768747457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vh0+NaFNSqUUr0lRvi0qh/0gFpaLfgRir9e/Vu9U7W4=;
        b=RzP8kK6D2DBcLtNECgIHLdlTGvpXbt8zVhY/HIv+Or5qthse81CLVwvlLheh9k/pWq
         /z/4oaoEsvPJm2ah5ky3toKWCGutT1EOUKcRnU2qxxslmsukwNJHdnt+JRVx0Pd9awS4
         UM7nGdIxvPk2sJ9mH123KNZBdvx0Fpuo6lD8hiR4Y20iBojxhBsMGTv+iOhXvzhSz+WE
         GQjnwaToTNOIMVk1TIFk0RNl0HepmY03cD9+QzebVIe+dtWw7cJhvztl1JTtd6t4SmA7
         a9X+4Qhd7EI1fX5bYMihJJMm8hYM1kPGe8+PPr1daUEzpe7iVpOOsN5eF0Dbyk/GUoAC
         uhMw==
X-Forwarded-Encrypted: i=1; AJvYcCW16O73RuOmhi4XplXWvY4k4m1uIef0r8EZcc5v1FjQCZsHll0m6Kot+jMJzFk/4CZjnTC0KC7sSoU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOqfDXmrPqW9FlY4Kg+pRyfl4MEr2jb+zK9NBXy9SKeIAhmL4i
	ajamQROHqPljUEWtuHrDNqbs8i3lq48mm7HOfXcWnLEiMMnFp/zlVPh2rW8+hIZnTtg=
X-Gm-Gg: AY/fxX7q1vszvvkgFJk02iXI2zd+aIjnY28P5BvI1dIL+gnjT83eIF6M1M//ygTUhj2
	DjobNabuN2xi0eQXx70Yxod3AVE7sQNT6802lb7T2pbB5hbYLyf9AtkcputuF6sVMhDfB1FJS9L
	haCD5aO8ZWRhFolWsXB/5jYKgXlu4ES3CLr6yhKNUDHyYfCkA1zEjks0rf/0rHzuHvSxABxboNo
	yiD9Qdyc4IeIbEvkyDVJBu/6ugkApp6vp5iX2STcMowYvsBPHp1VDxaaIYbc+R2nwWxAxwZMluR
	PJuIS5i/4epBNm/lq5vakp3VLxLIiGmAN+3cZt9nuGpjlkLomfyQtvJrJ9DRnHcq7qpusjT1mfE
	fITswbwuDIPP+ErndFhjXUV5bBjUIsihzKkqbCspH4RtrACUDalNmkjKDv1IndeplNeJrVUddIo
	JcCoN9zXUAjg6alHKVLOzXVmA=
X-Google-Smtp-Source: AGHT+IGSkgRdvFAJszoEIUVPnmxFKxpG81LZeaQDTCtjgK8/9NBkGo4UJCrHj8/qs3u8e7/Yxpu5vQ==
X-Received: by 2002:a17:907:96a1:b0:b80:6ddc:7dcd with SMTP id a640c23a62f3a-b84453a123amr1485279866b.31.1768142656775;
        Sun, 11 Jan 2026 06:44:16 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d3831sm1727347466b.44.2026.01.11.06.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:44:16 -0800 (PST)
Message-ID: <bb0c473d-0a86-407b-9c4b-9a39f9985ab9@tuxon.dev>
Date: Sun, 11 Jan 2026 16:44:12 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/15] dt-bindings: serial: atmel,at91-usart: add
 microchip,lan9691-usart
To: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, vkoul@kernel.org, andi.shyti@kernel.org,
 lee@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
 olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.org,
 lars.povlsen@microchip.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr, Conor Dooley <conor.dooley@microchip.com>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-4-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-4-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/29/25 20:37, Robert Marko wrote:
> Document Microchip LAN969x USART compatible.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>
> Acked-by: Conor Dooley<conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

