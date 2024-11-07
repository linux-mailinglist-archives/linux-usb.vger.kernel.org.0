Return-Path: <linux-usb+bounces-17293-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0C39C001F
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 09:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98987B22C55
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 08:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98AC31D95BE;
	Thu,  7 Nov 2024 08:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XCjpiXed"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5932938FB0
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 08:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730968607; cv=none; b=Umt6J0Xat+i05BvtQ4JFNIx1GtPW89JDCoaOhCTQ5v1oYUTKnK0QfnFuRrUIQKxb3ekG2QBBpV+s0dfwATbXuJojKy1I6yulgt5WQ/oySuNlJQQttHU0HiiqQ3TOMIGrjbNPamdm5yGzuRbWYE7W81x1OLFtKmrQb+gZ9OQ6lbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730968607; c=relaxed/simple;
	bh=MPJ+xmLRPWSjz9ln4OpMyFp7bhdGCuhiFxfh6eG1iHY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BHVyA6ODMSLdAyjBw/SKEiX0vBhO49wmMa0WJIXy9QoEuu1Dc2OnRrV9+SfUW8oQ1ZTXp4jjG9oPJnWFplxsspcw2c5zLSULj7nh6Gj0rNq2ZU1kFSnHxv6Ur8qHhRbvYiqy1laTDLkmhNWAYYujLFRKTI1+N/BAfdnM//bFdnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XCjpiXed; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso96874266b.1
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2024 00:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730968603; x=1731573403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQqbXphX1ImdcqyYzsEcnQnjSL8lwVsJxL3Rfwp4m44=;
        b=XCjpiXededHeT968NlgLHuQW76FFIAeKyQjj1wvNcZu6enptHxK0g4kUWk91jEyYsE
         BEswX27ijWZ+R5+qQ0FtHShsjG3DvUkSGMRoZt83fau4Y14L/Z1F7as/GBuGyeQYkh7G
         CMPXSvoaR4Sby/7J8gwcB/edYKW14QvpJ+Du7yE+Vkx9Z19MGlZ0x85ZawXlTDBA/aqp
         XxL5QjeFW9Dxw5goOZVFX3I+zkASRQlkvF07ZCV9uGswcUs9TvKwgTmJAImb9V284l8m
         oPETvk1G37wGkjF95qXezAjZ0N++s1G/KpTA2eoYPKHQm0nIduu3pUgEM9HO3Z1yOb21
         u28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730968603; x=1731573403;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PQqbXphX1ImdcqyYzsEcnQnjSL8lwVsJxL3Rfwp4m44=;
        b=mJ0HJH73LMiGKsgZSyq8tWPE5pjhQwppjgu12rbUbYKivmWfCV2fUVpp220yd3hdpv
         UK+g11ME4TVvvKXB53kIfAKV809crtrdarAzGmPNOVO1qYkO+mzubA1JC6J4argvXKdW
         pls+wjLw8DyYXZPNLN/HYDGlFGQGgMOxqHibBhgMD6EKrKuZ8UjnslhHXx7e30Ps+320
         gbnG/ZK5RSUg+sJYldCFPVeW9IfsLLrr1tMvUNDs2RnhN6iJ3GapK1Kkzx05IJpk9LTF
         FWkqUVq2pIGzyhcCFSmHxEwSnkHaXqMhhO7RMGwTmgmtsUApRMrhRpRzWK7VyRoye8xP
         V9XA==
X-Forwarded-Encrypted: i=1; AJvYcCUkWAm0Mzq/leItB79ijerDYQ53c7UV6DHOFAiC7ECabD/Z+d7Ol0Ex1vXS4KGEHbgniYP1J5GDQHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeRs46kQCZfg1pJHbO+65XCeDURYqdKF1wZogCmjV6XBHLsZ2T
	Y0bW0XReVHKGxrBQMQ0vN53oL6CoeGhfv+iA6mlG61wrh8SoPZ/mTeZeY2vp4LM=
X-Google-Smtp-Source: AGHT+IFVQvzta4Ew4PeO9Uvd51Ew88o9xgAYVE5WQNSEKQquZn+NYXkjaIpuZu6YQ4moZ1WlVeDqMw==
X-Received: by 2002:a17:906:6a09:b0:a99:ffdb:6fef with SMTP id a640c23a62f3a-a9de61cef8amr4451274366b.46.1730968603531;
        Thu, 07 Nov 2024 00:36:43 -0800 (PST)
Received: from [172.16.23.252] ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0defb61sm59727766b.150.2024.11.07.00.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 00:36:43 -0800 (PST)
Message-ID: <af93d56c-0656-4bb3-8533-0cbb69eb59cb@linaro.org>
Date: Thu, 7 Nov 2024 09:36:42 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] usb: typec: ucsi: glink: fix off-by-one in
 connector_status
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogeurs@linux.intel.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan+linaro@kernel.org>
References: <20241106-ucsi-glue-fixes-v1-0-d0183d78c522@linaro.org>
 <20241106-ucsi-glue-fixes-v1-1-d0183d78c522@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20241106-ucsi-glue-fixes-v1-1-d0183d78c522@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2024 16:45, Dmitry Baryshkov wrote:
> UCSI connector's indices start from 1 up to 3, PMIC_GLINK_MAX_PORTS.
> Correct the condition in the pmic_glink_ucsi_connector_status()
> callback, fixing Type-C orientation reporting for the third USB-C
> connector.
> 
> Fixes: 76716fd5bf09 ("usb: typec: ucsi: glink: move GPIO reading into connector_status callback")
> Reported-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/usb/typec/ucsi/ucsi_glink.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index 3e4d88ab338e50d4265df15fc960907c36675282..2e12758000a7d2d62f6e0b273cb29eafa631122c 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -185,7 +185,7 @@ static void pmic_glink_ucsi_connector_status(struct ucsi_connector *con)
>   	struct pmic_glink_ucsi *ucsi = ucsi_get_drvdata(con->ucsi);
>   	int orientation;
>   
> -	if (con->num >= PMIC_GLINK_MAX_PORTS ||
> +	if (con->num > PMIC_GLINK_MAX_PORTS ||
>   	    !ucsi->port_orientation[con->num - 1])
>   		return;
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

