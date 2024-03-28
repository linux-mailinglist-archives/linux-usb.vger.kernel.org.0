Return-Path: <linux-usb+bounces-8000-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA9887D2AE
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 18:23:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E6281F25089
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 17:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA124AEF9;
	Fri, 15 Mar 2024 17:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D1YxW2xt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2034AED8
	for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 17:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710523369; cv=none; b=SgsnyV6JeOuAvhEuPwPWIM2tgvGrwDzAxmYJppF3DXoPijqeolQCsQIsWr3nrPdyfIM86sJduccY/PultMzZJMoE9yknEPPu6shP0cK2h2NtiXcl4ykOFAMEykpjfdcHupM/oWr+EVZY46+nwHdJdBfaWFBRTGU3KwrczxDHPCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710523369; c=relaxed/simple;
	bh=mAhE3o0SrMCeflcuooFtxO5kccZA1jl/gXfmf7FXXXY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OebubCc8EROxlJqa9LyDLHZ57BxF0t2LfwRrggnOrzw/XL/bffkqYPdTKwdTEgjF/0ztbwJzt8/YBxXtgLkJZrz/aXSPjAwTqBqc2S+7ZO2n2dEMeFrCBchsr481C6eHmM7u82WV2EIYtDafULqHYwy5W7PnMyKBihK2hoeRKcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D1YxW2xt; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-413feaf0625so8250885e9.0
        for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 10:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710523366; x=1711128166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8LDXTlkgNdzNpQM4AckJ/eSrFb3E/elpUN5arl+3BbQ=;
        b=D1YxW2xtp3g9lNWf1RdLqoxXqV8YaPgpwiL3wC2MDhEiaFUWtKtR6i8gFHf40E47nV
         ehY2MNVYS+D04qy9ORj+5H3nhnXjB8WX02FFgTDJrDYvd6zAHap65Nur+z6FSYaf+qaM
         aU5CUC+0Qwjpujv7Fuao/XOeR/6VtSw775m6C6nF5vyR4x32ITjTRWDbBeCLMSjMbQ+7
         Z7JhamadV9b+78zj1Tg6FmIALsTtKQLPUJofp30RAQHW+D8r0/1Ui1lpbF/BEoJd/7gR
         PiAlluiMda4UdCfsFQUwrE9bLD2olyovyFVM3Ig4QV3dsrOg7/Iii3JWJXAbSvMCwWQB
         cMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710523366; x=1711128166;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8LDXTlkgNdzNpQM4AckJ/eSrFb3E/elpUN5arl+3BbQ=;
        b=P/+NBoDxkf2/fpMSmkLav9FuOoa2V10Ztx1L85MFJ2UsU/NRoCsiwbb/P1R/pxOU/r
         em31S6lYxYzTg3sxbCaQgRzgWEpEWMY1t6wUygOvkBkl8rsE9eHflU4BDxzBNM/XaTjD
         P3SHZgXtJTofJ75CHnaHDtvLWUk/xwPx1REfZSb8/IZfU+6aWmmC4m7G+ABUfiatcj51
         IHgIMxrlWboy1ff4JLuXWrQ79NNi7Ak7cxqq39gBv6Wsy7nM1CDhXuASa83+gOrogXDq
         4kcc1HodOwKXaLkXXyswYkLLmz1zrqL47lw353bMKcyJpS7G/dvw1RdXONZYj5h9Uqf0
         U0Aw==
X-Forwarded-Encrypted: i=1; AJvYcCX1qMZObAnhF3IJ8LdQ7wuu5HlOHtNJDWQ++CVWmCnamUR91Hd5PYl6z2KxL6PVETOx80M9Mu8YM/wugrZIVrkRoSF1DjgQfyPG
X-Gm-Message-State: AOJu0YyDhg8wShxak09p7S6NWm/33IIgZ7A9KZtoO5hfPVwcRUl7zm2G
	gfaYD9qFb39gES6Yl+pe0xxAFgnCW/XUEkD87iQ+pHn2HfUq2OHUtiMynAkSsRQ=
X-Google-Smtp-Source: AGHT+IE+tglPP52E7sGBtoK9bjSYFBUkswYItNjrVGIPqxkzJGnOxbpS3lX+gGL6lHvEIr8omTLi7A==
X-Received: by 2002:a05:600c:4e16:b0:413:feb5:96f6 with SMTP id b22-20020a05600c4e1600b00413feb596f6mr2356468wmq.21.1710523366246;
        Fri, 15 Mar 2024 10:22:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a633:992a:92cc:9c3? ([2a01:e0a:982:cbb0:a633:992a:92cc:9c3])
        by smtp.gmail.com with ESMTPSA id p7-20020adfcc87000000b0033e25c39ac3sm3629908wrj.80.2024.03.15.10.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 10:22:45 -0700 (PDT)
Message-ID: <b0e6badf-51f8-4c70-b315-5e5fd7a8e91b@linaro.org>
Date: Fri, 15 Mar 2024 18:22:44 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/1] usb: typec: ucsi: Check capabilities before cable
 and identity discovery
Content-Language: en-US, fr
To: Jameson Thies <jthies@google.com>, heikki.krogerus@linux.intel.com,
 linux-usb@vger.kernel.org
Cc: pmalani@chromium.org, bleung@google.com, abhishekpandit@chromium.org,
 andersson@kernel.org, dmitry.baryshkov@linaro.org,
 fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org,
 hdegoede@redhat.com, rajaram.regupathy@intel.com, saranya.gopal@intel.com,
 linux-kernel@vger.kernel.org
References: <20240315171836.343830-1-jthies@google.com>
 <20240315171836.343830-2-jthies@google.com>
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
Organization: Linaro Developer Services
In-Reply-To: <20240315171836.343830-2-jthies@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/03/2024 18:18, Jameson Thies wrote:
> Check the UCSI_CAP_GET_PD_MESSAGE bit before sending GET_PD_MESSAGE to
> discover partner and cable identity, check UCSI_CAP_CABLE_DETAILS before
> sending GET_CABLE_PROPERTY to discover the cable and check
> UCSI_CAP_ALT_MODE_DETAILS before registering the a cable plug. Additionally,
> move 8 bits from reserved_1 to features in the ucsi_capability struct. This
> makes the field 16 bits, still 8 short of the 24 bits allocated for it in
> UCSI v3.0, but it will not overflow because UCSI only defines 14 bits in
> bmOptionalFeatures.
> 
> Fixes: 38ca416597b0 ("usb: typec: ucsi: Register cables based on GET_CABLE_PROPERTY")
> Link: https://lore.kernel.org/linux-usb/44e8142f-d9b3-487b-83fe-39deadddb492@linaro.org
> Suggested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Jameson Thies <jthies@google.com>
> ---
> Confirmed a device which supports GET_PD_MESSAGE, GET_CABLE_PROPERTY and
> GET_ALTERNATE_MODES still requested identity and cable information.
> 
>   drivers/usb/typec/ucsi/ucsi.c | 34 +++++++++++++++++++++-------------
>   drivers/usb/typec/ucsi/ucsi.h |  5 +++--
>   2 files changed, 24 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index cf52cb34d2859..958dc82989b60 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1133,17 +1133,21 @@ static int ucsi_check_cable(struct ucsi_connector *con)
>   	if (ret < 0)
>   		return ret;
>   
> -	ret = ucsi_get_cable_identity(con);
> -	if (ret < 0)
> -		return ret;
> +	if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE) {
> +		ret = ucsi_get_cable_identity(con);
> +		if (ret < 0)
> +			return ret;
> +	}
>   
> -	ret = ucsi_register_plug(con);
> -	if (ret < 0)
> -		return ret;
> +	if (con->ucsi->cap.features & UCSI_CAP_ALT_MODE_DETAILS) {
> +		ret = ucsi_register_plug(con);
> +		if (ret < 0)
> +			return ret;
>   
> -	ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_SOP_P);
> -	if (ret < 0)
> -		return ret;
> +		ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_SOP_P);
> +		if (ret < 0)
> +			return ret;
> +	}
>   
>   	return 0;
>   }
> @@ -1189,8 +1193,10 @@ static void ucsi_handle_connector_change(struct work_struct *work)
>   			ucsi_register_partner(con);
>   			ucsi_partner_task(con, ucsi_check_connection, 1, HZ);
>   			ucsi_partner_task(con, ucsi_check_connector_capability, 1, HZ);
> -			ucsi_partner_task(con, ucsi_get_partner_identity, 1, HZ);
> -			ucsi_partner_task(con, ucsi_check_cable, 1, HZ);
> +			if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE)
> +				ucsi_partner_task(con, ucsi_get_partner_identity, 1, HZ);
> +			if (con->ucsi->cap.features & UCSI_CAP_CABLE_DETAILS)
> +				ucsi_partner_task(con, ucsi_check_cable, 1, HZ);
>   
>   			if (UCSI_CONSTAT_PWR_OPMODE(con->status.flags) ==
>   			    UCSI_CONSTAT_PWR_OPMODE_PD)
> @@ -1589,8 +1595,10 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
>   		ucsi_register_partner(con);
>   		ucsi_pwr_opmode_change(con);
>   		ucsi_port_psy_changed(con);
> -		ucsi_get_partner_identity(con);
> -		ucsi_check_cable(con);
> +		if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE)
> +			ucsi_get_partner_identity(con);
> +		if (con->ucsi->cap.features & UCSI_CAP_CABLE_DETAILS)
> +			ucsi_check_cable(con);
>   	}
>   
>   	/* Only notify USB controller if partner supports USB data */
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index 32daf5f586505..0e7c92eb1b227 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -206,7 +206,7 @@ struct ucsi_capability {
>   #define UCSI_CAP_ATTR_POWER_OTHER		BIT(10)
>   #define UCSI_CAP_ATTR_POWER_VBUS		BIT(14)
>   	u8 num_connectors;
> -	u8 features;
> +	u16 features;
>   #define UCSI_CAP_SET_UOM			BIT(0)
>   #define UCSI_CAP_SET_PDM			BIT(1)
>   #define UCSI_CAP_ALT_MODE_DETAILS		BIT(2)
> @@ -215,7 +215,8 @@ struct ucsi_capability {
>   #define UCSI_CAP_CABLE_DETAILS			BIT(5)
>   #define UCSI_CAP_EXT_SUPPLY_NOTIFICATIONS	BIT(6)
>   #define UCSI_CAP_PD_RESET			BIT(7)
> -	u16 reserved_1;
> +#define UCSI_CAP_GET_PD_MESSAGE		BIT(8)
> +	u8 reserved_1;
>   	u8 num_alt_modes;
>   	u8 reserved_2;
>   	u16 bc_version;

It looks fine:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

I'll run a test on the affected platforms in the next days and
report if it fixes the regression.

Thanks,
Neil

