Return-Path: <linux-usb+bounces-3069-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 623557F2817
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 09:54:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1789B281ED3
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 08:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCAE1208BE;
	Tue, 21 Nov 2023 08:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yEFRsMzS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A726ACA
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 00:54:19 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-507cd62472dso6647515e87.0
        for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 00:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700556858; x=1701161658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B9xw1X7ZA/w4qP7ewLLpSYyupPFRZNLRs/Ge/9QSmfw=;
        b=yEFRsMzSgF4f/nRfCL+DH0oaJmMShellPJJ7dsY3gp3JvYr5Lh7S/TWkil5R4Ow2IY
         VP0BMpRTDp3zAydt4COTTAwuaiIj2vUbOgMLGtYRwXQEWyWmpYS/FQuOH9lNi/vi4ME3
         gm5Xf8enTYewgGfhPq7Va8G8vPQoTcp3leV8rWcHWiSRFWDRxJ5+HptwvJUOsnHPVH0T
         NSRbEDMp6VCo/m9ihEGa4BdV8gXtZMU0sqnSpu09JJIwppeTQKm3Id1bpxf5vF1FWFgL
         MVxN2UsMDrxLDDiCfv4QEiPz2XYv4WDF0N/fggm5dgZ6sgOaDt40ktv9uULDNZpWat1z
         Sltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700556858; x=1701161658;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B9xw1X7ZA/w4qP7ewLLpSYyupPFRZNLRs/Ge/9QSmfw=;
        b=Y5lOhIPdsoHr1Rji5q0IQO5rKGbdoV+5YRMYOaoH5fsFFWMJrg3w25JD6gGitAKGuQ
         YrlEwwMxpK6wuhNcD5tVne6EeYtwNvvTpXsXH68KfXYqQyIOTpc9ujmwrGvKpqOzauCT
         pCPOV4r7m8rCNLt6Je7XWn0BOJ+IUPIpl0ilCTxBoKHohNLi5VJS3kyzSMP+BEwraa2V
         hUPIm7f1sQtic/5JtV4SjMx9TXvoP59NDeOIO/j1i4pJWpyfgcTO27isfekAofUV6yLB
         lbFm536RpvpSlMN11ANJxWH9cngq32IJsF/E5nQfMnteQt5Sxym78PHMn011tkS35vxX
         FQ5A==
X-Gm-Message-State: AOJu0YyceXoacvVZoPzukyWOL4cElGSdVK50gkGgGHw5xn/64svL6xu6
	z9yZOB6UMtD/fMk5TgYjH7Yv/A==
X-Google-Smtp-Source: AGHT+IF1xuQVsWLIefERP/sR6Kn9g3CbTRMtFwzRE/bayjQ5Xh7VoLcJ8SVMJ610YuVMdXcCuAIcKw==
X-Received: by 2002:a05:6512:3e25:b0:500:acae:30c5 with SMTP id i37-20020a0565123e2500b00500acae30c5mr737235lfv.15.1700556857891;
        Tue, 21 Nov 2023 00:54:17 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id w3-20020ac25983000000b0050aa51bd5b5sm1150927lfn.136.2023.11.21.00.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 00:54:17 -0800 (PST)
Message-ID: <209eceaa-10b0-47fc-aabf-1cfb0e1c9ce0@linaro.org>
Date: Tue, 21 Nov 2023 10:54:16 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] usb: typec: qcom-pmic-typec: switch to
 DRM_AUX_HPD_BRIDGE
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
 <20231103230414.1483428-7-dmitry.baryshkov@linaro.org>
In-Reply-To: <20231103230414.1483428-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2023 01:03, Dmitry Baryshkov wrote:
> Use the freshly defined DRM_AUX_HPD_BRIDGE instead of open-coding the
> same functionality for the DRM bridge chain termination.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Greg, Bryan, could you pease ack merging this patch through the drm-misc 
tree together with the rest of the series?

You have acked patch 3, but since that time I added this one.

> ---
>   drivers/usb/typec/tcpm/Kconfig                |  1 +
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 41 +++----------------
>   2 files changed, 7 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
> index 0b2993fef564..64d5421c69e6 100644
> --- a/drivers/usb/typec/tcpm/Kconfig
> +++ b/drivers/usb/typec/tcpm/Kconfig
> @@ -80,6 +80,7 @@ config TYPEC_QCOM_PMIC
>   	tristate "Qualcomm PMIC USB Type-C Port Controller Manager driver"
>   	depends on ARCH_QCOM || COMPILE_TEST
>   	depends on DRM || DRM=n
> +	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE
>   	help
>   	  A Type-C port and Power Delivery driver which aggregates two
>   	  discrete pieces of silicon in the PM8150b PMIC block: the
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> index 581199d37b49..1a2b4bddaa97 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -18,7 +18,7 @@
>   #include <linux/usb/tcpm.h>
>   #include <linux/usb/typec_mux.h>
>   
> -#include <drm/drm_bridge.h>
> +#include <drm/bridge/aux-bridge.h>
>   
>   #include "qcom_pmic_typec_pdphy.h"
>   #include "qcom_pmic_typec_port.h"
> @@ -36,7 +36,6 @@ struct pmic_typec {
>   	struct pmic_typec_port	*pmic_typec_port;
>   	bool			vbus_enabled;
>   	struct mutex		lock;		/* VBUS state serialization */
> -	struct drm_bridge	bridge;
>   };
>   
>   #define tcpc_to_tcpm(_tcpc_) container_of(_tcpc_, struct pmic_typec, tcpc)
> @@ -150,35 +149,6 @@ static int qcom_pmic_typec_init(struct tcpc_dev *tcpc)
>   	return 0;
>   }
>   
> -#if IS_ENABLED(CONFIG_DRM)
> -static int qcom_pmic_typec_attach(struct drm_bridge *bridge,
> -				     enum drm_bridge_attach_flags flags)
> -{
> -	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
> -}
> -
> -static const struct drm_bridge_funcs qcom_pmic_typec_bridge_funcs = {
> -	.attach = qcom_pmic_typec_attach,
> -};
> -
> -static int qcom_pmic_typec_init_drm(struct pmic_typec *tcpm)
> -{
> -	tcpm->bridge.funcs = &qcom_pmic_typec_bridge_funcs;
> -#ifdef CONFIG_OF
> -	tcpm->bridge.of_node = of_get_child_by_name(tcpm->dev->of_node, "connector");
> -#endif
> -	tcpm->bridge.ops = DRM_BRIDGE_OP_HPD;
> -	tcpm->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
> -
> -	return devm_drm_bridge_add(tcpm->dev, &tcpm->bridge);
> -}
> -#else
> -static int qcom_pmic_typec_init_drm(struct pmic_typec *tcpm)
> -{
> -	return 0;
> -}
> -#endif
> -
>   static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   {
>   	struct pmic_typec *tcpm;
> @@ -186,6 +156,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   	struct device_node *np = dev->of_node;
>   	const struct pmic_typec_resources *res;
>   	struct regmap *regmap;
> +	struct device *bridge_dev;
>   	u32 base[2];
>   	int ret;
>   
> @@ -241,14 +212,14 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   	mutex_init(&tcpm->lock);
>   	platform_set_drvdata(pdev, tcpm);
>   
> -	ret = qcom_pmic_typec_init_drm(tcpm);
> -	if (ret)
> -		return ret;
> -
>   	tcpm->tcpc.fwnode = device_get_named_child_node(tcpm->dev, "connector");
>   	if (!tcpm->tcpc.fwnode)
>   		return -EINVAL;
>   
> +	bridge_dev = drm_dp_hpd_bridge_register(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
> +	if (IS_ERR(bridge_dev))
> +		return PTR_ERR(bridge_dev);
> +
>   	tcpm->tcpm_port = tcpm_register_port(tcpm->dev, &tcpm->tcpc);
>   	if (IS_ERR(tcpm->tcpm_port)) {
>   		ret = PTR_ERR(tcpm->tcpm_port);

-- 
With best wishes
Dmitry


