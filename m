Return-Path: <linux-usb+bounces-32159-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA14D0F372
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 15:49:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 657B6308437F
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 14:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27DE2348880;
	Sun, 11 Jan 2026 14:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="g58+wShN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09503358BD
	for <linux-usb@vger.kernel.org>; Sun, 11 Jan 2026 14:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768142744; cv=none; b=lm8qIAIL6NVoq5MLzph1YEb3k+zCG38+btyprrfiF3coKOFDCBG89ahBvh5AkMckQ8uM2+7SuplAHfybkBkXarOlLhOm43k9va75Jb3ztOcZFv9TLSv3MSTUgLfwFqGNvNkPBLHdZEllYY4+R2J3O4e/Tq8ySjcGtp9J455K8uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768142744; c=relaxed/simple;
	bh=8+o9CrQDP9rR7vhYrkmBD4TEK1Ah1Um118V33OBjIn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvm9QT8QFNqfK61QhH0cf5WYyI3UewY+UPgjslpazPxFCdhoF9BeKjGviBSLcb/CB9o/IQjJm5kuMEOGrYphqejnrbMCCsPexerVNemr8uEx51UVUR4H6UVvA78tHIXWTQTXZL6ksJUyiWIluQNCmGgg4fVWc3LiT0Batu9yfIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=g58+wShN; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b870732cce2so64107866b.3
        for <linux-usb@vger.kernel.org>; Sun, 11 Jan 2026 06:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142741; x=1768747541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lfDtjbPnZQpFER+nbClQWcn44IBaDvTgM6H9iNz+Pz0=;
        b=g58+wShNUGm4cSq/cIFs5BcjtBtziWlVwOnRIYJ0JBVThU79/8vxkDEUyOzt7AzJBB
         cTZ9e0Q9nDikPkEBLmzCCkAYBMC9A64/OO6AU4Ed+EOGygTBTQEKuknv7Bvpc0Hq4pfW
         tWuCEazhna5tzsEGgmV/QS1mDV7AI8F7irWQCIvLFAdd6UBceXKAjkUon+m8Sp9IuWPs
         p2XYZJYaezhBjl4awlNqxLX5lYDftU2jHR0SSz7JmKdP4CM//mkBYchNBUXZFooCPe+6
         dp21GWl3JMqXh5qWiJlPzG2nBfXylKpA9kssFDHJxDnXDPKiHgK0Z6Kpaw+F7SivT7OY
         h9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142741; x=1768747541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lfDtjbPnZQpFER+nbClQWcn44IBaDvTgM6H9iNz+Pz0=;
        b=azylNZDy+za+fZomZlVLKZ6htCc8mumtjBq50J9ghmItyGOoAE+iVhyjVL/SL3Ww2T
         mOv4sfpdMCMEiMNdFhaRPL8jr1gL5lCAw6WqX5hKr8PyiXrjoiDt8HhSQBxOrNet0W5o
         DTtdYa/R0G4kjUhN2RITdAv1KKR08XiPlHcTjPna3MUx47TGOIKelySNCd8N8/+16JCB
         1J1HrqfwkCDldziQZnmOaW5qFNGI4jqd/thlRwe2nxcx6lGx+TiddEwzyo8t5ZOy0w5r
         6mMmUaF7hW3O2vOK0MC147yNRJRmnPI8JJUm2y7mEXuBbyT+DfWNF386WFIJPZrw6mKI
         mrHg==
X-Forwarded-Encrypted: i=1; AJvYcCXT+8vPN85BckgsG4zgNZ0kLaa4Wt/K9Bn7M02jVe7UJfMyTFA1+ypPpVZPl2NtwqgZEBmpwj0VLPw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5tF/dg0c2TV0InTLfNDqXVExUVPZ5yURqczW3o9VTxfhqpFdR
	6RY0r8t/U17jRwFgjgF6N/+8tF1e3RoMc1AckHpZH6H3wDIkdKf3WFg7y5kd1ngwR2c=
X-Gm-Gg: AY/fxX5V6Yr7aK1F3IYt4aSDs2dl5MxBo47wysePJy5Kvy5C5aERC/J5n5obKQAp0kx
	WLfLzxzZdHxzGg+fZ25qBEHv+vGCRxf2ZMHl0OLZc4axgaEMfxiTYDkQ0maIrQFLuYkS+BXsc1e
	M1X7+uQa7gsgdPgLPJmg03GsIok+57lLekslrx5jlmFqdPPJWC1w9wnroFDrq6K6NqcngF4Ysy+
	QZlmZmaK83zhNxinTaVut6iFaCTKHwg5zqP2gTn6sa6Lf4lvBS9+cwU5DyIBmqs75vWSDYjXxPj
	royWjSzzjFzsN0rMSb2Cl59Has4QF+kSdVSU+SZA6ARBmrgc86X5gTfQKBsWM7WCVmqn2wzDdJn
	9XpXjIy6uo7BNAwnvHR7ToiqdsWUOIzLXKAi2DVxm2lWOROZQIWdlKchD6Xd3DhZkM1on5lfmc6
	USdnNWM2k8Cq2tItDElmAB9Fo=
X-Google-Smtp-Source: AGHT+IGzzRSG9JPiSsYLBto386guzGNBLdjrzZm8+JQDEKUQ0tWs5J3FidjE880cd/bBYxLZJrvW2A==
X-Received: by 2002:a17:907:9455:b0:b3b:5fe6:577a with SMTP id a640c23a62f3a-b8445169517mr1585237766b.8.1768142741298;
        Sun, 11 Jan 2026 06:45:41 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8706c2604bsm260020066b.16.2026.01.11.06.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:45:40 -0800 (PST)
Message-ID: <555883af-66da-43a0-a4d6-bd3bc52581b6@tuxon.dev>
Date: Sun, 11 Jan 2026 16:45:36 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] dt-bindings: net: mscc-miim: add
 microchip,lan9691-miim
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
 <20251229184004.571837-11-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-11-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/29/25 20:37, Robert Marko wrote:
> Document Microchip LAN969x MIIM compatible.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>
> Acked-by: Conor Dooley<conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

