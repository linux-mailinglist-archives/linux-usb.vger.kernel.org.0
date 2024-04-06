Return-Path: <linux-usb+bounces-8998-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9B189AD85
	for <lists+linux-usb@lfdr.de>; Sun,  7 Apr 2024 00:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE42CB21241
	for <lists+linux-usb@lfdr.de>; Sat,  6 Apr 2024 22:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5274E535D1;
	Sat,  6 Apr 2024 22:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s2fmgIr1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC9F4174C
	for <linux-usb@vger.kernel.org>; Sat,  6 Apr 2024 22:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712441002; cv=none; b=cF6G6GW4JeQqYMIRzaaQf21Fxpq6VLZTvHVU4ouiYE28NagbJSVjKB+J+ihnSuROKQ9rce+vZTUv7yO9VF18+MN0r6LXMUiWrDWv/toiPV+YMJcYE8xnPz/lXMWrbYYSOWhldgIn0OA+sw468Ulrwp/Lu7Z300nv5qfkSrhFxmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712441002; c=relaxed/simple;
	bh=IMO6CD89TVo8qWq0/qdkA+3x41O1FzftCZquzI8qcsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sv+7BAgXlLX6euyOYUvk3+mcvVrNf0R6lAkslD7Wro7nGuOHa7vlPVIGyKedUsgWSf4xrE18J9ZCRUs8AYuep58puOVd0Wj8SBDfTYWNNDGYSlnxly/CDDmfDPXjbVXlmPH8G6qGY7Ut1Q85YyAH1sYjAl/I80VCpcuAbGsnBCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s2fmgIr1; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-344117bee49so868743f8f.1
        for <linux-usb@vger.kernel.org>; Sat, 06 Apr 2024 15:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712440999; x=1713045799; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cOT28vLXeenuTF9raPMx7mM8udpRFqntILqCAo6YXaA=;
        b=s2fmgIr1S6iIq++ZePr93wquCULNfp/hMSPjPHVso9WpuRJJmYKzXccCKA1R/7t7jr
         5I1gmNhKhmoos6aImsP1VUt4zQxCkuwj1gaD0N1Tx/T8wTM6FAcctaIf0NjUsKO52Eav
         UIiRb0yGJhPqeTftN8WSqc88belSSVziD+E30NDFfhWLAn4frT4bZLsAOIZYgxI/0DCA
         Y6AZhYkUrC8StaYTdjpTUHgUpoJtZJQUkXa1wM9cqvO4f/hlPzjuc52OwgELk6XOwfFK
         XM5fWie9P2fnUmW+5rhL6UInlHKj/xRplhoYggkwlOTUDpFDLzUUjD5XtjqDqGeqm7hM
         y0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712440999; x=1713045799;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cOT28vLXeenuTF9raPMx7mM8udpRFqntILqCAo6YXaA=;
        b=lST9knl6N6T6rDtriT3iHXSRevlw3tgxvfi/r/4StAsbp9nVg9tu7QFunQQ6xK2orh
         yqv8akOgRZ1X7d1/T74BJOcwHmLKJ4SrbV62yir5rDmm8Guj527A+3qHkXfnqIlxwo0a
         W5D4B3MlczSz/JoChSIRdRWZ9u5ZfICd93O80louMtWKXSbohvBylCOv+6acMC6Uph50
         s0m/uZyZB/ExWFWIeQAd1/Rhtawl4jDbffWzPFsZ79NqVcvsh2lLmwRx6O7T+KPvDEMT
         o9vE5sX3jAdAqM8i94uqAJQW5FEewwqvs40tYG5p7p1iD6OiQKrsKyoDn5TjiI9Zls9A
         gjCw==
X-Forwarded-Encrypted: i=1; AJvYcCWlVKfhsEZ33NAYksFhHKHVVDILJx7pmCk01kS4njvCa1sgrSpIwJjeZEyyb074F5GtT82zuwjbYh7WUQb6od0M1R+qyiyTvdg4
X-Gm-Message-State: AOJu0YyHIo5bL91+Anjxaxbjcc/h7CdITueBVMDeGF7ZSom1Qgqay0ix
	TKG4zUwXoFdRIf1MucXApNeGwfsP4R1GTo9oq3Y7sgBnLhwrny738y3sTTnYG7g=
X-Google-Smtp-Source: AGHT+IEZN1L85x79gQ4xMojuOPnIGHgKi2wu24OvxCazvAYLzctdWT//NwoyqeeAEJaSlVvVP++iBQ==
X-Received: by 2002:adf:fdc9:0:b0:33e:c91a:127e with SMTP id i9-20020adffdc9000000b0033ec91a127emr4313074wrs.63.1712440999316;
        Sat, 06 Apr 2024 15:03:19 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id r24-20020adfb1d8000000b00341b451a31asm5380465wra.36.2024.04.06.15.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Apr 2024 15:03:18 -0700 (PDT)
Message-ID: <c1899fae-8669-485a-95bd-0e76738a1187@linaro.org>
Date: Sat, 6 Apr 2024 23:03:17 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: split HPD bridge alloc and
 registration
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Caleb Connolly <caleb.connolly@linaro.org>,
 Johan Hovold <johan+linaro@kernel.org>
References: <20240405-qc-pmic-typec-hpd-split-v1-1-363daafb3c36@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240405-qc-pmic-typec-hpd-split-v1-1-363daafb3c36@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2024 19:11, Dmitry Baryshkov wrote:
> If a probe function returns -EPROBE_DEFER after creating another device
> there is a change of ening up in a probe deferral loop, (see commit

*ending

> fbc35b45f9f6 ("Add documentation on meaning of -EPROBE_DEFER").
> 
> In order to prevent such probe-defer loops caused by qcom-pmic-typec
> driver, use the API added by Johan Hoval and move HPD bridge

*Hovold

> registeration to the end of the probe function.

registration

> 
> Reported-by: Caleb Connolly <caleb.connolly@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> index e48412cdcb0f..96b41efae318 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -41,7 +41,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   	struct device_node *np = dev->of_node;
>   	const struct pmic_typec_resources *res;
>   	struct regmap *regmap;
> -	struct device *bridge_dev;
> +	struct auxiliary_device *bridge_dev;
>   	u32 base;
>   	int ret;
>   
> @@ -92,7 +92,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   	if (!tcpm->tcpc.fwnode)
>   		return -EINVAL;
>   
> -	bridge_dev = drm_dp_hpd_bridge_register(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
> +	bridge_dev = devm_drm_dp_hpd_bridge_alloc(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
>   	if (IS_ERR(bridge_dev))
>   		return PTR_ERR(bridge_dev);
>   
> @@ -110,6 +110,10 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto fwnode_remove;
>   
> +	ret = devm_drm_dp_hpd_bridge_add(tcpm->dev, bridge_dev);
> +	if (ret)
> +		goto fwnode_remove;
> +

Is there any reason this call comes after port_start/pdphy_start ?

I think the bridge add should go before starting the typec port and 
pdphy since after the start calls IRQs are enabled.

With those minor points addressed

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

