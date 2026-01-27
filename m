Return-Path: <linux-usb+bounces-32816-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Mi7IuPSeGmNtQEAu9opvQ
	(envelope-from <linux-usb+bounces-32816-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 15:59:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 09895962F5
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 15:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A840F30B7A84
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 14:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C70135C1A2;
	Tue, 27 Jan 2026 14:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PHukeZO1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97D0360744
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 14:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524929; cv=none; b=MDtPvrEASjFDn99gO0dqSTfrfs56eWMcLVNQq7HXABiDH8R6MFuzWSk/jdUqPcA+Mgj8i7bQx40srq6BruVPQojClMJhdDjeRIR55UrbRcEpWk/dPbfGrfxJslz9mzb7sGLyJTvx/gua1d7IVeOqU+JkS3/42M2XlL+9/3KO6iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524929; c=relaxed/simple;
	bh=1CaflWjkNhcQDANOir4hWMeC+w06SKx7wZJtD8EFIbE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HMysy53jgl2SEBMW660YCWjnkW+llgfuT/WX6Uup7RwIBeAh2GeUrTHwzsD8zggMgIynZhtPW6UQ7WDK8tpWZXKb5lmMdIjCh+5lE8njmSGvNNgsRKShB/GZ3T6O0PUeIF95fFp96D/f6bCgsVIFMlXKgZFSwKT5owdD1Fs1Jlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PHukeZO1; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so45058385e9.0
        for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 06:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769524924; x=1770129724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ljVMpWRKvY2+1qzoFSak0+AlpoDAqSEsFhtFylZkNe0=;
        b=PHukeZO1WoDCeoTJrWV4I6B/BObVkQT9MR22i9od8OD0fh2mrMrrTv0wQhmcZbqpfO
         52OwUVQluRkampP8I59oJYWZP2gcnp4hM6B21TBoA5GQTeYZXLCdcMLOnqIJ4jzpaVD0
         iA2fT4AQhA4g79+pEMFlPRZZZXLNDk8HB+TfrWXLJbKBVoDPdr/dMOZakT5GEBZxS6gS
         DsmdxGYngBNViZ1+Lhm17nwoBndjzT2xj6zUYeGj0aVVnfLPpIXyWeNdOHSwfU5EePIT
         xzOjCrLKJOUmH3pah9e0NnPZGZn+zhkA6kSpy5dNfyEI4+eNIcmr1KAIYUBvFBl7MxV/
         Bong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769524924; x=1770129724;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ljVMpWRKvY2+1qzoFSak0+AlpoDAqSEsFhtFylZkNe0=;
        b=oxEE3WGJpzMa/n63hfd17jsIqYWa71tUfTUFi4AlHJSYFB6LkeiAUigIVhrFoUcg1G
         kFVr5JqtpeR4QBAo8B4qhND3fpS19EkH++QHVHSPJFqMBescCul0eUUjnnxc82d1XIy0
         1+agZayqGLOkC9vCPP9N0iuJdvS422sjSM41OgNvI3xXvvAWVmMi3ALL0Ny1xiJwtmKw
         DIvDB6B/2ePxqY9RloT4izdKJtrm3DdFXR6lcskA1bBiG8opNy4dKWcGIkDFNw8BmvLk
         DavgDISCwg/wnSeZFP96J/2074JMzZ0Grbc7Vdgmlle31IQimV4A4YlnIiwmGUipr7Q4
         Bk2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLB1JELeb68gc+aihI1A3eUndzov/oPI/b0AHOdaNV0dvmc984ieIGe4cRGm8Ck5cGYzjXEvQuNW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YziJZbc+8Uo8yrQI9660OJLciw7KcmTGqbi2kyWCTb1BTKVxOTI
	MgNaX3+qMAvRx0cpzMbGYnKLZQd6katUIeka6zqV4uJ6CYvxGwD7Azp52RzJibrJpz0=
X-Gm-Gg: AZuq6aIDs6YKTQuyI5sOn0V5x2igy6gEZxzneUvBGTcl5IMOBB77IWKl+a4VX30zNNd
	76F8jYCrK8ZZpBCtycKGPPQQPVp1gorsqSgCfMz5zDMeaxiBYpk7603a91dhav4UEijnsyA695a
	r+uS9rxKKvJXL0pDTzCOqLsfbm5N2c5QxQWKhMVOIGbeXQbRWhXz4fi6mDXj3VRGRVicEDuVSfY
	uzBRhzbztZg1eNdGkfR/dFI2vSsPzStCM2Nzt1L+s/lruLcLQrFLxZDF+fXV4co9bcrg/Tf7ELc
	q23FhNtJNl5z+xFFtjdjbeGILqJE7fdB1MRuCG7jv8r7nXxtlkn10nLG0G0mnXxkhV913sOJIIX
	7DotRUlgKYh7qRYgSrVq++K++dl3szPOx3gwdyWfrnk+sp/mbaVypgvqj6f6Ey8T+vRWHvzEKFQ
	xP/VxolinLSjx0hFu3mW7na6h9ESUe3G7tEVxJ4PKOfM6iXTrpRx8O/81vy0ZsLSk=
X-Received: by 2002:a05:600c:8b16:b0:480:1a9a:e571 with SMTP id 5b1f17b1804b1-48069c8c109mr22743065e9.22.1769524924086;
        Tue, 27 Jan 2026 06:42:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:53a6:bd3c:8e65:509d? ([2a01:e0a:3d9:2080:53a6:bd3c:8e65:509d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c4f3edsm63317125e9.15.2026.01.27.06.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 06:42:03 -0800 (PST)
Message-ID: <d66687d5-cd11-47ae-9f6b-090feaf8761a@linaro.org>
Date: Tue, 27 Jan 2026 15:42:02 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/7] dt-binding: vendor-prefixes: document the Ayaneo
 brand
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-pci@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-4-c55ec1b5d8bf@linaro.org>
 <20260127142729.GA1622953-robh@kernel.org>
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
In-Reply-To: <20260127142729.GA1622953-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32816-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ayaneo.com:url,linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid,qualcomm.com:email];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 09895962F5
X-Rspamd-Action: no action

On 1/27/26 15:27, Rob Herring wrote:
> On Tue, Jan 27, 2026 at 10:57:31AM +0100, Neil Armstrong wrote:
>> Document the Ayaneo from the Anyun Intelligent Technology
>> (Hong Kong) Co., Ltd company.
>> Website: https://www.ayaneo.com/product/ayaneobrand.html
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> index c7591b2aec2a..1f83979e0d09 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> @@ -216,6 +216,8 @@ patternProperties:
>>     "^axiado,.*":
>>       description: Axiado Corporation
>>     "^axis,.*":
>> +    description: Anyun Intelligent Technology (Hong Kong) Co., Ltd
>> +  "^ayaneo,.*":
>>       description: Axis Communications AB
> 
> description is in the wrong place. Bad rebase?

Ok wow thanks I just missed it, somehow it looks good for me...

Neil

> 
>>     "^azoteq,.*":
>>       description: Azoteq (Pty) Ltd
>>
>> -- 
>> 2.34.1
>>


