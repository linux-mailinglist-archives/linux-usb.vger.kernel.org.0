Return-Path: <linux-usb+bounces-29791-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB43C15538
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 16:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F4B34274D8
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 15:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA8C2F616B;
	Tue, 28 Oct 2025 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SLF1iaPI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C8C33A005
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 14:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761663568; cv=none; b=Ce3ShjuHJL2viUOmfqcU9KdcoI8P3eDajiH1EvZlf/Si4jwg+uIxJT7H0zgwaTeqQlZ80JmupXp+dTslFKE5KSgUHuDOWCAmYB1YNHgRgoYpy4e/VSRXcgiThMDmTu6Ut4jDOUZU8tUVyZdlDVCLnoYHN4zEKFrQhKIbjIbwP5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761663568; c=relaxed/simple;
	bh=BiMRdmRoIl7l8nrxxTw2GsV6D3ZsuisFdGa3PGy0pkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QNieSQEbs3ClwtmT/CZRvMy/DT/otQCUD7JPDY1QUCNE0KVFw4a9qBzBT84h+/tiM7t7mLzipmrcC2DRU4n4lYxeZKxihI8if/jbFizQFkpYHJ0RCpFZ6fap5b1DLloJDRvbyGEva7eX8ZOo+d2hGppMRvKmbsgx955j3rgjA88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SLF1iaPI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47109187c32so33610715e9.2
        for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 07:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761663564; x=1762268364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/tEghCQNR+Ghq6UpTXWvvavmRHa5Qip/flVo1Z/DEyg=;
        b=SLF1iaPIPjZxAi6ztRLlgMKYM8X9eP3e/CHT4vlsGVX78dPbNtA2a9RkLoW6/LfBYw
         cfcclfH9fjVkbpEvgds/w7/wUYheE5o1crHXg2bE0W0LFvaz39QFv573EJkProej28m8
         wlOZ8t8he+oqMab0/AJ/Y3aNQZphs6CBMbf5dkNM0wYJV7rIAu2+mX46SPUuuqCV7aga
         G2fu1qaVvsC3+iMa1czDKOrTKjYCdhZS38aAUjefAroKkYxoWebo2CxnedK3vdG/cqMY
         A5HOtfwu80d1Z03Ucz4XI/YEdJw6z6HWcUVKHEUiwHZMElIi/+jP4M8IxC5HtQ3j7NxN
         rtfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761663564; x=1762268364;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/tEghCQNR+Ghq6UpTXWvvavmRHa5Qip/flVo1Z/DEyg=;
        b=q/P5Jq9XEANFsKO0OPhlXYu4Q1iwy8YAc8YtlqXGC9vTYIl101iK2MBs33u9+ih4uU
         5c+7u4HCaBLqBpdF5WSgOxIDvsLxHbo06TMHNf+Y68UFcDQeWKqpMyctaUdCsOu9pQjv
         52LVMhnvsDsyiWc+uQJeF3z03fgXQEhVuSnqEQhZxYlS28ml6JN/UC5EMufq5hRT/ovX
         ox/nQRuSb9k50Rw3JBTvWDq9pJHWQZrgqRFkt87V0NmuFX/HA23kSJqs+brTCftiT7ap
         fYhtfwRPivlZ7MZ8mCHtcNx3FrqOgRG/ZSkM03HKWAG0OOQvLdCbGgD8osma1Ngow886
         udLQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/zxk9PFOINw6nIwcCfi4M268Ws1bFYDEuXbXhCwqfBRNUbOHikgD+R+o521svgoIaULHoWtJi+f4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeeRRtj0YZ/LCDAAdDeJ8CaXt19h3lDJTp7kqLc0sdr859AEPO
	RtmCpkuxcJFezqQLSxjyHZql0ZzToZlUPXttZjT3PeUWcrDAlNZjhl2daMYeFWKU6yo=
X-Gm-Gg: ASbGncury8Ny+sV+QpL2kPhjjQrYS2QrO+CMy/ppHUCxI964RgRdB3c8LQOtmAmfsis
	pICv53ZrE37/TEXrwNet15Hxm/Tw2qLlaXZTqpchFH3dlcCeFegwj9t2o44vIin3UlMeLDRzbV+
	OKx+xId+9l9CnGvcJCpYc+JwpW75sUFTPoYi269FmvY/JzV3dTq6ISGAzZ/jITBcXdj1z13cUoG
	hcs42Nj57gOrR8oqbMUKX8OCpNbaCXOhHUQxo7GeWEwCU2StU2wCN0yWvHagwAIXXMUi3b+Z3Vk
	TKzU3coTC4p1nBKp+sYsdpwjdlY++KHVPl9RL4YlVWUg1WMoJZxJzcP80OPY5YD8drB9PgV7RN7
	PyEaFBm8iemvobKSluQuchqftPq0tYGuOsOVhVOtvp6ws9HEpjYmvLhoG80FJ7jJCl6HGVwru/t
	nk09UaEirWYgplZ/IlhxNpgr3EIbAiNV38ZQ4G3VmLEqrGjPEtoQ==
X-Google-Smtp-Source: AGHT+IGOmwoqGCwG34+95+/SGGOROMTRrOMrQVKEuSflYTb4BVwyTWmtHHtiKHl1c6fvvdxlmco53g==
X-Received: by 2002:a05:600d:4345:b0:477:1ae1:fa5d with SMTP id 5b1f17b1804b1-4771ae1fcd9mr10527035e9.20.1761663564212;
        Tue, 28 Oct 2025 07:59:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:ebe6:df10:d28d:aa5? ([2a01:e0a:cad:2140:ebe6:df10:d28d:aa5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47718fe63e0sm21630235e9.3.2025.10.28.07.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 07:59:23 -0700 (PDT)
Message-ID: <da061f7b-bbe8-4810-97b2-3122563592df@linaro.org>
Date: Tue, 28 Oct 2025 15:59:23 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] usb: typec: ucsi: Skip setting orientation for UCSI
 version 2.0 and above
To: Abel Vesa <abel.vesa@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251028-ucsi-glink-skip-orientation-for-ucsi-v2-v1-1-93e936ac59b4@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20251028-ucsi-glink-skip-orientation-for-ucsi-v2-v1-1-93e936ac59b4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/25 15:39, Abel Vesa wrote:
> In case of UCSI version 2.0 and above, if the orientation is set from
> glink as well, it will trigger the consumers along the graph (PHYs,
> repeaters and so on) to reconfigure a second time. This might break
> the consumer drivers which aren't currently implemented to drop the
> second request of setting the same orientation.
> 
> So lets leave the orientation setting to the UCSI generic implementation
> for all platform that implement UCSI spec 2.0 and above.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   drivers/usb/typec/ucsi/ucsi_glink.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index 11b3e24e34e2b4c21df20b6bec69619a0292c7bb..e68fd3fd0f54bfa3c5998519b17cf187bb363ec8 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -209,6 +209,10 @@ static void pmic_glink_ucsi_connector_status(struct ucsi_connector *con)
>   	struct pmic_glink_ucsi *ucsi = ucsi_get_drvdata(con->ucsi);
>   	int orientation;
>   
> +	/* For UCSI 2.0 and above, orientation is part of UCSI payload */
> +	if (ucsi->ucsi->version >= UCSI_VERSION_2_0)
> +		return;
> +
>   	if (!UCSI_CONSTAT(con, CONNECTED)) {
>   		typec_set_orientation(con->port, TYPEC_ORIENTATION_NONE);
>   		return;
> 
> ---
> base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
> change-id: 20251028-ucsi-glink-skip-orientation-for-ucsi-v2-6d52c6644d46
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

