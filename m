Return-Path: <linux-usb+bounces-3774-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FAC806812
	for <lists+linux-usb@lfdr.de>; Wed,  6 Dec 2023 08:16:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F368C1F21109
	for <lists+linux-usb@lfdr.de>; Wed,  6 Dec 2023 07:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F5D15AC2;
	Wed,  6 Dec 2023 07:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KIPeSnlm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 369FE1B6
	for <linux-usb@vger.kernel.org>; Tue,  5 Dec 2023 23:16:13 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50bfa5a6cffso3603036e87.0
        for <linux-usb@vger.kernel.org>; Tue, 05 Dec 2023 23:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701846971; x=1702451771; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zDXbMWEhNI2lTiHePaAGslfA8GicK9kiWYsFKaGDIVI=;
        b=KIPeSnlmUAfq8qCDYuebG2RO93LeEF5Q5tXjezP/79MFyEHxfWXmbbu+B0moudr+v+
         NUVBCmpByYoCfcEVTuELtqfrbzRnEpJMr/TSDGJybI4e5MRAmqw1YXCGo8+a5uFLzgvm
         1bwFucN5okUca4kYFTIVd5meTGpXqxuL3PNYum7jbp6Ua48TYjjKYxX69hq7dlJGvIDA
         Q1+0hAXRm0habB08T4fSR4tSw1uGSw0V1iE1YGfRYWVeJKtDaZgC5+uYJ6TIBSv2TpAe
         einT1xGUAoyJGIAgiN4ELwEtYWAnj1tCWJKEwP9VjBL7sIBWNYmoAAUm3dbcnI8fyboo
         8XFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701846971; x=1702451771;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zDXbMWEhNI2lTiHePaAGslfA8GicK9kiWYsFKaGDIVI=;
        b=AQGrqytaGgl1Loc09Su+ZEp8OzuF1tsrjz/htJBFUrzp7OFtStIm66aqXmuq116Ra/
         XA94LkgOCpYP8ZVjL8GsI3f+0jlExYSzSbupRLi+Ei4SEJ2WupIMLI0Y7aYFGPqMPxG+
         pPeZLltpkIi5oXQVwfDD1soVBfbHq+FAyLkCmiARqldsLTceip9L+f/98FH5/wcyzCfh
         HrAE45ER6zXOZqq8ZRHrleob4f3XECyrSLoVy3cMJRD034Awp111x55/vJOUaTeY63AI
         pH+ukxanSx48sgjMm4To3YtfQ7p6e4VYjVmoXV+dbfAQv7U8lrBHwDoS9ZtIhzxm8mnw
         3G3A==
X-Gm-Message-State: AOJu0YzlFtiHxq7SjiCBzhlhySr1VpZ+aBe7RjuhVVeBJd0C5m1aId7k
	5KixnnEIi4WyllqsNyCQoUzc9A==
X-Google-Smtp-Source: AGHT+IFosgPawxVbHM+ucU/rImmtmf74cewBhXNK/zsrvoN6gu4JaquJiaTw9BlgaIdmcDryu2w2SQ==
X-Received: by 2002:a05:6512:3d01:b0:50b:fdc6:9f30 with SMTP id d1-20020a0565123d0100b0050bfdc69f30mr276013lfv.41.1701846971330;
        Tue, 05 Dec 2023 23:16:11 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::227? (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
        by smtp.gmail.com with ESMTPSA id f17-20020a05651232d100b0050c10aa4582sm184607lfg.27.2023.12.05.23.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 23:16:10 -0800 (PST)
Message-ID: <fa72affd-ca04-4ea8-9892-d3a7cd1fbc8a@linaro.org>
Date: Wed, 6 Dec 2023 09:16:09 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] usb: typec: nb7vpq904m: Only select DRM_AUX_BRIDGE
 with OF
Content-Language: en-GB
To: Nathan Chancellor <nathan@kernel.org>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 linux@roeck-us.net, neil.armstrong@linaro.org, bryan.odonoghue@linaro.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev
References: <20231205-drm_aux_bridge-fixes-v1-0-d242a0ae9df4@kernel.org>
 <20231205-drm_aux_bridge-fixes-v1-1-d242a0ae9df4@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231205-drm_aux_bridge-fixes-v1-1-d242a0ae9df4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2023 22:13, Nathan Chancellor wrote:
> CONFIG_DRM_AUX_BRIDGE depends on CONFIG_OF but that dependency is not
> included when CONFIG_TYPEC_MUX_NB7VPQ904M selects it, resulting in a
> Kconfig warning when CONFIG_OF is disabled:
> 
>    WARNING: unmet direct dependencies detected for DRM_AUX_BRIDGE
>      Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && OF [=n]
>      Selected by [y]:
>      - TYPEC_MUX_NB7VPQ904M [=y] && USB_SUPPORT [=y] && TYPEC [=y] && I2C [=y] && (DRM [=y] || DRM [=y]=n) && DRM_BRIDGE [=y]
> 
> Only select CONFIG_DRM_AUX_BRIDGE with both CONFIG_DRM_BRIDGE and
> CONFIG_OF to clear up the warning.
> 
> Fixes: c5d296bad640 ("usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   drivers/usb/typec/mux/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

For this patch we'd need an ack from Heikki.

-- 
With best wishes
Dmitry


