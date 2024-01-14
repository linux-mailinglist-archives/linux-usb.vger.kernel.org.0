Return-Path: <linux-usb+bounces-5032-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E74982D160
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jan 2024 17:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A2131C20AA4
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jan 2024 16:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2017E;
	Sun, 14 Jan 2024 16:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MIQik8Nk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01853C29
	for <linux-usb@vger.kernel.org>; Sun, 14 Jan 2024 16:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3368ac0f74dso5759213f8f.0
        for <linux-usb@vger.kernel.org>; Sun, 14 Jan 2024 08:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705248780; x=1705853580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PK6B4lIcnEeALYHSYIJtJi6scK3wBTo91ND0+T8BXG4=;
        b=MIQik8Nk2969SPS3unPxZtejEY1wW+/c/FnjbgdJAZS6IsbOFPzhvhOx8jSYW58E3b
         CHbc09uNbb84Q/tsp+mBsNggVWMJwhYx0VgwLIoZesoHQLcXu9y4nv/W3N7yAp+8uGZK
         GnwU/LL+AZ99fcwCU/XgqbzsezBX1TT0I91uAftUHDNuD5WM3f5zX1DnX/xMoMD++dVJ
         tkj7EBEk0IyLou260E39RUHwT+hUejjY11FFPZZe0PD5UeOCAPNN7pup92jrkgtkBZL2
         2/8XVObKme54tQZSqVsge7AkBF8nZ3IBe4GSLVPpeoWbJm6YgiQfDSUjO+F2nMZhOzBU
         J5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705248780; x=1705853580;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PK6B4lIcnEeALYHSYIJtJi6scK3wBTo91ND0+T8BXG4=;
        b=uxO8JPjbGuTal9dmGL+UcaC0KT09RVB+GqioSG7tA99LBV/4r+xEnmQEF4oJVGJJH+
         olsc4+QdjEhwH4NtYs/NBLLISWuDVKNIDWhtK4ltpiLR98/wtiOMNYvjh5CG/eDOwKHI
         aqbE3tvM+/dJZi7HBP5q2/qLWa3Ao7nxmURs33+e1ArCiCNJYYitfH0xg3o6UE5yJKWE
         8Av2Hxoi1rZsPzGebop2ADw4U9zNmDe8owUX2g//t/K+90QnHg/rn5zccaNiUiaHfESO
         nBw+nNhJETDY6mUfWC5SphFgNaoFapYz/j80PdLgciVnhQOh3SCBL9Xg9EXDuMn5Y9dR
         hafA==
X-Gm-Message-State: AOJu0YyT/V+SrQrtWocF09BH4by2EW/u7ImMlagq4Hx1uIaIKCyRvVgx
	G45OMlIpe2361jtZ1s7ursWM7f7fKrFrkQ==
X-Google-Smtp-Source: AGHT+IGpum5IDzpXeQ9A/9V/dvzpLzlcrn9xiwR0V2h2sXZ5LoD408R10SsfEmXPPCQp+VatR6FysQ==
X-Received: by 2002:a5d:6a0f:0:b0:336:7449:2da4 with SMTP id m15-20020a5d6a0f000000b0033674492da4mr2709385wru.95.1705248779753;
        Sun, 14 Jan 2024 08:12:59 -0800 (PST)
Received: from [192.168.100.86] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id e19-20020a5d5953000000b0033609b71825sm9451486wri.35.2024.01.14.08.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jan 2024 08:12:59 -0800 (PST)
Message-ID: <8097c0e0-3096-431b-9b35-46dc063202cb@linaro.org>
Date: Sun, 14 Jan 2024 16:12:58 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/15] usb: typec: qcom-pmic-typec: allow different
 implementations for the port backend
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
 <20240113-pmi632-typec-v2-8-182d9aa0a5b3@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v2-8-182d9aa0a5b3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/01/2024 20:55, Dmitry Baryshkov wrote:
> Follow the PD PHY changes and rework Type-C port implementation to
> become an encapsulated backend. While this is not required for the
> PMI632, it will us later to enable Type-C handling on earlier platforms,
> including, but not limited to SDM845, SDM660 and MSM8998.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


