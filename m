Return-Path: <linux-usb+bounces-32157-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC4FD0F318
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 15:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87D17305CAD2
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 14:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A2634A3BC;
	Sun, 11 Jan 2026 14:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="K9ADx+2q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCA834A3DB
	for <linux-usb@vger.kernel.org>; Sun, 11 Jan 2026 14:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768142710; cv=none; b=PWMby75nUFMGj9zkh1ufbyb3ixENpISk2zRXhNBGQ6FgakQnHi75UFZvau2oVXJw9/qNSGfu1LBEdVcnMRWwPQhu6xHh5/Dp1ehgoG/iqVi494oTzWEjgzXeOth6h51q1/xKUd1ObA8wIcG+J6Ohx6zV7j1A4yT3OuCgOr2zj18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768142710; c=relaxed/simple;
	bh=gDiL7diPPllfiqdrICUaz2pklt2cpfwEzlq/42pPJS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PLozaBgWrUyWl1PLMeCqZ3mzepUscAGrAzqyHtwMDSuoPAiCItJEVWTSx4zOv636Yoo5dSwdhvvTXbVQZpHR60VPlCPZZB1rucJ+UeJ86z2ocgixFeLmsUqrm27IwgG09UBeZpk/ve+8iWb6A/W9Czm0BUuakspuEL0IBv9f6oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=K9ADx+2q; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b86f69bbe60so99370466b.1
        for <linux-usb@vger.kernel.org>; Sun, 11 Jan 2026 06:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142707; x=1768747507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bR5pMB9Z21CNTk1B6+opWEfUH+WjtdKh40K9u7GvYSs=;
        b=K9ADx+2q85hi1Y4+enhphqyqyZpZ50jBbUQejVQ9+lAyuPt1J7eUMJcsTH5Bdu91+/
         8uKGBqR2SSjJrxX/lCcEn9SiYTF/WVBgYkIGEyzvckX0wje75OhEfcmjaMUigKJwIZRs
         e06XzNxpm7i19SZ0LSNbNWyN8H9SmAT8nuB4Q15uT1Uv8OpT/U/AiGflgqftkaUx04wS
         FC9tKAq3ltBYaTZkCdn5SXY0EGMBHqbdzuQwDPZYYV0jMRzS64ApUPcVOjXPvySqbrOy
         U8+WS76PxjSbXLX1BI4gqBrNFoWcvXvKZgA6KNPOhcW9KOI4VzIXbxSQNQP75cdKv3IF
         4osQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142707; x=1768747507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bR5pMB9Z21CNTk1B6+opWEfUH+WjtdKh40K9u7GvYSs=;
        b=NS4SBP9oKYTyQzaWZ+62FBGxtIzrYd1TYZiWJvYAxxcXQtPPwVvlMcHxYEnZoybjhc
         2LbkxX9gKIOU9eBUHPSayX4Tfem0l3cqTgHm1QGMMDlserd9lmC/E/hZLlgFHgwH/vH1
         Kke4p9JllxKNfkYDyVTJo+qNn494mQILD08wvUZSvPV6BXlI2C3whuNb8su8zp1vGbmQ
         CF50VNVhQm/pQp93Yai1gDk68u9MN3ZAmKmoOK9dIT74oX52+erezUeT7WTEfxFxApwc
         P8KEHAmMFTQsfjSb8URl3pEB3oeeWKcxrJB9w4ALCwNSyX18IIWnPgixHOrGUd/qif+Q
         n43Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNXh837QBVVrRnTITAj574SMBUVF73gWmo1FlP0/DB/zc28OzBzMvvCI2jgAGLW5W08e+HS3gxQvE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw98l86gePYk6HztbSr/NSKyKH+b2bLZTYMBEum6ytOvJAIUh7f
	W5lVViXS5RI297kxWdFZzFZ8G4O76QyGyWDi9WNtgnGFZqBvpKIPAGdEgQOknhOgn4M=
X-Gm-Gg: AY/fxX5u0EHmDcfzANDChvT/IYzTYn7c+2YXnwKSUtDTuAs2WbQ6nk+YBWppYWVIM0n
	OihFMgB/AuRWtypsYiIPVJ3zv9d3vNcYVR23+GtY+L47gX/a+d/032oqfOsfXfoOlls+K9hnG6n
	SWuOq6gGGtAEc5tpMRg0dLT2sOiQ+MNdS1CTh5dDS2Hidneno1Y8qw6NunVfLhOKu7cXT0iyz7V
	1putxnbQDuHYMf+D89qEHNRwvdcHUCwdsi/SMPZLqRV6TZ+MsDJSHQsBlcP4i4E0FJ2gBJtMwpH
	XM2PRCkqDvU+bmu7nNgIBF1xrPbxXYglplzEvAZu0KFZyJkn0oUGl75QJdDAS8g6rHVy1ZSOXzU
	Kbb2m7OQUVLdlnX5ZlZR3jN1DFgRArS3TH9ezh+CIygDSj9nTzsHTnE66VWbDtV3qX2YMiWD8oy
	Osqew0p5mhbhkzB1fo9XmXw65IwbGpMpBVUQ==
X-Google-Smtp-Source: AGHT+IEnRprofKW6iUFW+aOMnt2p1AYruny/NjK8tSS/dtcvBYVRc/tCV4eudi2xBk8lGr0c6zLI/A==
X-Received: by 2002:a17:906:dc94:b0:b87:b87:cdbf with SMTP id a640c23a62f3a-b870b880077mr194416066b.53.1768142707046;
        Sun, 11 Jan 2026 06:45:07 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a235c0fsm1673227466b.9.2026.01.11.06.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:45:06 -0800 (PST)
Message-ID: <19f25a94-fc90-4298-b3ea-58bd66cad11d@tuxon.dev>
Date: Sun, 11 Jan 2026 16:45:01 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/15] dt-bindings: crypto: atmel,at91sam9g46-sha: add
 microchip,lan9691-sha
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
 <20251229184004.571837-9-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-9-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/29/25 20:37, Robert Marko wrote:
> Document Microchip LAN969x SHA compatible.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>
> Acked-by: Conor Dooley<conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

