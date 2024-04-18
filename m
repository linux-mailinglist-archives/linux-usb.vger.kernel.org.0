Return-Path: <linux-usb+bounces-9472-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 830A48AA5FD
	for <lists+linux-usb@lfdr.de>; Fri, 19 Apr 2024 01:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 232811F217FE
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 23:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623E177F10;
	Thu, 18 Apr 2024 23:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QEG4v2rw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9386C2E41C
	for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 23:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713483717; cv=none; b=cMGztywauVVBikRBgRmyj8iNfjzfTB7bnubAh1oCOh/5b1yhMTAjg3kfkb1JQ6UIK8auwijZAhZWKZGs7HnrsfJs7iXHL6J4VUI1/VER1iXDJbz+Hp7FelfK8bgzKKOzr/5AL1ML6e4hoCBn4Woc2jCUPMkEjU5ImskrUQa/eeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713483717; c=relaxed/simple;
	bh=+5tyRpFZjPP1SM73nE88cOsgWau4ESrZotbdiOXoto0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CIAnkkFTGfWQ1/KC8n3cMFKhryrBKgehi4z5JDO3PTwdmH4FV/fDpOlQ2nALGeaB2sELcpppJRcb0K8LhNjsNVzoC11wmmt02te0Sq/T5+62Rr0DdJ92KV6QnUzwdpONXSbyCWxwRS/hfY/B9zVulJ0OwavR8poq/Carz2Gt/Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QEG4v2rw; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6eb75c202dbso714753a34.2
        for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 16:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713483715; x=1714088515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9IJ76Ejq6B7Vhl/CGpUW1RVfuowjYIbxdWO91aKguEA=;
        b=QEG4v2rwTMo/MMKD7O0UFibmOQukmuIsz4HpQz+Xq5b10QlO7hYSIwbwnbm4kPw1n0
         /fDpB8zle/dkMj1CCbAehjRqk+lR1Qpt97o/+goFl7oNMD5E0ZolkyVBc6pagDQLWrUK
         YLFQUYqn7do+eHFxgTwUost+xO2W3o+3odEd6yr+05iSO92GsYsbBW2W6xMDn7fxuMI5
         SpeYEQ/GLJfpV9cPOj78Y9KSHmgLXNYtQ3xq0vytOYaCgWBLYAdkwK8OH7bhgbL3vNEF
         iCMRbVGuU/4IJxrSFYgWCfwbgTtuxEi+oLyPusStceKT4AkL5MCJOP4uHIGwU8+mPVWb
         s3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713483715; x=1714088515;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9IJ76Ejq6B7Vhl/CGpUW1RVfuowjYIbxdWO91aKguEA=;
        b=k0m9s8fvfd77CqeF3Tq7CgHxx0r/3ptJOfsok77S6KPs9hVWKvkri703rMg77lNo8x
         k86ztPM/CZ+MjnxlnYmxjzQ5DsX9LJP/xQizVNKmbcmmiOSHwKJ/8+LMiNEzSSXxRb5E
         9DOoJ3nVexAuXuYw14x8V21TkU7GragvUvg1CeceXmdfX4aL6+UHSjClddN+rq+02env
         dhuOKjFpuAE373HXqbfSA6JkPVyPQB6JO104iMj3OGthauYzt+gsuYYhpCEG57l2E5J7
         3ZZJ55FaCMFxDN2h3ACa6fAE1YOHWRiTpjDCD75cQAn3Ptmv5c7jDVmvnrBI9lJNA9ui
         CNkg==
X-Forwarded-Encrypted: i=1; AJvYcCVaciMOGelalmSNxcxdWrY52fOqHIeyDJyz9rQtPSInC8Ti8s1RfcICJBMgeeqK/BSsTB22rFaWzce5U8L5pHFzoDdGgvZ3pYcc
X-Gm-Message-State: AOJu0YxovlTJSzThI26hpVlhGeqg14y1xmZ/GGwD186Br0jAs5xbdjBp
	XLz55mbO/2i+dnX4PxCjUMPNivHtlssmOj+9Wy7hhGzWltX+B9ThfshSid13TcQ=
X-Google-Smtp-Source: AGHT+IEPPhrny4ZXAVN1iU2b2OjfmoT6zuGx6RKKiOlIUbWTSDXLSdB15t4JfekdzgJZ4+jLDhSH4w==
X-Received: by 2002:a05:6870:92c5:b0:239:e7:a679 with SMTP id g5-20020a05687092c500b0023900e7a679mr596171oak.14.1713483715726;
        Thu, 18 Apr 2024 16:41:55 -0700 (PDT)
Received: from [172.20.10.110] ([209.37.221.130])
        by smtp.gmail.com with ESMTPSA id ld2-20020a056a004f8200b006eaf43bbcb5sm2050444pfb.114.2024.04.18.16.41.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 16:41:55 -0700 (PDT)
Message-ID: <c5965733-f49b-4245-8d4e-778c94203845@linaro.org>
Date: Fri, 19 Apr 2024 00:41:54 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: typec: qcom-pmic: fix pdphy start() error
 handling
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240418145730.4605-1-johan+linaro@kernel.org>
 <20240418145730.4605-3-johan+linaro@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240418145730.4605-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/04/2024 15:57, Johan Hovold wrote:
> Move disabling of the vdd-pdphy supply to the start() function which
> enabled it for symmetry and to make sure that it is disabled as intended
> in all error paths of pmic_typec_pdphy_reset() (i.e. not just when
> qcom_pmic_typec_pdphy_enable() fails).
> 
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> index 6560f4fc98d5..5b7f52b74a40 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> @@ -475,10 +475,8 @@ static int qcom_pmic_typec_pdphy_enable(struct pmic_typec_pdphy *pmic_typec_pdph
>   
>   	qcom_pmic_typec_pdphy_reset_off(pmic_typec_pdphy);
>   done:
> -	if (ret) {
> -		regulator_disable(pmic_typec_pdphy->vdd_pdphy);
> +	if (ret)
>   		dev_err(dev, "pdphy_enable fail %d\n", ret);
> -	}
>   
>   	return ret;
>   }
> @@ -524,12 +522,17 @@ static int qcom_pmic_typec_pdphy_start(struct pmic_typec *tcpm,
>   
>   	ret = pmic_typec_pdphy_reset(pmic_typec_pdphy);
>   	if (ret)
> -		return ret;
> +		goto err_disable_vdd_pdhy;
>   
>   	for (i = 0; i < pmic_typec_pdphy->nr_irqs; i++)
>   		enable_irq(pmic_typec_pdphy->irq_data[i].irq);
>   
>   	return 0;
> +
> +err_disable_vdd_pdhy:
> +	regulator_disable(pmic_typec_pdphy->vdd_pdphy);
> +
> +	return ret;
>   }
>   
>   static void qcom_pmic_typec_pdphy_stop(struct pmic_typec *tcpm)

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

