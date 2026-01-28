Return-Path: <linux-usb+bounces-32865-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GyHOwXPeWnezgEAu9opvQ
	(envelope-from <linux-usb+bounces-32865-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 09:55:33 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 990E09E804
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 09:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 880213027688
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 08:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DA033A701;
	Wed, 28 Jan 2026 08:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t+v46eqb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30E633A9ED
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 08:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769590312; cv=none; b=QTfT21IYdq1xBLmyiBMmLD9C0ok2X9Kx/f+eeH9siDdkuOriIHGc32IpEtFnWOVb8KERJZHTfPqYN7otsKm0AbQJT0mpo+ternW3oOPdGVnV9in6w1kcSi7ZoZ5jrzIEnfCZV36wpO+8u5Ru4J7aRGqP4eXpXlvYNT+VS6Q9GwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769590312; c=relaxed/simple;
	bh=X2AzdKeGMu19tO1ypR/VJC5WRPHhh7DKhZdB6XQSJHI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GqDk4Kl7I7VLDuNQuEyoDq/aTUMl9iyeit+MEU7IaEWJtfmQQdoWEesxsxApODgYkWt5KRsWIRPCd0zlgSa9OU1v5Bz84g1EjmpyK4NFl+hW4sZ8ERhG9qeTE/AFEhlny6MA0GGzaYgYUckpUNiVIDylv1+pGpR46WYJdZrupDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t+v46eqb; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47edffe5540so76142685e9.0
        for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 00:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769590306; x=1770195106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KkssKX9UZLI3a5TYO9ENZYAnlkONRgQSKBvfWG/TLA4=;
        b=t+v46eqbTW5XM6obyBEMzkqYgESFckHAk/whgKXQvrxkoub0siR5k34gc8CSoCGwWk
         6vwr2IqLsIYvaZRUUwSEOv0c0vtILiQbwoddqzQwNU1gRDPgIadRC+/+GR+h4BZyg/Te
         4+yXlRsQ6kukqHeW5f1cmzCIUDDp/HPCqSUcsCR2+OX2VmM1rVF3+HlY06ojyKCaZY0N
         aoHDVPJ4AZsLUWWrqF02/sEjyFGF2PsCzi9EtAxmqFzks3krk0vXZimCUufDsr3ILJJT
         CQ+d+J3+3ApFtJO3JrVC9GLEyhDmCfS3ySkb0ud9KWQiUZrqv+z9EQu/Tzt/Umk7LudR
         OaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769590306; x=1770195106;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KkssKX9UZLI3a5TYO9ENZYAnlkONRgQSKBvfWG/TLA4=;
        b=PQVFCmQOar6wAH3PHJtQUNSoPM8RtCsIKwR7nb5d1Q/3SRz3x6+MA/uLxypXB2hQpb
         iPrwMWX8n/PTDVpaQs4caquoIGfzhOG+RxL9EhUQdc8ljCAFYQsFPxYI2vPVG2N6tbRU
         jaVt+pTvTww7nBlzQGb+c7eOWtFW1WAW7MXIo9h8TRrmL+hzZQ5vxoVCsnd9OTplZn9C
         BGIGL0wOa8uTiWoeQN46+3BgESAXNVH3hRWTmLR3m/4B5lCwRNQndweHFFvfXX0vKzhA
         n4+s+aLRjD1PeMm1diPGuJOFdE6VoqS+sZllfUyZ9poEVLdr9NUqp6HHMKshNCf+tb7a
         D8Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUdJd5I/C1NGZjxyMNcqAir+1Y+awI4iuamLMv3PEuE/1z7W6VtwiN9ZLZudrR5MttXLpa37ekhqXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmY849mmISMKWfcQwXamftvwqaUzZJkdGNhDFnXRDxTjOJxKtQ
	LSeQelX9KVL8QpYvHzsKdMbGxm331smA8sQMX4y0lW8A0buTvEsUFL/iyShLHDx4g3g=
X-Gm-Gg: AZuq6aKa+jsvp89Uf9EZP1lV/XQQ/+QIRr/DgS1otLczBgDXGSFM1g6Z2qQliSlZzV/
	X/bEQYwX0h+bjbpiU0M4JrXlQE9A+bbnBd9A9hNmL/LJjOkBLRB4viuw4pjEzRd7FJMfyx2G8J5
	FZzo+keEJwGZge6a1MkEcfm5djKU1djlXMnsgiMpbOx+3A/eadBUBJ9jjz9xpUrcjeyCd9pVdDk
	fUiS+zM0BFqK8vVdhxJbNOKjVdGXouAMy9MyFAb7XotwaSfT0Qe/6AFYMBCho50NZNAhdzQjKuC
	/7vboo7jSRMivDhKkfbSKJ9V/evaXTWWpvuWmT1DGVB9K/0xvgOxH0EzdiUjOTG9AaEnWRAAer9
	2XdAzaNh1uH5Kui++e3OhxQ3OH+9CTtXEZKjUJYiWQZCKg6t67NSHPaUYxePG55JKocwEjOjYlX
	rSqSflecR0ycBM5pZAAmdjMtj6F7Uv6eFNktP5EvwT6J7qDTSUtpoYJBdR39gFI+c=
X-Received: by 2002:a05:600c:4592:b0:477:1af2:f40a with SMTP id 5b1f17b1804b1-48069c5b97cmr56776605e9.17.1769590305903;
        Wed, 28 Jan 2026 00:51:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:7745:d752:5f0b:2b68? ([2a01:e0a:3d9:2080:7745:d752:5f0b:2b68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cddffe9sm66744915e9.4.2026.01.28.00.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 00:51:45 -0800 (PST)
Message-ID: <c3b678ea-fca2-47ff-bc39-72ad498c8641@linaro.org>
Date: Wed, 28 Jan 2026 09:51:44 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/7] pci: pwrctrl: add PCI pwrctrl driver for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Manivannan Sadhasivam <mani@kernel.org>,
 Shawn Lin <shawn.lin@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
 Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-pci@vger.kernel.org
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-2-c55ec1b5d8bf@linaro.org>
 <llbnkm72mgcsrucnp7pdkwbgyzenvhe4kudxkdixplgaoirdem@3q3me34o5drf>
 <0104896e-44d0-485a-a44e-694864c819b7@linaro.org>
 <33bbb3ec-5659-4d50-a5ff-dafa44e291dd@rock-chips.com>
 <ppe6w2h32vx2jh73bcv7ip7ubr2wgwjsz4ooruplpx7gx5s4rv@qfasjbocku4r>
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
In-Reply-To: <ppe6w2h32vx2jh73bcv7ip7ubr2wgwjsz4ooruplpx7gx5s4rv@qfasjbocku4r>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32865-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:replyto,linaro.org:dkim,linaro.org:mid];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 990E09E804
X-Rspamd-Action: no action

On 1/28/26 08:57, Manivannan Sadhasivam wrote:
> On Wed, Jan 28, 2026 at 02:22:50PM +0800, Shawn Lin wrote:
>> 在 2026/01/28 星期三 5:53, Neil Armstrong 写道:
>>> On 1/27/26 16:53, Manivannan Sadhasivam wrote:
>>>> On Tue, Jan 27, 2026 at 10:57:29AM +0100, Neil Armstrong wrote:
>>>>> Add support fo the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host
>>>>> Controller
>>>>> power control which connects over PCIe and requires specific
>>>>> power supplies
>>>>> to start up.
>>>>>
>>>>
>>>> This driver only handles the supplies. So why can't you use the existing
>>>> pwrctrl-slot driver as a fallback?
>>>
>>> It would fit with no change, but the name "slot" doesn't match the goal
>>> here,
>>> it's not a slot at all, it's an actual pcie IC.
>>>
>>
>> How about renaming slot.cto something like pci-pwrctrl-simple.c, especially
>> if most power sequences fit into this category? This would follow the naming
>> example seen in other subsystems, such as drivers/mmc/core/pwrseq_simple.c.
>>
> 
> Yes. There is no point in duplicating the drivers just for a different name.
> Slot driver is relatively new. So I don't think there would be issues in
> renaming the module name.
> 
> I'd prefer for 'pci-pwrctrl-generic.ko' for module name and 'generic.c' for
> driver name.

Will do

Thanks,
Neil

> 
> - Mani
> 


