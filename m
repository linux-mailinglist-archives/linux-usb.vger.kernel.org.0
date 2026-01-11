Return-Path: <linux-usb+bounces-32154-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD47D0F29C
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 15:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4819303F0C4
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 14:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07F6349B0D;
	Sun, 11 Jan 2026 14:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NoTM+k2S"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5470F3491E8
	for <linux-usb@vger.kernel.org>; Sun, 11 Jan 2026 14:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768142636; cv=none; b=pV5Q0a7WwPe4cV/h9kTETfD5gGZu3Be0maGO5GADGd92kqxwA31hPkjP3V+ypt1cWU95r5SzN7jm1M+9KprZv3ctKX0JCWslBSpILW8uC0yty/PBIDYICSjoNtdiG0YBo/H7SLS0hy3sGGO6+LbO/b8ICm/Iz+NyJ/PyXS6gloM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768142636; c=relaxed/simple;
	bh=PnoQRnuiOPkoaR4OWKdkvM54htM4YQiVOhdkWK0qg5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JbPa9/IGBaM0h3I50EqETvRmq2T1panpWJVdZzRu3FfuKKKah/48ET1rs2dh1U6YwbYuwVsb5fSm/WnA8rE2/AkpScEZXR3w9G3x5IV3LxSl77KUcbFYHw/U21RqMJN8HBpydG3iJ/yd+ZlNvrTj3H4E+xFw4CDRsp6uEnxaZTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NoTM+k2S; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so922355766b.2
        for <linux-usb@vger.kernel.org>; Sun, 11 Jan 2026 06:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142633; x=1768747433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J8ivZWfcmepYc5T+3Up0ol6uJ6XFnUAYmd34ka9AIUo=;
        b=NoTM+k2SO5HylCVHcHNqCec7b7gBIoX2QQd6dHlIYohJij5ffigE1XqVlvs93gRqWu
         zSIkpxTis8OI66sDUEw9DNOr0vv38lEu0MABsxGfO4mb7PU0O/BAenxo8CfbBvrIUjvJ
         LRD7tBDt5dQcbYHF3oqbQYYGIp7uzpqccEsipOONv2jXTM+d2xEwUlLYcgjMnPd3UHaG
         v1LNXlJiyOp211uIT/EXTZAXo6ZwY2pa/ypM6jMTRJzxVWBG9VG0jzGXdKX5J6OsbGrT
         +1rzoSd6z1syRrs42BwDqXaqn95JEU2D+Qx2+rM7+dRq6TJYCADcu6Rbo1rrtVkRqMN4
         drtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142633; x=1768747433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8ivZWfcmepYc5T+3Up0ol6uJ6XFnUAYmd34ka9AIUo=;
        b=ZJqf3r7qr0OmTZnS5op3zsNWThf4wbfJhDaDIAvgb8U2Xek1ksGfgZMjVop/nPPFJp
         DEmSBPBOJ0YXVUlCWucJBXVK0uwR2192RijYGV3qeuRyBnwDn0nRJYgsiLHg3+se+cg0
         h++I8j5a/S6rmdaQ0/eQa1QwF8CF0+cuPUH8f1uR58UYxpKQr7+nRPq9fAb4JTk81RnH
         OJqtfppLRz0yECL8B8Ep3eJyZI1ijdKLepyj/rnKjDbgIEfydC/mDJ9zdFRUvJqHKH5Z
         OZ94aFRE2FytM7EdG7uMPtpX24Xqb6pneSBGlH1PWprk0mJZUi9jaV8I9kTVMFx1fVno
         6mbA==
X-Forwarded-Encrypted: i=1; AJvYcCWGNDZIC42OFhi3LTSyV183XVsA5Km0zXVhG1KORtEXM8v90zxFKNZCMpfSti9HRAC96dSaX4mxwqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPa8vCoQimlrOoSCA/7eg1zKFSmFw1zcPeaLtWKUarw+abRyvl
	M1JuE++Z382bsiwTbqkmtTNrmnnCUOlhcYUSHcZ+ZRMvFhrs3mM11IUqtlJURxXLBjo=
X-Gm-Gg: AY/fxX4ebUhQgEYUFz6nvl+0sNSf4iMPmkguP6IghccJDzkQ9g738991rM8SaoWl0bu
	eT4E4AhVsAwYuSyqpJrRIpVRlLB2wd2qLYJ7JEWZqZLVueiDyEufsc7dhGchJFjTib7DvlwdOBe
	lVt9ZjZK9QFiMJqIyhf/WpCKGqZ2DokvysJJt4ReMM6zTwgvYkNjR1TEhOX9npmcaFeHEK0ikrf
	T4Qa4jGe9Li1RQI7suvFkBB9NL0OMqbeLgBTpKOz7oMLtfejKMiLWzmLc+FmKs7SeazckDmHD/6
	0NCRWsYnRlz0z/UTjQOZZb36SXs2vQjfgrgqc9Hfq85EyBjcToYfOBZTadXGhY3HKuv5iZZRXZ/
	Aiwj+hrZQWXDGPL7m2bMkEFvHWEyyeyDB0ZyF7PWyWH5+B2ufEDoo86kNw/0/sH9rMZTBZLxBrg
	LvsnYoKKKe3DhD9sJq+8mt8SE=
X-Google-Smtp-Source: AGHT+IEIDu7YG5XG/nu65TCe1ZGy2PfVFAGljLAgOLVEydIa/k97PZQn/n1VHfMaw/abNX/NIg40nQ==
X-Received: by 2002:a17:907:980e:b0:b72:5d9c:b47b with SMTP id a640c23a62f3a-b8444f6f7dcmr1568524366b.36.1768142632630;
        Sun, 11 Jan 2026 06:43:52 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86ebfd007fsm491365166b.31.2026.01.11.06.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:43:52 -0800 (PST)
Message-ID: <d97c48eb-ebbe-4742-a4f6-220d4515a65f@tuxon.dev>
Date: Sun, 11 Jan 2026 16:43:47 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/15] dt-bindings: mfd: atmel,sama5d2-flexcom: add
 microchip,lan9691-flexcom
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
 <20251229184004.571837-3-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-3-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/29/25 20:37, Robert Marko wrote:
> Add binding documentation for Microchip LAN969x.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>
> Acked-by: Conor Dooley<conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

