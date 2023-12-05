Return-Path: <linux-usb+bounces-3765-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 818D9806143
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 23:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 455CFB211E2
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 22:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3656FCF3;
	Tue,  5 Dec 2023 22:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ktEzvmTp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A1FEAC
	for <linux-usb@vger.kernel.org>; Tue,  5 Dec 2023 14:03:34 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a1915034144so19963366b.0
        for <linux-usb@vger.kernel.org>; Tue, 05 Dec 2023 14:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701813812; x=1702418612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R17jjO/Vw4wRIx9Ju0HZ2kb3C5GDd4Vm8IbDi1LNWjk=;
        b=ktEzvmTpGa0kGjq8+oF/G7HmFUeXo3horeFfdZpi+z3J5aJ8wkmzxYhX/jU1OZ5pR9
         42CJyloNsw9Td7GcYkvcB6vXvAZf9+Z/0mZT/j0Z5F7BLV80NbyPAuLPjoOVxKkdiwoS
         +A8zBaKXuANVN7oizdjsu6ynASuc93Kwgyt2tPTcZRD9HTrt5PeqohcU5q2UJ8Rr0YET
         Df/pHvvoutkoVsKyHswAICdbXncO8Cu1Yrp+6FJ7y9Ytmm14AOyAElNmjfk72eNdDH14
         Yeg6JeDpPolxKv23bwVwOUT+4Zm3nKYE6WVLBjtUW3onrVn0dd98sR0DW2dtdrpwx9Q3
         EPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701813812; x=1702418612;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R17jjO/Vw4wRIx9Ju0HZ2kb3C5GDd4Vm8IbDi1LNWjk=;
        b=LjAd+VpJUSiOXZ2Z28gDmtxroaUMejyhmutQZnnEm7jkl9CuLBVMY/3btjV0oiCQl7
         m18971y7tbPfZgq/zx4dcZ45tfL44Qyvl2EinpUeH70/M50uT2MFzdcXuby7lurk0LXM
         v3BFBT1nD4o7qHmaoN9qT4B5PWRjsKJXR+W+/M0iHZQw+iBgTKHinFgARp6HMmy41ul4
         7ZY/+j+8HTjW5QHEFdZXCKnMvQBe98Yl213ZFn7M4oADgPXFcXC7mz7wvipiQMqHJgkC
         vlHqtwGwnPSltf69xiZSz9iWI681Qn4ECTEKfDII/rB4Dp9/usaiwj0M4H0wm+HylLlp
         KRRA==
X-Gm-Message-State: AOJu0Yyw7KaUNMnNavYakvgXqWbZ+NnPGke+X+BTQYQIA6ughapgy3XU
	cIwgFC2VMWRBk2gMmkTV3MXd/4gWGpYJiqS1lbjkmqex
X-Google-Smtp-Source: AGHT+IE/hqq5solRByq/6s4+0WTlT9xIiduM2nthd2KHQBztl+NRk6XM/HBt9ZMTdjcUIz5MDEwfZg==
X-Received: by 2002:a17:906:2655:b0:a18:50ad:9ab with SMTP id i21-20020a170906265500b00a1850ad09abmr5106299ejc.74.1701813812535;
        Tue, 05 Dec 2023 14:03:32 -0800 (PST)
Received: from ?IPV6:2001:1c06:2302:5600:366d:ca8f:f3af:381? (2001-1c06-2302-5600-366d-ca8f-f3af-0381.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:366d:ca8f:f3af:381])
        by smtp.gmail.com with ESMTPSA id hq3-20020a1709073f0300b00a1cc1be1158sm1159684ejc.165.2023.12.05.14.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 14:03:32 -0800 (PST)
Message-ID: <94157ef7-95c9-429a-97c5-3bab2b9074ca@linaro.org>
Date: Tue, 5 Dec 2023 23:03:31 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] usb: typec: qcom-pmic-typec: Only select
 DRM_AUX_HPD_BRIDGE with OF
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, dmitry.baryshkov@linaro.org
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 linux@roeck-us.net, neil.armstrong@linaro.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, patches@lists.linux.dev
References: <20231205-drm_aux_bridge-fixes-v1-0-d242a0ae9df4@kernel.org>
 <20231205-drm_aux_bridge-fixes-v1-2-d242a0ae9df4@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20231205-drm_aux_bridge-fixes-v1-2-d242a0ae9df4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2023 21:13, Nathan Chancellor wrote:
> CONFIG_DRM_AUX_HPD_BRIDGE depends on CONFIG_OF but that dependency is
> not included when CONFIG_TYPEC_QCOM_PMIC selects it, resulting in a
> Kconfig warning when CONFIG_OF is disabled:
> 
>    WARNING: unmet direct dependencies detected for DRM_AUX_HPD_BRIDGE
>      Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && OF [=n]
>      Selected by [m]:
>      - TYPEC_QCOM_PMIC [=m] && USB_SUPPORT [=y] && TYPEC [=m] && TYPEC_TCPM [=m] && (ARCH_QCOM || COMPILE_TEST [=y]) && (DRM [=m] || DRM [=m]=n) && DRM_BRIDGE [=y]
> 
> Only select CONFIG_DRM_AUX_HPD_BRIDGE with both CONFIG_DRM_BRIDGE and
> CONFIG_OF to clear up the warning.
> 
> Fixes: 7d9f1b72b296 ("usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   drivers/usb/typec/tcpm/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
> index 64d5421c69e6..8cdd84ca5d6f 100644
> --- a/drivers/usb/typec/tcpm/Kconfig
> +++ b/drivers/usb/typec/tcpm/Kconfig
> @@ -80,7 +80,7 @@ config TYPEC_QCOM_PMIC
>   	tristate "Qualcomm PMIC USB Type-C Port Controller Manager driver"
>   	depends on ARCH_QCOM || COMPILE_TEST
>   	depends on DRM || DRM=n
> -	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE
> +	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
>   	help
>   	  A Type-C port and Power Delivery driver which aggregates two
>   	  discrete pieces of silicon in the PM8150b PMIC block: the
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

