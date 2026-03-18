Return-Path: <linux-usb+bounces-35066-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBFdJC3CumkGbgIAu9opvQ
	(envelope-from <linux-usb+bounces-35066-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 16:18:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0823E2BE082
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 16:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56CC33078FB4
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 15:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41623E51FB;
	Wed, 18 Mar 2026 15:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h07Xrt2u"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB783E51E2
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 15:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846841; cv=none; b=QwxSQ7pO6Nlng8qsmvdPhaVFwlvqQiyi382J16hoQzW9IRgaWbmstBIHyJxmdpK7KgixkDJE8xIK8zRuZGdXK3zMp1IIyJw+OXAgjKDSFUFjiXTW6i9nGlZj9cbmLLzPPOgabYHOGguXVAtA2YTuJmXz9AolscgQWE8lZjL4p1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846841; c=relaxed/simple;
	bh=Oaf6s37Gmuplz9+ZkhZCP8Y1y9iAbkHpKVFbPTN2SEI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Rog657P81138Cdjd9H37ZwBYxEBUxlPHxbbkHBC/GFec9cO28LpeQ+7d/0vLvIf9jgZGHCXSDaLZ15pNvEueWd5aepanuNH95tXwQ4giRkpwJp5/1RL/z2RyeQIE1GESEln/brMA4uTyl0aIAdSuCJYL+7ksEygwJgQJZZkjf6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h07Xrt2u; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-485445e80bdso60547235e9.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 08:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773846836; x=1774451636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgaShgnFpvjv0oqeZGBghNfivWunnVPbXktyhMiueac=;
        b=h07Xrt2u7x+/VrBA4qMCkyYgd39jYQE/xs9lb4Pabb9hzBdoiVELYGhI3POItr/84Q
         5CnvG9dKsFSMkMuDWfFpfj0qXzLeUUzZeTCc7LuXF+T1qbkHz7f1RWztUSN23BQB8xFJ
         g3OMUtIajj0xUHJgtSFqMXJrIG2CylHmIbLDet4uNsSYghvhdF4OtqBKGnjZhbkwYjgd
         ZMV7cum8kZWbkc1Oel+GDywDXFLSTbAxRODrmPWAU7hUtXFTPUQarsMxyGDQHv3Avq5a
         ES6LgUpzUQuH8fFIfZJBu/4eO4AF1mRqv6RPzGMP6i4DYGRLmLNkcfM6irwvOcL9eQZ9
         H8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846836; x=1774451636;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgaShgnFpvjv0oqeZGBghNfivWunnVPbXktyhMiueac=;
        b=XN/uVsgSZZu3QYNR8kKilwich9qzzfJUrS5Ase29y2GqB+hfS9TTYAosoe81mHWAIj
         Ccd5As0W1+yJ3HTWeezM2jLwFFN0f107fYlz2o5D1797J7/dGPeFQxtlsdVzc6/mKJ73
         BBjVOEhMFYHqOeDoZMymBtTR7VDeE8YmbhPBvbLQf9/MV91E2BLEINwsrcl4U+8MRH0b
         Fu6/M7HePKpo1p1reEMyK3ADlffk9V8A3hKHxiTTwaUu8JJ2exth5QNum1JMJRsHr7cn
         UWB87Rbbmx/a/3OMWSyasG0jZBN231aD4BZNv3BO2aub4JUcxjyTq9OVU27SoKQvLxVa
         28vA==
X-Gm-Message-State: AOJu0Yz/ZN8utPYNuBPLXnHQmPfYg327t9ZQteVqnPvMdHZxpSltfoy7
	Wg53nre7WaC7yHLLuPxPseiuESbLnZvByD/21BzxieDTb0t5s7mZQm0AIpnbiaIDeBk=
X-Gm-Gg: ATEYQzzxCazSmPOuvQ+02SjS65rrXjA8EMYijFZEiN5CBh7Agsg0l1B2gmMhE8KbPhX
	I43e9MllMxTomlYzsK+yVqSfaeBaJIeUpSC+eiq1Fv6EsNIW5tOis7YA00Pfk9al40ejHOx9+dv
	xoiFFn2lF5xAyTKB4cD/oG1bdhRNHW+TQK7FmrNMurP2NRNxtyO/PuqwMcoI46GSr557KCKAY/1
	EHxjBoEqZGNx+cVDoEPM1RZlkQnRwFLdydk4NZp1VvVSoNqTn2paBQGZvD/1BPNev/1EIt5NHqF
	NEWPJ3AJK76+BrPC4SRt6OkZFXHmFHOdb2BrSsUIrkPHOZtWaXn0va7PIwkFLGRTqxnh+aBzEYV
	V1a6HDT9l062s2Cj9D7tHl+FklSF855lKyl6gnwMQmwzhfArBUwi+4hWIx0NCuR6WOQ6vSZG57V
	AHQupjX60WhZnvTBSpbOUfeQnGLiUp8gqKKCnnnsabhzhCIzRY6YvLJEhjpBbLZ0Y6GjO3qtXJH
	6WBCXk=
X-Received: by 2002:a05:600c:8183:b0:486:f634:ef1 with SMTP id 5b1f17b1804b1-486f634100dmr42063005e9.17.1773846835528;
        Wed, 18 Mar 2026 08:13:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ac75:790f:ef3c:2eb0? ([2a01:e0a:106d:1080:ac75:790f:ef3c:2eb0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f46320e7sm23631045e9.9.2026.03.18.08.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 08:13:55 -0700 (PDT)
Message-ID: <c2cb0bac-1921-40d9-902f-15f682184cc0@linaro.org>
Date: Wed, 18 Mar 2026 16:13:53 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 0/9] arm64: dts: qcom: Add support for the Ayaneo
 Pocket S2
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 KancyJoe <kancy2333@outlook.com>
References: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org>
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
In-Reply-To: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ayaneo.com:url];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,outlook.com];
	TAGGED_FROM(0.00)[bounces-35066-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 0823E2BE082
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 2/20/26 16:04, Neil Armstrong wrote:
> The Ayaneo Pocket S2 is a gaming console based on the Qualcomm
> Snapdragon 8 Gen 3. It has an internal UFS storage, WiFi,
> Bluetooth, gaming buttons, SDCard, 2K display and USB-C
> connector.
> 
> Product Page [1].
> 
> The Initial linux port was done by KancyJoe (Sunflower2333)
> at [2].
> 
> [1] https://www.ayaneo.com/goods/9344082149621
> [2] https://github.com/sunflower2333/linux/tree/master

@bjorn @Bartosz @mani what's the best way for get this merged ?

Should I send the pci pwrctrl as a separate patchset ?

> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v5:
> - Rebased on -next
> - Collected tags
> - Rebased/renamed slot to generic based on changes from Bjorn
> - Link to v4: https://patch.msgid.link/20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org
> 
> Changes in v4:
> - Renamed slot to generic, in the code as well, fixed Kconfig & commit message
> - Switched the UPD72020x bindings additionalProperties to true to allow devices subnodes
> - Collected acks
> - Link to v3: https://patch.msgid.link/20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org
> 
> Changes in v3:
> - Made renesas,upd720201-pci bindings supplies required
> - Fixed description and example of renesas,upd720201-pci bindings
> - Renamed slot to generic, added renesas,upd720201-pci entry
> - Used PMIC_GPIO_STRENGTH_LOW instead of numbers
> - Removed all output-low in pinconf
> - Link to v2: https://patch.msgid.link/20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org
> 
> Changes in v2:
> - Add proper regulators for the USB controller, with bindings & power ctrl
> - Add proper regulators for FAN
> - Dropped support for headset over USB-C, audio is connected to a jack port
> - Cleaned up Audio routing and fixed the DP endpoint index
> - Added i2c clk frequencies
> - Renamed fan node and used interrupts-extended
> - Dropped the usb-c self-powered
> - Reordered nodes alphabetically
> - Renamed pcieport1 to pcie1_port0
> - Link to v1: https://patch.msgid.link/20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org
> 
> ---
> KancyJoe (1):
>        arm64: dts: qcom: add basic devicetree for Ayaneo Pocket S2 gaming console
> 
> Neil Armstrong (8):
>        dt-bindings: usb: document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller
>        pci: pwrctrl: slot: fix dev_err_probe() usage
>        pci: pwrctrl: rename pci-pwrctrl-slot as generic
>        pci: pwrctrl: generic: support for the UPD720201/UPD720202 USB 3.0 xHCI Host Controller
>        arm64: defconfig: enable pci-pwrctrl-generic as module
>        dt-binding: vendor-prefixes: document the Ayaneo brand
>        dt-bindings: arm: qcom: document the Ayaneo Pocket S2
>        arm64: dts: qcom: sm8650: Add sound DAI prefix for DP
> 
>   Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
>   .../bindings/usb/renesas,upd720201-pci.yaml        |   61 +
>   .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
>   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>   .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 1551 ++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sm8650.dtsi               |   47 +-
>   arch/arm64/configs/defconfig                       |    1 +
>   drivers/pci/controller/dwc/Kconfig                 |    4 +-
>   drivers/pci/pwrctrl/Kconfig                        |   13 +-
>   drivers/pci/pwrctrl/Makefile                       |    4 +-
>   drivers/pci/pwrctrl/generic.c                      |  143 ++
>   drivers/pci/pwrctrl/slot.c                         |  140 --
>   12 files changed, 1795 insertions(+), 173 deletions(-)
> ---
> base-commit: df94cc5ccb88d2f6ebc0cac480a1b94162f4ff0f
> change-id: 20260121-topic-sm8650-ayaneo-pocket-s2-base-05c348efd86d
> 
> Best regards,


