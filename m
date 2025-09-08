Return-Path: <linux-usb+bounces-27701-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95476B48886
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 11:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E46311B23F3D
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 09:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E330821B9D2;
	Mon,  8 Sep 2025 09:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YHyv8Y4k"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979231DBB3A
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 09:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757323843; cv=none; b=LAcalGrXvaInQNG3dhISIJjTVLcHfG15O0LB6mwPV/Hz58A5cq0N248sYSUrZRt+oLRL9KnBtLVFGEBjeKPnKfM5TNPsreoSBxL9xfAG4XJrfJb5YBoYk8IbT283f0cen0abDUn1rbw0KUnjnZAARPlnJlzS5RSfdAI4wdBQIqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757323843; c=relaxed/simple;
	bh=LsOUd7+Z9Z+Mo1dnPNINflXj2hIFL62wsRvVTxSWBvc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lv2PnD/VCaCsMpFQZoDyEG8/skXwed+q5BtCFvYDwy716Efc8tAdlR/cEI0XDE4Ktb37OAHu5Jy3xCGaq2+VpCszkoqOpNk+b3lQluQSyrefxKTCyfgPpVKWECEDJumrA6s/uCATRWTO6v3FlRv6a4piFLudtlX+Ll3Hbw2LFn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YHyv8Y4k; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45de221da9cso5896105e9.0
        for <linux-usb@vger.kernel.org>; Mon, 08 Sep 2025 02:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757323840; x=1757928640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FtF54VfgupfvZeJRRHGSv+U6ADXC4swlfQBiZBgbQ98=;
        b=YHyv8Y4kMzhZpUGifji51WU5MFqvdfj3M4qKLmEwSlKCZfY11+JvaqSYY+kYjN7Lnv
         n+v1FmY7hdMVCFT3AdGTs1COfEhTmp5G8RRn1EbJeEHHdncc2vwU/XtuMZfdi/QSLVlN
         jVXOQPeLFY6+hDYwCGU0tN3fTycAFOkWCCIutJIwuX2g3/O6qD8MCCdGwAcJquVKeLYB
         YePRiiZFjh1ccp7ZOCOhv/Nx5HoOLMeMAZrIPqWjW5BtL878i5DYYe3rBuOd6pYYb2J+
         f+tWniW0zY5ZIHZe9H1lQ6hwGPs1pfncL8jL1C9ynG12dHNY7I5jkxqZ6PTh2wrZCKL9
         Btfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757323840; x=1757928640;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FtF54VfgupfvZeJRRHGSv+U6ADXC4swlfQBiZBgbQ98=;
        b=W1fBOTb20rM7jDt2QKNGYGCffxCy88oM6d04nwG7VrlWB3WTv0gARWzHPu0cQhrJwx
         IRokAOBpAMqvFP5mJUiipBRNavTDU3SD2VpJaQJJU5ZBBziEC6+5YnlI5fLe7+9IDRbH
         iAAnECuF032dspSRePanB+/ZWvKcqvYtZxPkyqb0rPerLAxsderww49t0STfY2wbuE5J
         E/BqZdngMM8oad0JkcuucKVKpId1f5yOwG5irIs60ywnJHGqgRlB/nJIaWQqWtbH1OHO
         OSAblf2RKzMv4Duxf1VTiTImZkhspkedFNF1/VLGVG4KJN/oTkcQ1v9PseLzvBpUTB9W
         /tNg==
X-Forwarded-Encrypted: i=1; AJvYcCWnofjfRL1v2mPpQJ+sp8BmZyt2zFFvOlAn7pC3mnrfv7juJamag8cDQPfRstDZizE5I4uu0P2vibs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfsqOPv1i974eM7rhVOMmikLGsiKmRNo8OfQ5YIhP2/PU35EnC
	Y4o7axRJ2edvfZ2W5pXm9Hb2/5UtSvzqmEMlfrpTZKXP3XY/Bk35zZFxwb5JoCm33INt4e675Je
	BQM249Pk=
X-Gm-Gg: ASbGncv2hJAdLzfuNT2d/ij8PXOx9vvGGg/VrdqDQSLbQFCYv/Ux5EfOt1cl3fYXXIU
	PmfzgiyjKvAAl8ILP1kxasDxSb2UElIzwn9OThOrTchJy4fdX1qF95TJycggBhMrtp9qloqBnng
	jcDbv9IivlxoMlVWZAO1cqIBjHMzswhV84SeeT8v9QYd0IS2K34SoKi8hVPVRInktIEQqESQb2h
	X14oAxQV2K7eZMX/4fjAhbjwLv/aK4ORAlcuMXy2FyWCmlMRtWJOuKJ6OgadPwj1li4/dXK8ReZ
	IAJRPjxUWoqbLndlT3kYHOk9VyQJiCk+ld54pF6A6S1aUUchswz9uH8FknSvYDqMqWsK2QmJZBO
	RAu06xu4DzjnkiiMWcLtAf47ZGPwYZN8la4GwiTe3NEBt55I54oaaeFiYobk7kI9ANz+xB48uR+
	8ag5u4o++Ohw==
X-Google-Smtp-Source: AGHT+IGyiZpMXc/GvPd2o7Uh5T36kcw74w38apSJc8if5dUxwmDFtbz866TLpkyqeLFzSiDauY31fg==
X-Received: by 2002:a05:600c:198a:b0:456:13b6:4b18 with SMTP id 5b1f17b1804b1-45dddedd746mr62465705e9.31.1757323839854;
        Mon, 08 Sep 2025 02:30:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:61c1:5d31:4427:381b? ([2a01:e0a:3d9:2080:61c1:5d31:4427:381b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45de5eabdb0sm42259215e9.8.2025.09.08.02.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 02:30:39 -0700 (PDT)
Message-ID: <764f349e-c860-467c-bac1-00655ff730e2@linaro.org>
Date: Mon, 8 Sep 2025 11:30:39 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] usb: typec: ucsi: Add check for UCSI version
To: Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com,
 pse.type-c.linux@intel.com
References: <20250905184401.3222530-1-venkat.jayaraman@intel.com>
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
In-Reply-To: <20250905184401.3222530-1-venkat.jayaraman@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2025 20:44, Venkat Jayaraman wrote:
> "Power Reading" bit is introduced in UCSI v2.1 and so limit the
> check for that bit only if version supported is 2.1 or above.
> 
> Fixes: c851b71fd6cd ("usb: typec: ucsi: Add support for READ_POWER_LEVEL command")
> Signed-off-by: Venkat Jayaraman <venkat.jayaraman@intel.com>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>   drivers/usb/typec/ucsi/ucsi.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 0d6b0cf5a7cd..3f568f790f39 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1293,7 +1293,8 @@ static void ucsi_handle_connector_change(struct work_struct *work)
>   	if (change & UCSI_CONSTAT_BC_CHANGE)
>   		ucsi_port_psy_changed(con);
>   
> -	if (UCSI_CONSTAT(con, PWR_READING_READY_V2_1)) {
> +	if (con->ucsi->version >= UCSI_VERSION_2_1 &&
> +	    UCSI_CONSTAT(con, PWR_READING_READY_V2_1)) {
>   		curr_scale = UCSI_CONSTAT(con, CURRENT_SCALE_V2_1);
>   		volt_scale = UCSI_CONSTAT(con, VOLTAGE_SCALE_V2_1);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

