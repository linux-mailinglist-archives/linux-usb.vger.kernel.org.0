Return-Path: <linux-usb+bounces-32158-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA79D0F2E7
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 15:45:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B404F3032E96
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 14:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB4534AAF4;
	Sun, 11 Jan 2026 14:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="X9Wk2tta"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B08342169
	for <linux-usb@vger.kernel.org>; Sun, 11 Jan 2026 14:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768142730; cv=none; b=pRrV3wa95Cborv1nvD/ZteBVdpUdV4VCwOAGh5vrGRPMDbdNPHTXTWL9So3D6iojEijlLyXSORwA02qx/Ggo1YzH79oH9czxHJM84eoGbewcmuiNc7W9uheP0q9TixVxL8SSB5cdFWs3OarTWtvUJRYGe1KJ+uXJ6QzQXBvRZQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768142730; c=relaxed/simple;
	bh=YDHNGLJfluFKzT2RaL2uk9Ugi0ok4Sk7jIeMDkApg6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VPrxx7CxX55DtYc8w1/3F9UGoggDk6oWqqymvK+4OPfl2zlox1A6Ti+buGioxZCM3saW6yocBos36IQvxVbI81TWJWhsUdrcNtzW7SQvIisRj3T9M7m7vE15uUXGTTMa7k3dDtkXVCnfdpKePmtcGR2dA9cy+TL2OVdo9caMCoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=X9Wk2tta; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64b83949fdaso9278365a12.2
        for <linux-usb@vger.kernel.org>; Sun, 11 Jan 2026 06:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142726; x=1768747526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I6rwalswAWwTHAknUrP94zFyJo4NhuP+T6GegkCWM/M=;
        b=X9Wk2ttak/FxxYeh5WLK137PvXT2Bo+6f4tTd7DoZEvDfH1xyhWoL4n6yF/gvnCw8z
         z+h9Pq1VYPIop7EYoYHEF/ZvxNpxMSSGAdL55uhaBcqSfbLSS6+O0g3gtUKbcER1Z7IK
         s2S2cmElL/gpcQWFvwhm/u+qSVXzl+qK0VjAc1Dk2jlacBc88hyZK8whHoOR0r+uNnl3
         9BPa6sdp3h6wLWdtn2N8cV2+HuBUCgov4KQjwoG6XwRdQ8sxApffjIH+TQL/Pc4vRPxm
         y7mX4RoTw9OGMaAtnsluf6omcNfoTTI99nG19wYn4YbH2bFtmLM64ISHwLjSgcuMJIRj
         qGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142726; x=1768747526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6rwalswAWwTHAknUrP94zFyJo4NhuP+T6GegkCWM/M=;
        b=IJCaecTcSvlGooZ/aGVSe/+VZCVHZ0Hh+NDOCGrIkckGLHs8GXXTilEZ9cxGr/EAsb
         t7cyh5GnCMKrLO4u5KmYq764pykDsZW/uiBxSwsRe4YOrwpwCpaAgBJgzdhWB8yZNQzx
         H1EnpR0210SNsnJbtEpg1YGkep2GO1YsFihE55t/rbdQCLhytEjL62yusws06f1qgMmP
         xVun6qpU7m5NLAgAZa5tPYVLBH2aJqKu7+xzc7Els4kmrLgwZlO0PxAhx5JvrJIOcq53
         8/iENPYMLDgNngCpy798R3WTMOKEhbKTnHPBuh4vY5n8FooDDoBWXozzV4CkM3Pz6Zg/
         LuJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjAELYwTtQlAOoIUyMjx8kRkSJOxjCxTXVqIYwNAR81Jl8KGQzrCKQGwd7u6J71y6aMjJ+OFIjBN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxokKN43lwsDH7CixWcLhRrI1+s9Mf4s1Yezh0h6q9m5QvGd+DH
	PbcUx2LEIFqyCCjCK/CLaOxYR8k6C3gOIuQG187Il2tQZ1jEXSV/KTUgXandtek3CZ4=
X-Gm-Gg: AY/fxX4wXc6WYSpb1CyBtjXi3MOb13Qj3C16+LSkb67NDdmjZZYKCrXn9qOYMUrLsrY
	AqR0wox+guep5CVDJF/7WylpaZHcBx5sGBqWYIOjmUwGcY7AtTt72DX913Vhy6UCY2xBeyCjdSg
	P1Mq5IIhffO2BtKnpACF024yj65FlGBXCoq3LcxE0v3ej0HuSCK8gxdsW72lQDCKsEcQcWeLp9t
	7ipHj4/dswB9GL0FZKt/oo4gwWI5x7YEA4G3KNmKkhCzv7NcyKy8x5LSPLY910BXz1Uk/mL9vsH
	Q9xLPRX65gCMjvbRZRRwJXuRE0Hc1/CvfEm1vN+KKr2k2KmVvz+DtzZqGFn6eCao0y7hPSQhhwp
	0jyIwtCteoJomlf3wtPXjJEdVD9zr/IvUwlGiUhxii1AlZCm72gtdldQkUXu/1O3LQQ/4UJum82
	hEWJ8lRJ26HZsp4Xm1PX6/Iwc=
X-Google-Smtp-Source: AGHT+IGvS7IBApFn5Y6caZIpVWCcEKkW6+CPDWe6wxvm6P/BpWNKX4ZQoy1X15u9d+HjeZrWR8LDZA==
X-Received: by 2002:a17:907:6d10:b0:b84:40e1:c1c8 with SMTP id a640c23a62f3a-b8444f4afb5mr1764352266b.33.1768142726523;
        Sun, 11 Jan 2026 06:45:26 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a56962esm1699865166b.66.2026.01.11.06.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:45:25 -0800 (PST)
Message-ID: <7081b61b-599d-4a59-8a27-291c55a0e52a@tuxon.dev>
Date: Sun, 11 Jan 2026 16:45:20 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/15] dt-bindings: dma: atmel: add
 microchip,lan9691-dma
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
Cc: luka.perkov@sartura.hr
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-10-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-10-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/29/25 20:37, Robert Marko wrote:
> Document Microchip LAN969x DMA compatible which is compatible to SAMA7G5.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

