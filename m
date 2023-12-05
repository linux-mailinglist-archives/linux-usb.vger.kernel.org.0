Return-Path: <linux-usb+bounces-3766-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B3C80614F
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 23:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6BD3281E75
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 22:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3AB6FCF9;
	Tue,  5 Dec 2023 22:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fH5T8rso"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73845D53
	for <linux-usb@vger.kernel.org>; Tue,  5 Dec 2023 14:04:34 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c9f4bb2e5eso49567111fa.1
        for <linux-usb@vger.kernel.org>; Tue, 05 Dec 2023 14:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701813872; x=1702418672; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YcEMEJf4lCydMrLOTT6eApwWgWe19yXNqzmuvh+QqWY=;
        b=fH5T8rsowcqWO3IPOS6SpZctAHcQB7R9STNdq6gQAvvN7c1Jlry9EW0Sti41Vcqcp4
         AM8XQeiIAavnGNAtaw/GZ6k4MgX/Y/AZjGXBucvm1NKLGQ8/qj6wTMZ3/bkmvv9rqUkI
         s2LhSovr11Sgo7Bfcni36KXVC2rD8E5u0sPOUoV5tceccggSOf952OQ3bdkCjscgdsRt
         aEqU6BcLGNN+Q82Y7ovBt0Hxlq3/u9dwQ7mJmjM/ulc7br+UYbfaNBRlp4MNAF5CnZOg
         W+RbgI2DCMpvD5x/OeD4R3JqLmlprIGceeCjtvir/fP6cKXpeE0BiBqk5TlFzS7wuQX9
         wlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701813872; x=1702418672;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YcEMEJf4lCydMrLOTT6eApwWgWe19yXNqzmuvh+QqWY=;
        b=LcqxTeNi6JaVsFcyackhdI3wpW26m2Nfvdbkdmqsglm7zBgULZqpWmGgqtEGTqnId7
         KXEw9tjts/fiUrS9F+g2tb+1sp/vJjwLCHpPHyKrqBWThke7NGwkJhJ0xe/+90xOprCE
         7bmBulGkRNRM2mXIM+fu40MOqasSLJbE3M9Od1X/tT+6cVCtsMstA50MGiTNlE1Izu/3
         71iX9DnH17cqEAt1Binjk0wyI54eERkn62nxVQm4EIYbweZJyXs+VfPvBblKu6Qm7tEk
         pvFsi406ecM7183Da1J5jjJgxYyK42s3dl7ZAQNcPjwo99czUijm1OGa00a5WihjUgEF
         jAzA==
X-Gm-Message-State: AOJu0YzGiom3w20QFzyOhm+i2C88YM6xYagLt2d0ZvmjDs5TU5FhjLla
	vgdC8tQBspHlff2cmf7HZ+acLQBFqr1VkQej4azx7tQu
X-Google-Smtp-Source: AGHT+IELJFW4CRavNSvWmbv6+vTpGPUZn67DcntqLGgQXhIS4H64Z9uxXCZut3JO674Qxj6E0JTCBg==
X-Received: by 2002:a2e:b742:0:b0:2ca:20f7:531b with SMTP id k2-20020a2eb742000000b002ca20f7531bmr22788ljo.51.1701813872482;
        Tue, 05 Dec 2023 14:04:32 -0800 (PST)
Received: from ?IPV6:2001:1c06:2302:5600:366d:ca8f:f3af:381? (2001-1c06-2302-5600-366d-ca8f-f3af-0381.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:366d:ca8f:f3af:381])
        by smtp.gmail.com with ESMTPSA id hq3-20020a1709073f0300b00a1cc1be1158sm1159684ejc.165.2023.12.05.14.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 14:04:31 -0800 (PST)
Message-ID: <bc0bbe57-1739-4338-abfb-bd7011dc904b@linaro.org>
Date: Tue, 5 Dec 2023 23:04:31 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/bridge: Return NULL instead of plain 0 in
 drm_dp_hpd_bridge_register() stub
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, dmitry.baryshkov@linaro.org
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 linux@roeck-us.net, neil.armstrong@linaro.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, patches@lists.linux.dev,
 kernel test robot <lkp@intel.com>
References: <20231205-drm_aux_bridge-fixes-v1-0-d242a0ae9df4@kernel.org>
 <20231205-drm_aux_bridge-fixes-v1-3-d242a0ae9df4@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20231205-drm_aux_bridge-fixes-v1-3-d242a0ae9df4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2023 21:13, Nathan Chancellor wrote:
> sparse complains:
> 
>    drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c: note: in included file:
>    include/drm/bridge/aux-bridge.h:29:16: sparse: sparse: Using plain integer as NULL pointer
> 
> Return NULL to clear up the warning.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312060025.BdeqZrWx-lkp@intel.com/
> Fixes: e560518a6c2e ("drm/bridge: implement generic DP HPD bridge")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   include/drm/bridge/aux-bridge.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
> index 66249ff0858e..c4c423e97f06 100644
> --- a/include/drm/bridge/aux-bridge.h
> +++ b/include/drm/bridge/aux-bridge.h
> @@ -26,7 +26,7 @@ void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status sta
>   static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
>   							struct device_node *np)
>   {
> -	return 0;
> +	return NULL;
>   }
>   
>   static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
> 

Nice

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

