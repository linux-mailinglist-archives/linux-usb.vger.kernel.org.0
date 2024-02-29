Return-Path: <linux-usb+bounces-7349-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC1186CCA7
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 16:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF97A1F24229
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 15:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F8A13F015;
	Thu, 29 Feb 2024 15:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PHX8oLiv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4611386A8
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 15:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709219740; cv=none; b=iiH994V3TIH+gU3C53YI1S3oQkIqy3HDt3LAmBJyJ/O+7dScViWEs54JH9w7y/mQKzqreWewRMrHRliCWlTTEelVkRWYYMUqBmZMfCaP6KAukeykbBa5CATCIVlGes760t4OkqplJhMuFdcNrjMCVqt0ojKuvttagQ70MrKcfig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709219740; c=relaxed/simple;
	bh=V6OJiCShtzdvjWz97Ir+wJWCWv50bRJVMvZxVO1QW+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S65IKWzbGF0kVe51Q0RpFBb/bMSGt14GOCHxrsa7UXgIdkPPF5TkUySbQSKOBqKROQfPGev+ePyXPAb42U0lDVPpGi3p3iaMYEP5Ar40sj/HpNoii0VPM9aCirG+jKQkysRgzdEHXGI2yAQuHBJjW5pMDyv8ynTrltn7I9Z4SYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PHX8oLiv; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a3ee69976c9so185808166b.0
        for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 07:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709219737; x=1709824537; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YomR+DDsouVpMTkCKlMj3X1XHRJd3sZOjehM9h85Xsg=;
        b=PHX8oLiviMQwrGvWaTS7MxeD+jQGW8em6l1aMu8k/BC2aFJ0qicL9jKoZrid3hLS0z
         63VRag6Yo0hcdGpxi154BgRAIZ28DePG5UdGZ+UZWmWeAaSYAbKGWA3P3rsCVbcy83V3
         7r+TuScZFPzNQ5QO8/9Zf8XWBCmY8SIF8OVd9Pf6pZG15PDtJnI1G8yr4WA8qVI+JU2t
         g68HMYvzAH5NYMreTXgPXnY4qu9GgFNiGA1mpDiyFZjFNWj6J3rw2CVYJ0N8RCMOga6Q
         jeC+3atI4H/Du+0rdmj01Ufxw7bo8PMyMuEGVYBeipxjNoQf3AGulFWL2vsmg+lnEhm1
         BO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709219737; x=1709824537;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YomR+DDsouVpMTkCKlMj3X1XHRJd3sZOjehM9h85Xsg=;
        b=ivqrwXcjWhmxAtoo7t0uyZI+aPnD6SFdUz9HQKGn/uH2UWgii3zqaxn+ZvGzUxzwLn
         O16K/jlY5rkbeHvclWHdbS9+F+kjHCP2zsNKhLVfSn2NBS0UA8eWaIlY3rJENgvjcNKp
         W1AIEo8rFXPPiAMAWn+kub4mBjlw4FtyZfR+u7rAlCiUnJrqN5GEc/FTVCrhJI1EuavX
         bioR325riQnni/hvjm9jltaCv00Orh63XK1fY1TavHl50pRlFEuX945twny5R338Cw3+
         Hkmh1R0nmtyfObxVmwrM5AwS0TQJ/e5XGoMNIBd9MIVVF5JG4Zmkm3vxMkYNUtyM2/UQ
         GfDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWajNW4kLMoOLYXKNlLrEosAuH7wlTebfUUf7NrY4oxtux7JOIqi6ADAQZ9X95HmcmBNqe37bJm9HWKzZOTkEfR+aN3Lnit99fd
X-Gm-Message-State: AOJu0YxEec7sIF5Th3Ue/RlXsxnl4nUo2s+EnMGXO3DfcrOdESEK3rhQ
	op3emBnP8F1YObVePYc49/eoBk2IApcmi5tkQ4pdznTpmZwTo1iSqEWJqpXtXTE=
X-Google-Smtp-Source: AGHT+IEW57d6j7XDDz5Mx9iRBc88vALPtWhOXl7VICSIP2O7qZD+VkfxC7dUywt5yeIC67zGZt3+Pw==
X-Received: by 2002:a17:906:d146:b0:a44:1e32:a503 with SMTP id br6-20020a170906d14600b00a441e32a503mr1731569ejb.22.1709219736904;
        Thu, 29 Feb 2024 07:15:36 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id wb4-20020a170907d50400b00a3ee5c19ee5sm769010ejc.109.2024.02.29.07.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 07:15:36 -0800 (PST)
Message-ID: <32a5605a-c810-4b3d-bb72-4d413d9f9bb9@linaro.org>
Date: Thu, 29 Feb 2024 16:15:35 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/11] dt-bindings: usb: ci-hdrc-usb2-imx: remove
 fsl,anatop property
Content-Language: en-US
To: Xu Yang <xu.yang_2@nxp.com>, gregkh@linuxfoundation.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 conor+dt@kernel.org
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, peter.chen@kernel.org, jun.li@nxp.com,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240228113004.918205-1-xu.yang_2@nxp.com>
 <20240228113004.918205-7-xu.yang_2@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240228113004.918205-7-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/02/2024 12:30, Xu Yang wrote:
> Property "fsl,anatop" is needed by usb phy rather usb controller.
> This will remove it from ci-hdrc-usb2-imx schema.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v7:
>  - new patch
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2-imx.yaml | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2-imx.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2-imx.yaml
> index a2932af2c09b..0a6ebb427130 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2-imx.yaml
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2-imx.yaml
> @@ -74,10 +74,6 @@ properties:
>            - description: phandle to usbmisc node
>            - description: index of usb controller
>  
> -  fsl,anatop:
> -    description: phandle for the anatop node.
> -    $ref: /schemas/types.yaml#/definitions/phandle

Then why did you copy it from original schema? Just remove it before all
this work.

Again: Do not add lines in one patch which immediately later are being
removed. Such patchset has no effect and is only confusing. This
suggests your order is incorrect.

Best regards,
Krzysztof


