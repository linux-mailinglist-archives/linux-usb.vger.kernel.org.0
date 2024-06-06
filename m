Return-Path: <linux-usb+bounces-10978-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC228FE6DC
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2024 14:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 604BE1C2201F
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2024 12:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5565195B2E;
	Thu,  6 Jun 2024 12:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K4Crf0J7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89093195B17
	for <linux-usb@vger.kernel.org>; Thu,  6 Jun 2024 12:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717678423; cv=none; b=Sp++NXn0Zhb50GJrOLIty4gyOw/6kK+YN/X6lLOHdk4JTHm5cTvCggT24FRQLh+IgIgbqHq+mGITmiCZK2K5eL3BCI7Q0sg4uvRJ91yD4X1JU9d4Edbf/ca5yisknLQkfy0Z1yC3whyc4fC1AxK70q+WCPeXt52CtdwUmRMtPdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717678423; c=relaxed/simple;
	bh=+Y1fY3XWJqseXhLzVJOqTW0Y6cEuYRniPkrjrZ4vWRw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=s5c7byXalbji0pS1w8Tg2zsPQLrMZEpp5qDod1LF42q/L2fhOKF7ITaDkUP8jPlHGoYF/Yx/CcZD6k3nqLu5Nqzv12vldmIEsbKboDoKS1AOU8UX4a9CsjWluZExPmJIRU/f6jjJrmbs7YEO7VmWhbGEkMS6cr14Dluf/Kp6Klc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K4Crf0J7; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-35e816b735aso1024166f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Jun 2024 05:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717678420; x=1718283220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zvI4LJT6aD54nzCBdd9He6NE1PNpLm27EVI6+T7NR8Y=;
        b=K4Crf0J76TQqtp4X/F2G2BwHHksgeUNDn4HmpL7gyRbsLC3j98NVdI8PjIbp5h3Eo5
         UIaydDRKOOkZqXmKnHR3FCSPbSSX9XC7HnkwSwz4aPDJ3V0hNSAj8tKbSbBDk9ygdh2i
         xSxRR9uBhQs7MPKh487ToSGN2nKQO1f7YPIi8bPfBm2LLrCTMKZj0s9Dt5jfJ7M9PQVw
         w2GjGkXA91oMtAW6A0svFrNUGLhCPiqisliNbFobKG7awVcyRqjYpnAIcV4PjpF70quU
         3UoeTtX1bJFOLwVs1YZMZVareIiRktMe+SAS63xa4hsOV3dOtckJ/Z0Ve+3jsrSCmT10
         cxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717678420; x=1718283220;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zvI4LJT6aD54nzCBdd9He6NE1PNpLm27EVI6+T7NR8Y=;
        b=hxQ8i7h2wjYymBfk1WAy5VJFvDU9v3q5v0IDuCtYFnq2oXRzp9Y1zFT5iaC5jnCrCL
         s8FISezg6e0UP5Nbkosac0E8ERRtvnF4zx7A9wtKPvjqfSfu+nxMP5S1S7cgEHploo5T
         TM3Mz7YgdrHLkFgJJOJjfX6U2hjceUVan26YwFXiJZjFty1pbonUT+G99D75FR4oQQex
         fybN4sCShl5ZHVkeTEi1LFfMzr9ScsJTZ+hVkDGN4isDhM8vYkXihZSv6ciSXc8ZG3up
         283vatT+xbNmXIar53T1b1Z3FQBcfVreUW+dSKaIh2MgaRYeo68uXNMpqJ88agFhCXqy
         waxw==
X-Forwarded-Encrypted: i=1; AJvYcCXMYTziyvIia4MGYtKPPcFbJqyytEJhCfXkOwtFk3LILhHJ7jzJ3pKhse2UGQhlcNZm+YMtGtzQjW+BEetBL4Zq0Ostqp4l1n6w
X-Gm-Message-State: AOJu0Yx6mzhpPV2161QaJ+x6C2I5SmUQiDbk2rBKTsboMF+t0hjm+Ieg
	nRdSXwUPPhSVN9knRlv+REKvNotNK3dLUUtG7rXb6k75AB7CXPLdyqe2tFxXt0KPhYDL5WWD1Sc
	W
X-Google-Smtp-Source: AGHT+IFYKXev1KSRoG34ZFoXDkfJWML/WIzHmGNbBeC5z6WLb6SzDr68GSxHfl67sjsa0uFE6MS11w==
X-Received: by 2002:adf:f803:0:b0:351:dace:3dac with SMTP id ffacd0b85a97d-35e8ef65ae3mr4272994f8f.56.1717678419906;
        Thu, 06 Jun 2024 05:53:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6d66:dc6b:6c6b:f7aa? ([2a01:e0a:982:cbb0:6d66:dc6b:6c6b:f7aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5e96c15sm1493773f8f.75.2024.06.06.05.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 05:53:39 -0700 (PDT)
Message-ID: <8568359e-840a-4fa4-bcbd-a0029e854f69@linaro.org>
Date: Thu, 6 Jun 2024 14:53:38 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] usb: typec-mux: nb7vpq904m: broadcast typec state to
 next mux
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, Luca Weiss
 <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240527-topic-sm8x50-upstream-retimer-broadcast-mode-v1-0-79ec91381aba@linaro.org>
 <20240527-topic-sm8x50-upstream-retimer-broadcast-mode-v1-2-79ec91381aba@linaro.org>
 <jdqnlfuqount32ralk4jr3beobdt7dgs3h4lcpxj5fbmanysl6@pgwqeozl7ow5>
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
In-Reply-To: <jdqnlfuqount32ralk4jr3beobdt7dgs3h4lcpxj5fbmanysl6@pgwqeozl7ow5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/05/2024 11:18, Dmitry Baryshkov wrote:
> On Mon, May 27, 2024 at 09:45:30AM +0200, Neil Armstrong wrote:
>> In the Type-C graph, the nb7vpq904m retimer is in between the USB-C
>> connector and the USB3/DP combo PHY, and this PHY also requires the
>> USB-C mode events to properly set-up the SuperSpeed Lanes functions
>> to setup USB3-only, USB3 + DP Altmode or DP Altmode only on the 4 lanes.
>>
>> Update the nb7vpq904m retimer to get an optional type-c mux on the next
>> endpoint, and broadcast the received mode to it.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/usb/typec/mux/nb7vpq904m.c | 29 +++++++++++++++++++++++++++--
>>   1 file changed, 27 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/typec/mux/nb7vpq904m.c b/drivers/usb/typec/mux/nb7vpq904m.c
>> index b17826713753..efb10f890fed 100644
>> --- a/drivers/usb/typec/mux/nb7vpq904m.c
>> +++ b/drivers/usb/typec/mux/nb7vpq904m.c
>> @@ -69,6 +69,7 @@ struct nb7vpq904m {
>>   
>>   	bool swap_data_lanes;
>>   	struct typec_switch *typec_switch;
>> +	struct typec_mux *typec_mux;
>>   
>>   	struct mutex lock; /* protect non-concurrent retimer & switch */
>>   
>> @@ -275,6 +276,7 @@ static int nb7vpq904m_sw_set(struct typec_switch_dev *sw, enum typec_orientation
>>   static int nb7vpq904m_retimer_set(struct typec_retimer *retimer, struct typec_retimer_state *state)
>>   {
>>   	struct nb7vpq904m *nb7 = typec_retimer_get_drvdata(retimer);
>> +	struct typec_mux_state mux_state;
>>   	int ret = 0;
>>   
>>   	mutex_lock(&nb7->lock);
>> @@ -292,7 +294,14 @@ static int nb7vpq904m_retimer_set(struct typec_retimer *retimer, struct typec_re
>>   
>>   	mutex_unlock(&nb7->lock);
>>   
>> -	return ret;
>> +	if (ret)
>> +		return ret;
>> +
>> +	mux_state.alt = state->alt;
>> +	mux_state.data = state->data;
>> +	mux_state.mode = state->mode;
>> +
>> +	return typec_mux_set(nb7->typec_mux, &mux_state);
>>   }
>>   
>>   static const struct regmap_config nb7_regmap = {
>> @@ -411,9 +420,16 @@ static int nb7vpq904m_probe(struct i2c_client *client)
>>   		return dev_err_probe(dev, PTR_ERR(nb7->typec_switch),
>>   				     "failed to acquire orientation-switch\n");
>>   
>> +	nb7->typec_mux = fwnode_typec_mux_get(dev->fwnode);
>> +	if (IS_ERR(nb7->typec_mux)) {
>> +		ret = dev_err_probe(dev, PTR_ERR(nb7->typec_mux),
>> +				    "Failed to acquire mode-switch\n");
>> +		goto err_switch_put;
>> +	}
>> +
>>   	ret = nb7vpq904m_parse_data_lanes_mapping(nb7);
>>   	if (ret)
>> -		return ret;
>> +		goto err_mux_put;
>>   
>>   	ret = regulator_enable(nb7->vcc_supply);
>>   	if (ret)
>> @@ -456,6 +472,12 @@ static int nb7vpq904m_probe(struct i2c_client *client)
>>   	gpiod_set_value(nb7->enable_gpio, 0);
>>   	regulator_disable(nb7->vcc_supply);
>>   
>> +err_mux_put:
>> +	typec_mux_put(nb7->typec_mux);
>> +
>> +err_switch_put:
>> +	typec_switch_put(nb7->typec_switch);
> 
> Same comment, typec_switch_put should go to a separate commit. IMHO it
> almost begs us to have devm_fwnode_typec_mux_get() and
> devm_fwnode_typec_switch_get().

Yep

Thx,
Neil

> 
>> +
>>   	return ret;
>>   }
>>   
>> @@ -469,6 +491,9 @@ static void nb7vpq904m_remove(struct i2c_client *client)
>>   	gpiod_set_value(nb7->enable_gpio, 0);
>>   
>>   	regulator_disable(nb7->vcc_supply);
>> +
>> +	typec_mux_put(nb7->typec_mux);
>> +	typec_switch_put(nb7->typec_switch);
>>   }
>>   
>>   static const struct i2c_device_id nb7vpq904m_table[] = {
>>
>> -- 
>> 2.34.1
>>
> 


