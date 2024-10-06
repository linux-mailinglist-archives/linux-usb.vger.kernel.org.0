Return-Path: <linux-usb+bounces-15778-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AB9991E17
	for <lists+linux-usb@lfdr.de>; Sun,  6 Oct 2024 13:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 598D91F21B9A
	for <lists+linux-usb@lfdr.de>; Sun,  6 Oct 2024 11:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91BF9176226;
	Sun,  6 Oct 2024 11:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZRFLoBjT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343B7184F
	for <linux-usb@vger.kernel.org>; Sun,  6 Oct 2024 11:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728213683; cv=none; b=Lqu27MkbkPgBg9G96MgvKU8XA6WanVpUSG2nbDWJJBpqOdXM5xUgGM6qpQ6J//5kbG+NsxM8f/wRcE79FQ8MqsAbJ7dDL7kEpT7nNlKJie97ZWknG4KWZEssIIdYJrI4YJVOoTmSDhpfclxinA6hAN/4hSMkL4s33cWVxpaLD5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728213683; c=relaxed/simple;
	bh=kAkf6NIhOlen6xkgkrgYREOsdkIOiEOGqa3LkxwXAz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=natIHydp5j/66Pfj/XW+sAtExd/Oa8mAXYGFLF+U7y0K70enYcnb8YobWQLDtiaPJytPqD3CAkj0La0WGtWnhb9TZxSuMsx7/etBLRSLJqJw+HnvBbuVeVYldPrrRSRGYIOwDeWKWI+ZR3LpBzOhIdc8EMC5WO3cELthL3U8lG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZRFLoBjT; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8d6ac24a3bso664495866b.1
        for <linux-usb@vger.kernel.org>; Sun, 06 Oct 2024 04:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728213678; x=1728818478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IaSdlUzNDNfxslBW/OGrSNOxQF3vX0DH7/KKjL0CWFE=;
        b=ZRFLoBjTG8F3mnbaxzhEVD5mJKaLx5/2TTk+hrgvD3rdpHcyXkH0aj+uPy1cA8D4wx
         Af23dzdoNOYTNwpzbbqx46oCw8/n8HpYvCKG1Qd+xvl8BSGIOil2iyAT7QvsXKizpBWK
         PUXOoo12LpxhY6HIQIaMCZEtPE64TkBWJVK0J7zpihvQSrhbh8HcbSzL/aR1ETUhORfS
         2A0I9OMJxJSQTiRQF+1Z2nVOqA5BgPNRE8IO3JZUOLi3TXRC8vcy1KPbR4lAwlXjrpWc
         Av9hGEa16S8jbnKt+ZESVTlwP8Ygdj36R8Ao5EERaSF78gTr0fKlAQ2mnoeFD0K+6tI1
         8fqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728213678; x=1728818478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IaSdlUzNDNfxslBW/OGrSNOxQF3vX0DH7/KKjL0CWFE=;
        b=ayNIsEtwsRt4GRKivwK3ESSd1qEXRDeAgLtCe06UNBpGy2ML4SqmRIDvhKyDkcsJxY
         QoxCYtnQ36adVdh1d+BRrLYvNNRw+Op+Y6whp0NuTdHc8+6GD4dCd5zxmK43C96fS77O
         qp2ADsCHp8sR1I6LybRiRb++FDfHWygfjgcwaPedAXnyE6jGzkrUtJxr9hcojsrnoaIN
         AFu9ffiDj/Lstnuj2ZrqINaE55uB2GOwcKI01ovMRkfu08mwKayyqTOQKcSpthJmqDqu
         qf5T1hlupYQbE4wvx475lYohXNeOYH9VYIoYw9PBZv1Y7pHILGueLhpLbsN6NVNqrCmF
         Uc3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXn9H36TuJaR+Lm6a5r7kdjp+b4yZ+Gvg8Fn09vP/RT8qvB5uyfPZN7KwaINkOTx6JVuWSOxzh3Xww=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN68ifmfD7gCyAOW7G6245vIvTsE1DxAgdMQcPO6bXQH74oCBv
	9VQgQg9/mjfJgab3E0u5b06j6q7QFxpLWOhys56/0bZK7XLOdRO4z1loPBeTQ/A=
X-Google-Smtp-Source: AGHT+IGhNzL6F7Y3Basq1U7UYWMAXnxAome0GeoM6oq+0r0hVBAogjvQax1Al72V/SfzYXj8LXhFpw==
X-Received: by 2002:a17:907:360e:b0:a8d:4e69:4030 with SMTP id a640c23a62f3a-a990a0606a4mr1387180166b.19.1728213678283;
        Sun, 06 Oct 2024 04:21:18 -0700 (PDT)
Received: from [192.168.0.15] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a992e7860cbsm242410866b.120.2024.10.06.04.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Oct 2024 04:21:17 -0700 (PDT)
Message-ID: <b9e1c0ae-5651-418a-9b71-897cd739ed0c@linaro.org>
Date: Sun, 6 Oct 2024 12:21:17 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: fix sink status being
 overwritten with RP_DEF
To: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>,
 "open list:QUALCOMM TYPEC PORT MANAGER DRIVER" <linux-usb@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20241005144146.2345-1-jonathan@marek.ca>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241005144146.2345-1-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2024 15:41, Jonathan Marek wrote:
> This line is overwriting the result of the above switch-case.
> 
> This fixes the tcpm driver getting stuck in a "Sink TX No Go" loop.
> 
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index a747baa297849..c37dede62e12c 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -432,7 +432,6 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_dev *tcpc,
>   			val = TYPEC_CC_RP_DEF;
>   			break;
>   		}
> -		val = TYPEC_CC_RP_DEF;
>   	}
>   
>   	if (misc & CC_ORIENTATION)

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

