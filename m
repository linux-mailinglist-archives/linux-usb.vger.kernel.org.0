Return-Path: <linux-usb+bounces-32161-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC2FD0F336
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 15:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0F55B3018344
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 14:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6283634A79D;
	Sun, 11 Jan 2026 14:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Qam1s0sk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7BF3491C9
	for <linux-usb@vger.kernel.org>; Sun, 11 Jan 2026 14:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768142804; cv=none; b=uQ0GJJJqOsQ1F22blJVXXrjypxBTDJKz5E0GkZqXRQBmAem6VAWFq326p4f5HMmVbcsTNrVxcNyLduBd44hXzvzlJFPIl0TXjv5aDZmQ/Zu51Qdl9xQO7ppa4Y7mndO0HUodva7WfEj7pHPMYrQ42SxBOCU/FzU2zK/ExEMn2kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768142804; c=relaxed/simple;
	bh=L2SAqNmu61MHKLD0agICr57xkRB0iGTI91g9rMmmRgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YPgyJmwsblvn7ILVJXee8+WAbfPUYdtL/ha/D4YCrWoPIhhkZ2xdxuwg4Fv2MRGgn1sHoJOXyj8HnjNFVOssMI/5hZIf+2/Ep3O1vkZ+ydOkAiJVwNq2N7XuHx4G+mxvoYfcOcfGCby/2/MZJtFSoXnWQ1NWj+LMmQ9laHSEmmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Qam1s0sk; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-64b8123c333so8955032a12.3
        for <linux-usb@vger.kernel.org>; Sun, 11 Jan 2026 06:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142800; x=1768747600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=998LIQD26tTlqKe1Nt9hPTV8z5SAR5Xb1tsWRfDj7yM=;
        b=Qam1s0skrMJn1KfWZxSe96IKP81h22WhBDibkbxgWIUwpBSQNSN536T77TtojW3nxq
         kLFoyDPha3E1j8A98VyQxWws3pi3XVHEjYrLvuh2AjL/vNPcDkas+WMRnHVItePkIK5p
         yjOS8EtefDgl07rBXwJ/tP65Y/Vw1sE6EhWNK6+VRchLP7n6emPQxYYi/5H9xtlL6/P/
         ns7a6XFDQO9GAFW8hheFyqWsQk6Nsce0VyXmYi3J35Jk+Y3cTtzFIsWLZLPcx+gnyCUs
         9g1Vv5mta+IVdq3zoLjpJHhxhqt9cTIhUzchJVlA7JHMdhTyomaoN/CV+gPsigwenQok
         wOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142800; x=1768747600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=998LIQD26tTlqKe1Nt9hPTV8z5SAR5Xb1tsWRfDj7yM=;
        b=rvVAbbBytcSySyKubI+5tR32xMaLJ8BPTLnEYBt9JxYpmp+V2xHKnc4vVIraV4l5i3
         Cgqsj1Asg2JxCeHDGEKr6yNeVc1yJuQ8ZWkv8kd6MQxU3//TBUVeOvphnhp05gSVyyUx
         Gd4k6hk5CDmjowSC4CrbSHNx1rvNWuK+oxwXx4m8oKT9N09HBig26hw6h7++tBduJwMI
         4/pUTjonivBB932T6HRmiuuQLCFR4v7G8DYZxVzHdxim7x8PDTlLy20Jl+8Ttlv6g4s0
         KqWBfucbb2tXAmDv7QJ9+nx6QPl/gPTDxNpis7NJXBasW3Ag2nw39l1a/9Q1dpzVIgeC
         4orw==
X-Forwarded-Encrypted: i=1; AJvYcCVtFI+gRiHWSIOYNdlTrGu5hw9HWwz1nUBQEyUOvyVAHDTT9gB74FDXnkgF4EwHNfZ2GqhvfcTO7/8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+KxqEDFa40s13JOorIOcWxeWXLP4zgMJY9bfbYkGtgLnnRBdc
	lp9j+H3Kvzy5JWEc43Z+KM9slnqWlDfac1AsxGIgN2K6QjjWF0jqj9aU94gJ/hePbbo=
X-Gm-Gg: AY/fxX5pC5uW7vta8d7i5VN7BHaChBDG3UzVXxlNK2ZEPbz5rc5RPEFE0PUscAynb8u
	9a1VaBw+7tkdYvBTVT4BjS/mrc0bNkBWNVQhfVxoXzBjfwI86upZzn7V+0T9K5b7yA3HwxORbuU
	J16KPyhvjd/fj+CAmlLkoCmyDm2o+1BiDJ3j8g/0uh9cILS7WJRVnoKO6r35tm1gBHZxwyCgH7b
	DUjjHh8EBwB6DwlEUIG+faXiUGuj0wl4HpUCGzl3dTAzfXGL1wsk2qCcdQIbeae7dzul9f2CbY/
	NCrabzcZGvzdDGW0/kQa8DHaSlbtyfDm/owiCDOXPyTSxqvGAbYWtCdxUw1wmbX8ojDxMbH3VoZ
	jvoV27g+PL//sZKkhHO03ukbNqo1pN35C6sADwALPp+ctQF/EzDP1gHLLRkTrdSr9OoV89aDWCg
	oKYmklvNhmYLGmKvezmfB03J4=
X-Google-Smtp-Source: AGHT+IEEnxtsLJjgQBqtCtTKdKKJ7nKe93tErDCONdjzSpalyD4Cf1jf8cogFFk+Jwao/l06OHgHEQ==
X-Received: by 2002:a05:6402:26cc:b0:64d:498b:aeff with SMTP id 4fb4d7f45d1cf-65097e8e49bmr13880469a12.34.1768142800347;
        Sun, 11 Jan 2026 06:46:40 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d4acsm15318996a12.30.2026.01.11.06.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:46:39 -0800 (PST)
Message-ID: <0ca4477e-cfd8-439f-946f-9d0205b62c6a@tuxon.dev>
Date: Sun, 11 Jan 2026 16:46:33 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/15] dt-bindings: arm: AT91: document EV23X71A board
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
 <20251229184004.571837-15-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-15-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/29/25 20:37, Robert Marko wrote:
> Microchip EV23X71A board is an LAN9696 based evaluation board.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

