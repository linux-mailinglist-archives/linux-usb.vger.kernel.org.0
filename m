Return-Path: <linux-usb+bounces-27026-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C49F4B2C5D4
	for <lists+linux-usb@lfdr.de>; Tue, 19 Aug 2025 15:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FBEB16AB08
	for <lists+linux-usb@lfdr.de>; Tue, 19 Aug 2025 13:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18AF33EB09;
	Tue, 19 Aug 2025 13:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XXWYcuVe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F7233CEBD
	for <linux-usb@vger.kernel.org>; Tue, 19 Aug 2025 13:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755610376; cv=none; b=iQqd5QgKrSYR68/qrpcRmftLcFh+NvdrZ6uQZqadtLkdy3ZtF+FcbxiHYB1/RX5hP30zHOqChMCjQMt23+33uYIjjpXqrtfELvZ88dQgZi34NKj6pdc3pig9p/osoaQYdL7AVY4iCm0OhRsQYRjXyxW80kBHzeftUZlmlGFEiEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755610376; c=relaxed/simple;
	bh=pSC5IgqyzZtG96ClfbXrgt5sbg1AohobwZVoz25rj/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bUwFdS9KpyS+lK1hFwJ1dMxW3VklaAUjqUJt/kkPYOeUoUD7dpz9USXzRdI8FmWj/iNHbq8L/zNAn/rdj/IHA/qIAkRqFlX2AlDrQVnBIhQ6IVU9nZl+ttK1C592O6QhjvVbYN9uHzXU84ufy6QjuOiOUA2OOGBOXciKLpW32JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XXWYcuVe; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9e4106460so4218948f8f.2
        for <linux-usb@vger.kernel.org>; Tue, 19 Aug 2025 06:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755610373; x=1756215173; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FygJPUitZkmXwlp1RpWscijGjGvi5AqEQa7JO2lBl9w=;
        b=XXWYcuVeZdjKkQpbmgtiXlCYl2P3uKIwc5vk/Jo460Xd8ezzS8QFMCAjkC3CFcBkq5
         VW4Ej+rGwFUzbGHTZiSEUcXRxH6+omwQMCHHQ8UZ8F212Fj5ItogE2fwUBn64JLw3rRc
         8petYKOwLYhlUHEw/L0Z9ZkyRbzgU5K8/LHZhpS/DUO7f0Invi60piAGW9odGopSSq7g
         GVkdZ0Lts9g0aYG0WPYT9hmGl3junTZPCBRSZM25yU8Fk94+YxU6IPQKdt+hzTCB0lnR
         xGN35RYy8u9zLJ95wGvXczvsAiCr7Pkl5/T5dANheglI9ftTOEttnFCJRH/7s+WebjJ0
         VqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755610373; x=1756215173;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FygJPUitZkmXwlp1RpWscijGjGvi5AqEQa7JO2lBl9w=;
        b=wKuOekBcL5SSbv2ZwmVqdJSYWoI9vOrsvSmZgKUwKS2IN8VtH/GUtnA1+IX/w82mxu
         asJOH60T3Q00YgN9wNJ7hlREFCTIjBqvcz3S3TYB9uOJyVy77GBrOJReo7cCeQrKtMQY
         8uxtJ6zEWZ/ZXXhM3C4c3DAg61O4Mhfo9GtdtQfHO1QhNGDO6O0yvfweJdo+S9vo9Mke
         Sbw2c/ho5bg1suHe+9eTgxkqkd0afKmFSZLdFDkILrcaRgFPifSJxVKtFUGJ1vOvJjuT
         eRgkuK7e0o0B9rzt5VLrBwyl5ZxSGRdT3mB0aiUXNizuwpKFH6NcEBnIo41ZdDhDwNVz
         RndQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtR+VlI5JAZzjpP4LEtXd6xi5Z4C3Op17SyT831/RAJwhmDjrqql+IbsKifJquvw15b2TXEXr4Vng=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0wi1nD6ZGl5deokwPXrtXxkCzrALD+fz4R2jEviudgiD59g4P
	toftRSYvUd29OmQCPoCaDEVAxI3KDBcU2avJGKMPEE/Ne1oeBg975AwsSeXnT3hFYxM=
X-Gm-Gg: ASbGncsuTBp9V36MAsP728ThEUhRC+1W4R3Sz7ab5sUFNKPIs0scLIq44pohmSbZI4f
	mbDUrw1xP51bt0lrxBB3iBcitGwZxJL6l1YpttwdvyEaZB2W01OpqqrnbBKCWar3Jc3Uy20TS5R
	Hn+cY5dlMimPuwXvTDUWdUz4YFZfNtj2iK7KDW5bZypA2JoRkrncJwnR+vk8nxazuygQBXRJplu
	94Xk4j0wNkU5pdh4JAYnh/9xGs0FRt3t15UjdoAUmDblDeoH9MjEiGNP+sEGt59LOaYerCwcdXt
	TaDYpU3P89j/UW9wdIvRPuR/WkT/Jh58mOn5hJiChfdZPMorIxUDSReB2/Cojx9xoY2dcR50zjF
	H/FvZYAWlYMqdZPJNRU0cb5YI45WntYErVW0WYgkuNCuD6G2o4frrOY/eaJNuawU=
X-Google-Smtp-Source: AGHT+IHE3eWuGDJbAuuWclWDGhvbLd8+Nrm3L1V5+JQsqdxDxBiVDMEcNaBhcDl9yr9xN8B6hHRBKQ==
X-Received: by 2002:a05:6000:24c3:b0:3a4:d64a:3df6 with SMTP id ffacd0b85a97d-3c0ea3cf081mr2302142f8f.3.1755610373108;
        Tue, 19 Aug 2025 06:32:53 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077c5776fsm3708064f8f.61.2025.08.19.06.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 06:32:52 -0700 (PDT)
Message-ID: <bee2fce1-facb-44c2-8eed-2bb396f9c204@linaro.org>
Date: Tue, 19 Aug 2025 14:32:51 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: use kcalloc() instead of
 kzalloc()
To: Qianfeng Rong <rongqianfeng@vivo.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250819090125.540682-1-rongqianfeng@vivo.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250819090125.540682-1-rongqianfeng@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/08/2025 10:01, Qianfeng Rong wrote:
> Replace devm_kzalloc() with devm_kcalloc() in qcom_pmic_typec_pdphy_probe()
> and qcom_pmic_typec_port_probe() for safer memory allocation with built-in
> overflow protection.
> 
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 2 +-
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> index 18303b34594b..c8b1463e6e8b 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> @@ -567,7 +567,7 @@ int qcom_pmic_typec_pdphy_probe(struct platform_device *pdev,
>   	if (!res->nr_irqs || res->nr_irqs > PMIC_PDPHY_MAX_IRQS)
>   		return -EINVAL;
>   
> -	irq_data = devm_kzalloc(dev, sizeof(*irq_data) * res->nr_irqs,
> +	irq_data = devm_kcalloc(dev, res->nr_irqs, sizeof(*irq_data),
>   				GFP_KERNEL);
>   	if (!irq_data)
>   		return -ENOMEM;
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index 4fc83dcfae64..8051eaa46991 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -713,7 +713,7 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
>   	if (!res->nr_irqs || res->nr_irqs > PMIC_TYPEC_MAX_IRQS)
>   		return -EINVAL;
>   
> -	irq_data = devm_kzalloc(dev, sizeof(*irq_data) * res->nr_irqs,
> +	irq_data = devm_kcalloc(dev, res->nr_irqs, sizeof(*irq_data),
>   				GFP_KERNEL);
>   	if (!irq_data)
>   		return -ENOMEM;
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

